<template>
  <div class="home">
      <div class="m_layout">
        <!--搜索区-->
        <HomeSearch />
        <!--轮播区-->
        <HomeBanner :bannerImg='bannerImg'/>
        <!--导航区-->
        <HomeNav />
        <!--展示区-->
      </div>
    </div>
</template>

<script>
import HomeSearch from './HomeSearch';
import HomeBanner from './HomeBanner';
import HomeNav from './HomeNav';
export default {
  data () {
    return {
      msg: 'home',
      bannerImg:[require('../../assets/images/b1.jpg'),
            require('../../assets/images/b2.jpg'),
            require('../../assets/images/b3.jpg'),
            require('../../assets/images/b4.jpg'),
            require('../../assets/images/b5.jpg')]
    }
  },
  components:{
      HomeSearch,
      HomeBanner,
      HomeNav
  }
}
</script>
<style>
    @import '../../assets/css/index.css'
</style>
