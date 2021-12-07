<template>
  <v-container>
        <div id = "infoProyecto">
            <div class = "top">
                <p id = "titulo">Proyecto de Mejora</p>
                    <p id="idProy">20-001</p>
            </div>
            <div id = "datos">
                <div id = "datosIzq">
                    <p>Líder del proyecto</p>
                    <p id ="sub">(5181) ADRIÁN CARRILLO</p>
                    <br>
                    <p>Gerente del Área</p>
                    <p id ="sub">(5181) ADRIÁN CARRILLO</p>
                    <br>
                     <p>Área del proyecto</p>
                    <p id ="sub">Celda 4 - Sellos reforazdos</p>
                    <br>
                </div>
                <div id = "datosDer">
                    <p>Tipo del proyecto</p>
                    <p id ="sub">KAIZEN</p>
                    <br>
                    <p>KAIZEN EVENT</p>
                    <p id ="sub">NO REQUERIDO</p>
                    <br>
                     <p>Área del proyecto</p>
                    <p id ="sub">No asignada</p>
                    <br>
                </div>
            </div>
            <div id="textBoxes">
                <p>Título de proyecto</p>
                <textarea id="txtArea" ></textarea>
                <p>Planteamiento del problema</p>
                <textarea id="txtArea" ></textarea>
                <p>Alcance</p>
                <textarea id="txtArea" ></textarea>
                <p>Impacto en el negocio</p>
                <textarea id="txtArea" ></textarea>
                <p>Objetivos generales</p>
                <textarea id="txtArea" ></textarea>
                <p>General Schedule (Kaizen Event)</p>
                <textarea id="txtArea" ></textarea>
            </div>
        </div>
        <div id = "masInfo">
            <h2>Equipo del proyecto</h2>
            <div id="equipoProyecto">
                <div id="foto">
                    <img src="@/assets/camera.png" alt="IMAGEN DE FOTO" id="fotopng">
                </div>
                <div id="listaIntegrantes">
                    <ul>
                        <li>INTEGRANTE #1</li>
                        <li>INTEGRANTE #2</li>
                        <li>INTEGRANTE #3</li>
                        <li>INTEGRANTE #4</li>
                        <li>INTEGRANTE #5</li>
                        <li>INTEGRANTE #6</li>

                    </ul>
                </div>
            </div>
            <hr>
            <div id="situacionActual">
                <div id="recoleccionDatos">
                    <div><h2>Plan de recolección de datos</h2></div>
                    <div id="recoleccionRow">
                        <div id="ev">
                        <p>Evidencia:</p>
                        </div>
                        <div id="evidenciaBotones">
                        <a>Descargar</a>
                        <a>Remover</a>
                    </div>
                    </div>
                    
                </div>
            </div>
            <hr>
            <div id="indicadoresIniciales">
                <br>
                <h2>Indicadores iniciales</h2>
                <div id = "listas">
                    <v-data-table
                    :headers="titulos"
                    :items="indicadores"
                    hide-actions
                    class="elevation-1"
                    select-all
                    pagination.sync="pagination"
                    item-key="id"
                    loading="true"
                    >
                    </v-data-table>
                </div>
            </div>
            <hr>
            <div id="analisisProceso">
                <h2>Análisis del proceso</h2>
                <div id="checkBoxesIzq">
                    <v-checkbox v-model="ex4" label="SIPOC" color="blue" value="sipoc" hide-details/>
                    <v-checkbox v-model="ex4" label="VSM" color="blue" value="vsm" hide-details/>
                    <v-checkbox v-model="ex4" label="Diagrama de Flujo" color="blue" value="diagramaFlujo" hide-details/>
                    <v-checkbox v-model="ex4" label="Otra" color="blue" value="otra" hide-details/>
                </div>
                <div id="diagramaFlujoProceso">
                    <p id = "diagrama">Diagrama de flujo</p>
                    <div id="evidenciaDiagramaRow">
                        <div id="ev">
                        <p>Evidencia:</p>
                        </div>
                        <div id="evidenciaBotones">
                        <a>Descargar</a>
                        <a>Remover</a>
                        </div>
                    </div>                
                </div>
            </div>
            <hr>
            <div id="analisisProceso">
                <h2>Análisis del las causas</h2>
                <div id="checkBoxesIzq">
                    <v-checkbox v-model="ex4" label="Pareto" color="blue" value="pareto" hide-details/>
                    <v-checkbox v-model="ex4" label="5 porques" color="blue" value="5porques" hide-details/>
                    <v-checkbox v-model="ex4" label="Ishikawua" color="blue" value="ishikawua" hide-details/>
                    <v-checkbox v-model="ex4" label="Otra" color="blue" value="otra" hide-details/>
                </div>
                <div id="diagramaFlujoProceso">
                    <p id = "diagrama">Ishikawa</p>
                    <div id="evidenciaDiagramaRow">
                        <div id="ev">
                        <p>Evidencia:</p>
                        </div>
                        <div id="evidenciaBotones">
                        <a>Descargar</a>
                        <a>Remover</a>
                        </div>
                    </div>                
                </div>
            </div>
            <hr>
            <p id="causas"> Causas Identificadas</p>
            <h3 id="estadofuturo">Estado futuro</h3>
            <div id=definirEstadoFuturo>
                <p id = "diagrama">Definir estado futuro</p>
                    <div id="evidenciaDiagramaRow">
                        <div id="ev">
                        <p>Evidencia del estado futuro:</p>
                        </div>
                        <div id="evidenciaBotones">
                        <a>Descargar</a>
                        <a>Remover</a>
                        </div>
                    </div>  
            </div>
            <hr>
            <div>
                <div id="planAcciones">
                    <h3 id="estadofuturo">Plan de acciones</h3>
                    <a>VER DETALLES</a>
                </div>
                <div id = "puntos">
                    <v-data-table
                    :headers="titulosPuntosDeUso"
                    :items="puntosDeUso"
                    hide-actions
                    class="elevation-1"
                    select-all
                    pagination.sync="pagination"
                    item-key="id"
                    loading="true"
                    >
                    </v-data-table>
                </div>
            </div>
            <hr>
            <h3 id="estadofuturo">Resultados</h3>
            <div>
                <div id="planAcciones">
                    <p id="causas">Indicadores Finales</p>
                </div>
                <div id = "puntos">
                    <v-data-table
                    :headers="titulosResultados"
                    :items="resultados"
                    hide-actions
                    class="elevation-1"
                    select-all
                    pagination.sync="pagination"
                    item-key="id"
                    loading="true"
                    >
                    </v-data-table>
                </div>
            </div>
            <hr>
            <div id="efectividad">
                <p>Efectividad del proyecto: </p>
                <p id="porcentajeEfectividad">91.11%</p>
            </div>
        </div>
        <div id="botonesGuardar">
            <v-btn color="#1E90FF" class="white--text">GUARDAR</v-btn>
            <router-link to="/" tag="v-btn">
            <v-btn color="#1E90FF" flat value="principal" class="white--text">
                <span>Finalizar</span>
            </v-btn>
            </router-link>
        </div>
        <br>
  </v-container>
