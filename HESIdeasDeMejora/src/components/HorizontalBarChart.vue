<template>
  <div id="app">
    <GChart
      :settings="{ packages: ['bar'] }"
      :data="inputData"
      :options="chartOptions"
      :createChart="(el, google) => new google.charts.Bar(el)"
      @ready="onChartReady"
    />
  </div>
</template>

<script>
import { GChart } from "vue-google-charts";
export default {
  name: "App",
  components: {
    GChart,
  },
  props: {
    inputData: Array,
  },
  data() {
    return {
      chartsLib: null,
    };
  },
  computed: {
    chartOptions() {
      return {
        chart: {
          title: "Cumplimiento de meta anual",
          subtitle: "Por empleado",
        },
        bars: "horizontal", // Required for Material Bar Charts.
        hAxis: { format: "decimal" },
        height: 300,
        colors: ["#435898"],
        legend: { position: "none" },
        axes: {
          x: {
            0: { label: "Número de ideas" },
          },
          y: {
            0: { label: "Empleado" },
          },
        },
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
