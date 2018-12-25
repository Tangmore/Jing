function  topNavFixed(){
    var homeHeader=document.querySelector('.homeHeader');
    window.onscroll=function(){
         var scrollTop=document.body.scrollTop || document.documentElement.scrollTop;
        if(scrollTop>0){
            homeHeader.style.background='rgba(0,0,0,.4)';
            homeHeader.style.boxShadow='0 -2px 10px #ccc inset';
        }else{
            homeHeader.style.backgroundColor='';
            homeHeader.style.boxShadow='';
        }
    }
}
export {topNavFixed}