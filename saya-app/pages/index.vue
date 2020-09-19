<template>
  <v-container>
    <v-row>
      <v-col md="2">
        <img src="../assets/仮素材_日付.gif" alt="">
      </v-col>
      <v-col offset-md="2" md="6">
        <p class="top-message">
          Happy Birthday Saya!
        </p>
      </v-col>
    </v-row>


    <v-row class="main-contents">

      <v-col class="" sm="4" md="2" lg="2">
        <img height="500px" src="../assets/saya.png" alt="">
      </v-col>

      <v-col offset-md="2" md="5">
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

            <v-list-item-avatar tile size="80">
              <img src="../assets/mini_saya.jpg" alt="">
            </v-list-item-avatar>
          </v-list-item>

          <!-- <v-card-actions>
            <v-btn text></v-btn>
          </v-card-actions> -->
        </v-card>

        <v-textarea background-color="amber lighten-4" color="orange orange-darken-5" label="お祝いメッセージを入力する">
        </v-textarea>

        <v-col class="d-flex">
          <v-btn class="main-btn" @click="count()" rounded color="#1fffff">
            <v-icon color="orange orange-darken-5">mdi-star</v-icon>誕生日をお祝いする
          </v-btn>
        </v-col>

        <v-col class="count-btn-message d-flex">
          <p class="test">沙耶がお祝いされた回数：{{ countSayaBirthday }}</p>
        </v-col>
      </v-col>

      <v-col class="" md="3">
        <a class="twitter-timeline" data-width="300" data-height="600" data-theme="light"
          href="https://twitter.com/yuki82511988?ref_src=twsrc%5Etfw">Tweets by yuki82511988</a>
        <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
      </v-col>

      <v-col>
        <a href="https://twitter.com/intent/tweet?text= + 'こんにちは' + '&hashtags=dotinstall'" id="test">あああ</a>
        <a href="https://twitter.com/share" class="twitter-share-button" data-text="ここの値をフォームにしたい">Tweet</a>
      </v-col>

      <v-col>

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
        text: "#朱鷺戸沙耶生誕祭2020"
      }
    },
    methods: {
      async count() {
        let vm = this
        console.log("hoge")
        await axios.put("/v1/counter").then(response => {
          vm = response;
          console.log(response.data.test.count);
          this.countSayaBirthday = response.data.test.count;
        })
      }
    },
    created() {
      let vm = this
      console.log("hage")
      axios.get("/v1/counter").then(response => {
        vm = response;
        console.log(response.data.test.count);
        this.countSayaBirthday = response.data.test.count;
      })
      this.countSayaBirthday
    },
    components: {}
  }

  // console.log(document)
  //   let tweet = document.getElementById("test")
  //   let tweetUrl ='https://twitter.com/intent/tweet?text=' + "こんにちは" + '&hashtags=dotinstall';
  //   console.log(tweet);
  //   tweet.href = tweetUrl;


</script>


<style lang="scss">
  .day {
    padding-top: 60px; // 仮
    background-color: green;
    border-radius: 30px;
    font-size: 30px;
    // height: 300px;
  }

  .main-contents {
    margin-bottom: 40px;
    margin-top: -40px;
  }

  .top-message {
    font-size: 60px;
    margin-top: 120px;
    background-color: white;
  }

  .main-btn {
    margin-left: 260px;
    margin-top: -30px;
  }

  .count-btn-message {
    background-color: white;
    padding: 30px;
    font-size: 30px;
  }

</style>
