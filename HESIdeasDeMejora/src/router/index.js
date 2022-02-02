import Vue from "vue";
import VueRouter from "vue-router";
import Menu from "../views/Menu.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: Menu,
  },
  {
    path: "/indicadores",
    component: () => import("../views/Indicators.vue"),
  },
  {
    path: "/reconocimientos",
    component: () => import("../views/Awards.vue"),
  },
  {
    path: "/dashboard",
    component: () => import("../views/Dashboard.vue"),
  },
  {
    path: "/approval1/:idReporte",
    component: () => import("../views/Approval1.vue")
  },
  {
    path: "/approval2/:idReporte",
    component: () => import("../views/Approval2.vue")
  },
  {
    path: "/assignment/:id",
    component: () => import("../views/Assignment.vue")
  },
  {
    path: "/tasks/:id/:a/:b/:c/:d",
    component: () => import("../views/Tasks.vue")
  },
  {
    path: "/validation",
    component: () => import("../views/Validation.vue")
  },
  // {
  //   path: "/instruccion",
  //   component: () => import("../views/Prototyping.vue"),
  // },
  {
    path: "/reporte/:id",
    component: () => import("../views/Prototyping.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
