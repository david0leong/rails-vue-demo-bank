const state = {
  loading: false,
  profile: {},
}

const getters = {
  loggedIn: state => !!state.profile.email,
}

const mutations = {
  logout(state) {
    state.profile = {}
  },
}

const actions = {
  logout({ commit }) {
    localStorage.removeItem('token')

    commit('logout')
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
