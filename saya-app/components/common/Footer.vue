<template>
  <v-card>
    <v-footer class="py-3" color="light-blue lighten-1" padless>
      <v-row justify="center" no-gutters>
        <v-col class="light-blue lighten-1 text-center white--text" cols="12">
          {{ new Date().getFullYear() }} — <strong>Created by Yuki Horikoshi</strong>
        </v-col>
      </v-row>
    </v-footer>
  </v-card>
</template>

<script>
export default {
  data () {
    return {}
  }
}
</script>
