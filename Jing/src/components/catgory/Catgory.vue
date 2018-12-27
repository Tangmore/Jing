<template>
  <div class="categoryBox m_layout">
    <!--分类固定头部bar-->
    <commonHead :title='msg' :where='home'></commonHead>
   <h4 class="recommend_you">为您推荐</h4>
    <!--主体内容部分  -->
    <div class="category_content">
      <CatgoryMainLeft />
      <CatgoryMainRight />
    </div>
  </div>
</template>

<script>
  import commonHead from '../public/commonHead';
  import CatgoryMainLeft from './CatgoryMainLeft';
  import CatgoryMainRight from './CatgoryMainRight';
  export default {
    data() {
      return {
        msg: '商品分类',
        home:0
      }
    },
    components: {
      commonHead,
      CatgoryMainLeft,
      CatgoryMainRight
    }
  }
</script>
<style>
  @import '../../assets/css/category.css';
</style>
