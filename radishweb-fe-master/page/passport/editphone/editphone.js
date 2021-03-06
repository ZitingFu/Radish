(function (window, $, undefined) {
    $(function () {
        window.history.forward(1);  //禁止用户后退
        //location
        var phone = null;
        $(document).on('blur', '#phone', function () {
            var $this = $(this);
            phone = $('#phone').val();
            if(!/^1[3-8]{1,}[0-9]{9}$/.test(phone)){
                ybb.msgs('请输入正确的电话号码', 'warning');
                return false;
            }
            else{
                $("#yanzheng").css({
                  "display":"block"
                })
            }
            // ybb.ajax({
            //     url: '/radishweb/phone/code',
            //     data: 'phone='+phone,
            //     done: function (data) {
            //         var time = 120;
            //         var fn_time = setInterval(timeCountDown, 1000);
            //         $this.html('120S后发送');
            //         function timeCountDown() {
            //             time--;
            //             if(time > 0){
            //                 $this.addClass('disabled').html(time+'S后发送');
            //             }else{
            //                 clearInterval(fn_time);
            //                 $this.html('获取验证码')
            //             }
            //         }
            //     }
            // });
        });

        ybb.ajaxSubmit({
            url: '/radishweb/passport/editphone',
            form: '#form-create',
            type: 'post',
            selector: '.btn-primary',
            regs: {
                'phone': /^1[3-8]{1,}[0-9]{9}$/,
                'code': /\S/,
            },
            done: function (data) {
                ybb.msgs('修改手机号成功，请重新登录', 'success');
                console.log(1);
                setTimeout(function () {
                    location.href = '/radishweb/passport/login'
                }, 1000);
            }
        });

    })
})(window, $, undefined)


 window.callback = function(res){
      var ticket = res.ticket
      var randstr = res.randstr
          if(res.ret === 0){
            var phone = $("#phone").val()
              $.ajax({
                url: '/radishweb/phone/captcha',
                type:"post",
                data:{
                  phone:phone,
                  ticket:ticket,
                  randstr:randstr
                },
                success:function(data){
                  var $this = $("#TencentCaptcha") 
                  var time = 120;
                  var fn_time = setInterval(timeCountDown, 1000);
                  $this.html('120S后发送');
                  function timeCountDown() {
                    time--;
                    if(time > 0){
                      $this.addClass('disabled').html(time+'S后发送');
                    }else{
                      clearInterval(fn_time);
                      $this.removeclass('disabled').html('获取验证码')
                    }
                  }
                },
            });
          }
      }