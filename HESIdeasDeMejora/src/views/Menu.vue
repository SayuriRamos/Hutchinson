<template>
  <v-container>
    <v-row>
      <v-col>
        <h3>SISTEMA DE IDEAS DE MEJORA</h3>
      </v-col>
    </v-row>
    <v-row justify="center">
      <v-col cols="12" md="3" align-self="center">
        <v-img src="../assets/logo.png" max-height="20rem" contain />
      </v-col>
      <v-col cols="">
        <v-container>
          <v-row>
            <v-col cols="12" sm="4">
              <v-btn block color="info" to="/">INICIO</v-btn>
            </v-col>
            <v-col cols="12" sm="8">
              <Idea />
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" sm="4">
              <v-btn block color="info" to="/instruccion"> INSTRUCCIÓN </v-btn>
            </v-col>
            <v-col cols="12" sm="4">
              <v-btn block color="info" to="/indicadores"> INDICADORES </v-btn>
            </v-col>
            <v-col cols="12" sm="4">
              <v-btn block color="info" to="/reconocimientos">
                RECONOCIMIENTOS
              </v-btn>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <v-btn block color="info" to="/dashboard"
                >ESTATUS DE PROPUESTAS DE MEJORA</v-btn
              >
            </v-col>
          </v-row>
        </v-container>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Idea from "@/components/Idea.vue";
export default {
  name: "Menu",
  components: {
    Idea,
  },
};
</script>

<style>
h3 {
  text-align: center;
}
</style>
