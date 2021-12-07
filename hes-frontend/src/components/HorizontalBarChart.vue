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
      if (!this.chartsLib) return null;
      return this.chartsLib.charts.Bar.convertOptions({
        chart: {
          title: "Cumplimiento de meta anual",
        },
        bars: "horizontal", // Required for Material Bar Charts.
        hAxis: { format: "decimal" },
        height: 300,
        
        colors: ["#435898"],
      });
    },
  },
  methods: {
    onChartReady(chart, google) {
      this.chartsLib = google;
    },
  },
};
</script>