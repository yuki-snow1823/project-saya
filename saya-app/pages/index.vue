<template>
  <v-container class="main-wrapper">
    <v-row class="main-contents" cols="12">
      <v-col class="v-flex" sm="12" md="2" lg="4">
        <img
          v-if="illustBool"
          class="main-image animate__animated animate__pulse"
          width="100%"
          src="../assets/tachiefix2.png"
        />
        <img
          v-else
          class="main-image animate__animated animate__pulse"
          width="100%"
          src="../assets/tachie2.png"
        />
        <v-col class="text-center">
          <v-btn @click="changeIllust" rounded color="#00B8D4" x-large>
            <span class="replay-btn">REPLAY?</span>
          </v-btn>

          <v-btn class="ml-3" v-if="rikiBool" rounded color="#00B8D4" x-large>
            <span class="replay-btn" @click="changeBtn">GAME END</span>
          </v-btn>
          <span class="riki-text" v-else>諦める訳ないよ！！</span>
        </v-col>
      </v-col>

      <v-col md="5" sm="12">
        <v-card class="mx-auto birthday-card" outlined>
          <v-list-item three-line>
            <v-list-item-content>
              <a
                href="https://twitter.com/search?q=%23%E6%9C%B1%E9%B7%BA%E6%88%B8%E6%B2%99%E8%80%B6%E7%94%9F%E8%AA%95%E7%A5%AD2020&src=recent_search_click"
                target="_blank"
                class="tweet-hashtag-title overline mb-4"
                >#朱鷺戸沙耶生誕祭2020</a
              >

              <v-list-item-title class="birthday-main-message headline mb-1"
                >沙耶さん！<br />お誕生日おめでとう！</v-list-item-title
              >
              <v-list-item-subtitle class="birthday-message my-3">
                どうか幸せになってください！
              </v-list-item-subtitle>
            </v-list-item-content>
            <v-list-item-avatar tile size="150">
              <img class="tweet-img-mini" src="../assets/tweetimg.png" alt="" />
            </v-list-item-avatar>
          </v-list-item>
        </v-card>

        <v-col class="count-btn-message d-flex mx-auto">
          <img width="100%" src="../assets/label.png" alt="" />
          <p class="birthday-message py-5 mb-3">
            {{ countSayaBirthday }}回<br />みんなにお祝いしてもらいました！
          </p>
        </v-col>

        <v-col class="d-flex">
          <v-textarea
            counter="100"
            v-model="value"
            background-color="amber lighten-4"
            color="orange orange-darken-5"
            label="お祝いメッセージを入力する"
          >
          </v-textarea>
        </v-col>

        <v-col class="d-flex" offset-md="8" sm="12">
          <v-btn
            :disabled="btnFalse"
            class="tweet-btn"
            target="_blank"
            @click="count()"
            :href="madeUrl + value + mess + ' ' + 'https://tokidosaya.com'"
            rounded
            color="#F48FB1"
            height="60"
          >
            <v-icon class="mr-1" color="#EC407A">mdi-pistol</v-icon>
            <span class="btn-message">誕生日をお祝いする</span>
          </v-btn>
        </v-col>
      </v-col>

      <v-col md="3">
        <v-card class="tweet-wrapper">
          <v-card
            href="https://twitter.com/search?q=%23%E6%9C%B1%E9%B7%BA%E6%88%B8%E6%B2%99%E8%80%B6%E7%94%9F%E8%AA%95%E7%A5%AD2020&src=recent_search_click"
            class="tweet-logo-wrapper"
            color="rgba(158, 200, 255, 0.747)"
          >
            <v-container class="pd-0" text-center>
              <img width="20%" src="../assets/Twitter_Logo_Blue.png" alt="" />
            </v-container>
          </v-card>

          <v-container v-for="(message, index) of messages" :key="index">
            <v-card :href="message.tweet_link" target="_blank">
              <v-list-item-avatar tile size="50">
                <img class="tweet-icon ml-3" :src="message.image" alt="" />
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
            <Person :personData="personData.yuki"></Person>
            <Person :personData="personData.momoringo"></Person>
            <Person :personData="personData.kraris"></Person>
            
            <v-card
              href="https://key.visualarts.gr.jp/"
              color="rgba(242, 246, 92, 0.6)"
              class="px-1 py-1"
            >
              <span class="key-link">版権元：VISUAL ARTS/Key</span>
            </v-card>
          </v-col>
        </v-container>
      </v-col>
    </v-row>

    <v-row>
      <v-col md="12" sm="12">
        <v-card class="py-2 px-2 talk-wrapper" color="#BBDEFB">
          <vue-typer
            color="white"
            :text="[
              'うんがーーーーーー！',
              'げげごぼおぇ…',
              '戦場ではこういうのもアリなんだから…'
            ]"
            :repeat="Infinity"
            :shuffle="true"
            initial-action="typing"
            :pre-type-delay="120"
            :type-delay="130"
            :pre-erase-delay="2000"
            :erase-delay="330"
            erase-style="clear"
            :erase-on-complete="true"
            caret-animation="smooth"
          ></vue-typer>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Person from "@/components/collabolator/Person";
import axios from "@/plugins/axios";

export default {
  components: {
    Person
  },
  data() {
    return {
      countSayaBirthday: 0,
      mess: "&hashtags=朱鷺戸沙耶生誕祭2020",
      value: "",
      madeUrl: "https://twitter.com/intent/tweet?text=",
      messages: [],
      text: "",
      a: require("@/assets/chibi.png"),
      b: require("@/assets/tachiefix1.png"),
      illustBool: true,
      rikiBool: true,
      personData: {
        yuki: {
          twitter: "https://twitter.com/yuki82511988",
          avatar: require("@/assets/yuki.png"), // requireがいる
          position: "programmer",
          name: "Yuki"
        },
        momoringo: {
          twitter: "https://twitter.com/momoringo_natan",
          avatar: require("@/assets/momoringo.png"),
          position: "Web Designer",
          name: "ももりんご"
        },
        kraris: {
          twitter: "https://twitter.com/K_raris",
          avatar: require("@/assets/kraris.png"),
          position: "Illustrator",
          name: "Kraris"
        }
      }
    };
  },
  methods: {
    async count() {
      let vm = this;
      await axios.put("/v1/counter").then(response => {
        vm = response;
        this.countSayaBirthday = response.data.count.count;
      });
    },
    openWindow() {
      window.open(
        this.madeUrl + this.value + this.mess,
        "",
        "width=600,height=500,top=50,left=50"
      );
    },
    changeIllust() {
      this.illustBool = !this.illustBool;
    },
    changeBtn() {
      this.rikiBool = !this.rikiBool;
    }
  },
  created() {
    let vm = this;
    axios.get("/v1/counter").then(response => {
      this.countSayaBirthday = response.data.count.count;
      this.messages = response.data.tweet;
    });
  },
  computed: {
    btnFalse: function() {
      if (this.value.length > 100) {
        return true;
      } else {
        return false;
      }
    }
  }
};
</script>

<style lang="scss" scoped>
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
  font-family: "ヒラギノ角ゴ ProN W3", "Hiragino Kaku Gothic ProN", "メイリオ",
    "Meiryo", sans-serif;
}

.row {
  margin: auto 0 !important;
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

.riki-text {
  @include sp {
    font-size: 70%;
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

  @include sp {
    font-size: 70% !important;
  }
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
