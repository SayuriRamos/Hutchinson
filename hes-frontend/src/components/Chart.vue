<template>
  <div> <table>
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
<v-container>
      <v-row justify="center">
        <v-col cols="12" sm="8">
          <VerticalBarChart v-bind:inputData="verticalBarData" />
        </v-col>
        <v-col cols="12" sm="4"
          ><PieChart v-bind:inputData="pieChartData"
        /></v-col>
      </v-row>
      <v-row justify="center">
        <v-col
          ><HorizontalBarChart v-bind:inputData="horizontalBarData"
        /></v-col>
      </v-row>
    </v-container>      </v-card>
    </v-card>
        </td>
    </table>
    
  </div>
</template>

<script>
import HorizontalBarChart from "@/components/HorizontalBarChart.vue";
import VerticalBarChart from "@/components/VerticalBarChart.vue";
import PieChart from "@/components/PieChart.vue";
export default {
  name: "Indicators",
  components: {
    HorizontalBarChart,
    VerticalBarChart,
    PieChart,
  },
  data() {
    return {
      verticalBarData: [
        //mes y total de ideas
        ["ENE", 2],
        ["ENE", 2],
      ],
      pieChartData: [
        ["Propuestas", 25],
        ["Por proponer", 25],
      ],
      horizontalBarData: [
        //Nombre de empleado y num. de proyectos
        ["JOHN DOE", 10],
        ["JOHN DOE", 10],
      ],
    };
  },
 
  async mounted() {
    // let response = await axios.get(
    //   "https://swapi.dev/api/people/1",
    //   {
    //     method: "GET",
    //     headers: headers,
    //     dataType: "json",
    //   }
    // );
    // console.log("Server response: ", response.data);
    // let data = await response.json();
    // this.horizontalBarData = data;
    // response = await axios.get("https://swapi.dev/api/people/1", {
    //   method: "POST",
    //   headers: headers,
    //   dataType: "json",
    // });
    // console.log("Server response: ", response.data);
    // data = await response.json();
    // this.verticalBarData = data;
    // response = await axios.get("https://swapi.dev/api/people/1", {
    //   method: "POST",
    //   headers: headers,
    //   dataType: "json",
    // });
    // console.log("Server response: ", response.data);
    // data = await response.json();
    // this.pieChartData = data;
    this.verticalBarData.unshift(["Mes", "Ideas"]);
    this.pieChartData.unshift(["Tipo", "Progreso"]);
    this.horizontalBarData.unshift(["Nombre", "Avance"]);
  },
};
</script>

<style></style>