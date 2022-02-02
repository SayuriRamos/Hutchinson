<template>
  <div>
    <RouterButton
      label="ESTATUS DE LAS PROPUESTAS DE MEJORA"
      target="dashboard"
    />
    <input id="input" type="text" name="" />
  </div>
</template>

<script>
import RouterButton from "@/components/RouterButton.vue";

export default {
  name: "IdeaSearch",
  components: {
    RouterButton,
  },
};
</script>

<style scoped>
#input {
  box-sizing: border-box;
  width: 100%;
  height: 2rem;
}
</style>
