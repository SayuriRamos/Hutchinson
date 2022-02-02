<template>
  <div>
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
    </v-container>
  </div>
</template>

<script>
import HorizontalBarChart from "@/components/HorizontalBarChart.vue";
import VerticalBarChart from "@/components/VerticalBarChart.vue";
import PieChart from "@/components/PieChart.vue";
import axios from "axios";
import { headers } from "../config/headers.ts";

export default {
  name: "Indicators",
  components: {
    HorizontalBarChart,
    VerticalBarChart,
    PieChart,
  },
  data() {
    return {
      propuestas: null,
      porProponer: null,
      verticalBarData: [
        ["ENE",2],
        ["FEB",5],
        ["MAR",8],
        ["ABR",6],
        ["MAY",8],
        ["JUN",9],
        ["JUL",4],
        ["AGO",5],
        ["SEP",7],
        ["OCT",8],
        ["NOV",5],
        ["DIC",3]
      ]
      ,
      pieChartData: [
        ["Propuestas", 0],
        ["Por proponer", this.porProponer],
      ],
      horizontalBarData: [
        //Nombre de empleado y num de ideas
      ],
    };
  },
  async mounted() {
    let response = await axios.get(
      "https://localhost:5001/api/data/getEmpleados",
      {
        method: "GET",
        headers: headers,
        dataType: "json",
      }
    );

    let data = await response.data;
    const empleados = () => {
      const empleadosList = [];
      let x;
      for(x in data){
        empleadosList.push([data[x].idEmpleado, data[x].contadorIdeas]);
      }
      return empleadosList;
    }

    this.horizontalBarData = empleados();


    response = await axios.get("https://localhost:5001/api/data/getIdeasDeMejora", {
      method: "GET",
      headers: headers,
      dataType: "json",
    });

    data = await response.data;
    console.log(data);
    // let monthData = [
    // ["ENE",0],
    // ["FEB",0],
    // ["MAR",0],
    // ["ABR",0],
    // ["MAY",0],
    // ["JUN",0],
    // ["JUL",0],
    // ["AGO",0],
    // ["SEP",0],
    // ["OCT",0],
    // ["NOV",0],
    // ["DIC",0]
    // ]
    //let monthMap = ["01","02","03","04","05","06","07","08","09","10","11","12"]
    
    //, "ENE"
    //, "FEB"
    //, "MAR"
    //, "ABR"
    //, "MAY"
    //, "JUN"
    //, "JUL"
    //, "AGO"
    //, "SEP"
    //, "OCT"
    //, "NOV"
    //, "DIC"
    // console.log("monthData: ",monthData);
    // const fillVerticalChart = () => {
    //   let x;
    //   let month;
    //   let index;
    //   for(x in data){
    //     month = data[x].fechaElaboracion.split("-");
    //     index = monthMap.indexOf(month)
    //     monthData[index][1] = monthData[index][1]+1
    //   }
    // }
    //fillVerticalChart();
    //console.log("Datos del mes: ",monthData);

    //this.verticalBarData = monthData;
    this.propuestas = data.length;
    this.porProponer = 5;
    this.pieChartData = [
        ["Propuestas", this.propuestas],
        ["Por proponer", this.porProponer],
    ]

    this.verticalBarData.unshift(["Mes", "Ideas"]);
    this.pieChartData.unshift(["Tipo", "Progreso"]);
    this.horizontalBarData.unshift(["Nombre", "Avance"]);
  },
};

</script>

<style></style>
