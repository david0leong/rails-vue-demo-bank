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
          <v-icon>power_settings_new</v-icon>
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
        { title: 'Dashboard', to: '/dashboard', icon: 'account_balance' },
        { title: 'Deposit', to: '/deposit', icon: 'attach_money' },
        { title: 'Withdraw', to: '/withdraw', icon: 'money_off' },
        { title: 'Send', to: '/send', icon: 'send' },
      ],
    }
  },
}
</script>
