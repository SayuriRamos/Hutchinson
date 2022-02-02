<template>
  <div>
    <v-card style="margin: 2rem">
      <v-card-title>
        Reportes de Idea de Mejora
        <v-spacer></v-spacer>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="items"
        :search="search"
        pagination.sync="pagination"
        item-key="id"
        loading="true"
        @click:row="loadReport"
      >
      </v-data-table>
    </v-card>
  </div>
</template>

<script>
import axios from "axios";
import { headers } from "../config/headers.ts";
export default {
  data() {
    return {
      search: "",
      headers: [
        {
          text: "# Propuesta",
          align: "start",
          value: "numProp",
        },
        { text: "Mes", value: "mes" },
        { text: "Fecha Propuesta", value: "fecha" },
        { text: "Área de quien propone", value: "areaPropone" },
        { text: "Título", value: "titulo" },
        { text: "Área de mejora", value: "areaMejora" },
        { text: "Tipo de mejora", value: "tipoMejora" },
        { text: "Gerente", value: "gerente" },
        { text: "# Aprobación", value: "noAprobacion" },
        { text: "Estatus", value: "estatus" },
      ],
      items: [
        {
          numProp: "No hay datos",
          mes: "",
          fecha: "",
          areaPropone: "",
          titulo: "",
          areaMejora: "",
          tipoMejora: "",
          gerente: "",
          noAprobacion: "",
          estatus: "",
        },
      ],
    };
  },
  methods: {
    loadReport(row) {
      console.log("items: ", this.items);
      let id = row.numProp;
      const route = this.items[id - 1];
      let approval = "approval1";

      if (route.noAprobacion == "Aprobacion 1") {
        approval = "approval2";
      }
      if (route.noAprobacion == "Aprobacion 2") {
        approval = "assignment";
      }

      let valid = route.estatus;
      if (valid != "rechazado" && approval != "assignment") {
        this.$router.push(`/${approval}/` + id);
      }
      if (approval == "assignment") {
        this.$router.push(`/${approval}/` + id);
      }

      console.log("load report: ", route.noAprobacion);
      console.log("valid: ", valid);
    },
  },
  async mounted() {
    const response = await axios.get(
      "https://localhost:5001/api/data/dashboard",
      {
        method: "GET",
        headers: headers,
      }
    );
    let approval1 = await axios.get(
      `https://localhost:5001/api/data/getAprobacion1`,
      {
        method: "GET",
        headers: headers,
      }
    );
    let approval2 = await axios.get(
      `https://localhost:5001/api/data/getAprobacion2`,
      {
        method: "GET",
        headers: headers,
      }
    );

    console.log("Server response: ", response.data);
    if (response.data.length > 0) {
      this.items = response.data;

      let x;
      for (x in this.items) {
        let id = this.items[x].numProp;
        this.items[x].noAprobacion = "N/A";
        this.items[x].estatus = "N/A";
        let y;
        for (y in approval1.data) {
          if (id == approval1.data[y].idReporte) {
            this.items[x].noAprobacion = "Aprobacion 1";
            this.items[x].estatus = approval1.data[y].aprobado;
          }
        }
      }
      for (x in this.items) {
        let id = this.items[x].numProp;
        let y;
        for (y in approval2.data) {
          if (id == approval2.data[y].idReporte) {
            this.items[x].noAprobacion = "Aprobacion 2";
            this.items[x].estatus = approval2.data[y].factible;
          }
        }
      }
      console.log("Approval1: ", approval1.data[0].idReporte);
      console.log("Approval1: ", approval1.data);
      console.log("Approval2: ", approval2.data);

      console.log("Items: ", this.items);
    }
  },
};
</script>

<style></style>
