<template>

  <v-app>
    <v-content>
      <table>
        <tr>
          Proyectos Completos del mes
        </tr>
        <tr>
        <td>
          Septiembre
        </td>
        </tr>
        <td>
    <v-card
      class="d-flex justify-end mb-6"
      :color="$vuetify.theme.dark ? 'grey darken-3' : 'grey lighten-4'"
      flat
      tile
    >
      <v-card
        v-for="n in 1"
        :key="n"
        class="pa-2"
        outlined
        tile
      >
        <Chart />
      </v-card>
    </v-card>
        </td>
    </table>

  </v-content>
  </v-app>
</template>

<script>
import Chart from '@/components/Chart';
export default {
  name: 'indicadores',
  components: {
    Chart,
  },
  data: () => ({
    //
  }),
};
</script>

<style scoped>
@import '../assets/style.css'
</style>