<template>
  <v-app class="bg">
    <Loading v-if="show"></Loading>
    <Header></Header>
    <nuxt />
    <Footer></Footer>

    <Person></Person>
  </v-app>

</template>

<script>
  import Loading from "@/components/Loading"; // 追加
  import Header from "@/components/common/Header"; // 画像は全てのページで出て欲しいため。
  import Footer from "@/components/common/Footer";

  export default {
    components: {
      Loading,
      Header,
      Footer,
    },
    data() {
      return {
        show: true
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
    mounted() {
      this.stopLoading();
    },
    methods: {
      stopLoading() {
        setTimeout(() => {
          this.show = false
        }, 3000)
      }
    }
  }

</script>

<style lang="scss">
  * {
    margin: 0;
  }

  v-app {
    background-size: 100%;
  }

  .bg {
    background-image: url("~@/assets/background.png") !important;
    background-size: 100% !important;
  }

  .link {
    color: white !important;
  }


</style>
