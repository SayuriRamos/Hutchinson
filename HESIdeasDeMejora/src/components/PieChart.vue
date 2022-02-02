<template>
  <div id="app">
    <GChart
      :settings="{ packages: ['corechart'] }"
      :data="inputData"
      :options="chartOptions"
      :createChart="(el, google) => new google.visualization.PieChart(el)"
      @ready="onChartReady"
    />
  </div>
</template>

<script>
import { GChart } from "vue-google-charts";
export default {
  components: {
    GChart,
  },
  props: {
    inputData: Array,
  },
  computed: {
    chartOptions() {
      return {
        title: "Avance global de meta anual",
        height: 300,
        colors: ["#435898", "#8293ee"],
        pieHole: 0.5,
        legend: "none",
      };
    },
  },
  methods: {
    onChartReady(chart, google) {
      this.chartsLib = google;
    },
  },
};
</script>
