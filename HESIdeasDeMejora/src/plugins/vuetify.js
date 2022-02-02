import Vue from "vue";
import Vuetify from "vuetify/lib/framework";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    themes: {
      light: {
        first: "#172646",
        second: "#435898",
        third: "#7b92f5",
        fourth: "#bfd0ff;",
        accent: "#000000",
        error: "#f00",
      },
    },
  },
});
