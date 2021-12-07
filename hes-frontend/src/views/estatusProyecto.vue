<template>
  <v-container>
      <div id = "menuBusqueda">
          <div id = "topRow">
          <v-text-field
            label="Búsqueda"
          ></v-text-field>
    <div>
    <v-menu offset-y>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="primary"
          dark
          v-bind="attrs"
          v-on="on"
        >
          Status
        </v-btn>
      </template>
      <v-list>
        <v-list-item
          v-for="(item, index) in items"
          :key="index"
        >
          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
      </div>
    </div>
    <br>
    <v-btn id  = "btnBus" class="white--text" width="20%" color="#2B7CAB" >Búsqueda Avanzada</v-btn>
    <v-btn class="white--text" width="20%" color="#2B7CAB" >Exportar Reporte</v-btn>
    <br>
    <br>
    </div>
    <div id = "listas">
        <v-data-table
      :headers="titulos"
      :items="proyectos"
      hide-actions
      class="elevation-1"
      select-all
      pagination.sync="pagination"
      item-key="id"
      loading="true"
    >
    <template v-slot:[`item.detalle`]="{ item }">
      <router-link :to="{ name: 'masDetalles', params: { id: item.prop } }"> <!-- cambiar los params -->
      Más detalles
    </router-link>
    </template>
    </v-data-table>
    </div>
  </v-container>
</template>

<script>
export default {
    name: 'estatusProyecto',
    data: () => ({
        items: [
        {title: "1"}, {title: "2"}
      ],
      titulos: [{text: "Mes", value:"mes"},{text: "# Prop", value:"prop"},{text: "Inicio", value:"inicio"},{text:"lider", value:"lider"},
                {text:"Area", value:"area"},{text:"Titulo", value:"titulo"},{text:"Area", value:"area"},
                {text:"Tipo", value:"tipo"},{text:"Gerente", value:"gerente"},{text:"Detalles", value:"detalle"}],

      proyectos: [{mes: "1", prop: "1", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"},
                  {mes: "2", prop: "2", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"},
                  {mes: "5", prop: "3", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"},
                  {mes: "5", prop: "3", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"},
                  {mes: "5", prop: "3", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"},
                  {mes: "5", prop: "3", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"},
                  {mes: "5", prop: "3", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"},
                  {mes: "5", prop: "3", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"},
                  {mes: "5", prop: "3", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"},
                  {mes: "1", prop: "4", inicio:"20/07/2020", lider: "x", area: "x", titulo:"y", area2:"d",tipo:"daw", gerente: "dawd", detalle: "Más detalles"}]
})
}
</script>

<style>

#btnBus{
    margin-right: 20px;
}

</style>