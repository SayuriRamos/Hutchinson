import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from 'vuex-persistedstate'


Vue.use(Vuex);

import { auth } from '../modules/auth.module.js'

export default new Vuex.Store({
  plugins: [createPersistedState({
    storage: window.sessionStorage,
})],
  state: {
    firstLoad: true,
  },
  mutations: {
    setFirstLoad(state, data) {
      state.firstLoad = data;
      console.log(state.firstLoad);
    },

  },
  actions: {},
  modules: {
    auth
  },
  getters: {
    isFirstLoad: state => {return state.firstLoad},
    profile(state) {
      return state.auth.profile;
    },
  }
});
