<template>
	<header class="homeHeader">
          <div class="homeSearchBox">
              <!-- logo -->
                <a href="#" class="icon_logo"></a>
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
import {topNavFixed}  from '../../assets/js/header.js';

    export default {
        methods: {
            goSearch(){
                this.$router.push('/catgory');
            },
           
        },
        mounted() {
            topNavFixed();
        },
    }
</script>
<style>
.homeHeader {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 40px;
    z-index: 2;
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
    width: 60px;
    height: 36px;
    position: absolute;
    top: 4px;
    left: 10px;
    display: block;
    background:url('../../assets/images/sprites.png') 0 -303px;
    background-size: 200px 200px;
    display: block;
}

.homeSearchBox form {
    width: 100%;
    height: 40px;
    padding-left: 75px;
    padding-right: 60px;
    position: relative;
}

/*input*/
.homeSearchBox form .search {
    width: 66%;
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
    right: 8px;
    top: 0;
    color: #fff;
    line-height: 40px;
    font-weight: 400;
}
</style>