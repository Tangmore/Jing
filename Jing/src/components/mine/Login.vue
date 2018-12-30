<template>
	<div class="my_login">
		<header class="topBar">
			  <a @click="goBack" class="icon_back"> <i class='iconfont icon-xiangzuo'></i></a>
		      <span class="cartname">咕咕登录</span>
		</header>
       
		<main class="user_login_box">
		    <div class="login_dialog">　
		        <div class="input_box">
		            <input type="search" name="username" placeholder="请输入用户名" class="user_input" v-model="username" @blur="unameAsk"/>
					<p class="tip"> </p>
		        </div>
		        <div class="input_box u_passwd">
		            <input type="password" name="password" placeholder="请输入密码" class="user_input" v-model="password" @blur="upwdAsk"/>
					<p class="tip"> </p>
		        </div>
                    <span class="forget_password">忘记密码</span>
		        <div class="login_box">
		            <a href="#">登录</a>
					<!-- <a href="#">登录</a> -->
		        </div>

				 <div class="login_box_quick">
					<a href="#">一键登录</a>
		        </div>
		        <div class="go_reg_box">
		            <router-link tag="span" to="/register">快速注册</router-link>
		        </div>
		    </div>
		</main>



	</div>
</template>
<script>	
import {mapActions} from 'vuex';
export default {

  data () {
    return {
      username: '',
      password: ''
    }
  },
  methods:{
	  goBack(){
		  this.$router.push('/home');
	  },

      unameAsk(){
         
	  },
	  upwdAsk(){

	  }

























//     goLogin(){
//       if(this.username =="" || this.password ==""){
//       	alert('请输入信息')
//       }else {
//       	let self = this;
//       	let data = {
//       		loginName:this.username,
// 			loginPawd:this.password
// 		};
//         self.$http.post('/login',data).then((res)=>{
//             console.log(res);
//             if(res.status == 200){
//             	if(res.data.status ==1){
//             		window.sessionStorage.userInfo= res.data.user_name;
//             		self.$router.push('/');
//             	}else {
//             		alert(res.data.msg)
//             	}
//             }else{
//             	alert('请求失败')
//             }
            
//         },(error)=>{
//             console.log(error);
//         })
// }
//     }
  },
 mounted(){
        this.$store.dispatch('hideNav')    //取消底部navbar 
    },
    destroyed(){
        this.$store.dispatch('showNav')    
    },
}
</script>
<style>
@import '../../assets/css/login.css';
</style>