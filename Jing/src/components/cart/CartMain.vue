<template>
  <div>
    <div class="cart_content clearfix" v-for="item in cartDatas">
            <div class="cart_shop clearfix">
                <div class="cart_check_box">
                    <div class="check_box"> 
 
                    </div>
                </div>
                <div class="shop_info clearfix">
                    <img src="../../assets/images/buy-logo.png" alt="" class="shop_icon">
                    <span class="shop_name">{{item.shop_name}}</span>
                </div>
                <div class="cart_free clearfix">
                    <span class="free_tip">优惠券></span>
                </div>
            </div>
            <div class="cart_item">
                <div class="cart_item_box">
                    <div class="check_box">

                    </div>
                </div>
                <div class="cart_detial_box clearfix">
                    <a href="#" class="cart_product_link">
                        <img v-lazy="item.product_img_url" alt="">
                    </a>
                    <div class="item_names">
                        <a href="#">
                            <span>{{item.product_name}}</span>
                        </a>
                    </div>
                    <div class="cart_weight">
                        <i class="my_weigth">重量:0.45kg</i>
                        <span class="my_color">颜色:AT800/16</span>
                    </div>
                    <div class="cart_product_sell">
                        <span class="product_money">￥<strong class="real_money">{{item.product_uprice}}</strong>.00</span>
                        <div class="cart_add clearfix">
                            <span class="my_add" @click="incrementData(item.product_id)">+</span>
                            <input type="tel" class="my_count" v-model="item.num">
                            <span class="my_jian" @click="decrementData(item.product_id)">-</span>
                        </div>
                    </div>
                    <div class="cart_del clearfix" @click="delCart(item.product_id)">
                        <div class="del_top" >
                        </div>
                        <div class="del_bottom">
                        </div>
                    </div>
                </div>
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
  </div>
</template>

<script>
//mapGetters 辅助函数  获取store中的getters值
import { mapGetters,mapActions} from 'vuex'
export default {
  data () { 
    return {
      popStatus: false,
      curId:''
    }
  },
  computed :mapGetters(['cartDatas']),

   methods:{
    ...mapActions(['incrementData','decrementData']),
    delCart:function(id){   //删除
      this.popStatus = true;
      this.curId = id;
    },
    delCancel:function(){   //取消
      this.popStatus = false;
    },
    delOk:function(){   //确定
      this.popStatus = false;
      this.$store.dispatch('delCartData',this.curId)
    }
  }
}
</script>
