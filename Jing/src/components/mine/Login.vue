<template>
	<div class="my_l">
		<header class="top_bar">
		    <a onclick="window.history.go(-1)" class="icon_back"></a>
		    <h3 class="cartname">京东登录</h3>
		</header>
		<main class="user_login_box">
		    <div class="login_dialog">　
		        <div class="_username">
		            <input type="text" name="username" placeholder="请输入用户名" class="user_input" v-model="username"/>
		        </div>
		        <div class="_username u_passwd">
		            <input type="password" name="password" placeholder="请输入密码" class="user_input" v-model="password"/>
		        </div>

		        <div class="login_box">
		            <a @click="goLogin()" class="btn_login">登录</a>
		        </div>
		        <div class="go_reg_box">
		            <router-link tag="span" to="/register">快速注册</router-link>
		        </div>
		    </div>
		</main>
	</div>
</template>
<script>
export default {
  data () {
    return {
      username: '',
      password: ''
    }
  },
  methods:{
    goLogin(){
      if(this.username =="" || this.password ==""){
      	alert('请输入信息')
      }else {
      	let self = this;
      	let data = {
      		loginName:this.username,
			loginPawd:this.password
		};
        self.$http.post('/login',data).then((res)=>{
            console.log(res);
            if(res.status == 200){
            	if(res.data.status ==1){
            		window.sessionStorage.userInfo= res.data.user_name;
            		self.$router.push('/');
            	}else {
            		alert(res.data.msg)
            	}
            }else{
            	alert('请求失败')
            }
            
        },(error)=>{
            console.log(error);
        })
}
    }
  }
}
</script>
<style>
@import '../../assets/css/login.css';
</style>