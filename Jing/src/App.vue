<template>
  <div id="app">
    <router-view/>
    <BottomNavBox v-show='shownav'/>
  </div>
</template>

<script>
import BottomNavBox from './components/BottomNavBox';
import {mapGetters} from 'vuex';
export default {
  name: 'App',
  data(){
    return {
    }
  },
  components:{
    BottomNavBox
  },
  computed: {
    ...mapGetters(['shownav']),   //底部的显示与隐藏取决于state中的shownav
  },
}
</script>

