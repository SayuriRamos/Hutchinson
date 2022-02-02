<!-- comentarios generales
    - falta botón Ver propuesta
    - el botón Guardar va a hacer un método POST porque estos datos se ocuparán en la pantalla Tasks
    - el botón Cerrar no estoy segura de a dónde tiene que regresar
 -->

<template>
  <v-container>
    <v-row>
      <v-col>
        <h2>SISTEMA DE IDEAS DE MEJORA</h2>
        <h3>Asignar piloto</h3>
      </v-col>
    </v-row>
    <v-row>
      <div class="inicio">
        <p>RESPONSABLES Y ACCIONES</p>
      </div>
    </v-row>

    <v-row>
      <v-select
        v-model="seleccionarPiloto"
        class="pa-4"
        width="5%"
        :items="seleccionarPilotoSelect"
        label="Seleccionar piloto"
      ></v-select>
      <v-select
        v-model="indicadorMejora"
        class="pa-4"
        width="5%"
        :items="indicadorMejoraSelect"
        label="Indicador de mejora"
      ></v-select>
      <v-text-field
        v-model="indicadorInicial"
        label="Indicador inicial"
        value=""
      ></v-text-field>
      <v-select
        v-model="unidadMedida"
        class="pa-4"
        width="5%"
        :items="unidadMedidaSelect"
        label="U/M"
      ></v-select>
    </v-row>

    <v-row>
      <v-col>
        <v-btn block color="blue" class="pa-4 white--text" @click="cerrar"
          >CERRAR</v-btn
        >
      </v-col>
      <v-col>
        <v-btn block color="blue" class="pa-4 white--text" @click="guardar()"
          >GUARDAR</v-btn
        >
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data: () => ({
    seleccionarPilotoSelect: ["Nombre1", "Nombre2", "Nombre3", "Nombre4"],
    indicadorMejoraSelect: [
      "Cantidaddepiezas",
      "Tiempodeespera",
      "Tiempodeciclo",
      "Manodeobra",
      "%Eficiencia",
      "Tiempomuerto",
      "Pisoutilizado",
      "Inventarios",
      "Equipoutilizado",
      "Desperdiciodematerial",
      "Partesyrefacciones",
      "Retrabajos",
      "Flujo/Transportación",
      "Rechazosinternos",
      "Rechazosexternos",
    ],
    unidadMedidaSelect: ["MIN", "QTY", "%", "M/2", "$", "M", "PZS"],
    dialog: false,
  }),
  methods: {
    guardar() {
      const id = this.$route.params.id;
      const a = this.seleccionarPiloto;
      const b = this.indicadorMejora;
      const c = this.indicadorInicial;
      const d = this.unidadMedida;
      this.$router.push(`/tasks/` + id + "/" + a + "/" + b + "/" + c + "/" + d);
    },
  },
};
</script>

<style>
h3 {
  text-align: center;
}
h2 {
  text-align: center;
}
.inicio {
  font-weight: bold;
}
.resultados {
  font-weight: bold;
}
.infogeneral p {
  margin: 0 auto;
}
</style>
