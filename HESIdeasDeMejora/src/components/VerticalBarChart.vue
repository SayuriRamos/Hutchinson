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
      // Array will be automatically processed with visualization.arrayToDataTable function
    };
  },
  computed: {
    chartOptions() {
      return {
        chart: {
          title: "Ideas de Mejora",
          subtitle: "Por mes",
        },
        bars: "vertical", // Required for Material Bar Charts.
        hAxis: { format: "decimal" },
        height: 300,
        colors: ["#435898"],
        legend: { position: "none" },
        axes: {
          y: {
            0: {label: 'Número de ideas'}
          }
        }
      }
    },
  },
  methods: {
    onChartReady(chart, google) {
      this.chartsLib = google;
    },
  },
};
</script>
