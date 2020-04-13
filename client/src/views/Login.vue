<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-card class="elevation-12">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>Login</v-toolbar-title>
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
                id="password"
                label="Password"
                name="password"
                prepend-icon="lock"
                type="password"
                v-model="password"
                :rules="passwordRules"
              />
            </v-form>
          </v-card-text>

          <v-card-actions>
            <v-spacer />
            <v-btn :disabled="!valid" color="primary" @click="submit"
              >Login</v-btn
            >
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import * as rules from '@/utils/validation'

export default {
  name: 'Login',

  data() {
    return {
      loading: false,
      valid: true,
      email: '',
      emailRules: [rules.required('Email'), rules.email('Email')],
      password: '',
      passwordRules: [rules.required('Password')],
    }
  },

  methods: {
    async submit() {
      if (this.$refs.form.validate()) {
        const { data } = await this.$http.plain.post('/api/v1/token', {
          auth: {
            email: this.email,
            password: this.password,
          },
        })

        localStorage.setItem('token', data.jwt)

        this.$router.push(this.$route.query.redirect || { name: 'Dashboard' })
      }
    },
  },
}
</script>
