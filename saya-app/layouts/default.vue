<template>
  <v-app class="bg">
    <Loading v-if="show"></Loading>
    <Header></Header>
    <nuxt />
    <Footer></Footer>
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
        ],
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
    created() {
              setTimeout(() => {
          this.show = false
        }, 3000)
    },
    // methods: {
    //         showFlash(){
    //     this.show = true;
    //   // setTimeoutで3000ms後にshowをfalseにする
    //     setTimeout(() => {
    //       this.show = false}
    //       ,3000
    //     )
    //   }
    // }
  }

</script>

<style lang="scss">
  * {
    margin: 0;
  }

  .bg {
    background-image: url("~@/assets/background.png") !important;
    // width: 100% !important;
    background-size: 100% !important; // いい感じになる
    // background-position: center !important;
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
