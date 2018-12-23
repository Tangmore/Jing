<template>
  <div id="app">
    <router-view/>
    <BottomNavBox />
  </div>
</template>

<script>
import BottomNavBox from './components/BottomNavBox';
export default {
  name: 'App',
  data(){
    return {
    }
  },
  components:{
    BottomNavBox
  }
}
</script>

