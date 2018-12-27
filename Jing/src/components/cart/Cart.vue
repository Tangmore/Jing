<template>
  <div id="my_cart">
     <!--购物车固定头部bar-->
    <commonHead :title='msg' :where='home'></commonHead>
    <!-- <CartMain></CartMain> -->
    <!-- 固定footer -->
    <CartFooter></CartFooter>
  </div>
</template>
<script>
  import commonHead from '../public/commonHead';
 import CartMain from './CartMain';
 import CartFooter from './CartFooter';

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

 }
</script>
<style>
/* @import '../../assets/css/cart.css'; */
</style>
