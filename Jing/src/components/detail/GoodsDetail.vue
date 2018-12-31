<template>
    <div class="goodsDetail m_layout">
         <!--详情固定头部bar-->
        <commonHead :title='msg' :where='home'></commonHead>

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
                    <a href='javascript:void(0)' class="add_to_cart" @click='addToCart'>加入购物车</a>
                    <a href="javascript:void(0)" class="buy_now">立即购买</a>
                </div>
            </div>

        </footer>

    </div>
</template>
<script>
    import Banner from '../public/Banner';
    import commonHead from '../public/commonHead';
   export default {
        data () {
            return {
                num:0,
                goodsImages:[],  //轮播数据
                goodsData:[],   //商品介绍
                flag:false,
                msg:'商品详情',
                home:-1
            }
        },
        mounted(){
            this.getData(this.$route.params.id);
            this.$store.dispatch('hideNav')
        },

        destroyed() {
            this.$store.dispatch('showNav')
        },
        methods:{
            goBack(){
                window.history.go(-1)
            },
            getData(id){ 
                let self = this;
                self.axios.get('/detail',{params:{mId:id}}).then((res)=>{
                    if(res.status =='200'){
                        self.goodsImages = res.data[0];  //轮播数据
                        self.flag = true;
                        self.goodsData = res.data[1];  //详情信息
                    }
                },(error)=>{
                    console.log(error);
                })
            },
            addToCart(){
                let data=JSON.parse(JSON.stringify(this.goodsData[0]));
                data.num=0;//商品数量
                data.checked=true;//商品被选中
                this.$store.dispatch('addCart',data);  //将数据存于store
                this.$router.push('/cart');
            }
        },
        components:{
            Banner,
            commonHead
        }
  }
</script>
<style>
    @import '../../assets/css/detail.css';
</style>