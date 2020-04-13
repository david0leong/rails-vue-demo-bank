<template>
  <v-container class="fill-height" fluid>
    <v-row justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-card class="elevation-12">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>Balance</v-toolbar-title>
          </v-toolbar>

          <v-card-text>
            <p class="display-1 text--primary">
              {{ formattedBalance }}
            </p>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'Dashboard',

  computed: {
    ...mapState('app', {
      balance: state => state.profile.balance || 0,
    }),

    formattedBalance() {
      return `$ ${this.balance.toFixed(2)}`
    },
  },
}
</script>
