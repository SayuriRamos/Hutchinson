<!-- comentarios generales
    - al cargar la pantalla se ocupan:
                - los datos de la idea propuesta
    - falta que propuesta factible se pinte de verde y propuesta no factible de naranja
    - los botones Propuesta factible y Propuesta no factible abren cuadros de diálogo
        - el botón Aceptar en ambos cuadros de diálogo hacen un método POST para guardar si la idea fue aprobada por segunda ocasión o si se rechazó
    

 -->


<template>
  <v-container>
    <v-row>
      <v-col>
        <h2>SISTEMA DE IDEAS DE MEJORA</h2>
        <h3>Segunda aprobación - Aprobación técnica (Supervisor / Ingeniería)</h3>
      </v-col>
    </v-row>
    <v-row justify="left">
      <div class = "inicio">
         <p>INFORMACIÓN GENERAL <span id = "icon">PENDIENTE DE REVISIÓN (HES)</span></p>
      </div>
    </v-row>

    <v-row> 
        <p>
        <v-dialog v-model="dialogCerrar" width="500">       
            <template v-slot:activator="{ on, attrs }">
                <v-btn x-small plain v-bind="attrs" v-on="on" @click="cerrar()">
                    Cerrar
                </v-btn>
            </template>



        </v-dialog>
        |
        <v-dialog v-model="dialogPropuestaFactible" width="500">       
            <template v-slot:activator="{ on, attrs }">
                <v-btn x-small plain v-bind="attrs" v-on="on" class="propuestaFactibleBtn">
                    Propuesta factible
                </v-btn>
            </template>

            <v-card>
                <v-card-title class="text-h5 grey lighten-2">
                    Finalizar propuesta
                </v-card-title>

                <div id="propuestaFactible">
                    <h3 class="ma-4">¿Es factible realizar esta propuesta de mejora?</h3>
                        <v-card-actions>
                            <v-row>
                                <v-col>
                                    <v-btn block color="blue" class="white--text" @click="dialogPropuestaFactible = false">
                                        CANCELAR
                                    </v-btn>
                                </v-col>
                                <v-col>
                                    <v-btn block color="blue" class="white--text" @click="aceptarFactible()">
                                        ACEPTAR
                                    </v-btn>
                                </v-col>
                            </v-row>
                        </v-card-actions>
                    </div>
            </v-card>
        </v-dialog>
        |
        <v-dialog v-model="dialogPropuestaNoFactible" width="500">       
            <template v-slot:activator="{ on, attrs }">
                <v-btn x-small plain v-bind="attrs" v-on="on">
                    Propuesta no factible
                </v-btn>
            </template>

            <v-card>
                <v-card-title class="text-h5 grey lighten-2">
                    Propuesta no factible
                </v-card-title>

                <div id="aprobarRechazar">
                <v-card-actions>
                    <v-row>
                        <v-select class="pa-4" v-model="rechazoJustificacion" :items="noFactJustificacionItems" label="Justificación"></v-select>
                    </v-row>
                </v-card-actions>
                    <v-row>
                        <v-textarea name="noFactComentarios" v-model="rechazoComentarios" class="pa-8" label="Comentarios" value="" solo auto-grow></v-textarea>
                    </v-row>
                <v-card-actions>
                    <v-row>
                        <v-col>
                            <v-btn block color="blue" class="pa--4 ma--4 white--text" @click="cerrar()">
                                CANCELAR
                            </v-btn>
                        </v-col>
                        <v-col>
                            <v-btn block color="blue" class="pa--4 ma--4 white--text" @click="rechazarFactible()">
                                ACEPTAR
                            </v-btn>
                        </v-col>
                    </v-row>
                </v-card-actions>
                </div>
            </v-card>
        </v-dialog>
        </p>
    </v-row>

    <div class="infogeneral">
        <v-row>
            <v-col>
                <v-text name="hola"># Propuesta</v-text>
            </v-col>
            <v-col>
                <v-text>Propuesta por</v-text>
            </v-col>
            <v-col>
                <v-text>UAP/DEPTO</v-text>
            </v-col>
            <v-col>
                <v-text>Área de quien propone</v-text>
            </v-col>
            <v-col>
                <v-text>Fecha</v-text>
            </v-col>
        </v-row>    
        <v-row>
            <v-col>
                <v-text-field v-model="numPropuesta" value="" readonly>
                </v-text-field>
            </v-col>
            <v-col>
                <v-text-field v-model="nombreEmisor" readonly>JESÚS CARRILLO</v-text-field> 
            </v-col>
            <v-col>
                <v-text-field v-model="nombreDepto" readonly>HES</v-text-field>
            </v-col>
            <v-col>
                <v-text-field v-model="areaPropone" readonly>HES</v-text-field>
            </v-col>
            <v-col>
                <v-text-field v-model="fecha" readonly>04/08/2021</v-text-field>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <v-text>Gnte. de quien</v-text>
            </v-col>
            <v-col>
                <v-text>Área de la Mejora</v-text>
            </v-col>
            <v-col>
                <v-text>Supervisor del área de mejora</v-text>
            </v-col>
            <v-col>
                <v-text>Tipo de Mejora</v-text>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <v-text-field v-model="nombreGnte" readonly>JESÚS CARRILLO</v-text-field>
            </v-col>
            <v-col>
                <v-text-field v-model="areaMejora" readonly>Almacén</v-text-field>
            </v-col>
            <v-col>
                <v-text-field v-model="nombreSupervisor" readonly>AARON MANRIQUEZ</v-text-field>
            </v-col>
            <v-col>
                <v-text-field v-model="tipoMejora" readonly>Movimientos</v-text-field>
            </v-col>
        </v-row>
        </div>

        <v-divider class="ma-8"></v-divider>

        <div class="datosidea">
        <v-row>
            <v-col>
                <p>Título de la propuesta</p>
                <v-text-field v-model="tituloPropuesta" value="Hola" solo readonly></v-text-field>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <p>Oportunidad de mejora</p>
                <v-text-field v-model="opMejora" value="" solo readonly></v-text-field>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <p>(Antes)</p>
                <v-img v-model="imgAntes" max-height="100%" max-width="100%" src="../assets/prueba.png" aspect-ratio="1.7"></v-img>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <p>Propuesta de mejora</p>
                <v-textarea v-model="propuestaMejora" value="" readonly solo auto-grow></v-textarea>
            </v-col>
        </v-row>
        </div>
        <template>
            <v-row>
                <v-col>
                    <v-btn block color="blue" class="ma-2 white--text">Guardar</v-btn>
                </v-col>
                <v-col>
                    <v-btn block color="blue" class="ma-2 white--text">Finalizar</v-btn>
                </v-col>
            </v-row>
        </template>
  </v-container>
