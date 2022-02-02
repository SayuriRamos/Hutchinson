<template>
  <router-link id="button" :to="target">
    <img src="@/assets/logo.png" alt="" />
    <p>{{ label }}</p>
  </router-link>
</template>

<script>
export default {
  name: "RouterButton",
  props: {
    label: String,
    target: String,
  },
};
</script>

<style scoped>
a {
  text-decoration: none;
  display: inline-flex;
  background-color: #4a5990;
  align-items: center;
  color: white;
  font-size: 12pt;
}

a * {
  margin: 0.5rem 0.5rem;
}

img {
  height: 1.5rem;
}

#button {
  display: flex;
  justify-content: center;
}
</style>
