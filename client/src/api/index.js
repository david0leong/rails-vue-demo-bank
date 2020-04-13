import axios from 'axios'

const plainAxiosInstance = axios.create({
  withCredentials: true,
  headers: {
    Accepet: 'application/json',
  },
})

const securedAxiosInstance = axios.create({
  withCredentials: true,
  headers: {
    Accepet: 'application/json',
  },
})

securedAxiosInstance.interceptors.request.use(config => {
  const method = config.method.toUpperCase()

  if (method !== 'OPTIONS') {
    config.headers.Authorization = `Bearer ${localStorage.token}`
  }

  return config
})

export { plainAxiosInstance, securedAxiosInstance }
