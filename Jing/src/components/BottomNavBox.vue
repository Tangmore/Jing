<template>
  <div class="footer ">
    <footer class="bottomNavBox">
      <router-link to="/home" class="tabItem">
        <i class="iconfont icon-shouye"></i>
        <label>首页</label>
      </router-link>
      <router-link to="/catgory/34" class="tabItem">
        <i class="iconfont icon-fenlei"></i>
        <label>分类</label>
      </router-link>
      <router-link to="/find" class="tabItem">
        <i class="iconfont icon-discovery"></i>
        <label>发现</label>
      </router-link>
      <router-link to="/cart" class="tabItem">
        <i class="iconfont icon-gouwuche"></i>
        <label>购物车</label>
      </router-link>
      <router-link v-if="this.$store.state.user=''"   to="/login"  class="tabItem">
        <i class="iconfont icon-wode"></i>
        <label>我的</label>
      </router-link>
      <router-link v-else to="/mine" class="tabItem">
        <i class="iconfont icon-wode"></i>
        <label>我的</label>
      </router-link>
    </footer>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        title: '',
      }
    },
    methods: {
     
    },

  }
</script>
<style scope>
  /*固定底部通栏*/
  .bottomNavBox {
       max-width: 640px;
    min-width: 300px;
    width: 100%;
    height: 50px;
    position: fixed;
    bottom: 0;
    left: 50%;
    background-color: #fff;
    display: flex;
    justify-content: space-around;
    box-shadow: 0 -2px 10px #ccc;
    transform:translate(-50%);
  }

  .bottomNavBox .tabItem {
    width: 18%;
    height: 100%;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .active i,
  .active label {
    color: #f60;
  }
</style>