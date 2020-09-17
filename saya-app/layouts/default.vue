<template>

      <v-container>
        <nuxt />
      </v-container>

</template>

<script>
export default {
  data () {
    return {
      
    }
  },
    head: {
    bodyAttrs: {
      class: 'bg'
    }
  },
  created() {
      console.log("API_ENDPOINT:", process.env.API_ENDPOINT);
  },
}
</script>

<style lang="scss">
  .bg {
    background-image: url("~@/assets/testhaikei.jpg");
    background-size: 100%;

  }
</style>
