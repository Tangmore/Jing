<template>
  <div class="searchPage">
    <div class="head_layout ">
	  <!-- 搜索固定导航bar -->
      <header class="topBar clearfix">
		  <div>
			<a @click="goBack" class="icon_back"> <i class='iconfont icon-xiangzuo'></i></a>
			<form class="goods_search">
			<!--监听input的输入值变化事件-->
			<input type="search" class="goods_search_keywords" placeholder="搜索" v-model="keyword" @input="goSearch()">
			</form>
			<a href="#" class="icon_menu"> <i class='iconfont icon-diandiandian'></i></a>
	    </div>
		<div class="search_condition">
			<ul>
			  <li>
				<span class="all">全部</span>
				<em class="all_icon"></em>
			  </li>
			  <li>
				<span @click="goSearch('hot')">销量</span>
			  </li>
			  <li class="product_price">
				<span>价格</span>
				<em  class="price_nav" @click="getByPrice()" v-show='PriceFlag'></em>
				<!-- <em class="price_nav" @click="getPriceDown()"  v-show='downPriceFlag'></em> -->
			  </li>
			  <li>
				<span>筛选</span>
				<em class="drop"></em>
			  </li>
			</ul>
		</div>
	</header>

     
      <section class="search_goods_box "> 
			<ul>
				<li class="goods_item" v-for="(item,index) in searchData" :key="index">
					<router-link :to="'/detail/'+item.product_id" class="goods_item_link">
								<img :src="item.product_img_url" alt="" class="goods_item_pic">
								<div class="goods_right">
									<div class="product_name">
										<span>
											{{item.product_name}}
										</span>
									</div>
									<div class="price_box">
										<span>￥</span>
										<span>{{item.product_uprice}}</span>
										<span>.00</span>
									</div>
									<div class="content_count">
										<span>{{item.product_comment_num}}条评价</span>
										<span>{{item.shop_name}}</span>
									</div>
								</div>
					</router-link>
				</li>
			</ul>
      </section> 
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        keyword: '',
		searchData: [],
		priceFlag:false,
		hot:'',
		priceDown:'',
		priceUp:''
      }
    },
    methods: {
		getByPrice(){
			// if(this.pri)
		
		},

      goBack() {
        this.$router.push("/home");
	  },
	  
      goSearch() {
        if (!this.keyword) return;

        this.axios.get('/search', {
          params: {
            kw: this.keyword,
            hot: this.hot,
            priceUp: this.priceUp,
            priceDown: this.priceDown
          }
        }).then((res) => {
          console.log(res);
          this.searchData = res.data;
        }, (error) => {
          console.log(error);
        })
      }
    }
  }
</script>
<style scoped>
  @import '../../assets/css/searchpage.css';
</style>