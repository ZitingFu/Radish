(function (window, $, undefined) {
    $(function () {

        //danger

        var maxCount = 500;  // 最高字数，这个值可以自己配置
        $(".txt1").on('keyup', function() {
            var len = getStrLength(this.value);
            $(".txtbar1").text("("+(len)+"/"+(maxCount)+")");
        });
        function getStrLength(str) {
            var len = str.length;
            var reLen = 0;
            for (var i = 0; i < len; i++) {
                if (str.charCodeAt(i) < 27 || str.charCodeAt(i) > 126) {
                    // 全角
                    reLen += 1;
                } else {
                    reLen++;
                }
            }
            return reLen;
        }
        ybb.ajaxSubmit({
            url: '/radishweb/chat/send',
            form: '#form-create',
            type: 'post',
            selector: '.btn-primary',
            regs: {
                'body': /\S/,
            },
            done: function (data) {
                ybb.msgs('回复私信成功！', 'success');
                setTimeout(function () {
                    location.reload();
                },1000)
            }
        });
            $(document).on('click','span.deleteBody',function(){
                $(this).parents('li').hide();
                var deId=$(this).attr('data-deID');
                $.post('/radishweb/chat/delete2',{id:deId},function(){
                    ybb.msgs('删除消息成功！', 'success');
                    setTimeout(function(){
                        location.reload();
                    }, 1000);
                });

            })
    })
})(window, $, undefined);
