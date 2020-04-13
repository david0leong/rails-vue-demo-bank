import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '@/views/Home.vue'
import Login from '@/views/Login.vue'
import Signup from '@/views/Signup.vue'
import Dashboard from '@/views/Dashboard.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: { public: true },
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: { public: true },
  },
  {
    path: '/signup',
    name: 'Signup',
    component: Signup,
    meta: { public: true },
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard,
    meta: { private: true },
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
})

router.beforeEach((to, from, next) => {
  const { private } = to.meta
  const token = localStorage.getItem('token')

  if (private && !token) {
    next({
      name: 'Login',
      query: { redirect: to.fullPath },
    })
  } else if (!private && token) {
    next({ name: 'Dashboard' })
  } else {
    next()
  }
})

export default router
