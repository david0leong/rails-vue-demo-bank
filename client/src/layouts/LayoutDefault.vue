<template>
  <v-app>
    <app-bar :email="email" />

    <nav-bar :loggedIn="loggedIn" @logout="logout" />

    <v-content>
      <slot></slot>
    </v-content>

    <v-footer app>
      <span>&copy; 2020</span>
    </v-footer>
  </v-app>
</template>

<script>
import { mapState, mapGetters, mapActions } from 'vuex'

import AppBar from '@/components/AppBar.vue'
import NavBar from '@/components/NavBar.vue'

export default {
  name: `LayoutDefault`,
  components: {
    AppBar,
    NavBar,
  },

  data() {
    return {
      user: null,
    }
  },

  computed: {
    ...mapState('app', {
      email: state => state.profile.email,
    }),
    ...mapGetters('app', ['loggedIn']),
  },

  methods: {
    ...mapActions('app', ['logout']),
  },
}
</script>

<style lang="scss"></style>
