<template>
  <component :is="layout">
    <router-view />
  </component>
</template>

<script>
import LayoutPublic from '@/layouts/LayoutPublic.vue'
import LayoutPrivate from '@/layouts/LayoutPrivate.vue'

export default {
  components: {
    LayoutPublic,
    LayoutPrivate,
  },

  computed: {
    layout() {
      return this.$route.meta.private ? 'layout-private' : 'layout-public'
    },
  },
}
</script>
