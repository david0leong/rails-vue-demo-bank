import { securedAxiosInstance } from '@/api'

const state = {
  profile: {},
}

const getters = {
  loggedIn: state => !!state.profile.email,
}

const mutations = {
  updateProfile(state, payload) {
    state.profile = payload
  },

  logout(state) {
    state.profile = {}
  },
}

const actions = {
  async fetchProfile({ commit }) {
    const { data } = await securedAxiosInstance.get('/api/v1/profile')

    commit('updateProfile', data)
  },

  logout({ commit }) {
    commit('logout')

    localStorage.removeItem('token')
    location.replace('/')
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
