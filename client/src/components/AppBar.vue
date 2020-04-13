<template>
  <v-app-bar app clipped-left color="primary" dark>
    <v-toolbar-title>Demo Bank</v-toolbar-title>

    <v-spacer></v-spacer>

    <template v-if="email">
      <span>{{ email }}</span>
    </template>

    <template v-else>
      <v-btn text to="/signup">Sign up</v-btn>
      <v-btn text to="/login">Log in</v-btn>
    </template>
  </v-app-bar>
</template>

<script>
export default {
  name: `AppBar`,
  props: {
    email: {
      type: String,
    },
  },
}
</script>
