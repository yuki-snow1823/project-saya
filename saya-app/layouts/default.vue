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
  created() {
      console.log("API_ENDPOINT:", process.env.API_ENDPOINT);
  },
}
</script>
