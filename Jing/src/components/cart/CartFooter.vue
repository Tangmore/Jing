<template>
	<div class="cart_footer_box">
		<footer class="cart_footer">
		    <div class="all_check_box " @click="checkAllItem">
		        <i class="iconfont icon-xuanze" v-show='$store.state.checkedAll==false'></i>
				 <i class="iconfont icon-gouxuanzhong"  v-show="$store.state.checkedAll" style="color:#f00"></i>
		        <span >全选</span>
		    </div>
		    <div class="total_money_box">
		        <div class="total">
		            <strong class="total_cate">合计:</strong> 
		            <i>￥</i>
		            <strong>{{total.toFixed(2)}}</strong>
					<!-- <strong>00.00</strong> -->
					<p class="total_cate">优惠： <i>￥</i><span>00.00</span></p>
		        </div>
		            <a href="javascript:void(0)" class="go_pay">
		                <span>去计算(<span>{{totalCount}}</span>)</span>
		            </a>
		    </div>
		</footer>
	</div>
</template>
<script>
import {mapActions,mapGetters,mapState} from 'vuex';

	export default {
		data() {
			return {
				
			}
		},
		computed: {
		  ...mapGetters(['total','cartDatas','totalCount']),
		
		},
           mounted() {
			//    console.log()
		   },
		methods: {
			...mapActions(['checkAllItem'])
	        
		},
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
	float: left;
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
    margin-left: 20px;
}

.total_money_box .total {
	margin-top: 6px;
	float:left;
}

.total_money_box .total_cate {
    font-size: 12px;
}

.total_money_box .total i {
    font-style: normal;
    text-decoration: none;
	color: #000;
}

.total_money_box .go_pay {
    position: absolute;
    right: 0;
    top: 0;
	display: block;
	width: 98px;
    height: 50px;
    line-height: 50px;
    text-align: center;
    background: #f23030;
    color: #fff;
    font-size: 16px;
}

</style>