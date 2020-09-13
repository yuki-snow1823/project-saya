<template>
  <div @click="count()">Hello Saya</div>
</template>

<script>
  import axios from "@/plugins/axios"

  export default {
    methods: {
      async count(todo) {
        console.log("hoge")
        await axios.put("/v1/counter")
      }
    },
    components: {}
  }

</script>
