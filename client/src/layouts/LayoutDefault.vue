<template>
  <v-app>
    <app-bar />

    <nav-bar />

    <v-content>
      <v-container fluid>
        <slot></slot>
      </v-container>
    </v-content>

    <v-footer app>
      <span>&copy; 2020</span>
    </v-footer>
  </v-app>
</template>

<script>
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

  created() {
    // Simulate fetching user data.
    setTimeout(() => {
      this.user = { name: `John Doe` }
    }, 2000)
  },
}
</script>

<style lang="scss"></style>
