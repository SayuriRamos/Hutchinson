<template>
  <div>
    <v-col cols="auto">
      <v-row justify="center">
        <v-col cols="auto">
          <v-icon
            :color="
              items.place == 1
                ? '#ffd700'
                : items.place == 2
                ? '#c0c0c0'
                : '#cd7f32'
            "
            >mdi-trophy</v-icon
          >
        </v-col>
        <v-col cols="auto">
          <h3>{{ items.place }}° LUGAR</h3>
        </v-col>
      </v-row>
      <v-row>
        <v-card>
          <v-img
            style="margin: 1rem"
            class="thumbnail"
            src="@/assets/logo.png"
            alt=""
          />
          <v-card-title>{{ items.title }}</v-card-title>
          <v-card-subtitle>{{ items.author }}</v-card-subtitle>
          <v-card-actions>
            <v-btn icon @click="show = !show"
              ><v-icon>{{
                show ? "mdi-chevron-up" : "mdi-chevron-down"
              }}</v-icon></v-btn
            >
          </v-card-actions>
          <v-expand-transition>
            <div v-show="show">
              <v-divider></v-divider>
              <v-card-text> {{ items.description }} </v-card-text>
            </div>
          </v-expand-transition>
        </v-card>
      </v-row>
    </v-col>
  </div>
</template>

<script>
export default {
  data: () => ({
    show: false,
  }),
  props: {
    items: {
      place: Number,
      img: String,
      title: String,
      author: String,
      description: String,
    },
  },
};
</script>

<style></style>
