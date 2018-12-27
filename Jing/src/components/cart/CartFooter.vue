<template>
	<div class="cart_footer_box">
		<footer class="cart_footer">
		    <div class="all_check_box ">
		        <i class="iconfont icon-xuanze"></i>
		        <span>全选</span>
		    </div>
		    <div class="total_money_box">
		        <div class="heji">
		            <strong>合计:</strong> 
		            <strong>￥</strong>
		            <!-- <strong>{{total.toFixed(2)}}</strong> -->
					<strong>2300.00</strong>
		        </div>
		     
		            <a href="#" class="go_pay">
		                <span>去计算(1)</span>
		            </a>
		    </div>
		</footer>
	</div>
</template>
<script>
	// import {mapGetters} from 'vuex'
	export default {
		data() {
			return {
				
			}
		},
		// computed:{
	    //   ...mapGetters(['total'])
	    // }
	}
</script>

<style>
	
.cart_footer {
    width: 100%;
    height: 50px;
    border-top: 1px solid #cccccc;
    position: fixed;
    bottom: 0;
	left: 0;
	/*z-index:99;*/
    background-color: #fff;
}
/*全选*/
.cart_footer .all_check_box {
    width: 100px;
    height: 50px;
	padding-left: 16px;
}

.cart_footer .all_check_box span {
    text-align: center;
    line-height: 50px;
    margin-left: 10px;
    color: #f00;
    font-weight: 600;
}

/*合计*/
.cart_footer .total_money_box {
    float: left;
    height: 50px;
    margin-left: 80px;
}

.total_money_box .heji {
	margin-top: 6px;
	position: absolute;
	top: 10;
	float:right;
}

.total_money_box .total_money {
    color: #aaa;
    font-size: 12px;
}

.total_money_box .total_money i {
    font-style: normal;
    text-decoration: none;
}

.total_money_box .go_pay {
    position: absolute;
    right: 0;
    top: 0;
    max-width: 98px;
    line-height: 50px;
    text-align: center;
    background: #f23030;
    color: #fff;
    font-size: 16px;
    height: 49px;
    margin-top: 1px;
    padding: 0 16px;
}

</style>