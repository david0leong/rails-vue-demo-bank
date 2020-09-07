import axios from 'axios'

import store from '@/store'

const plainAxiosInstance = axios.create({
  withCredentials: true,
  headers: {
    Accept: 'application/json',
  },
})

const securedAxiosInstance = axios.create({
  withCredentials: true,
  headers: {
    Accept: 'application/json',
  },
})

securedAxiosInstance.interceptors.request.use(config => {
  const method = config.method.toUpperCase()

  if (method !== 'OPTIONS') {
    config.headers.Authorization = `Bearer ${localStorage.getItem('token')}`
  }

  return config
})

securedAxiosInstance.interceptors.response.use(null, error => {
  if (error.response && error.response.status === 401) {
    store.dispatch('logout')
  }

  return Promise.reject(error)
})

export { plainAxiosInstance, securedAxiosInstance }
