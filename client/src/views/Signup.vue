<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-alert type="error" v-if="error">
          {{ error }}
        </v-alert>

        <v-card class="elevation-12">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>Signup</v-toolbar-title>
          </v-toolbar>

          <v-card-text>
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-text-field
                label="Email"
                name="email"
                prepend-icon="person"
                type="email"
                v-model.trim="email"
                :rules="emailRules"
              />

              <v-text-field
                label="Password"
                name="password"
                prepend-icon="lock"
                type="password"
                v-model="password"
                :rules="passwordRules"
              />

              <v-text-field
                label="Confirm Password"
                name="confirmPassword"
                prepend-icon="lock"
                type="password"
                v-model="confirmPassword"
                :rules="confirmPasswordRules"
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
              Signup
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import * as rules from '@/utils/validation'

export default {
  name: 'Signup',

  data() {
    return {
      loading: false,
      valid: true,
      email: '',
      emailRules: [rules.required('Email'), rules.email('Email')],
      password: '',
      passwordRules: [rules.required('Password')],
      confirmPassword: '',
    }
  },

  computed: {
    confirmPasswordRules() {
      return [
        () => this.password === this.confirmPassword || 'Password must match',
      ]
    },
  },

  methods: {
    async submit() {
      if (!this.$refs.form.validate()) {
        return
      }

      try {
        this.loading = true
        this.error = ''

        const { data } = await this.$http.plain.post('/api/v1/signup', {
          email: this.email,
          password: this.password,
        })

        localStorage.setItem('token', data.jwt)
        this.$router.push({ name: 'Dashboard' })
      } catch (error) {
        this.error = 'Error in signing up'
      } finally {
        this.loading = false
      }
    },
  },
}
</script>
