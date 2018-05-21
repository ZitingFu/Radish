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
      url: '/radishweb/passport/modifywithdrawpass',
      form: '#form-create',
      type: 'post',
      selector: '.btn-primary',
      regs: {
        'phone': /^1[3-8]{1,}[0-9]{9}$/,
        'code': /\S/,
        'pass': /^\d{6}$/
      },
      done: function (data) {
        ybb.msgs('找回密码成功', 'success');
        var isType=$('#isType').val();
        var id=$('#userId').val();
        console.log(isType);
        switch (isType){
          case '1':
              setTimeout(function () {
                location.href = '/radishweb/question/info?id='+id;
              },1000);
                break;
          case '2':
            setTimeout(function () {
              location.href = '/radishweb/notice/info?id='+id;
            },1000);
            break;
          case '3':
            setTimeout(function () {
              location.href = '/radishweb/money/default';
            },1000);
            break;
          default:
            setTimeout(function () {
              location.href = '/radishweb/passport/center?id='+id;
            },1000);
                console.log('都不是');
        }
      }
    });

  })
})(window, $, undefined)