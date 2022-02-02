<template>
  <v-app>
    <Header />
    <v-main>
      <div id="app">
        <router-view />
      </div>
    </v-main>
  </v-app>
</template>

<script>
import Header from "@/components/Header.vue";
export default {
  components: { Header },
};
</script>

<style>
html {
  font-family: Arial, Helvetica, sans-serif;
}
</style>
