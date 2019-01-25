<template>
     <div class="popTo">
        <div class='pop_box' v-show='status==1'>
            <span>{{msg}}</span>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
	     popUpFlag:false
        }
    },
    props:['msg','status']
}
</script>
<style>
.popTo{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
 }
.popTo .pop_box {
    width: 100%;
    height: 44px;
    border-radius: 8px;
    padding: 0 6px;
    color: #fff;
    text-align: center;
    background:rgba(0,0,0,.1);
    font-size: 16px;
    line-height: 44px;
}
</style>