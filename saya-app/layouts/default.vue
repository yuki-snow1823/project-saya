<template>
  <v-app class="bg">
    <nuxt />
    <v-card>
      <v-footer class="py-3" color="light-blue lighten-1" padless>
        <v-row justify="center" no-gutters>
          <!-- <v-btn v-for="link in links" :key="link.name" color="white" text rounded class="my-2">
            <a class="link" :href="link['rel']" target="_blank">{{ link["name"] }}</a>
          </v-btn> -->
          <v-col class="light-blue lighten-1 text-center white--text" cols="12">
            {{ new Date().getFullYear() }} — <strong>Created by Yuki Horikoshi</strong>
          </v-col>
        </v-row>
      </v-footer>
    </v-card>
    <!-- <Loading></Loading> -->
  </v-app>

</template>

<script>
import Loading from "@/components/Loading"; //追加

  export default {
  components: {
    Loading 
  },
    data() {
      return {
        links: [{
            name: "製作者",
            rel: "https://twitter.com/magic18jpn"
          },
          {
            name: "デザイナー",
            rel: "https://twitter.com/K_raris"
          },
          {
            name: "版権元",
            rel: "https://key.visualarts.gr.jp/"
          }
        ]
      }
    },
    head() {
      return {
        link: [{
          rel: "stylesheet",
          href: "https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
        }]
      }
    },
    created() {},
  }

</script>

<style lang="scss">
* {
  margin:0 ;
}
  .bg {
    background-image: url("~@/assets/background.png") !important;
    background-size: cover !important;
    // background-repeat: no-repeat !important;
    // スマホのサイズで画像の真ん中を参照するように変更したい（サイズそのまま）
  }

  .link {
    color: white !important;
  }

  v-app {
    background-size: 100%;
  }

</style>
