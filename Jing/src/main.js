// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import axios from 'axios'
import VueLazyload from 'vue-lazyload'
import store from './store/store'
import App from './App'
import router from './router'
import './assets/font/iconfont.css'
import './assets/css/base.css'

Vue.config.productionTip = false
/* eslint-disable no-new */
axios.defaults.baseURL='http://127.0.0.1:3008';
axios.defaults.headers['Content-Type']='application/x-www-form-urlencoded'
Vue.prototype.axios=axios;

Vue.use(VueLazyload,{
    preLoad:1.3,   //表示lazyload的元素距离页面底部的百分比
    error:require('./assets/images/err.png'),
    loading:require('./assets/images/loading.gif'),
    attempt:1,   //加载失败后的重试次数，默认为3
    listenEvent:['scroll']  //加载方式 在scroll方式下才会加载
});
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})


