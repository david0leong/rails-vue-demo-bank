<template>
  <div id="app">
    <component :is="layout">
      <router-view />
    </component>
  </div>
</template>

<script>
import LayoutDefault from './layouts/LayoutDefault.vue'

const defaultLayout = 'layout-default'

export default {
  components: {
    LayoutDefault,
  },

  computed: {
    layout() {
      return `${this.$route.meta.layout || defaultLayout}`
    },
  },
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
