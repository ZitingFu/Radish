;(function (window, $, undefined) {
    $(document).on('click','p.cancelled',function(){
        $(this).parent('li').animate({height:"0"});
        var userId=$(this).attr('data-id');
            $.post('/radishweb/favorite/fav',{id:userId, type:3},function(){
                ybb.msgs('取消关注成功！', 'success');
                setTimeout(function(){
                    location.reload();
                }, 1000);
            });
        return false;
    })


})(window, $, undefined)