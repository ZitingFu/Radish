(function (window, $, undefined) {

    window.history.forward(1);  //禁止用户后退
    ybb.ajaxSubmit({
        url: '/radishweb/passport/editpass',
        form: '#password_form',
        selector: '.btn-warning',
        regs: {
            'oldpass': /\S/,
            'newpas': /\S/,
        },
        preFilter: function () {
            var isRight = true;
            var oldpass=$('#oldpass').val();
            var newpass=$('#newpass').val();
            if(oldpass.length<6 || newpass.length<6) {
                isRight = false;
                ybb.msgs('输入大于6位的密码', 'warning');
            }
            return isRight;
        },
        done: function (data) {
            ybb.msgs('修改密码成功，请重新登录', 'success');
            setTimeout(function () {
                location.href = '/radishweb/passport/login'
            }, 1000);
        }
    })
})(window, $, undefined);
