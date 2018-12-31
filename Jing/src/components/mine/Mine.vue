<template>
  <div class="mineBox">
    <main class="mine_layout">
      <section class="mine_infos clearfix">
        <div class="mmm_info">
          <div class="user_icon">
            <div class='img'>头像</div>
          </div>
          <div class="user_detal">
            <p class="user_name">{{info}}</p>
          </div>
        </div>
        <div class="conceBox">
          <ul class="conc_item">
            <li class="item">
              <a href="" class="item_link">
                <span>0</span>
                <span>关注的商品</span>
              </a>
            </li>
            <li class="item">
              <a href="" class="item_link">
                <span>0</span>
                <span>关注的店铺</span>
              </a>
            </li>
            <li class="item">
              <a href="" class="item_link">
                <span>8</span>
                <span>浏览记录</span>
              </a>
            </li>
          </ul>
        </div>
      </section>
    </main>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        info: ''
      }
    },
    mounted() {
      this.getInfo()
    },
    methods: {
      getInfo() {
        if (window.sessionStorage.userInfo) {
          this.info = window.sessionStorage.userInfo;
        } else {
          this.$router.push('/login');
        }
      }
    }
  }
</script>

<style>
  @import '../../assets/css/mine.css';
</style>