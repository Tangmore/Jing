import Vue from 'vue'
import Router from 'vue-router'
import Home from '../components/home/Home'

import Catgory from '../components/catgory/Catgory'
import Find from '../components/find/Find'
import Cart from '../components/cart/Cart'
import Mine from '../components/mine/Mine'
import GoodsDetail from '../components/detail/GoodsDetail'
import SearchMain from '../components/search/SearchMain'

Vue.use(Router)

export default new Router({
  linkActiveClass: 'active',   //在router-link被激活时自动添加.active类
  routes: [
    {path: '/home', component: Home},
    {path: '/',redirect: '/home'},
    {path: '/detail/:id',component: GoodsDetail},
    {path: '/search',component: SearchMain},
    {path: '/catgory',component: Catgory},
    {path: '/catgory/:id',component: Catgory},
    {path: '/find',component: Find},
    {path: '/cart',component: Cart},
    {path: '/mine',component: Mine},
    {path: '*',redirect: '/home'}
  ]
})
