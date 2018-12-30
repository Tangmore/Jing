<template>
	<div class="my_login">
		<header class="topBar">
			  <a @click="goBack" class="icon_back"> <i class='iconfont icon-xiangzuo'></i></a>
		      <span class="cartname" >咕咕注册</span>
		</header>

	 <!-- 注册 -->
	 <main class="user_login_box" >
		<div class="login_dialog">　
			<div class="input_box">
				<input type="text" name="phone" placeholder="请输入手机号" class="user_input"
				 v-model="user_phone" @blur='ackPhone'/>
				 <p class="tips" v-show='phoneAck.flag' >{{phoneAck.tip}}</p>
			</div>
			<div class="input_box u_passwd">
				<input type="password" name="upwd" placeholder="请输入密码" class="user_input"
				 v-model="password" @blur='ackUpwd'/>
				 <p class="tips" v-show='upwdAck.flag' >{{upwdAck.tip}}</p>
			</div>
			<div class="input_box u_passwd">
				<input type="password" name="upwdAgain" placeholder="确认密码" class="user_input" 
				v-model="againPwd" @blur='ackUpwdAgain'/>
				 <p class="tips" v-show='upwdAgainAck.flag' >{{upwdAgainAck.tip}}</p>
			</div>
			<div class="login_box">
				<a href="#" :class="(ackAllFlag&&(!phoneAck.flag)&&(!upwdAck.flag)&&(!upwdAgainAck.flag))?'all_login_box':''" @click='goReg'>注册</a>
			</div>
			<div class="go_reg_box">
               <router-link tag="span" to="/login">已有账号，直接登录</router-link>
			</div>
		</div>
	</main> 

   <popUp :msg='msg' :status='status'></popUp>
	</div>
</template>
<script>	
import {mapActions} from 'vuex';
import popUp from '../public/popUp'
export default {

  data () {
    return {
		 user_phone: '',
         password: '',
	     againPwd:'',
	     phoneAck:{tip:'',flag:false,},
		 upwdAck:{tip:'',flag:false},
		 upwdAgainAck:{tip:'',flag:false},
		 ackAllFlag:false,  //当为true时才可提交信息
         msg:'',
         status:0
    }
  },
  components:{
    popUp
  },
  methods:{
	  goBack(){
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
                   if(reg.test(this.user_phone)){
                       this.phoneAck.flag=false;
                       //查询手机是否被占用
                        this.axios.get("/ackphone",
                        {params:{phone:this.user_phone}}).then(res=>{
                                if(res.data.code==1){
                                    this.phoneAck.tip=res.data.msg;
                                    this.phoneAck.flag=true;
                                    this.ackAllFlag=false;
                                }else{
                                     this.ackAllFlag=true;
                                }
                        })
                  }else{
                      this.phoneAck.tip='请输入正确的手机号格式！';
                      this.phoneAck.flag=true;
                      this.ackAllFlag=true;
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
                       return;
                  }else{
                      this.upwdAck.tip='密码为6~14位数字、字母或下划线！';
                      this.upwdAck.flag=true;
                      this.ackAllFlag=false;
                  }              
			 },
			 
			 ackUpwdAgain(){
                 if(!this.againPwd){
                      this.ackAllFlag=false;
                      return;
                 }
                if(!(this.againPwd===this.password)) {
                     this.upwdAgainAck.tip='两次密码请保持一致!';     
                     this.upwdAgainAck.flag=true;
                      this.ackAllFlag=false;
                    return;
                }else{
                     this.upwdAgainAck.flag=false;
                      this.ackAllFlag=true;
                }
             },

             goReg(){
                 	if(this.user_phone =="" || this.password ==""){
                        this.msg='请输入信息';
					    this.status=1;
                        setTimeout(()=>{
                              this.status=0;
                        },2000)
				}else {
                  let data = {
                    regPhone:this.user_phone,
                    regPasswd:this.password
                    };
                  this.axios.post('/reg',data).then((res)=>{
                        console.log(res);
                        if(res.status == 200){
                            if(res.data.status ==1){
                                this.msg=res.data.msg;
                                this.status=1;
                                setTimeout(()=>{
                                    this.$router.push('/login');
                                },2000)
                            }else {
                                   this.status=1;
                                setTimeout(()=>{
                                     this.status=0;
                                },2000)
                                  this.msg=res.data.msg;
                            }
                        }else{ 
                            this.status=1;
                                setTimeout(()=>{
                                     this.status=0;
                                },2000)
                             this.msg='请求失败';
                        }
                    },(error)=>{
                        console.log(error);
                    })
             }
            },
            mounted(){
                this.$store.dispatch('hideNav')    //取消底部navbar 
            },
            destroyed(){
                this.$store.dispatch('showNav');  
            },  
         
    }
}
</script>
<style>
@import '../../assets/css/login.css';
</style>