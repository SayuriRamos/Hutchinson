<template>
  <v-content>
  <formaRegistro />
  </v-content>
</template>

<script>
import formaRegistro from '@/components/forma.vue';

export default {
    name: 'nuevoProyecto',
    components:{
      formaRegistro
    }
  };
</script>
<style>
.btn{
    background-color: #2B7CAB;
    /* border: none; */
    color:white;
    font-size: 16px;
    /* padding: 10px;
    border-radius: 4px;
    
    width: 20%; */
}
.btn:hover {
  /* background-color: white;  */
  border: 2px solid #2B7CAB;
  color:  #2B7CAB;
}
</style>