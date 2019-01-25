<template>
    <header class="topBar">
            <a @click="goBack" class="icon_back"> <i class='iconfont icon-xiangzuo'></i></a>
            <h3 class="cartname">{{title}}</h3>
            <a href="#" class="icon_menu"> <i class='iconfont icon-diandiandian'></i></a> 
    </header>
</template>


<script>
export default {
    data(){
        return{

        }
    },
    props:['title','where'],
    methods: {
         goBack(){
             if(this.where==-1){
                 window.history.go(-1);
             }
             if(this.where==0){
                 this.$router.push('/home')
             }
            },
    },
}
</script>

<style >
      
/* 详情页固定头部导航 */
.topBar {
    max-width: 640px;
    min-width: 300px;
    width: 100%;
    height: 45px;
    background: #fff;
    border-bottom: 1px solid #ccc;
    position: fixed;
    z-index: 99;
    top: 0;
    left: 50%;
    transform:translateX(-50%);
}

.topBar .icon_back {
    width: 18px;
    height: 18px;
    margin-left:10px;
    position: absolute;
    left: 0;
    top: 0;
    line-height: 45px;
}

.topBar .cartname {
    text-align: center;
    font-size: 16px;
    font-family: sans-serif;
    font-weight: normal;
    line-height: 45px;
}
.topBar .icon_menu {
    height: 44px;
    width: 40px;
    display: block;
    position: absolute;
    right: 0;
    top: 0;
    line-height: 45px;
}

</style>