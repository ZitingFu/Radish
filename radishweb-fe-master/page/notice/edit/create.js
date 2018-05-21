(function (window, $, undefined) {
    $(function () {

        var imgdata = [];

        var data_img = JSON.parse($('#data-image').html());
        console.log(data_img);
        var input_data = [];
        var data = [];
        if(data_img.length > 0){
            $.each(data_img, function (i, v) {
                input_data.push(v.id);
                data.push({
                    id: v.id,
                    url: { b : v.images.b}
                });
            });
            $('input[name="images"]').val(input_data);
        };

        new aaa4({
            limit: 8,
            inputName: 'image[]',
            $wrapper: $('#shortcut-card'),
            data:data
        });
        //danger
        $(document).on('click', '#img-upload-confirm .btn-primary', function () {
            var html = '';
            $('tr.fl4').each(function(e){
                var url = $(this).find('input.aaa14').val();
                var data = $(this).find('label.aaa4L').html();
                html += '<img src="'+url+'">';
                imgdata.push(data);
            });
            $('.img-list').html($.trim(html)).parents('div.form-group').removeClass('collapse');
            html = '';
            $('#img-upload-confirm').modal('hide');
            $('input[name="images"]').val(imgdata);
            imgdata = []
        });

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
            url: '/radishweb/notice/edit',
            form: '#form-create',
            type: 'post',
            selector: '.btn-primary',
            regs: {
                'content': /\S/,
            },
            done: function (data) {
                ybb.msgs('修改公告成功！', 'success');
                setTimeout(function () {
                    location.href = '/radishweb/notice/list'
                },1000)
            }
        });

    })
})(window, $, undefined);
