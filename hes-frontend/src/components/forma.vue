<template>

<div>

<h2>PROYECTO DE MEJORA</h2>
<h3>Registro del Proyecto</h3>



<form id="app-6">
  <!--{{payload}} {{resp}} -->
  <!-- {{proyecto}} -->

<!-- <p>Id del Empleado {{ empleadoSelec.id_empleado }}</p>
<p>De la API JSONplaceHolder con el id del Empleado {{ empleadoSelec }}</p> -->
<!-- <P>{{ar}}</P>
<P>{{emplead }}</P> -->
	<fieldset>
    <legend>Solicitado por:</legend>

    <label for="solicitante">Solicitante</label>
    <input type="text" class="gpo1" id="solicitante" v-model="empleadoSelec.nombre"  size=30>

     <select id="empleado" @change="setEmpleado()"  v-model="empleadoSelec">  
         <option v-for="empleado in empleados" :value="empleado" :key="empleado.id_empleado" >{{empleado.nombre}}</option>
     </select>   

   
    <label for="uap">UAP:</label>
    <input type="text" class="gpo1" id="uap"  v-model="proy.uap">
    <br><br>
    <label for="sarea">Area de quien propone</label>
    <input type="text" class="gpo1" id="sarea" v-model="proy.area_sol"><br><br>
    
    <label for="ssol">Supervisor del Solicitante:</label>
    <input type="text" class="gpo1" id="ssol" v-model="proy.sup_sol">
    
    <label for="gsol">Gerente del Solicitante:</label>
    <input type="text" class="gpo1" id="gsol" v-model="proy.ger_sol">
   </fieldset>

   <br>

   <fieldset>
    <legend>Datos del Proyecto:</legend>

    <!-- p>{{ areaSelec.id_area }}</p> -->

    <label for="aproy">Area del Proyecto:</label>
    <input type="text" class="gpo1" id="aproy" v-model="areaSelec.nombre" size=45>

    <select id="aproy" @change="setArea()" v-model="areaSelec" >
         <option v-for="area in areas" :value="area" :key ="area.id_area">{{area.nombre}}</option>
     </select> 
    <br>
    <label for="saproy">Supervisor del Area de Proyecto:</label>
    <input type="text" class="gpo1" id="saproy" v-model="proy.sup_area_proy">

     

    <label for="gaproy">Gerente del Area de Proyecto:</label>
    <input type="text" class="gpo1" id="gaproy" v-model="proy.ger_area_proy"><br><br>
    
    <label for="titulo">Titulo del proyecto:</label><br>
    <input type="text" class="gpo1" id="titulo" v-model="proy.titulo" size=100><br><br>
    
    <label for="descripcion">Descripcion del Problema:</label><br>
    <input type="text" class="gpo1" id="descripcion" v-model="proy.descripcion" size=100>
    <br>
    <br>
<label for="equipo">Equipo:</label>
    <input type="text"  class="gpo1" id="equipo" v-model="proy.equipo" size=60>
    
    <label for="tipo">Tipo de Proyecto:</label>
    
    <select name="tipop" id="tipop" v-model="proy.tipo">
         <option value="1">Evento Kaisen</option>
         <option value="2">Six Sigma</option>
         <option value="3">Mercedes</option>
         <option value="4">Audi</option>
    </select>   

  </fieldset>

  <!-- <button class="boton" onmouseover="app6.registrar(1)">Cancelar </button>-->
  <input  class="boton" type="submit" value="Registrar" @click="save()">
  <!-- <button  class="boton" v-on:click="registrar">Registrar</button> --> 
  
</form>
</div>
</template>

<script>


