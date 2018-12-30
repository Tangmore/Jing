<template>
    <div class="pop">
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
.pop{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
 }
.pop .pop_box {
    width: 100%;
    height: 44px;
    background-color: #555;
    border-radius: 8px;
    padding: 0 6px;
    color: #fff;
    text-align: center;
    font-size: 16px;
    line-height: 44px;
}
</style>