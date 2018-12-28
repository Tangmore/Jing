<template>
  <main class="cart">
    <div class="cart_content" v-for="item in cartDatas" v-show='item.num!=0'>
        <!-- 选择 店铺名称 优惠券 -->
            <div class="cart_shop">
                <div class="shop_info clearfix">
                    <!-- logo -->
                    <!-- <img src="../../assets/images/buy-logo.png" alt="" class="shop_icon"> -->
                      <span class="shop_name">Tammytangs旗舰店</span> 
                </div>
                      <span class="cart_free">优惠券></span>
            </div>
            <div class="cart_item">
                <div class="check"> 
                     <i class="iconfont icon-xuanze" v-show="item.checked==false" @click="changeToTrue(item)"></i>
                     <i class="iconfont icon-gouxuanzhong" v-show="item.checked" style="color:#f00" @click="changeToFalse(item)"></i>
                     </div> 

                <div class="cart_detial_box">   
                    
                    <a href="#" class="cart_product_link"> 
                           <img v-lazy="item.product_img_url" alt=""> 
                    </a>
                    <div class="item_names">
                        <a href="#">
                            <span>{{item.product_name}}</span>
                        </a>
                    </div> 
                   <div class="cart_item_spec">
                        <i>重量:0.45kg</i>
                        <span class="prodoct_color">颜色:AT800/16</span>
                    </div> 
                    <div class="cart_product_sell">
                        <span class="product_money">￥ 
                            <strong class="roduct_money">{{item.product_uprice}}</strong> 
                            .00
                        </span>
                       <!-- 数量 -->
                        <div class="cart_count_box clearfix" > 
                            <span class="item_count_add" @click="incrementData(item.product_id)">+</span> 
                         
                          <input type="tel" class="item_count" v-model="item.num" /> 

                            <span class="item_count_sub" @click="decrementData(item.product_id)">-</span>
                         
                        </div> 

                    </div>
                </div>
                    <!-- <div class="cart_del clearfix" @click="delCart(item.product_id)">
                        <div class="del_top" >
                        </div>
                        <div class="del_bottom">
                        </div>
                    </div> -->
            </div>
       </div>
 
        <!-- <div class="pop" v-show="popStatus">
          <div class="pop_box">
              <div class="del_info">
                  确定要删除该商品吗？ 
              </div>
              <div class="del_cancel" @click="delCancel">
                  取消
              </div>
              <div class="del_ok" @click="delOk">
                  确定
              </div>
          </div>
        </div> -->
  </main>
</template>

<script>
//mapGetters 辅助函数  获取store中的getters值
import { mapGetters,mapActions, mapMutations} from 'vuex'
export default {
  data () { 
    return {
      popStatus: false,
      curId:''
    }
  },
  computed :{
      ...mapGetters(['cartDatas']),
  },
  mounted() {
    //   console.log(this.carDatas)
  },
   methods:{
    ...mapActions(['incrementData','decrementData']),


    // delCart:function(id){   //删除
    //   this.popStatus = true;
    //   this.curId = id;
    // },
    // delCancel:function(){   //取消
    //   this.popStatus = false;
    // },
    // delOk:function(){   //确定
    //   this.popStatus = false;
    //   this.$store.dispatch('delCartData',this.curId)
    // },


    changeToTrue(item){
       item.checked=true;      
    },
    changeToFalse(item){
        item.checked=false;
        this.$store.commit('changeToAll',false)
    }
  }
}
</script>

<style>
    
</style>
