<template>
	<div class="homeBanner">
		<div class="bannerBox clearfix">
           <!-- 图片 -->
            <ul class="imgBox">    
                <li v-for="(item,i) in bannerImg" v-show="i==num" :key="i">
                    <img :src="item" alt="" />
                </li> 
            </ul>
            <!-- 点 -->
            <ul class="pointerBox">
                <li v-for="i in len" :class="(i-1)==num?'now':''"></li> 
            </ul>
        </div>
	</div>
</template>

<script>
export default {
  data () {
    return {
        num:0,
        len:this.bannerImg.length
    }
  },

  props:['bannerImg'],

  mounted:function(){   
        this.autoPlay();
  },

  methods:{   
        autoPlay(){
            setInterval(()=>{
                this.num++;
                if(this.num == this.bannerImg.length){
                    this.num = 0;
                }
            },2000)
        }
    }
}
</script>
<style>
 /*轮播图*/
.homeBanner {
    width: 100%;
    overflow: hidden;
    position: relative;
}
.homeBanner .imgBox li img {
    width: 100%;
}

/*点*/
.homeBanner .pointerBox {
    position: absolute;
    left: 50%;
    bottom: 10px;
    transform: translateX(-50%);  
}
.homeBanner .pointerBox li {
    float: left;
    width: 6px;
    height: 6px;
    border-radius: 3px;
    border: 1px solid #fff;
    margin-right: 10px;
}

.homeBanner .pointerBox .now {
    background: #fff;
}
</style>