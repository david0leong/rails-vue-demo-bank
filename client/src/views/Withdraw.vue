<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-alert type="error" v-if="error">
          {{ error }}
        </v-alert>

        <v-alert type="success" v-if="success">
          Successfully withdrew money!
        </v-alert>

        <v-card class="elevation-12">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>Withdraw</v-toolbar-title>
          </v-toolbar>

          <v-card-text>
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-text-field
                label="Amount"
                name="amount"
                prepend-icon="attach_money"
                type="number"
                v-model.number="amount"
                :rules="amountRules"
              />
            </v-form>
          </v-card-text>

          <v-card-actions>
            <v-spacer />
            <v-btn
              :loading="loading"
              :disabled="!valid"
              color="primary"
              @click="submit"
            >
              Submit
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapMutations } from 'vuex'

import * as rules from '@/utils/validation'

export default {
  name: 'Withdraw',

  data() {
    return {
      loading: false,
      success: false,
      error: '',
      valid: true,
      amount: 0,
      amountRules: [rules.greaterThan('Amount', 0)],
    }
  },

  methods: {
    ...mapMutations('app', ['updateProfile']),

    async submit() {
      if (!this.$refs.form.validate()) {
        return
      }

      try {
        this.loading = true
        this.error = ''
        this.success = false

        const { data } = await this.$http.secured.post('/api/v1/withdraw', {
          amount: this.amount,
        })

        this.success = true
        this.updateProfile(data)
      } catch (error) {
        this.error = 'Error in withdrawing money'
      } finally {
        this.loading = false
      }
    },
  },
}
</script>