//var app6 = new Vue(
    export default
    {
       //el: '#app-6',
      name:"formaRegistro",
      data() {
        
      return {  empleadoSelec: {"id_empleado":0,"nombre":"Selecciona Solicitante"},
         emplead: 
         //{},
            { "id_empleado":3,
              "nombre":"carlos murillo",
              "nombre1":"Planeacion_y_programacion",
              "nombre2":"bastian prado",
              "nombre3":"Hector Fernandez"
            },
           // si se consumera de mi API
         // {  "userId": 1,  "id": 4,  "title": "et porro tempora",  "completed": true }
         // si se consume de LA API Jsonplaceholder
         empleados: 
          //[],   //ARREGLO VACIO QUE SE LLENA EN getEmpleados desde una API REST
              [
                {"id_empleado":1,"nombre":"Hector Fernandez"},
                {"id_empleado":2,"nombre":"bastian prado"},
                {"id_empleado":3,"nombre":"carlos murillo"},
                {"id_empleado":4,"nombre":"guillermo guerrero"},
                {"id_empleado":5,"nombre":"dan quezada"},
                {"id_empleado":6,"nombre":"carlos hernandez"},
                {"id_empleado":7,"nombre":"Sarah Catillo"}
              ], 
              areaSelec:{"id_area":0,"nombre":"Selecciona Area del Proyecto"},
              ar: 
              // {},
              {
                  "id_area":1,
                  "nombre":"Planeacion_y_programacion",
                  "nombre1":"bastian prado",
                  "nombre2":"Hector Fernandez"
                },
               areas:
               // [],
              [
                {"id_area":1,"nombre":"Planeacion_y_programacion"},
                {"id_area":2,"nombre":"Mejora_Continua"},
                {"id_area":3,"nombre":"Produccion"}
              ],
         proy: {  solicitante:  "Selecciona Solicitante",
                  uap: "UAP del Solicitante",
                  area_sol:"Area del Solicitante",
                  sup_sol:"Supervisor del Solicitante",
                  ger_sol:"Gerente del Solicitante",
                  area_proy:"Selecciona Area del Proyecto",
                  sup_area_proy:"Supervisor del Area",
                  ger_area_proy:"Gerente del Area",
                  titulo: "",
                  descripcion: "",
                  equipo: "",
                  tipo: "Tipo"
              },
              //payload:{},
              //resp:{},
              proyecto:{
                        titulo:"",
                        descripcion:"",
                        equipo:"",
                        tipo:0,
                        id_area:0,
                        id_solicitante:0
                       }
            }
      },
    methods: {
      async getEmpleados() {
            //const url = SERVER_URL + "/todos";
            const SERVER_URL = "https://localhost:5001/api";
            const url = SERVER_URL + "/empleados";
            const r = await fetch(url);
            const empleads = await r.json();
            this.empleados = empleads;   // los datos que se consumen de la API se guardan en empleados
            },
      async getEmpleado() {
            //const url = SERVER_URL + "/todos/"+this.empleadoSelec.id_empleado;
            const SERVER_URL = "https://localhost:5001/api";
            const url = SERVER_URL + "/empleados/"+this.empleadoSelec.id_empleado;
            const r = await fetch(url);
            const emplead = await r.json();
            this.emplead = emplead[0];
            },
      setEmpleado()
            {   this.getEmpleado();
                 this.proy.uap="AUP";
                 this.proy.area_sol=this.emplead.nombre1;
                 this.proy.sup_sol=this.emplead.nombre2;
                 this.proy.ger_sol=this.emplead.nombre3;
            },
      async getAreas() {
          const SERVER_URL = "https://localhost:5001/api";
            const url = SERVER_URL + "/area";
            const r = await fetch(url);
            const areas = await r.json();
            this.areas = areas;
           },
      async getArea() {
            //const url = SERVER_URL + "/todos/"+this.areaSelec.id_area;
            const SERVER_URL = "https://localhost:5001/api";
            const url = SERVER_URL + "/area/"+this.areaSelec.id_area;
            const r = await fetch(url);
            const area = await r.json();
            this.ar = area[0];
            },
      setArea()
            {   this.getArea();
                this.proy.sup_area_proy=this.ar.nombre1;
                 this.proy.ger_area_proy=this.ar.nombre2;
            }
           // ,
        
//          async save() {          
//           const headers = {
//     "Content-Type": "application/json;",
//     "Access-Control-Allow-Origin" : "*",
//     "Accept": "*/*",
//     "Access-Control-Allow-Methods": "GET, PUT, POST, DELETE, OPTIONS, post, get",
//     "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token, Authorization",   
//     "Access-Control-Allow-Credentials": "true",
//     "Access-Control-Max-Age": "3600"
//   };
//             this.proyecto.titulo=this.proy.titulo;
//             this.proyecto.descripcion=this.proy.descripcion;
//             this.proyecto.equipo=this.proy.equipo;
//             this.proyecto.tipo=this.proy.tipo;
//             this.proyecto.id_area=this.areaSelec.id_area;
//             this.proyecto.id_solicitante=this.emplead.id_empleado;
//             this.payload = JSON.stringify(this.proyecto);
          
//             const url = SERVER_URL + "/proyecto/insertarDatos";
            
//             const r = await axios.post(url, {
//                 method: 'POST',
//                 body: this.payload,
//                 dataType: "json",
//                 headers: {
//                     'Content-type': 'application/json; charset=UTF-8',
//                 },
//             });

//             //const response = await r.json();
//             //this.resp=response;

            
//           }  
        },
        mounted() {
            this.getEmpleados();
             this.getAreas();
         }
        
}

//);


</script>


<style>
form{
  font-family: verdana;
  font-size: 14px;
}
h3{color: rgb(100,100,200);
}
label{
	color: rgb(40,40,200);
}
.gpo1{
  background-color: rgb(220,220,220);
  border-width: 1px;
  /* border-color: black; */
  /* padding: 2px 2px; */
}
.boton{
	background-color: rgb(150,150,250);
	border-width: 1px;
	font-size: 16px;
	font-weight: bold;
	margin: 20px 150px 20px 150px;
}
#tipop{
  background-color: rgb(220,220,220);
  border-width: 0px;
}
</style>
