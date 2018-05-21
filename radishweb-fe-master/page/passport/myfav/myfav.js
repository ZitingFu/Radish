;(function (window, $, undefined) {
    $(document).on('click','span.cancelled',function(){
        $(this).parents('li').animate({height:"0"});
        var userId=$(this).attr('data-id');
            $.post('/radishweb/favorite/fav',{id:userId, type:1},function(){
                ybb.msgs('取消收藏成功！', 'success');
                setTimeout(function(){
                    location.reload();
                }, 1000);
            });
        return false;

    })


})(window, $, undefined)