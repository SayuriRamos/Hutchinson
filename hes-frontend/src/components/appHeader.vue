<template>
  <div>
    <v-navigation-drawer v-model="drawer" fixed app temporary>
      <v-list dense>
        <v-list-item
          v-for="item in items"
          :key="item.title"
          link
          :to="item.path"
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar class="first" app>
      <v-app-bar-nav-icon @click="drawer = !drawer" color="white"></v-app-bar-nav-icon>

      <v-toolbar-title class="white--text">HES</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn>
        <v-icon left>mdi-account-circle</v-icon>
        <span>Iniciar Sesión</span>
      </v-btn>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  name: "Header",
  data() {
    return {
      drawer: null,
      items: [
        { title: "Home", icon: "mdi-home", path: "/" },
        { title: "idea", icon: "mdi-lightbulb", path: "/idea" },
        {
          title: "indicadores",
          icon: "mdi-chart-bar",
          path: "/indicadores",
        },
        {
          title: "reconocimientos",
          icon: "mdi-license",
          path: "/reconocimientos",
        },
        { title: "dashboard", icon: "mdi-view-dashboard", path: "/dashboard" },
        {
          title: "instruccion",
          icon: "mdi-school",
          path: "/instruccion",
        },
      ],
    };
  },
};
</script>

<style scoped></style>