</template>

<script>
import axios from 'axios';
import {headers} from "../config/headers.ts";
export default {
    data: () => ({
    dialogAprobacion: false,
    dialogCerrar: false,
    tipoMejoraItems: ['Movimientos', 'Inventario', 'Proceso / Organización', 'Sobreproducción', 'Tiempo', 'Calidad: Defectos/Retrabajos', 'Esperas', 'Costos / Ahorros', 'Medio ambiente / Energía'],
    rechazoJustificacionItems: ['Existe un proyecto relacionado con la mejora', 'No es viable por inversión', 'No es idea, es corrección', 'No es idea, es necesidad'],
    primeraAprobacion: "aprobar",
    propuestaMejora: "",
    opMejora: "",
    imgAntes: "",
    nombreDepto: "",
    tituloPropuesta: "",
    tipoMejora: "",
    nombreSupervisor: "",
    areaMejora: "",
    nombreGnte: "",
    fecha: "",
    areaPropone: "",
    nombreEmisor: "",
    numPropuesta: "",
    rechazoComentarios: "",
    rechazoJustificacion: "",
    aprobar: null,
    rechazar: null,
    dialogPropuestaNoFactible: false,
    dialogPropuestaFactible: false,
    noFactJustificacionItems: ['No es viable por riesgo de seguridad', 'No es viable, incumple especificaciones de proceso', 'No es viable, riesgo de calidad', 'No es viable, falta de tecnología'],
    }),
    async mounted(){
        const idReporte = this.$route.params.idReporte;
        const response = await axios.get(`https://localhost:5001/api/data/getReporteIdea/${idReporte}`, { 
        method: "GET",
        headers: headers
        });
        const data = response.data[0];
        console.log(data);
        this.numPropuesta = data.idReporte;
        this.tituloPropuesta = data.titulo;
        this.opMejora = data.oportunidad;
        this.propuestaMejora = data.propuesta;

        const tipoMejora = await axios.get(`https://localhost:5001/api/data/getTipoMejora/${idReporte}`, { 
        method: "GET",
        headers: headers
        });
        this.tipoMejora = tipoMejora.data[0].descripcion;
    },
    methods: {
    async aceptarFactible(){
        var data = {
            idReporte: this.$route.params.idReporte,
            factible: "factible",
            idJustificacionNoFact: null,
            comentariosNoFact: null,
        };
        const values = JSON.stringify(data);
        
        const response = await axios.post("https://localhost:5001/api/data/approval2", { 
            method: "POST",
            headers: headers,
            dataType: "json",
            body: values
        });
        console.log(response);
        this.$router.push("/dashboard/");
    },
    async rechazarFactible(){
        var data = {
            idReporte: this.$route.params.idReporte,
            factible: "no factible",
            idJustificacionNoFact: this.noFactJustificacionItems.indexOf(this.rechazoJustificacion)+1,
            comentariosNoFact: this.rechazoComentarios,
        };
        const values = JSON.stringify(data);
        
        const response = await axios.post("https://localhost:5001/api/data/approval2", { 
            method: "POST",
            headers: headers,
            dataType: "json",
            body: values
        });
        console.log(response);
        this.$router.push("/dashboard/");
    },
    cerrar(){
        //console.log(this.rechazoComentarios);
        this.$router.push("/dashboard/");
    },
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
.inicio #icon{
    color: #339CFF;
}
.infogeneral p{
    margin: 0 auto;
}
</style>

