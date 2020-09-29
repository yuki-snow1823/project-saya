<template>
  <div class="loader-container">
    <div class="loaders">
      <div class="ball-clip-rotate">
        <div class="ball"></div>
      </div>
    </div>
        <p>うんがー！！！！！！！！！！！！！</p>
  </div>
</template>

<script>
import "loaders.css";
export default {
  data() {
    return {};
  },
};
</script>

<style  lang="scss" scoped>
$theme-color: #fffb29;
.loader-container {
  position: fixed;
  top: 0;
  z-index: 999;
  width: 100%;
  height: 100vh;
  background: #eee;
  opacity: 0.7;
}

.ball-clip-rotate > div {
  border: 2px solid $theme-color;
  /* background-color: orange !important; */
  border-bottom-color: transparent !important;
}

.ball-clip-rotate {
  position: absolute;
  top: 50%;
  color: red;
  transform: translate(-50%, -50%);
  left: 50%;
}
</style>
