<template>
  <div class="my_login">
    <header class="topBar">
      <a @click="goBack" class="icon_back"> <i class='iconfont icon-xiangzuo'></i></a>
      <span class="cartname">咕咕登录</span>
    </header>

    <!-- 登录 -->
    <main class="user_login_box">
      <div class="login_dialog">　
        <div class="input_box">
          <input type="text" name="phone" placeholder="请输入手机号" class="user_input" v-model="user_phone" @blur='ackPhone' />
          <p class="tips" v-show='phoneAck.flag'>{{phoneAck.tip}}</p>
        </div>
        <div class="input_box u_passwd">
          <input type="password" name="upwd" placeholder="请输入密码" class="user_input" v-model="password" @blur='ackUpwd' />
          <p class="tips" v-show='upwdAck.flag'>{{upwdAck.tip}}</p>
        </div>
        <p class="forget_password">忘记密码</p>
        <div class="login_box">
          <!-- <a href="#" :class="(ackAllFlag&&(!phoneAck.flag)&&(!upwdAck.flag))?'all_login_box':''" @click='goLogin'>登录</a> -->
		  <a href="javascript:void(0)" class="all_login_box" @click='goLogin'>登录</a>
		  
		</div>
        <div class="login_box_quick">
          <a href="javascript:void(0)">一键登录</a>
        </div>
        <div class="go_reg_box">
          <router-link tag="span" to="/register">快速注册</router-link>
        </div>
      </div>
    </main>

    <popUp :msg='msg' :status='status'></popUp>

  </div>
</template>
<script>
  import {
    mapActions
  } from 'vuex';
  import popUp from '../public/popUp'
  export default {

    data() {
      return {
        user_phone: '',
         password: '',
	     againPwd:'',
	     phoneAck:{tip:'',flag:false,},
		 upwdAck:{tip:'',flag:false},
		 ackAllFlag:false,  //当为true时才可提交信息
         msg:'',
		 status:0
	  }
    },
    components: {
      popUp
    },
       mounted() {
        this.$store.dispatch('hideNav') //取消底部navbar 
      },
    methods: {
      goBack() {
        this.$router.push('/home');
      },


     ackPhone(){
                   var reg=/^1[3-8]\d{9}$/;
                   if(!this.user_phone){
                      this.phoneAck.tip='手机号不能为空！';
                      this.phoneAck.flag=true;
                      this.ackAllFlag=false;
                      return;
                   }
                   if(!reg.test(this.user_phone)){
                     this.phoneAck.flag=true;
                      this.phoneAck.tip='请输入正确的手机号格式！';
                      this.ackAllFlag=false;
                  } 
             },

     ackUpwd(){

                   var reg=/^\w{6,14}$/;
                   if(!this.password){
                           this.ackAllFlag=false;
                           return;
                   }
                   if(reg.test(this.password)){
					   this.upwdAck.flag=false;
                    //    this.ackAllFlag=true;
                       return;
                  }else{
                      this.upwdAck.tip='密码为6~14位数字、字母或下划线！';
                      this.upwdAck.flag=true;
                      this.ackAllFlag=false;
                  }              
			 },

      goLogin() {
        if (this.user_phone == "" || this.password == "") {
          this.msg = '请输入信息';
          this.status = 1;
          setTimeout(() => {
            this.status = 0;
          }, 2000)
          return;
        }else if((!this.phoneAck.flag)&&(!this.upwdAck.flag)){
			     let data = {
					loginPhone: this.user_phone,
					loginPawd: this.password
				};
				this.axios.post('/login', data).then((res) => {
					// console.log(res);
					if(res.status == 200){
						if(res.data.status ==1){
							this.msg=res.data.msg;
							this.status=1;
							window.sessionStorage.userInfo= this.user_phone;
						
								this.$router.push('/home');
                this.$store.dispatch('showNav');  
							
						}else {
							this.status=1;
							this.msg=res.data.msg;
							setTimeout(()=>{
								this.status=0;
							},2000)
						}
					}else{
						this.status=1;
						this.msg='请求失败';
						setTimeout(()=>{
								this.status=0;
							},2000)
					}

				}, (error) => {
					console.log(error);
				})
		} 
      },
   
      destroyed() {
        this.$store.dispatch('showNav')
      },

    }
  }
</script>
<style>
  @import '../../assets/css/login.css';
</style>