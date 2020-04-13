<template>
  <component :is="layout">
    <router-view />
  </component>
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
