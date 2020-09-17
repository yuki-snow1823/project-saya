<template>
  <v-container>
    <v-row class="mb-6" >
      <v-spacer></v-spacer>
      <v-col md="3" offset="5" >test</v-col>
      <v-col md="3">
        <v-btn @click="count()" rounded color="#FFEB3B">
          <v-btn icon color="#FFC107">
            <v-icon>mdi-star</v-icon>
          </v-btn>
          Happy Birthday Saya
        </v-btn>
        <p class="test">沙耶がお祝いされた回数：{{ countSayaBirthday }}</p>
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
</style>
