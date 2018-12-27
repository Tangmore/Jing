<template>
		 <div class="category_left_box">
	            <ul class="childbox">
	                <li :class="{active:num==i}" v-for="(item,i) in leftDatas" @click="num=i" >
	                	<router-link :to="'/catgory/'+item.category_id">
	                	{{item.category_name}}
	                	</router-link>
	                </li>
	               
	            </ul>
	        </div>
</template>

<script>
export default {
  data () {
    return {
      leftDatas: [],
      num:''
    }
  },
  mounted(){
      this.getLeftData();
  },
  methods:{
      getLeftData() {
        this.axios.get('/category').then((res)=>{
            console.log(res);
            this.leftDatas = res.data;
        },(error)=>{
            console.log(error);
        })
      }
  }
}
</script>
<style scoped>

/* 左内容 */
.category_left_box ul li {
    height: 44px;
    width: 100%;
    background: #f3f4f6;
    font-size: 12px;
    font-family: sans-serif;
     text-align: center;
}

.category_left_box ul li a {
     height: 44px;
    width:100%;
    display: block;
    line-height: 44px;
    border-right: 1px solid #e0e0e0;
    border-bottom: 1px solid #e0e0e0;
} 
.category_left_box ul li .active {
        background: #999;
    }
</style>
