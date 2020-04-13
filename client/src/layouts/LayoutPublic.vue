<template>
  <v-app>
    <app-bar />

    <v-content>
      <slot></slot>
    </v-content>

    <v-footer app>
      <span>&copy; 2020</span>
    </v-footer>
  </v-app>
</template>

<script>
import AppBar from '@/components/AppBar.vue'

export default {
  name: `LayoutPublic`,

  components: {
    AppBar,
  },
}
</script>
