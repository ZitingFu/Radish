(function (window, $, undefined) {
    $(function () {
        $(document).on('click','span.deleteBody',function(){
            //$(this).parents('li').hide();
            var deId=$(this).attr('data-deID');
            $.post('/radishweb/chat/delete',{identifier:deId},function(){
                console.log(1);
                ybb.msgs('删除消息成功！', 'success');
                setTimeout(function(){
                    location.reload();
                }, 1000);
            });
        })
    })
})(window, $, undefined);

