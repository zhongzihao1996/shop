window.onload=function(){
    var oReduce=document.getElementById("reduce");
    var oPlus=document.getElementById("plus");
    var oText=document.getElementById("text");
    var i=0;
    oPlus.onclick=function(){
        if(oText.value<10){
            oText.value=++i
        }
            return false;
    }
    oReduce.onclick=function(){
        if (oText.value <= 1) {
            return false;
        }else{
            oText.value = --i;
        }
    }
}