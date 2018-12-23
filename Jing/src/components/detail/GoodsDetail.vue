<template>
    <div class="goods_detail">
        <header class="top_bar">
            <a @click="goBack" class="icon_back"></a>
            <!-- <a onclick="window.history.go(-1)" class="icon_back"></a> -->
            <h3 class="cartname">商品详情</h3>
            <a href="#" class="icon_menu"></a> 
        </header>
        <main class="detail_box">
            <section class="banner_box">
                <Banner :imgDatas ='goodsImages' v-if="flag"/>
            </section>
            <section class="product_info clearfix">
                <div class="product_left">
                    <p class="p_name">{{goodsData[0] ? goodsData[0].product_name : ''}}</p>
                    <div class="product_pric">
                        <span>￥</span>
                        <span class="rel_price">{{goodsData[0] ? goodsData[0].product_price : ''}}</span>
                        <span>.00</span>
                    </div>
                    <div class="product_right">
                        降价通知
                    </div>
                </div>

            </section>
            <section class="product_intro">
                <p class="pro_det">
                    {{goodsData[0] ? goodsData[0].product_detail : ''}}
                </p>
           </section>
          
        </main>
        <footer class="cart_d_footer">
            <div class="m">
                <ul class="m_box">
                    <li class="m_item">
                        <a href="" class="m_item_link">
                            <em class="m_item_pic"></em>
                            <span class="m_item_name">卖家</span>
                        </a>
                        <a href="" class="m_item_link">
                            <em class="m_item_pic two"></em>
                            <span class="m_item_name">关注</span>
                        </a>
                        <a href="" class="m_item_link">
                            <em class="m_item_pic three"></em>
                            <span class="m_item_name">购物车</span>
                        </a>
                    </li>
                </ul>
                <div class="btn_box clearfix" >
                    <a href="#" class="buy_now">加入购物车</a>
                    <a href="#" class="buybuy">立即购买</a>
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
                goodsImages:[],
                goodsData:[],
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
                self.$http.get('/detail',{params:{mId:id}}).then((res)=>{
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
    .cart_d_footer {
        z-index:10;
    }
</style>