import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
//创建store对象
const store=new Vuex.Store({
     state:{
        shownav:true,
         cartDatas:[] //购物车中的数据
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
        }
     },
     getters:{   //相当于计算属性
        shownav(state){  
            return state.shownav;
        },
        cartDatas(state){
              return state.cartDatas;
        }
    },
})
// 导出
export default store;