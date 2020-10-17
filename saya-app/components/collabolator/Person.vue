<template>
  <v-card target="_blank" :href="personData.twitter" class="mb-2" color="rgba(86, 168, 165, 0.836)">
    <v-list-item-avatar tile size="80">
      <img class="tweet-icon" :src="personData.avatar" alt="" />
    </v-list-item-avatar>
    <span class="twitter-name">
      {{ personData.position }}
      <span class="twitter-name">
        {{ personData.name }}
      </span>
    </span>
  </v-card>
</template>

<script>
export default {
  data () {
    return {}
  },

  props: ['personData'], // index.vueで送ろうとしているデータが入る、その名前で登録されている

}
</script>
