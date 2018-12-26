<template>
	<div>
		<ul class="child_banner_box">
            <li class="banner_item" v-for="(item,i) in imgDatas" v-show="i==num">
                <img :src="item.image_url" alt="" class="banner_pic">
            </li>
        
        </ul>
        <div class="banner_count">
                <i class="now_count">{{num+1}}</i>
                <i class="nub-bg">/</i>
                <i class="total_count">{{imgDatas.length}}</i>
        </div>
	</div>
</template>

<script>
export default {
  data () {
    return {
        num:0,
    }
  },
  props:['imgDatas'],
    mounted:function(){   
        this.autoPlay();
    },
    methods:{ 
         autoPlay(){
            setInterval(()=>{
                this.num++;
                if(this.num == this.imgDatas.length){
                    this.num = 0;
                }
            },2000)
        }
    }
}
</script>

<style>
  
</style>