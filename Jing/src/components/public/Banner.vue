<template>
	<div>
		<ul class="banner_child_box">
            <li class="banner_item" v-for="(item,i) in imgDatas" v-show="i==num">
                <img :src="item.image_url" alt="" class="banner_pic">
            </li>
        
        </ul>
        <div class="banner_count">
                <em id="slide-nub" class="fz18">{{num+1}}</em>
                <em class="nub-bg">/</em>
                <em id="slide-sum" class="fz12">{{imgDatas.length}}</em>
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
    mounted:function(){   //生命周期  挂载完成
        this.play();
    },
    methods:{   //方法
        autoPlay:function(){
            this.num++;
            if(this.num == this.imgDatas.length){
                this.num = 0;
            }
        },
        play:function(){
            setInterval(this.autoPlay,2000);
        }  
    }
}
</script>