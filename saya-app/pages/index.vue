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


    <v-row>
      <v-col class="" sm="4" md="2" lg="2">
        <img src="../assets/saya.png" alt="">
      </v-col>
    </v-row>

    <v-row>
      <v-col md="4">
        <v-btn @click="count()" rounded color="#FFEB3B">
          <v-icon>mdi-star</v-icon>Happy Birthday Saya
        </v-btn>
      </v-col>
    </v-row>

    <v-row>
      <p class="test">沙耶がお祝いされた回数：{{ countSayaBirthday }}</p>
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

  .top-message {
    font-size: 100px;
    background-color: white;

  }

</style>
