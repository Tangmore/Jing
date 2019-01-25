<template>
	<header class="homeHeader">
          <div class="homeSearchBox">
              <!-- logo -->
                <a href="#" class="icon_logo"></a>
                <!-- <img src="../../../static/lo.png" alt="" class="icon_logo"> -->
              <!-- 搜索框 -->
                <form action="#">
                    <i class="iconfont icon-iconfontsousuokuangsousuo icon_search"></i>
                    <input type="search" class="search" placeholder="搜索商品..." 
                        @focus="goSearch()">
                </form>
              <!-- 登录 -->
                <router-link to="/login" class="login_btn">登录</router-link>
           </div>
    </header>       
</template>
<script>
    export default {
        methods: {
            goSearch(){
                this.$router.push('/search');
            },
           
        },
    
    }
</script>
<style>
.homeHeader {
    max-width: 640px;
    min-width: 300px;
    position: fixed;
    left: 50%;
    top: 0;
    width: 100%;
    height: 40px;
    z-index: 2;
    transform:translate(-50%);
    
}

.homeHeader .homeSearchBox {
    position: relative;
    min-width: 300px;
    max-width: 640px;
    height: 40px;
    margin: 0 auto;
    background: rgba(201, 21, 35, 0);
}

/*logo*/
 .homeSearchBox .icon_logo {
    width: 180px;
    height:180px;
    position: absolute;
    top: 5px;
    left: -34px;
    display: block;
    background:url('../../../static/lo.png') 0 -303px; 
    background-size: 156px 205px;
}

.homeSearchBox form {
    width: 64%;
    height: 40px;
    padding-left: 75px;
    padding-right: 60px;
    position: relative;
    margin:0 auto;
}

/*input*/
.homeSearchBox form .search {
    width: 100%;
    height: 30px;
    border-radius: 15px;
    margin-top: 5px;
    padding-left: 30px;
}

.homeSearchBox form .icon_search {
    display: block;
    width: 37px;
    height: 40px;
    position: absolute;
    left: 85px;
    top: 13px;
}

.homeSearchBox .login_btn {
    display: block;
    width: 30px;
    height: 40px;
    position: absolute;
    right:12px;
    top: 0;
    color: #fff;
    line-height: 40px;
    font-weight: 400;
}
.homeSearchBox .scroll{
    background:rgba(0,0,0,.4);
    border-bottom:1px solid #ccc;
    box-shadow: 0 -2px 10px #ccc inset;
}
</style>