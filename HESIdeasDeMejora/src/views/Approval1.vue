<!-- comentarios generales
    - al cargar la pantalla se ocupan:
            - los datos de la idea propuesta
    - el botón cerrar abre un cuadro de confirmación (no estoy segura de a dónde debe regresar)
    - el botón aprobación abre un cuadro de diálogo donde habrán las opciones Aprobar y Rechazar
        - el botón Aceptar dentro del cuadro de diálogo de Aprobación hará un método POST porque debe guardar si la idea se aprobó o rechazó 
        y mandar a la 2da aprobación en caso de que sea aprobada
    
 -->

<template>
  <v-container>
    <v-row>
      <v-col>
        <h2>SISTEMA DE IDEAS DE MEJORA</h2>
        <h3>Primera aprobación</h3>
      </v-col>
    </v-row>
    <v-row>
      <div class = "inicio">
         <p>INFORMACIÓN GENERAL <span id = "icon">PENDIENTE DE REVISIÓN (HES)</span></p>
      </div>
    </v-row>
    <v-row>
        <p>
        <v-dialog v-model="dialogCerrar" width="500">
            <template v-slot:activator="{ on, attrs }">
                <v-btn x-small plain v-bind="attrs" v-on="on">
                    Cerrar
                </v-btn>
            </template>
            <v-card>
                <v-card-title class="text-h5 grey lighten-2">
                    Cerrar propuesta
                </v-card-title>

                <div id="propuestaFactible">
                <h3 class="ma-4">¿Desea cerrar esta propuesta?</h3>
                <v-card-actions>
                    <v-row>
                        <v-col>
                            <v-btn block color="blue" class="ma-2 pa-2 white--text">
                                CANCELAR
                            </v-btn>
                        </v-col>
                        <v-col>
                            <v-btn block color="blue" class="ma-2 pa-2 white--text" to="/">
                                ACEPTAR
                            </v-btn>
                        </v-col>
                    </v-row>
                </v-card-actions>
                </div>
            </v-card>

        </v-dialog>
        |
        </p>
        <v-dialog v-model="dialogAprobacion" width="500">
            <template v-slot:activator="{ on, attrs }">
                <v-btn x-small plain v-bind="attrs" v-on="on">
                    Aprobación
                </v-btn>
            </template>

            <v-card>
                <v-card-title class="text-h5 grey lighten-2">
                    Aprobación
                </v-card-title>

                <div id="aprobarRechazar">
                <v-card-actions>
                    <v-radio-group v-model="primeraAprobacion" row class="ma-2">
                        <input type="radio" label="Aprobar" value="aprobado" v-model="aprobar">
                        <label for="Aprobar" v-bind:style="{ marginLeft: '0.5rem', marginRight: '0.5rem'  }">Aprobar</label>
                        <input type="radio" label="Rechazar" value="rechazado" v-model="aprobar">
                        <label for="Rechazar" v-bind:style="{ marginLeft: '0.5rem', marginRight: '0.5rem' }">Rechazar</label>
                    </v-radio-group>
                </v-card-actions>
                    
                    <div v-if="aprobar == 'aprobado'">
                        <v-card-actions>
                            <v-row>
                                <v-col>
                                    <v-select v-model="tipoMejora" :items="tipoMejoraItems" label="Tipo de mejora" class="ma-2"></v-select>
                                </v-col>
                            </v-row>
                        </v-card-actions>
                    </div>
                    <div v-else>
                        <v-card-actions>
                            <v-row>
                                <v-select v-model="rechazoJustificacion" :items="rechazoJustificacionItems" label="Justificación" class="ma-2"></v-select>
                            </v-row>
                        </v-card-actions>

                        <v-card-actions>
                            <v-row>
                                <v-text-field v-model="rechazoComentarios" label="Comentarios" value="" solo class="ma-2"></v-text-field>
                            </v-row>
                        </v-card-actions>
                    </div>


                <v-card-actions>
                        <v-row>
                            <v-col>
                                <v-btn block color="blue" class="ma-2 white--text" @click="cancelar">
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
                    <v-btn block color="blue" class="ma-2 white--text finish-btn" @click="finalizar">Finalizar</v-btn>
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
        rechazoJustificacion: false,
        aprobar: "aprobado",
        rechazar: null,
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

    },
    methods:
    {
        finalizar(){
            this.$router.push("/dashboard");
        },
        async aceptar()
        {
            console.log(this.numPropuesta);
            var data = {
                idReporte: this.$route.params.idReporte,
                aprobado: this.aprobar,
                idTipoMejora: this.aprobar ? this.tipoMejoraItems.indexOf(this.tipoMejora)+1 : null,
                idJustificacionRech: this.rechazoJustificacion ? this.tipoMejoraItems.indexOf(this.tipoMejora)+1 : null,
                comentariosRech: (this.rechazoComentarios !== "") ? this.rechazoComentarios : null,
            };
            console.log(JSON.stringify(data));
            const values = JSON.stringify(data);
            
            const response = await axios.post("https://localhost:5001/api/data/approval1", { 
                method: "POST",
                headers: headers,
                dataType: "json",
                body: values
            });
            console.log(response);
            this.$router.push("/dashboard/");
        },
        cancelar()
        {
            console.log(this.rechazoComentarios !== "");
            console.log(this.rechazoJustificacion);
            console.log(this.rechazoJustificacionItems.indexOf(this.rechazoJustificacion)+1);
            console.log(this.tipoMejoraItems.indexOf(this.tipoMejora)+1);
            console.log(this.aprobar);
            this.dialogAprobacion = false;
        }
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
.finish-btn {
    max-width: 5rem;
    width: 100%;
}
</style>

