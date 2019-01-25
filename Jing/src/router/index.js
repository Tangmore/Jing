import Vue from 'vue'
import Router from 'vue-router'

import Home from '../components/home/Home'
import Catgory from '../components/catgory/Catgory'
import Find from '../components/find/Find'
import Cart from '../components/cart/Cart'
import Mine from '../components/mine/Mine'
import GoodsDetail from '../components/detail/GoodsDetail'
import SearchMain from '../components/search/SearchMain'
import Login from '../components/mine/Login'
import Register from '../components/mine/Register'
Vue.use(Router)

export default new Router({
  linkActiveClass: 'active',   //在router-link被激活时自动添加.active类
  routes: [   
     {path: '/',redirect: '/home'},
    {path: '/home', component: Home},
    {path: '/detail/:id',component: GoodsDetail},//详情
    {path: '/search',component: SearchMain},
    {path: '/catgory/:id',component: Catgory},
    {path: '/find',component: Find},
    {path: '/cart',component: Cart},
    {path: '/mine',component: Mine},
    {path:'/login',component:Login},
    {path:'/register',component:Register},
    {path: '*',redirect: '/home'}
  ]
})
