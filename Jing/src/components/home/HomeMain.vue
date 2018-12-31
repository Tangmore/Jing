<template>
	<div class="homeMain">
		 <section class="m_product_top">
              <div class="product_top">
                  <!-- title -->
                   <span class="miaosha_icon">全场秒杀</span>
                    <strong class="dianshu">六点场</strong>
                    <span class="time">00:21:43</span>
               </div>

                <!-- 秒杀区 -->
               <div class="product_content">
                    <ul>
                        <li class="product_sale_item" v-for="item in saleDatas">
                            <router-link :to="'/detail/'+item.product_id" class="product_sale_item_link">
                            <!--v-lazy懒加载-->
                                  <img v-lazy="item.product_img_url" alt="" class="product_sale_item_img   lazy-img-fadein">
                                  <p class="nowPrice">
                                        <i>¥</i>
                                        <span>{{item.product_uprice}}</span>
                                 </p>
                                  <p class="oldPrice">
                                        <i>¥</i>
                                        <del>{{item.product_price}}</del>
                                  </p>
                            </router-link>
                        </li>
                            
                    </ul>
                </div>
        </section>
        <div class="recommend_content_box"> 
            <div class="recommend_content">
                 <p class="recommend_title">为你推荐</p>

                 <div class="recommend_thing_box">
                      <ul>
                          <li class="recommend_thing_item" v-for="item in recommenedDatas">
                                <router-link :to="'/detail/'+item.product_id">
                                    <img v-lazy="item.product_img_url" alt="" class="recommend_thing_pic"/>
                                    <div class="recommend_thing_info">
                                        <p class="recommend_thing_title">{{item.product_name}}</p>
                                        <p class="recommend_thing_text">
                                            <i>¥</i>
                                            <span>{{item.product_price}}</span>
                                        </p>
                                    </div>
                                </router-link>
                            </li>
                     </ul>
                 </div>
            </div>
        </div>

	</div>
</template>
<script>
   export default {
        data () {
            return {
                saleDatas:[],
                recommenedDatas:[]
            }
        },
        mounted(){
            this.getHomeData();
        },
        methods:{
            getHomeData(){
                this.axios.get('/home').then((res)=>{
                    console.log(res);
                    if(res.status =='200'){
                        this.saleDatas = res.data.slice(0,4);
                        this.recommenedDatas = res.data;
                    }
                },(error)=>{
                    console.log(error);
                })
            }
        }
  }
</script>

<style>
/*内容区*/
.m_product_top {
    margin: 0 5px;
}
/*秒杀区*/
.m_product_top .product_top {
    box-shadow: 0 0 1px 1px #e0e0e0;
    height: 32px;
    border-bottom: 1px solid #ccc;
    display: flex;
    height: 32px;
}

.m_product_top .product_top .miaosha_icon{
    height: 30px;
    width: 60px;
    line-height: 32px;
    color: #ff2000;
    font-weight: bold;
    padding-left:4px;
}

.product_top .dianshu{
    line-height: 30px;
    margin-left: 8px;
}

.product_top .time{
    line-height: 30px;
    margin-left: 6px;
    color: #aaa;
}
.product_content{
    margin-top: 8px;
    
}
.product_content ul{
    height: 130px;
    text-align:center;
    background-color: #fff;
}

.product_sale_item .product_sale_item_link{
    width: 25%;
    height: 130px;
    float:left;
}
.product_sale_item_link .product_sale_item_img{
    width: 76px;
    height: 76px;
    
}
@media screen and (max-width:320px){
.product_sale_item_link .product_sale_item_img{
    width: 60px;
    height: 60px;
}
}
.product_sale_item_link .nowPrice{
    width: 80px;
    color: #f00;
    font-weight: 800;
    font-family: "微软雅黑";
    font-size: 16px;
    text-align: center;
}
.product_skill_item_link .oldPrice{
    width: 80px;
    color: #aaa;
    text-align: center;
}
.product_sale_item_link .nowPrice i,
.product_sale_item_link .oldPrice i{
    font-size: 12px;
    font-style: normal;
}


/*为你推荐*/
.recommend_content_box .recommend_title{
    margin: 0 5px;
}
.recommend_content_box .recommend_thing_box{
    height: auto;
    width: 100%;
}
.recommend_content_box .recommend_thing_item{
    width: 49%;
    text-align: center;
    background-color: #fff;
    float:left;
}

.recommend_content_box .recommend_thing_pic{
    width: 100%;
    overflow: hidden;
    margin: 5px;
}

.recommend_content_box .recommend_thing_info{
    text-align: left;
    margin-left: 5px;
}

.recommend_content_box .recommend_thing_title{
    color: #6F7474;
    font-weight: 500;
    font-family: "微软雅黑";
    height: 36px;
    overflow: hidden;
    margin-bottom: 5px;
}

.recommend_content_box .recommend_thing_text{
    color: #f00;
    font-weight: 800;
    font-family: "微软雅黑";
    font-size: 16px;
}
.recommend_content_box .recommend_thing_text i{
    font-size: 12px;
    font-style: normal;
}
</style>


