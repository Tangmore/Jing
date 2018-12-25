<template>
    <div class="goodsDetail">
       <!--详情固定头部bar-->
        <header class="topBar">
            <a @click="goBack" class="icon_back"> <i class='iconfont icon-xiangzuo'></i></a>
            <h3 class="cartname">商品详情</h3>
            <a href="#" class="icon_menu"> <i class='iconfont icon-diandiandian'></i></a> 
        </header>

        <section class="detail_box">
        <!--图片轮播-->
            <div class="banner_box">
                <Banner :imgDatas ='goodsImages' v-if="flag"/>
            </div>

             <!--title-->
            <div class="product_info clearfix">
                <div class="product_price_box">
                    <p class="product_name">{{goodsData[0] ? goodsData[0].product_name : ''}}</p>
                    <div class="product_price">
                        <span>￥</span>
                        <span class="rel_price">{{goodsData[0] ? goodsData[0].product_price : ''}}</span>
                        <span>.00</span>
                    </div>
                    <div class="product_right">
                        降价通知
                    </div>
                </div>
            </div>

             <!--商品介绍-->
            <div class="product_intro clearfix">
                <p class="product_detail">
                    {{goodsData[0] ? goodsData[0].product_detail : ''}}
                </p>
           </div>
          
        </section> 

         <!--详情固定底部bar-->
        <footer class="detail_footer">
            <div class="footer_box">
              <div class='cop_footer'>
                        <a href="#" class="footer_item_link">
                            <i class='iconfont icon-maijia2'></i>
                            <span class="m_item_name">卖家</span>
                        </a>
                        <a href="#" class="footer_item_link">
                             <i class='iconfont icon-guanzhu'></i>
                            <span class="m_item_name">关注</span>
                        </a>
                        <a href="#" class="footer_item_link">
                             <i class='iconfont icon-gouwuche1'></i>
                            <span class="m_item_name">购物车</span>
                        </a>
              </div>
                <div class="btnBox clearfix" >
                    <a href="#" class="add_to_cart">加入购物车</a>
                    <a href="#" class="buy_now">立即购买</a>
                </div>
            </div>

        </footer>

    </div>
</template>
<script>
    import Banner from '../public/Banner'
   export default {
        data () {
            return {
                num:0,
                goodsImages:[],  //轮播数据
                goodsData:[],   //商品介绍
                flag:false
            }
        },
        mounted(){
            this.getData(this.$route.params.id);
        },
        methods:{
            goBack(){
                //this.$router.push('/home');
                //this.$router.push({path:'/home'});
                window.history.go(-1)
            },
            getData(id){ 
                let self = this;
                self.axios.get('/detail',{params:{mId:id}}).then((res)=>{
                    console.log(res);
                    if(res.status =='200'){
                        self.goodsImages = res.data[0];  //轮播数据
                        self.flag = true;
                        self.goodsData = res.data[1];  //详情信息
                    }
                },(error)=>{
                    console.log(error);
                })
            }
        },
        components:{
            Banner
        }
  }
</script>
<style>
    @import '../../assets/css/detail.css';
</style>