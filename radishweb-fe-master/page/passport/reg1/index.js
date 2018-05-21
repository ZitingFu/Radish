(function (window, $, undefined) {
  $(function () {

    //location
    var phone = null;
    $(document).on('click', 'button.code', function () {
      var $this = $(this);
      phone = $('#phone').val();
      if(!/^1[3-8]{1,}[0-9]{9}$/.test(phone)){
        ybb.msgs('请输入正确的电话号码', 'warning');
        return false;
      };
      ybb.ajax({
        url: '/radishweb/phone/code',
        data: 'phone='+phone,
        done: function (data) {
          var time = 120;
          var fn_time = setInterval(timeCountDown, 1000);
          $this.html('120S后发送');
          function timeCountDown() {
            time--;
            if(time > 0){
              $this.addClass('disabled').html(time+'S后发送');
            }else{
              clearInterval(fn_time);
              $this.html('获取验证码')
            }
          }
        }
      });
    });

    ybb.ajaxSubmit({
      url: '/radishweb/passport/reg1',
      form: '#form-create',
      type: 'post',
      selector: '.btn-primary',
      regs: {
        'phone': /^1[3-8]{1,}[0-9]{9}$/,
        'code': /\S/,
        'password': /\S/,
      },
      done: function (data) {
        console.log(data);
        if(data.type == 0){
          location.href = '/radishweb/passport/reg2?id='+data.id
        }else if(data.type == 1){
          location.href = '/radishweb/passport/volunapply?id='+data.id
        }else if(data.type == 2){
          location.href = '/radishweb/passport/orgapply?id='+data.id
        }
      }
    });

  })
})(window, $, undefined)