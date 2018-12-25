function  topNavFixed(){
    var homeHeader=document.querySelector('.homeHeader');
    window.onscroll=function(){
         var scrollTop=document.body.scrollTop || document.documentElement.scrollTop;
        if(scrollTop>0){
            homeHeader.style.backgroundColor='#ddd';
        }else{
            homeHeader.style.backgroundColor='';
        }
    }
}
export {topNavFixed}