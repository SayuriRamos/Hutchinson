<template>
<div id="todo">

      
        <label id="titulo">Pantalla de Instruccion</label>
        <div id="app">

              <div class=ins>
              <button class=btn >INICIO</button>
              <label class=msj>1) INICIO: Cambio a la pantalla de inicio de  nuevo proyecto. Este botón te enviará al menú de inicio del sistema</label>
              </div>
            
              <div class=ins>
              <button class=btn >INSTRUCCIÓN                   </button>
              <label class=msj>2) INSTRUCCIÓN: Cambio a la pantalla de instrucción. En esta pantalla se observará mayor información sobre las funcionalidades de la interfaz de proyectos de mejora.</label>
               </div>
              
              <div class="ins">
               <button class=btn >REGISTRO DE NUEVO PROYECTO    </button>
               <label class=msj>3) REGISTRO DE NUEVO PROYECTO: Cambio a la pantalla de registro de nuevo proyecto. En esta pantalla se completaraá el formulario para registrar un nuevo proyecto en la plataforma.</label>
               </div>
                

               <div class="ins">
               <button class=btn >KAIZEN EVENT PLANNING         </button>  
               <label class=msj>4) KAIZEN EVENT PLANNING: Cambio a la pantalla de kaizen event planning. En esta pantalla se puede vizualizar toda la información sobre los eventos tipo kaizen.</label>
               </div>

               <div class="ins">
              <button class=btn >INDICADORES                   </button>
              <label class=msj>5) INDICADORES: Cambio a la pantalla de indicadores, este botón te enviará a la pantalla de donde se puede observar los detalles del avance del proyecto por mes.</label>
              </div>

              <div class="ins">
              <button class=btn o>PORTAFOLIO DE PROYECTOS</button>
              <label class=msj>6) PORTAFOLIO DE PROYECTOS: Cambio a la pantalla de portafolio de proyectos, en esta pantalla se puede vizualizar los avances pendientes del proyecto.</label>
              </div>

              <div class="ins">
              <button class=btn o>ESTATUS DE PROYECTOS DE MEJORA</button>
              <label class=msj>7) ESTATUS DE PROYECTOS DE MEJORA: cambio a la pantalla de estatus del proyecto, en esta pantalla se puede el estado de todos los eventos que se estan haciendo</label> 
              </div>  

             

        </div>
        </div>

</template>

<script>
export default {
    name: 'instruccion'
  };
</script>



<style>
#apv{display:block;

      width:100%;}
.btn{
    background-color: #008CBA;
    color:white;
    font-size: 16px;
    padding: 10px;
    border-radius: 4px;
    border: none;
    
}


.msj{
    float:left;
    padding:5px;
}
.ins{ 
       display:grid;
       grid-template-columns: 20% 80%;
       padding:5px;
}
    

.regresar{
    display:block;
   
    
  }

/* #home{ 
     background-color: #008CBA;
    color:white;
    border:none;
    font-size: 16px;
    padding: 10px;
    border-radius: 4px;
    width:20% ;
}
#home:hover {
  background-color: white; /* Green */
  /* border: 2px solid #008CBA;
  color:  #008CBA; */
/* } */ */
#todo{
  font-family:  Helvetica, sans-serif;
    }

    #titulo{
      font-weight: bold;
      font-size: 3em;
      text-align:center;
      color:#000000;
      
      padding: 2px;
      border: none;
    }


</style>