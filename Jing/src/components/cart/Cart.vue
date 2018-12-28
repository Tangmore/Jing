<template>
  <div id="my_cart">
     <!--购物车固定头部bar-->
    <commonHead :title='msg' :where='home'></commonHead>
    <CartMain></CartMain> 
    <!-- 固定footer -->
    <CartFooter></CartFooter>
  </div>
</template>
<script>
  import commonHead from '../public/commonHead';
 import CartMain from './CartMain';
 import CartFooter from './CartFooter';
import {mapActions} from 'vuex'
 export default{
   data() {
     return {
       msg:'购物车',
       home:0
     }
   },
  components:{
   commonHead,
    CartMain,
    CartFooter
  },

   mounted(){
        this.$store.dispatch('hideNav')     //触发store中的隐藏的方法
    },
    destroyed(){
        this.$store.dispatch('showNav')     //触发store中的显示的方法
    },

 }
</script>
<style>
@import '../../assets/css/cart.css';
</style>
