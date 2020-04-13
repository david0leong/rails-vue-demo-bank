<template>
  <v-app-bar app clipped-left color="primary" dark>
    <div class="d-flex align-center">
      <v-toolbar-title>Demo Bank</v-toolbar-title>
    </div>

    <v-spacer></v-spacer>

    <v-btn text to="/signup">
      Sign up
    </v-btn>

    <v-btn text to="/login">
      Log in
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  name: `AppBar`,
}
</script>
