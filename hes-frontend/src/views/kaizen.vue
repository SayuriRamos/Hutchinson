<template>
    <v-content>
    <calendario />
  </v-content>
</template>

<script>
import calendario from '@/components/calendar.vue'

export default {
  components: {
    calendario,
  },

  data: () => ({
    //
  }),
};
</script>

<style scoped>
@import '../assets/style.css'
</style>
