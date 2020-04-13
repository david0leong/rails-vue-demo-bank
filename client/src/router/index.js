import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '@/views/Home.vue'
import Login from '@/views/Login.vue'
import Signup from '@/views/Signup.vue'
import Dashboard from '@/views/Dashboard.vue'
import Deposit from '@/views/Deposit.vue'
import Withdraw from '@/views/Withdraw.vue'
import Transfer from '@/views/Transfer.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  {
    path: '/signup',
    name: 'Signup',
    component: Signup,
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard,
    meta: { requiresAuth: true },
  },
  {
    path: '/deposit',
    name: 'Deposit',
    component: Deposit,
    meta: { requiresAuth: true },
  },
  {
    path: '/withdraw',
    name: 'Withdraw',
    component: Withdraw,
    meta: { requiresAuth: true },
  },
  {
    path: '/transfer',
    name: 'Transfer',
    component: Transfer,
    meta: { requiresAuth: true },
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
})

router.beforeEach((to, from, next) => {
  const { requiresAuth } = to.meta
  const token = localStorage.getItem('token')

  if (requiresAuth && !token) {
    next({
      name: 'Login',
      query: { redirect: to.fullPath },
    })
  } else if (!requiresAuth && token) {
    next({ name: 'Dashboard' })
  } else {
    next()
  }
})

export default router
