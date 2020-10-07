<template>
  <v-container class="main-wrapper">

    <v-row>
      <v-col cols="12" xs="12" sm="12" offset-md="1" md="10">
        <v-container text-center>
          <img class="my-10" width="100%" height="100%" src="../assets/title.png" alt="">
        </v-container>
      </v-col>
    </v-row>

    <v-row class="main-contents" cols="12">
      <v-col class="v-flex" sm="12" md="2" lg="4">
        <!-- <v-hover v-slot:default="{ hover }" open-delay="200"> -->
        <!-- <img class="main-image animate__animated animate__pulse" width="100%" :src="hover ? a : b" alt=""> -->
        
        <img v-if="illustBool" class="main-image animate__animated animate__pulse" width="100%" src="../assets/tachie.png">
        <img v-else class="main-image animate__animated animate__pulse" width="100%" src="../assets/chibi.png">
        <!-- </v-hover> -->
        <v-btn @click="changeIllust" rounded color="#00B8D4" x-large>
          <span class="replay-btn">REPLAY?</span>
        </v-btn>
        <v-btn v-if="rikiBool" rounded color="#00B8D4" x-large>
          <span class="replay-btn" @click="changeBtn">GAME END</span>
        </v-btn>
        <span v-else>諦める訳ないよ！！！！</span>
      </v-col>

      <v-col md="5" sm="12">
        <v-card class="mx-auto birthday-card" outlined>
          <v-list-item three-line>
            <v-list-item-content>
              <a href="https://twitter.com/search?q=%23%E6%9C%B1%E9%B7%BA%E6%88%B8%E6%B2%99%E8%80%B6%E7%94%9F%E8%AA%95%E7%A5%AD2020&src=recent_search_click"
                target="_blank" class="tweet-hashtag-title overline mb-4">#朱鷺戸沙耶生誕祭2020</a>

              <v-list-item-title class="birthday-main-message headline mb-1">沙耶さん！<br>お誕生日おめでとう！</v-list-item-title>
              <v-list-item-subtitle class="birthday-message my-3">
                どうか幸せになってください！
              </v-list-item-subtitle>
            </v-list-item-content>
            <v-list-item-avatar tile size="150">
              <img src="../assets/sayaface.png" alt="">
            </v-list-item-avatar>
          </v-list-item>
        </v-card>

        <v-col class="count-btn-message d-flex mx-auto">
          <img width="100%" src="../assets/label.png" alt="">
          <p class="birthday-message py-5 my-1">{{ countSayaBirthday }}回<br>みんなにお祝いしてもらいました！</p>
        </v-col>

        <v-col class="d-flex">
          <v-textarea counter="120" v-model="value" background-color="amber lighten-4" color="orange orange-darken-5"
            label="お祝いメッセージを入力する">
          </v-textarea>
        </v-col>

        <v-col class="d-flex" offset-md="8" sm="12">
          <v-btn :disabled="btnFalse" class="tweet-btn" target="_blank" @click="count()" :href="madeUrl + value + mess"
            rounded color="#F48FB1" height="60">
            <v-icon class="mr-1" color="#EC407A">mdi-pistol</v-icon>
            <span class="btn-message">誕生日をお祝いする</span>
          </v-btn>
        </v-col>
      </v-col>


      <v-col md="3">
        <v-card class="tweet-wrapper">
          <v-card
            href="https://twitter.com/search?q=%23%E6%9C%B1%E9%B7%BA%E6%88%B8%E6%B2%99%E8%80%B6%E7%94%9F%E8%AA%95%E7%A5%AD2020&src=recent_search_click"
            class="tweet-logo-wrapper" color="rgba(158, 200, 255, 0.747)">
            <v-container class="pd-0" text-center>
              <img width="20%" src="../assets/Twitter_Logo_Blue.png" alt="">
            </v-container>
          </v-card>

          <v-container v-for="(message,index) of messages" :key="index">
            <v-card :href="message.tweet_link" target="_blank">
              <v-list-item-avatar tile size="50">
                <img class="tweet-icon ml-3" :src="message.image" alt="">
              </v-list-item-avatar>
              <span>{{ message.name }}</span>
              <v-list-item>
                <v-list-item-content>
                  <span>{{ message.text }}</span>
                </v-list-item-content>
              </v-list-item>
            </v-card>
          </v-container>
        </v-card>

        <v-container>
          <v-col md="10">
            <v-card target="_blank" href="https://twitter.com/yuki82511988" class="mb-2"
              color="rgba(86, 168, 165, 0.836)">
              <v-list-item-avatar tile size="80">
                <img class="tweet-icon" src="../assets/yuki.png" alt="">
              </v-list-item-avatar>
              <span class="twitter-name">
                programmer
                <span class="twitter-name">
                  Yuki
                </span>
              </span>
            </v-card>

            <v-card target="_blank" href="https://twitter.com/K_raris" class="mb-2" color="rgba(86, 168, 165, 0.836)">
              <v-list-item-avatar tile size="80">
                <img class="tweet-icon" src="../assets/kraris.png" alt="">
              </v-list-item-avatar>
              <span class="twitter-name">
                Illustlator
                <span class="twitter-name">
                  Kraris
                </span>
              </span>
            </v-card>

            <v-card target="_blank" href="https://twitter.com/momoringo_natan" class="mb-2"
              color="rgba(86, 168, 165, 0.836)">
              <v-list-item-avatar tile size="80">
                <img class="tweet-icon" src="../assets/momoringo.png" alt="">
              </v-list-item-avatar>
              <span class="twitter-name">
                Designer
                <span class="twitter-name">
                  ももりんご
                </span>
              </span>
            </v-card>

            <v-card href="https://key.visualarts.gr.jp/" color="rgba(242, 246, 92, 0.6)" class="px-1 py-1">
              <span class="key-link">版権元：VISUAL ARTS/Key</span>
            </v-card>

          </v-col>
        </v-container>
      </v-col>
    </v-row>

    <v-row>
      <v-col md="12" sm="12">
        <v-card class="py-2 px-2 talk-wrapper" color="#BBDEFB">
          <vue-typer color="white" :text='["うんがーーーーーー！","げげごぼおぇ…","戦場ではこういうのもアリなんだから…"]' :repeat='Infinity'
            :shuffle='true' initial-action='typing' :pre-type-delay='120' :type-delay='130' :pre-erase-delay='2000'
            :erase-delay='330' erase-style='clear' :erase-on-complete='true' caret-animation='smooth'></vue-typer>
        </v-card>
      </v-col>
    </v-row>

  </v-container>
