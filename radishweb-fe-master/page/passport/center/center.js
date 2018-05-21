(function (window, $, undefined) {
    var favId=$('#favId').val();
    var userId=$('#userId').val();
    $('.favLove').on('click',function(){
        if( favId == '99'){
            favId='0';
            $(this).addClass('fav').html('已关注');
            favAjax(userId,3)
        }else {
            favId='99';
            $(this).removeClass('fav').html('关注');
            favAjax(userId,3)
        }
    });
    $('#dsBtn').on('click',function(){
        isShow($('.Cover'));
        $('.gold').val('');
    })
    $('.m-title').find('img').on('click',function(){
        isShow($('.Cover'));
        $('#Cover1').show();
        $('#Cover2').hide();
        $('#Passw').val('');
        $('.virbox').find('span').html('').css('background','#ffffff');
    });

    //  打赏确认支付
    var topicId=$('.topicId').val();
    $('#withdraw').on('click',function(){
        var dataMoney=$('#dataMoney');
        var gold=$('.gold').val();
        var isNum=/^\+?[1-9][0-9]*$/;　　//正整数
        if( gold == '' && dataMoney.val() == ''){
            ybb.msgs('请选择或者输入打赏的金币数量', 'warning');
            return
        }
        if(!isNum.test(gold) && dataMoney.val() == ''){
            ybb.msgs('请输入正确的数量', 'warning');
            return
        }
        if(dataMoney.val() == ""){
            dataMoney =gold;
        }else {
            dataMoney =dataMoney.val();
        }
        $.post('/radishweb/reword/reword',{price:(dataMoney*100),id:topicId},function(data){
            console.log(data);
            if(data.flag ==1){
                ybb.msgs(data.msg, 'warning');
                if(data.msg == '金币不足'){
                    $('.goldInadequate').show();
                }
                if(data.msg == '请先设置提现密码'){
                    setTimeout(function () {
                        location.href='/radishweb/passport/createwithdrawpass?id='+topicId+'&type=5' ;
                    }, 1000);
                }
                return
            }
            $('#orderId').val(data.data.orderId);
            $('#Cover1').hide();
            $('#Passw').val('');
            $('#Cover2').show();
        })

    });





    //自定义密码输入框
    var virbox=$('.virbox');
    virbox.click(function(){
        $('.realbox').focus();
        $('.virbox span').css('background','#FFFECF');
    });
    virbox.blur(function(){
        $('.virbox span').css('background','#ffffff');
    });
    $('.realbox').keyup(function(){
        virbox.find('span').html('');
        var realboxLength = Number($('.realbox').val().length);
        for(var i=0;i<realboxLength;i++){
            //var words = $('.realbox').val();
            $('.virbox span').eq(i).html('·');
        }
    });

    // 打赏金额选择事件
    $('.m-list ul').on('click','li',function(){
        $('#dataMoney').val($(this).attr('data-money'));
        $('.m-list ul li').removeClass('active');
        $(this).addClass('active');
        $('.gold').val('');
    });
    //金额输入框，获取焦点事件
    $(".gold").focus(function(){
        $('.m-list ul li').removeClass('active');
        $('#dataMoney').val('');
    });
    //支付密码
    $('#topicPass').on('click',function(){

        var passw=$('#Passw').val();
        if(passw.length !==6 || isNaN(passw)){
            ybb.msgs('请输入正确的6位数字密码', 'warning');
            return
        }
        //订单ID。 密码
        $.post('/radishweb/reword/PayReword',{id:$('#orderId').val(),pass:passw,pay:4},function(data){
            if(data.flag=='1'){
                if(data.msg =="提现密码不对"){
                    ybb.msgs('支付密码错误','warning');
                }
            }else {
                ybb.msgs('打赏成功', 'success');
                setTimeout(function () {
                    location.reload();
                }, 1000);
            }
        })

    });

})(window, $, undefined);

