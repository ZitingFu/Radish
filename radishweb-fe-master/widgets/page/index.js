(function(){
    
    var b=$('ul.pagination li')[0];
    var c=$('ul.pagination li')[1];
    var d=$('ul.pagination li')[2];
    var childHtml=$(c).find('span').text();
    var smartyValue = $('.smartyValue').text();
    //judge page's actived button's color
    if(smartyValue >= 1){
    activeBtn:{
        var a=$('ul.pagination li.active span');
        $(a).css('color','#fff');
        console.log(smartyValue+'.......e.......')
        if(b.innerHTML==1){
            if(childHtml!==2){
                $('.pagination').innerHTML('没有更多数据了！');
            }else{
                $(b).css({'border':'1px solid #fda249','border-right':'0'});
            }
            
        }else{
            $(a).css({'border':'1pxsolid #fda249','border-left':'0','border-right':'0'})
        }
    };
    }
    
    //judge pages tag first one have border-radius. 
    firstBorder:{
        var b=$('ul.pagination li')[0];
        $(b).css('border-top-left-radius','5px');
        $(b).css('border-bottom-left-radius','5px');
    }
})();
