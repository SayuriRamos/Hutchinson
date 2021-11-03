<template>
    <v-app>
      <v-navigation-drawer
      absolute
      v-model="drawer"
      left
      temporary
      :style="{ top: $vuetify.application.top + 'px', zIndex: 6 }"
    >
      <div id="dashboard">
        <v-list nav dense>
          <v-list-item-group v-model="group" active-class="text--accent-4">
            <v-list-item >
              <v-list-item-title>Inicio</v-list-item-title>
            </v-list-item>

          <v-list-item>
              <v-list-item-title>Indicadores</v-list-item-title>
            </v-list-item>

          <v-list-group :value = "true">
            <template v-slot:activator>
              <v-list-item-title>Dashboard</v-list-item-title>
            </template>

                <v-list-item-content>
                  <v-list-item-title>Propuestas de mejora</v-list-item-title>
                </v-list-item-content>

                <v-list-item-content>
                  <v-list-item-title>Control EEP</v-list-item-title>
                </v-list-item-content>

                <v-list-item-content>
                  <v-list-item-title>Administración SSMA</v-list-item-title>
                </v-list-item-content>
          </v-list-group>
           </v-list-item-group>

        </v-list>
      </div>
    </v-navigation-drawer>
      <v-app-bar app color="#16365C" dark dense>

      <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>
        <v-toolbar-title >
          <v-btn icon large>
              <v-avatar size="32px">
                <img :src="require('./assets/hutchinson.png')" alt="Hutchinson"/>
              </v-avatar>
          </v-btn>
          <span class="hidden-sm-and-down">HES</span>
        </v-toolbar-title>

        <v-spacer></v-spacer>

        <div class="mr-3 font-weight-medium"> {{ profile.nombre || 'Iniciar Sessión'}}</div>

        <v-avatar size="32px">
          <v-menu v-if="profile.nombre" offset-y>
            <template v-slot:activator="{ on }">
              <img :src="require('./assets/hutchinson.png')" alt="Avatar" v-on="on"> 
            </template>
            <v-list>
              <v-list-item @click="logout()">
                <v-list-item-title>Cerrar Sessión</v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>  
          <img v-else src="@/assets/user.png" alt="Avatar" @click="loginDialog = true"/>    
        </v-avatar>

    </v-app-bar>

    <v-main>
      <v-alert
        dense
        type="warning"
        v-if="isIE()"
      >
        For better performance use chrome or firefox instead
      </v-alert>

      <router-view/>
    </v-main>

    <Login :dialog="loginDialog" @close="loginDialog = false" />


  </v-app>
</template>

<script>

import Login from './components/Login'


export default {
  name: "App",
  components: {
    Login,

  },

  data() {
    return {
      loginDialog: false
    }
  },

  methods: {

    navigate(to) {
      this.$router.push({name: to})
    },

    isIE() {

      if(navigator.userAgent.indexOf('MSIE')!==-1
          || navigator.appVersion.indexOf('Trident/') > -1
          || /Edge\/\d./i.test(navigator.userAgent)){
          return true
      }

      return false
    },

    logout(){

      this.$store.dispatch('auth/logout')
      
      if(this.$route.name != 'Home')
        this.$router.push({name: 'Home'});
    
    },

  },

  computed: {
    profile() { 
      return this.$store.state.auth.profile;
    },
  }
};
</script>

