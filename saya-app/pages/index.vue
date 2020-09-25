<template>
  <v-container class="main-wrapper">

    <v-row>

      <v-col cols="12" xs="2" sm="2" md="2">
        <!-- 画像もらったらabsoluteでおめでとうメッセージに重ねる -->
        <v-container text-center>
          <img class="date-img" src="../assets/仮素材_日付.gif" alt="">
        </v-container>
      </v-col>

      <v-col cols="12" xs="12" sm="10" md="10">
        <v-container text-center>
          <img class="mt-3" width="70%" height="70%" src="../assets/happy.png" alt="">
        </v-container>
      </v-col>

    </v-row>

    <v-row class="main-contents" cols="12">
      <!-- こいつに他の要素がかぶらないようにしたい -->
      <v-col class="v-flex" sm="12" md="2" lg="4">
        <!-- <v-card class="v-flex"> -->
        <img class="main-image animate__animated animate__slideInDown" width="100%" src="../assets/tachie.png" alt="">
        <!-- </v-card> -->
      </v-col>

      <v-col md="5">
        <v-card class="mx-auto" outlined>
          <v-list-item three-line>
            <v-list-item-content>
              <div class="overline mb-4">#朱鷺戸沙耶生誕祭2020</div>
              <v-list-item-title class="headline mb-1">沙耶さん！おめでとう！</v-list-item-title>
              <v-list-item-subtitle class="my-3">
                ここにお祝いメッセージが入ります。<br>
                ここにお祝いメッセージが入ります。<br>
              </v-list-item-subtitle>
            </v-list-item-content>
            <v-list-item-avatar tile size="200">
              <img src="../assets/mini_saya.jpg" alt="">
            </v-list-item-avatar>
          </v-list-item>
        </v-card>

        <v-col class="count-btn-message d-flex mx-auto">
          <v-card class="sub-message-card" elevation="10" color="#81D4FA" shaped outlined>
            <v-list-item>
              <v-list-item-content>
                <p class="test py-5 my-1">みんなにお祝いされた回数：{{ countSayaBirthday }}回！！</p>
              </v-list-item-content>
            </v-list-item>

          </v-card>
        </v-col>

        <v-col class="d-flex">
          <v-textarea v-model="value" background-color="amber lighten-4" color="orange orange-darken-5"
            label="お祝いメッセージを入力する">
          </v-textarea>
        </v-col>

        <v-col class="d-flex" offset-md="8" sm="12">
          <v-btn class="main-btn" target="_blank" @click="count()" :href="madeUrl + value + mess" rounded
            color="#F48FB1" height="60">
            <v-icon class="mr-1" color="#EC407A">mdi-pistol</v-icon>
            <span class="btn-message">誕生日をお祝いする</span>
          </v-btn>
        </v-col>
      </v-col>


      <v-col md="3">
        <div v-for="(message,index) of messages" :key="index">
          <v-card class="mb-5" :href="message.tweet_link" target="_blank">
            <v-list-item-avatar tile size="50">
              <img class="twitter-icon ml-3" :src="message.image" alt="">
            </v-list-item-avatar>
            <span>{{ message.name }}</span>
            <v-list-item>
              <v-list-item-content>
                <span>{{ message.text }}</span>
              </v-list-item-content>
            </v-list-item>
          </v-card>
        </div>
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
        text: ""
      }
    },
    methods: {
      async count() {
        let vm = this;
        await axios.put("/v1/counter").then(response => {
          vm = response;
          console.log(response.data.add.image);
          this.countSayaBirthday = response.data.test.count;
        })
      }
    },
    created() {
      let vm = this
      axios.get("/v1/counter").then(response => {
        vm = response;
        this.countSayaBirthday = response.data.test.count;
        this.messages = response.data.add;
        console.log(response.data.add);
      })
    },
    components: {}
  }

</script>


<style lang="scss">
  $pc: 2024px;
  $mid: 1024px;
  $tab: 680px;
  $sp: 480px;

  // レスポンシブデザイン用の指定
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

  .date-img {
    // z-index: 1;

    @include sp {
      width: 50%;
      // height: 100px;
    }
  }

  .main-image {
    @include sp {
      width: 100%;
    }
  }

  .main-wrapper {
    margin-top: -40px;
  }

  .main-contents {
    margin-bottom: 40px;
    margin-top: -40px;
  }

  .main-btn {
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

  .twitter-icon {
    margin-left: 1%;
    margin-top: 1%;
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

  }

  .twitter-timeline {
    margin: 0 auto !important;
  }

</style>
