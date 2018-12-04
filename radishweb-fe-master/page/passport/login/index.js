(function (window, $, undefined) {
  $(function () {
    
    var $phone = $('#phone'),
        $password = $('#password'),
        $login = $('#login-btn');
    $login.click(function (e) {
      // if(!checkForm()){
      //   return false;
      // }
      e.preventDefault();
      ybb.ajax({
        url: '/radishweb/passport/login',
        data: $('#loginform').serialize(),
        done: function (data) {
          ybb.msgs('欢迎回来', 'success');
          setTimeout(function () {
            location.href = '/radishweb/index/index';  
          }, 1000);
        }
      });
    });
    
    function checkForm(){
      var isRight = true;
      //检查用户名
     
      // if(!/^[a-zA-Z0-9]{3,15}$/.test($.trim($phone.val())) || !$.trim($password.val())){
      //   ybb.msgs('你才', 'warning');
      //   isRight = false;
      // }

      // if(!/^1[3-8]{1,}[0-9]{9}$/.test($.trim($phone.val())) || !$.trim($password.val())){
      //   ybb.msgs('用户名或密码不正确', 'warning');
      //   isRight = false;
      // }
      return isRight;
    }
    
    $(document).on('keyup', function(e){
			//如果按下回车键，则相当于搜索键被按下
			if(e.which == 13) {
				//$login.trigger('click');
			}
		});

  })
 
})(window, $, undefined)