(function (window, $, undefined) {

    window.history.forward(1);  //禁止用户后退
    ybb.ajaxSubmit({
        url: '/radishweb/passport/CreateWithdrawPass',
        form: '#password_form',
        selector: '.btn-warning',
        regs: {
            'phone': /\S/,
            'password': /^\d{6}$/
        },
        preFilter: function () {
            var isRight = true;
            if($('#passV').val().length !==6 ||  isNaN($('#passV').val())) {
                isRight = false;
                ybb.msgs('请输入6位数字的支付密码', 'warning');
            }
            return isRight;
        },
        done: function (data) {
            ybb.msgs('设置支付密码成功', 'success');
            var topicId=$('#topicId').val();
            var topicType=$('#topicType').val();
            if(topicType == '1'){
                setTimeout(function () {
                    location.href = '/radishweb/question/info?id='+topicId;
                }, 1000);
            }else  if(topicType == '2'){
                setTimeout(function () {
                    location.href = '/radishweb/notice/info?id='+topicId;
                }, 1000);
            }else if(topicType == '5'){
                setTimeout(function () {
                    location.href = '/radishweb/passport/center?id='+topicId;
                }, 1000);
            }else {
                setTimeout(function () {
                    location.href = '/radishweb/money/default';
                }, 1000);
            }
        }
    })
})(window, $, undefined);

