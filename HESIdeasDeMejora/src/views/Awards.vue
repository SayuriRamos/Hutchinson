<template>
  <div>
    <v-container grid-list-xs>
      <v-row>
        <v-col cols="12">
          <h4>MEJORES IDEAS DEL MES</h4>
        </v-col>
      </v-row>
      <v-row justify="space-around">
        <!-- Podium, 3 of the below cols -->
        <ProjectCard :items="firstPlace" />
        <ProjectCard :items="secondPlace" />
        <ProjectCard :items="thirdPlace" />
      </v-row>
    </v-container>
    <div style="height: 50px"></div>
    <v-card style="margin: 0 2rem">
      <v-card-title> Mejores Reportes de Idea </v-card-title>
      <v-data-table
        :headers="tableHeaders"
        :items="tableData"
        pagination.sync="pagination"
        item-key="id"
        loading="true"
      >
      </v-data-table>
    </v-card>
  </div>
</template>

<script>
import ProjectCard from "@/components/ProjectCard.vue";
import axios from "axios";
import { headers } from "../config/headers.ts";

export default {
  components: { ProjectCard },
  data() {
    return {
      tableHeaders: [
        {
          text: "# Prop",
          align: "start",
          value: "numProp",
        },
        { text: "Nombre", value: "nombre" },
        { text: "Área de quien propone", value: "areaPropone" },
        { text: "Título de la propuesta", value: "titulo" },
      ],
      tableData: [
        { numProp: "123", nombre: "asdf", areaPropone: "asdf", titulo: "asdf" },
      ],
      firstPlace: {
        place: "1",
        title: "test",
        author: "author",
        description: "description",
      },
      secondPlace: {
        place: "2",
        title: "test",
        author: "author",
        description: "description",
      },
      thirdPlace: {
        place: "3",
        title: "test",
        author: "author",
        description: "description",
      },
    };
  },
  async mounted() {
    let response = await axios.get(
      "https://localhost:5001/api/data/awards/topThree",
      {
        method: "GET",
        headers: headers,
        dataType: "json",
      }
    );

    console.log("Server response: ", response.data);

    let data = response.data;

    this.firstPlace = data[0];
    this.secondPlace = data[1];
    this.thirdPlace = data[2];
    this.firstPlace.place = 1;
    this.secondPlace.place = 2;
    this.thirdPlace.place = 3;

    response = await axios.get("https://localhost:5001/api/data/awards/table", {
      method: "POST",
      headers: headers,
      dataType: "json",
    });

    //data = await response.json();

    this.tableData = response.data;
  },
};
</script>

<style scoped>
h3,
h4,
p {
  text-align: center;
}
</style>