</template>

<script>
export default {
    name: 'masDetalles',
    data: () => ({
    
      titulos: [{text: "Nombre del indicador", value:"nombreIndicador"},{text:"Target",value:"targetIndicador"},{text:"Inicial",value:"inicial"},{text:"U/M",value:"um"}],
      indicadores: [{nombreIndicador:"Nombre",targetIndicador:"target",inicial:"inicial",um:"U/M"}],
      titulosPuntosDeUso:[{text: "Subacción",value:"subaccion"},{text:"Encargado",value:"encargado"},{text:"Inicial",value:"inicial"},
                          {text:"Target", value:"target"},{text:"Complete",value:"complete"}],
      puntosDeUso:[{subaccion:"EJEMPLO SUBACCION", encargado:"EJEMPLO ENCARGADO", inicial:"EJEMPLO INICIAL",target:"EJEMPLO TARGET", complete:"EJEMPLO COMPLETE"}],
      titulosResultados: [{text:"Nombre del indicador", value:"nombre"},{text:"Target",value:"target"},{text:"Inicial",value:"inicial"}
                        ,{text:"Target",value:"target"},{text:"Final",value:"final"},{text:"U/M",value:"um"}],
      resultados:[{nombre:"Tiempo de ciclo",target:"45",inicial:"30",final:"Final",um:"Min"}]
})
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap');
#infoProyecto{
    font-family: 'Poppins';
    font-style: normal;
    font-display: swap;
    src: url(https://fonts.gstatic.com/s/poppins/v15/pxiByp8kv8JHgFVrLBT5Z11lFd2JQEl8qw.woff2) format('woff2');
    width: 40%;
    height: 60%;
    margin: 0.5%;
    padding: 1%;
    float: left;
    border: 1px solid #000;
}
#masInfo{
    width: 50%;
    float: left;
    margin: 0.5%;
    border: 1px solid #000;
}

.top{
  width: 100%;
  display: flex;
  justify-content: space-between;
}

#titulo{
    text-align: left;
}

#botonesProyecto{
    display: flex;
    justify-content: center;
}

#idProy{
   background: lightgrey; 
}

#datosIzq{
    width: 45%;
    height: 60%;
    float: left;
    text-align: left;
    margin: 2%;
}

#datosDer{
    width: 45%;
    float: left;
    text-align: left;
    margin: 2%;
}

#sub{
    color: gray;
}

#textBoxes{
    width: 100%;
    float: left;
}

#txtArea{
    float: left;
    background-color: lightgrey;
    width: 100%;
}

#equipoProyecto{
    width: 100%;
    display: flex;
    justify-content: space-between;
    
}

#foto{
    width: 50%;
    height: auto;
    float: left;
    margin: 0.5%;
}

#listaIntegrantes{
    width: aut;
    height: auto;
    float: left;
    margin: 0.5%;
    list-style-type: none;
}

#fotopng{
    width: 100%;
    height: auto;
}

#evidenciaBotones{
    display: flex;
    justify-content: end;
}
#recoleccionDatos{
    width: 100%;
}

#recoleccionRow{
    width: 100%;
    display: flex;
    justify-content: space-between;
}

h2{
    margin-left: 2%;
    color:#639fff;
}

#analisisProceso{
    width: 100%;
    overflow: hidden;

}

#checkBoxesIzq{
    margin-left: 1%;
    float: left;
    width: 33%;
    
}

#diagramaFlujoProceso{
    float: left;
    width: 65%;
}

#diagrama{
    margin-top: 5%;
    background-color: lightgrey;
}

#analisisCausas{
    width: 100%;
    float: left;
}

#evidenciaDiagramaRow{
    width: 100%;
    display: flex;
    justify-content: space-between;
}

#causas{
    margin-left: 2%;
    color:#639fff;
}

#estadofuturo{
    margin-left: 2%;
    color:grey;
}

#planAcciones{
    width: 100%;
    display: flex;
    justify-content: space-between;
}

#efectividad{
    width: 100%;
    display: flex;
    justify-content: end;
}

#porcentajeEfectividad{
    background-color: lightgreen;
    margin-left: 2%;
}


</style>