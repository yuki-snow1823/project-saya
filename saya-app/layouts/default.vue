<template>
  <v-app class="bg">
    <nuxt />
    <v-card>
      <v-footer color="green lighten-1" padless>
        <v-row justify="center" no-gutters>
          <v-btn v-for="link in links" :key="link.name" color="white" text rounded class="my-2">
            <a class="link" :href="link['rel']" target="_blank">{{ link["name"] }}</a>
          </v-btn>
          <v-col class="green lighten-2 py-4 text-center white--text" cols="12">
            {{ new Date().getFullYear() }} — <strong>Yuki</strong>
          </v-col>
        </v-row>
      </v-footer>
    </v-card>
  </v-app>

</template>

<script>
  export default {
    data() {
      return {
        links: [
          { name: "製作者", rel: "https://twitter.com/magic18jpn" },
          { name: "デザイナー", rel: "https://twitter.com/K_raris" },
          { name: "版権元", rel: "https://key.visualarts.gr.jp/" }
        ]
      }
    },
    created() {},
  }

</script>

<style lang="scss">
  .bg {
    background-image: url("~@/assets/0968_gingham_m.jpg") !important;
    background-repeat: repeat;
    // スマホのサイズで画像の真ん中を参照するように変更したい（サイズそのまま）
  }
  .link {
    color: white !important;
  }

  v-app {
    background-size: 100%;
  }

</style>
