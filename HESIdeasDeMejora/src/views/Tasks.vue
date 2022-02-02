<!-- comentarios generales
    - en cuanto cargue la pantalla, se ocupa cargar los datos de los siguientes campos:
            - Piloto / Responsable
            - Indicador de Mejora
            - Indicador Inicial
            - U / M
    - La mejora obtenida se calculará con un método (se necesita que el usuario ingrese el Indicador Final)
    - falta el botón Guardar
    - botón Finalizar se supone que manda una alerta al administrador para que haga la validación y cierre
    - falta botón Ver propuesta

    -->

<template>
  <v-container>
    <v-row>
      <v-col>
        <h2>SISTEMA DE IDEAS DE MEJORA</h2>
        <h3>Acciones de mejora</h3>
      </v-col>
    </v-row>
    <v-row>
      <div class="inicio">
        <!-- El piloto se va a obtener de la base de datos, se guardó en la pantalla Assignment (Seleccionar Piloto) -->
        <p>RESPONSABLE: {{ nombrePiloto }}</p>
      </div>
    </v-row>

    <div class="ma-4 acciones">
      <v-row>
        <template>
          <v-card width="100%">
            <v-card-title>
              Acciones de mejora
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
              loading-text="No hay acciones."
            >
            </v-data-table>
          </v-card>
        </template>

        <v-dialog v-model="dialogAgregarAccion" width="500">
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              block
              color="blue"
              class="ma-8 white--text"
              v-bind="attrs"
              v-on="on"
              justify="right"
              >Agregar acción</v-btn
            >
          </template>

          <v-card>
            <v-card-title class="text-h5 grey lighten-2">
              Agregar acción
            </v-card-title>

            <v-card-actions>
              <v-row>
                <v-text-field
                  v-model="accion"
                  class="ma-4"
                  label="Acción a realizar"
                  value=""
                ></v-text-field>
              </v-row>
            </v-card-actions>

            <v-card-actions>
              <v-row>
                <v-text-field
                  v-model="descripcionAccion"
                  class="ma-4"
                  label="Descripción"
                  value=""
                ></v-text-field>
              </v-row>
            </v-card-actions>

            <v-card-actions>
              <v-row>
                <v-col>
                  <v-btn
                    block
                    color="blue"
                    class="pa-4 white--text"
                    @click="dialogAgregarAccion = false"
                  >
                    CANCELAR
                  </v-btn>
                </v-col>
                <v-col>
                  <v-btn
                    block
                    color="blue"
                    class="white--text"
                    @click="agregarAccion()"
                  >
                    ACEPTAR
                  </v-btn>
                </v-col>
              </v-row>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-row>
    </div>

    <v-row>
      <v-col>
        <p class="resultados">(Después)</p>
        <v-file-input
          v-model="imgDespues"
          label="Cargar imagen"
          filled
          prepend-icon="mdi-camera"
          class="ma-4"
        ></v-file-input>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <p class="resultados">Resultados</p>
        <v-row>
          <v-col>
            <!-- se obtiene de la base de datos, se guardó a través de la pantalla Assignment -->
            <p>Indicador de mejora</p>
            <v-text-field
              v-model="indicadorMejora"
              solo
              readonly
            ></v-text-field>
          </v-col>

          <v-col>
            <!-- se obtiene de la base de datos, se guardó a través de la pantalla Assignment -->
            <p>Indicador inicial</p>
            <v-text-field
              v-model="indicadorInicial"
              solo
              readonly
            ></v-text-field>
          </v-col>

          <v-col>
            <!-- el usuario lo ingresa -->
            <p>Indicador final</p>
            <v-text-field v-model="indicadorFinal" solo></v-text-field>
          </v-col>

          <v-col>
            <!-- se obtiene de la base de datos, se guardó a través de la pantalla Assignment -->
            <p>U/M</p>
            <v-text-field v-model="unidadMedida" solo readonly></v-text-field>
          </v-col>

          <v-col>
            <!-- se obtiene con un método -->
            <p>Mejora obtenida</p>
            <v-text-field v-model="mejoraObtenida" solo readonly></v-text-field>
          </v-col>
        </v-row>
      </v-col>
    </v-row>

    <v-divider class="ma-4"></v-divider>

    <v-row>
      <v-col>
        <p class="resultados">Estándar actualizado</p>
        <v-row>
          <v-col>
            <p>Nombre</p>
            <v-text-field v-model="nombreEstandar" value="" solo></v-text-field>
          </v-col>

          <v-col>
            <p>Nomenclatura</p>
            <v-text-field
              v-model="nomenclaturaEstandar"
              value=""
              solo
            ></v-text-field>
          </v-col>
        </v-row>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-btn block color="blue" class="pa-4 white--text">GUARDAR</v-btn>
      </v-col>
      <v-col>
        <v-btn block color="blue" class="pa-4 white--text">FINALIZAR</v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data: () => ({
    search: "",
    headers: [
      {
        text: "Acción",
        align: "start",
        value: "accion",
      },
      { text: "Descripción", value: "descripcion" },
    ],
    items: [],
    accion: "",
    descripcionAccion: "",
    nomenclaturaEstandar: "",
    nombreEstandar: "",
    mejoraObtenida: "",
    unidadMedida: "",
    indicadorFinal: "",
    indicadorInicial: "",
    indicadorMejora: "",
    nombrePiloto: "",
    imgDespues: null,
    dialogAgregarAccion: false,
  }),
  mounted() {
    this.nombrePiloto = this.$route.params.a;
    this.indicadorMejora = this.$route.params.b;
    this.indicadorInicial = this.$route.params.c;
    this.unidadMedida = this.$route.params.d;
  },
  methods: {
    agregarAccion() {
      this.items.push({
        accion: this.accion,
        descripcion: this.descripcionAccion,
      });
      this.dialogAgregarAccion = false;
      this.accion = "";
      this.descripcionAccion = "";
      // se guarda la acción a realizar junto con su descripción y se acomoda en la lista de acciones de mejora
    },
    calcularMejoraObtenida() {
      // calcular mejora obtenida: Valor Final / Valor Inicial * 1 = %
      // valor inicial se obtiene de la base de datos y el valor final el usuario lo ingresa
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
