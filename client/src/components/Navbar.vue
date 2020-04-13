<template>
  <v-navigation-drawer app clipped>
    <v-list>
      <v-list-item
        v-for="item in items"
        :key="item.title"
        link
        exact
        :to="item.to"
      >
        <v-list-item-icon>
          <v-icon>{{ item.icon }}</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-list-item @click="$emit('logout')">
        <v-list-item-icon>
          <v-icon>mdi-logout</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Log out</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  name: 'NavBar',

  data() {
    return {
      items: [
        { title: 'Dashboard', to: '/dashboard', icon: 'mdi-bank' },
        { title: 'Deposit', to: '/deposit', icon: 'mdi-currency-usd' },
        { title: 'Withdraw', to: '/withdraw', icon: 'mdi-currency-usd-off' },
        { title: 'Send', to: '/send', icon: 'mdi-send' },
      ],
    }
  },
}
</script>
