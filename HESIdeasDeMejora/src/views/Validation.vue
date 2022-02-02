<!-- comentarios generales
        - en cuanto cargue la pantalla, se ocupa cargar los datos que se recolectaron de la pantalla Tasks
        - falta el botón Ver propuesta
        - el botón Validar aparecerá un cuadro de diálogo
            - el botón Aceptar dentro de este cuadro, hará un método POST
                - si estaba seleccionada la opción validar, entonces se cerrará la idea propuesta y se mandará señal de que ya está finalizada
                - si está seleccionada la opción retroalimentar, entonces se enviará señal al piloto para corregir y finalizar de nuevo
 -->

<template>
  <v-container>
    <v-row>
      <v-col>
        <v-btn color="info">Ver propuesta</v-btn>
        <h2>SISTEMA DE IDEAS DE MEJORA</h2>
        <h3>Acciones de mejora</h3>
      </v-col>
    </v-row>
    <v-row>
      <div class = "inicio">
        <!-- El piloto se va a obtener de la base de datos, se guardó en la pantalla Assignment (Seleccionar Piloto) -->
         <p>RESPONSABLE: piloto</p>
      </div>
    </v-row>

    <div class="ma-4 acciones">
        <v-row>
            <template>
                <v-card class="mx-auto" max-width="400" tile>
                    <v-list-item single-line>
                        <v-list-item-content>
                            <v-list-item-title align="center">Acciones</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>

                    <v-list-item two-line>
                        <v-list-item-content>
                            <!-- La acción y la descripción se obtendrán del cuadro de diálogo que se llena al hacer click en el botón Agregar acción -->
                            <v-list-item-title align="center">Acción a realizar</v-list-item-title>
                            <v-list-item-subtitle align="center">Descripción</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>

                    <v-list-item two-line>
                        <v-list-item-content>
                            <v-list-item-title align="center">Acción a realizar</v-list-item-title>
                            <v-list-item-subtitle align="center">Descripción</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                </v-card>
            </template>
        </v-row>
    </div>

    <v-row>
        <v-col>
            <p class="resultados">(Después)</p>
            <v-img v-model="imgAntes" max-height="100%" max-width="100%" src="../assets/prueba.png" aspect-ratio="1.7"></v-img>
        </v-col>
    </v-row>

    <v-row>
        <v-col>
            <p class="resultados">Resultados</p>
            <v-row>
                <v-col>
                    <p>Indicador de mejora</p>
                    <v-text-field v-model="indicadorMejora" solo readonly></v-text-field>
                </v-col>

                <v-col>
                    <p>Indicador inicial</p>
                    <v-text-field v-model="indicadorInicial" solo readonly></v-text-field>
                </v-col>

                <v-col>
                    <p>Indicador final</p>
                    <v-text-field v-model="indicadorFinal" solo readonly></v-text-field>
                </v-col>

                <v-col>
                    <p>U/M</p>
                    <v-text-field v-model="unidadMedida" solo readonly></v-text-field>
                </v-col>

                <v-col>
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
                    <v-text-field v-model="nombreEstandar" value="" solo readonly></v-text-field>
                </v-col>

                <v-col>
                    <p>Nomenclatura</p>
                    <v-text-field v-model="nomenclaturaEstandar" value="" solo readonly></v-text-field>
                </v-col>
            </v-row>
        </v-col>
    </v-row>

    <v-row>
        <v-col>
            <v-btn block color="blue" class="pa-4 white--text">GUARDAR</v-btn>
        </v-col>
        <v-col>
            <v-dialog v-model="dialogValidar" max-width="500">
                <template v-slot:activator="{ on, attrs }">
                    <v-btn block color="blue" class="pa-4 white--text" v-bind="attrs" v-on="on">VALIDAR</v-btn>
                </template>

                <v-card>
                    <v-card-title class="text-h5 grey lighten-2">
                        Validación
                    </v-card-title>

                    <div id="validarRetroalimentar">
                    <v-card-actions>
                        <v-radio-group v-model="validacion" row class="ma-2">
                            <v-radio label="Validar" value="validar"></v-radio>
                            <v-radio label="Retroalimentar" value="retroalimentar"></v-radio>
                        </v-radio-group>
                    </v-card-actions>
                    
                    <div v-if="validacion == 'retroalimentar'">
                        <v-card-actions>
                            <v-row>
                                <v-text-field v-model="rechazoComentarios" label="Comentarios" value="" solo class="ma-2"></v-text-field>
                            </v-row>
                        </v-card-actions>
                    </div>

                    <v-card-actions>
                        <v-row>
                            <v-col>
                                <v-btn block color="blue" class="ma-2 white--text" @click="dialogValidar = false">
                                    CANCELAR
                                </v-btn>
                            </v-col>
                            <v-col>
                                <v-btn block color="blue" class="ma-2 white--text" @click="aceptar()">
                                    ACEPTAR
                                </v-btn>
                            </v-col>
                        </v-row>
                    </v-card-actions>
                    </div>
                </v-card>
            </v-dialog>
        </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
    data: () => ({
      accion: "",
      descripcionAccion: "",
      nomenclaturaEstandar: "",
      nombreEstandar: "",
      mejoraObtenida: "",
      unidadMedida: "",
      indicadorFinal: "",
      indicadorInicial: "",
      indicadorMejora: "",
      imgDespues: null,      
      validacion: "validar",
      dialogValidar: false,
    }),
    methods:
    {
       
    }
  }
</script>

<style>
h3 {
  text-align: center;
}
h2 {
  text-align: center;
}
.inicio{
    font-weight: bold;
}
.resultados{
    font-weight: bold;
}
.infogeneral p{
    margin: 0 auto;
}
</style>
