import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
//创建store对象
const store=new Vuex.Store({
     state:{
        shownav:true,
         cartDatas:[], //购物车中的数据
         checkedAll:false,
         user:window.sessionStorage.getItem('userInfo') || '',
         isLogin:false
     },
  
     actions:{   //用来管理mutation
          hideNav({commit}){
              commit('HIDENAV')
          },
          showNav({commit}){    //底部导航的显示与隐藏
              commit('SHOWNAV')
          },
          addCart({commit},data){  //购物车数据
               commit('ADDCART',data)
          },
          incrementData({commit},data){   //购物车添加
            commit('INCREMENTDATA',data)
            },
          decrementData({commit},data){    //购物车减少
             commit('DECREMENTDATA',data)
          },
          checkAllItem({commit}){
              commit('CHECKALLITEM')
          },
          delCartData({commit,state},data){   //购物车删除
               commit('DELCARTDATA',data);
          }

     },
     mutations:{  //改变状态
         HIDENAV(state){
             state.shownav=false;
         },
         SHOWNAV(state){
            state.shownav=true;
        },
        ADDCART(state,data){    //进行添加购物车数据
               state.cartDatas.push(data);
               if(state.cartDatas.length>0){
                   let item=state.cartDatas.filter((v)=>{
                    return v.product_id==data.product_id;
                   })[0];

                    if(item){
                           item.num++;
                    }  else{
                        state.cartDatas.push(data);
                    }     
               }else{
                   state.cartDatas.push(data)
               }
        },
        INCREMENTDATA(state,data){
            let item =state.cartDatas.filter(function(v){
                return v.product_id == data
            })[0];
            if(item){
                item.num++;
            }
        },
        DECREMENTDATA(state,data){
            let item =state.cartDatas.filter(function(v){
                return v.product_id == data
            })[0];
            if(item&&item.num>1){
                item.num--;
            }
        },
        CHECKALLITEM(state){
             state.checkedAll=!state.checkedAll;
             for(let item of state.cartDatas){ 
                 if(state.checkedAll){
                       item.checked=true;
                 }else{
                     item.checked=false;
                 }
            }
        },
        changeToAll(state,data){
            if(!data){
                state.checkedAll=false;
            }
        },
        sigin(state){
            state.isLogin=true;
        },
        siginout(state){
            state.isLogin=false;
            state.user='';
        },
        DELCARTDATA(state,data){
            for(let i=0;i<state.cartDatas.length;i++){
                if(state.cartDatas[i].product_id==data){
                    state.cartDatas.splice(i,1);
                    break;
                }
            }
        }
  
     },
     getters:{   //相当于计算属性
        shownav(state){  
            return state.shownav;
        },
        cartDatas(state){
              return state.cartDatas;
        },
        total(state){           //计算出购物车中被选中的商品的总价  
            var total=0;
            for(let i=0,len=state.cartDatas.length;i<len;i++){
                if(state.cartDatas[i].checked){
                    total+=state.cartDatas[i].num*state.cartDatas[i].product_uprice;
                }else{
                    continue;
                }
            }
            return total;
        },

        totalCount(state){
            var totalCount=0;
            for(let i=0,len=state.cartDatas.length;i<len;i++){
                if(state.cartDatas[i].checked){
                    totalCount+=state.cartDatas[i].num;
                }else{
                    continue;
                }
            }
            return totalCount;
        },
        bottomTitle(state){
            if(state.user){
                return '我的';
            }else{
                return '未登录';
            }
        }
    }
})
// 导出
export default store;