<template>
	<div class="category_right_box">
		 <div class="category_right">  
              <!--banner  -->
	            <div class="category_banner">
	                <HomeBanner :bannerImg='bannerImg' ></HomeBanner>
	            </div>
               <!-- 商品列表 -->
	            <div class="category_detail">
	                <h3 class="category_title">Hot Category Goods</h3>
	                <ul>
	                    <li class="category_detail_item" v-for="item in rightDatas" :key="item.product_id">
	                        <router-link :to="'/detail/'+item.product_id" class="category_detail_item_link">
	                            <img v-lazy="item.product_img_url" alt="" class="category_detail_item_pic">
	                            <p class="category_detail_item_name">{{item.product_name}}</p>
	                        </router-link>
	                    </li>
	                </ul>
	            </div>
	        </div> 
	</div>
</template>

<script>
import HomeBanner from '../home/HomeBanner';
export default {
    
  data () {
    return {
      rightDatas: [],
      bannerImg:[require('../../assets/images/cate1.jpg'),
      require('../../assets/images/cate2.jpg'),
      require('../../assets/images/cate3.jpg')]
    }
  },
  mounted(){
      if(this.$route.params.id) {
        this.getRightData(this.$route.params.id);
      }
  },
  watch:{
      $route(to,from){
        //   console.log(to)
          if(to.params.id){
              this.getRightData(to.params.id);
          }
      } 
  },
  methods:{
      getRightData(id) {
        this.axios.get('/categorygoods',{params:{mId:id}}).then((res)=>{
            this.rightDatas = res.data;
        },(error)=>{
            console.log(error);
        })
      }
  },
  components:{
      HomeBanner
  }
}
</script>
<style scoped>
/* 右banner */
.category_right .category_banner,
.category_detail {
    padding: 10px 12px;
}

.category_right .category_banner img {
    display: block;
    width: 100%;
    overflow: hidden;
}


/* 右商品 */
.category_detail .category_title {
    color: #888;
    margin-bottom: 10px;
}

 .category_detail .category_detail_item {
    float: left;
    width: 33.333%;
    text-align: center;
}

.category_detail_item_link .category_detail_item_pic {
    width: 62px;
    height: 62px;
    display: inline-block;
}

.category_detail_item_link .category_detail_item_name {
    line-height: 30px;
    height: 30px;
    overflow: hidden;
} 

</style>
