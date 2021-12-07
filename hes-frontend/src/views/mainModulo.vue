<template>

  <v-container>
    <div id = "btns">
      <v-row id = "buttonRow" style="10px" v-for="n in nombreBotones" :key="n"> 
        <br>
        <br>
        <br>
        <br>
        <v-btn id = "btn" class="white--text" width="70%" color="#2B7CAB" :to="n.ruta">{{n.nombre}}
          <router-link to = "/"> </router-link>
        </v-btn>
      </v-row>
    </div>
    <div id="logo">
        <div id="imgTxtBundle">
          <h1 id="proMej">Proyectos de Mejora</h1>
        <img src="@/assets/logoHutchinson.png" class="responsive" id="imgLogo"/>
        </div>
    </div>
  </v-container>
</template>

<script>
  export default {
    name: 'mainModuloProyectos',
    data: () => ({
        nombreBotones: [
        {nombre: "INICIO", ruta:"/"}, {nombre:"INSTRUCCIÓN", ruta:"/instruccion"}, {nombre: "REGISTRO DE NUEVO\nPROYECTO", ruta:"/nuevoProyecto"}, {nombre: "KAIZEN EVENT PLANNING", ruta:"/kaizen"},
        {nombre: "INDICADORES", ruta:"/indicadores"},  {nombre: "ESTATUS DE PROYECTO DE MEJORA", ruta:"/estatusProyecto"}
      ]

  })
  };
</script>

<style>
#btns{
  float:left;
  width:50%;
  height:auto;
  margin-top: 2%;
}

#titulo{
  font-size: 3vw;
  text-align: right;
}

#buttonRow{
  margin-top: 1.5%;
}

#btn{
  font-size: 1em;
  font-family: Poppins, Helvetica, sans-serif;
}

.v-ripple__container {
    display:none !important;
}

#logo{
width: 50%;
position: absolute; 
top: 30%;
right: 00%;
float: left;
}

#proMej{
  color: black;
  font-size: 2.5em;
}
#imgLogo{
  width: 60%;
}

#imgTxtBundle{
  margin-left: 20%;
}

</style>

