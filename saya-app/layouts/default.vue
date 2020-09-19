<template>
  <v-app class="bg">
    <nuxt />
    <v-card>
      <v-footer color="green lighten-1" padless>
        <v-row justify="center" no-gutters>
          <v-btn v-for="link in links" :key="link" color="white" text rounded class="my-2">
            {{ link }}
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
        '製作者',
        'デザイナー',
        'Github',
        '版権元',
      ],

      }
    },
    created() {
      console.log("API_ENDPOINT:", process.env.API_ENDPOINT);
    },
  }

</script>

<style lang="scss">
  .bg {
    // background-image: url("~@/assets/testhaikei.jpg") !important;
    background-image: url("~@/assets/0968_gingham_m.jpg") !important;
    background-repeat: repeat;
    // スマホのサイズで画像の真ん中を参照するように変更したい（サイズそのまま）
  }

  v-app {
    background-size: 100%;
  }

</style>
