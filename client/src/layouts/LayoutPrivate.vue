<template>
  <v-app>
    <app-bar :email="email" />

    <nav-bar @logout="logout" />

    <v-content>
      <slot></slot>
    </v-content>

    <v-footer app>
      <span>&copy; 2020</span>
    </v-footer>
  </v-app>
</template>

<script>
import { mapState, mapActions } from 'vuex'

import AppBar from '@/components/AppBar.vue'
import NavBar from '@/components/NavBar.vue'

export default {
  name: `LayoutPrivate`,

  components: {
    AppBar,
    NavBar,
  },

  computed: {
    ...mapState('app', {
      email: state => state.profile.email,
    }),
  },

  methods: {
    ...mapActions('app', ['logout', 'fetchProfile']),
  },

  created() {
    this.fetchProfile()
  },
}
</script>

<style lang="scss"></style>
