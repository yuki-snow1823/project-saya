<template>
  <v-app class="bg">
    <nuxt />
    <v-card>
      <v-footer absolute>みんなでハッシュタグのツイートをつけてお祝いしよう。</v-footer>
    </v-card>
  </v-app>

</template>

<script>
  export default {
    data() {
      return {

      }
    },
    created() {
      console.log("API_ENDPOINT:", process.env.API_ENDPOINT);
    },
  }

</script>

<style lang="scss">
  .bg {
    background-image: url("~@/assets/testhaikei.jpg") !important;
    background-size: cover !important;
    // スマホのサイズで画像の真ん中を参照するように変更したい（サイズそのまま）
  }

  v-app {
    background-size: 100%;
  }

</style>
