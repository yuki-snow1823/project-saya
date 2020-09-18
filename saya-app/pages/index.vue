<template>
  <v-container>
    <v-row>
      <v-col class="day" md="1">10/21</v-col>
      <v-col class="top-message" offset-md="1" md="10">
        <p>
          Happy Birthday Saya!
        </p>
      </v-col>
    </v-row>


    <v-row class="main-contents">
      <v-col class="" sm="4" md="2" lg="2">
        <img height="500px" src="../assets/saya.png" alt="">
      </v-col>

      <v-col offset-md="2" md="5">
        <v-card class="message-card mb-5">
          みんなでお祝いしましょう。<br>
          みんなでお祝いしましょう。<br>
          みんなでお祝いしましょう。<br>
          みんなでお祝いしましょう。<br>
          みんなでお祝いしましょう。<br>
        </v-card>

        <v-col class="d-flex">
          <v-btn class="main-btn" @click="count()" rounded color="#FFEB3B">
            <v-icon>mdi-star</v-icon>誕生日をお祝いする
          </v-btn>
        </v-col>

        <v-col class="count-btn-message d-flex">
          <p class="test">沙耶がお祝いされた回数：{{ countSayaBirthday }}</p>
        </v-col>
      </v-col>

      <v-col class="" md="3">
        <img height="600px" src="../assets/twitter.jpg" alt="">
      </v-col>
    </v-row>


  </v-container>
</template>

<script>
  import axios from "@/plugins/axios"

  export default {
    data() {
      return {
        countSayaBirthday: 0
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
  }

  .top-message {
    font-size: 100px;
    background-color: white;
  }

  .main-btn {
    padding: 60px !important;
    font-size: 30px !important;
  }

  .count-btn-message {
    background-color: white;
    padding: 30px;
    font-size: 30px;
  }

</style>