</template>

<script>
  import axios from "@/plugins/axios"

  export default {
    data() {
      return {
        countSayaBirthday: 0,
        mess: "&hashtags=朱鷺戸沙耶生誕祭2020",
        value: "",
        madeUrl: "https://twitter.com/intent/tweet?text=",
        messages: [],
        text: "",
        a: require('@/assets/chibi.png'),
        b: require('@/assets/tachie.png'),
        illustBool: true,
        rikiBool: true
      }
    },
    methods: {
      async count() {
        let vm = this;
        await axios.put("/v1/counter").then(response => {
          vm = response;
          console.log(response.data.tweet.image);
          this.countSayaBirthday = response.data.count.count;
        })
      },
      openWindow() {
        window.open(this.madeUrl + this.value + this.mess, '', 'width=600,height=500,top=50,left=50');
      },
      changeIllust() {
        this.illustBool = !this.illustBool;
      },
      changeBtn() {
        this.rikiBool = !this.rikiBool;
      }
    },
    created() {
      let vm = this
      axios.get("/v1/counter").then(response => {
        vm = response;
        this.countSayaBirthday = response.data.count.count;
        this.messages = response.data.tweet;
        // console.log(response.data.tweet);
      })
    },
    components: {},
    computed: {
      btnFalse: function () {
        if (this.value.length > 120) {
          return true
        } else {
          return false
        }
      }
    }
  }

</script>


<style lang="scss">
  @font-face {
    font-family: "makapop";
    src: url("../assets/fonts/851MkPOP_002.ttf") format("truetype");
  }

  $pc: 2024px;
  $mid: 1024px;
  $tab: 680px;
  $sp: 480px;

  @mixin pc {
    @media (max-width: ($pc)) {
      @content;
    }
  }

  @mixin mid {
    @media (max-width: ($mid)) {
      @content;
    }
  }

  @mixin tab {
    @media (max-width: ($tab)) {
      @content;
    }
  }

  @mixin sp {
    @media (max-width: ($sp)) {
      @content;
    }
  }

  @media (min-width: 960px) {
    .container {
      max-width: 100% !important;
    }
  }

  * {
    font-family: "ヒラギノ角ゴ ProN W3", "Hiragino Kaku Gothic ProN", "メイリオ", "Meiryo", sans-serif;
  }

  .birthday-main-message {
    font-family: "makapop" !important;
    font-size: 120%;
  }

  .v-application .headline {
    font-family: "makapop" !important;
    font-size: 120%;

    @include sp {
      font-size: 140% !important;
    }
  }

  .birthday-message {
    font-family: "makapop" !important;
    font-size: 120%;

  }

  .main-image {
    @include sp {
      width: 100%;
    }
  }

  .count-btn-message p {
    position: absolute;
    font-size: 80%;
    top: 20%;
    left: 25%;

    @include sp {
      position: absolute;
      top: 15%;
      left: 27%;
      font-size: 50%;
    }
  }

  .main-wrapper {
    margin-top: -40px;
  }

  .main-contents {
    margin-bottom: 40px;
    margin-top: -40px;
  }

  .replay-btn {
    font-weight: bold;
    color: white;
  }

  .tweet-btn {
    border: white solid 4px !important;

    @include sp {
      margin: auto !important;
      width: 100% !important;
    }

    @include tab {
      margin: auto !important;
      width: 100% !important;
    }

    @include mid {
      margin: auto !important;
      width: 100% !important;
    }

  }

  .top-message {
    font-size: 60px;
    margin-top: 120px;
    background-color: white;

    @include sp {
      margin-top: 40px;
      font-size: 30px;
    }
  }

  .vue-typer {
    font-size: 18px;
  }


  .sub-message-card {
    border: white solid 4px !important;
    margin: 0 auto !important;
  }

  .btn-message {
    color: #711836;
  }

  .count-btn-message {
    padding: 30px;
    font-size: 30px;
    position: relative;
  }

  .birthday-card {
    background: rgba(255, 255, 255, 0.692) !important;
  }

  .twitter-name {
    color: white;
    font-family: "makapop" !important;
    font-size: 120%;
  }

  .tweet-hashtag-title {
    text-decoration: none;
  }

  .tweet-icon {
    margin-left: 1%;
    margin-top: 1%;
  }

  .tweet-wrapper {
    background: rgba(255, 255, 255, 0.692) !important;
  }

  .twitter-timeline {
    margin: 0 auto !important;
  }

  span.twitter-name {
    display: block;
  }

  .key-link {
    color: rgb(68 90 203 / 87%);
  }

  .talk-wrapper {
    border: rgba(252, 180, 204, 0.747) 6px solid !important;
  }

  a.mb-2.v-card.v-card--link.v-sheet.theme--light {
    display: flex;
    align-items: center;
  }

  .vue-typer .custom.char.typed {
    color: #711836;
  }

</style>
