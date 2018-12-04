(function (window, $, undefined) {
    //计算平台手续费
    var Banlance=$('#Banlance').val()-0;//余额
    var  rate=$('#rate').val()-0;//余额
    (function(){
        RateNumber({num1:Banlance,num2:rate})
    })();
    function RateNumber(data){
    //    计算费率
        var XLBFee=$('.XLBFee');
        var num1=(data.num1*data.num2).toFixed(2);
        var num2=(data.num1-num1).toFixed(2);
        XLBFee.find('.Fee1').html(num1);
        XLBFee.find('.Fee2').html(num2);
    }
    $('#withdrawInput').on('keyup',function(){
        var inputVal=$(this).val();
        if(!/^[0-9]+([.]{1}[0-9]+){0,1}$/.test(inputVal)){
            return
        }
        //console.log(inputVal);
        //if($('#withdrawInput').val() == ""){
        //    RateNumber({num1:Banlance,num2:rate})
        //}
        RateNumber({num1:inputVal,num2:rate})
    });



    //充值按钮 ，显示遮罩
    $(document).on('click','button#recharge',function(){
        isShow($('.Cover'));
        $('#isRecharge').show();
        $('#isWithdraw').hide();
    });

    $(document).on('click','button#withdraw',function(){
        isShow($('.Cover'));
        $('#withdrawInput').val('');
        $('#isRecharge').hide();
        $('#isWithdraw').show();
    });
    //关闭遮罩曾X
    $('.m-title').find('img').on('click',function(){
        isShow($('.Cover'));
        $('#Cover2').hide();
        $('#Passw').val('');
        $('.virbox').find('span').html('').css('background','#ffffff');
    });

    //确认支付
    $('.confirm-payment').on('click',function(){
        var onMoney=$('#onMoney').val()-0; //被选中的金额
        var checInput=$('input:radio[name="type"]:checked').val(); //选中的支付方式
        if(!onMoney){
            ybb.msgs('请选择充值金额', 'warning');
            return ;
        }
        switch(checInput)
        {
            case '1':
                console.log('我选择了支付宝');
                payMoney(onMoney,1);
                break;
            case '2':
                console.log('我选择了微信');
                payMoney(onMoney,2);
                break;
            default:
                console.log('我选择银联');
                payMoney(onMoney,3);
        }
    });

    //充值的fun
    function payMoney(money,type){
        $('.confirm-payment').attr('disabled','disabled').html('支付中...');
        $.ajax({
            url: "/radishweb/pay/topup",
            type: 'post',
            data: {
                pay: type,
                price: money
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                var orderId=data.data.order_id;
                switch(data.data.pay)
                {
                    case 1:
                        var form = data.data.res;
                        $("#hidden").html(form);
                        break;
                    case 2:
                        setTimeout(function(){
                            $('#QRcode').show().find('img').attr('src',data.data.qrcode);
                            isMoney(orderId)
                        },600);
                        break;
                    default:
                        console.log('银联');
                        var form2 = data.data.res;
                        //console.log(form2);
                        $("#hidden").html(form2);
                        document.all.pay_form.submit();
                }
            },
            error: function (data) {
                console.log('error',data);
            }
        });
    }
    //请求是否微信支付成功
    function isMoney(orderid){
        var time=setInterval(function(){
            $.post("/radishweb/pay/query",{id:orderid},function(data){
                console.log(data);
                if(data.data.status === '20'){
                    clearInterval(time);
                    ybb.msgs('充值成功！', 'success');
                    setTimeout(function(){
                        location.reload();
                    }, 1000);
                }
            });
        },2000)
    }


//    申请提现
    $('.Application').on('click',function(){
        var withdrawInput=$('#withdrawInput').val();
        var Banlance=$('#Banlance').val();
        var  bind=$('#bind').val();
        var hasPassword=$('#hasPassword').val();
        if(!bind){
            // $('.WXLetter').show();
            isShow($('.Cover'));
            isShow($('.cover3'));
           // setTimeout(function(){
           //     $('.WXLetter').hide();
           // },5000);
            return
        }
        if(!/^[0-9]+([.]{1}[0-9]+){0,1}$/.test(withdrawInput)){
            ybb.msgs('请输入正确的金币数量', 'warning');
            return
        }
        if((withdrawInput-0) > (Banlance-0)){
            ybb.msgs('余额不足', 'warning');
            return
        }
        if(!hasPassword){
            ybb.msgs('请先设置支付密码', 'warning');
            setTimeout(function () {
                location.href='/radishweb/passport/createwithdrawpass?type=3' ;
            }, 1000);
        }
        $('#isWithdraw').hide();
        $('#Cover2').show();
        $('#Passw').val('');
    });

//    提现的ajax
    function AjaxWithdraw(money,password){
        $.post("/radishweb/money/Withdraw",{price:money*100,password:password},function(data){
            console.log(data,money);
            if(data.flag == 1){
                ybb.msgs(data.msg,'warning');
            }else {
                if(data.data.code.result_code === "FAIL"){
                    ybb.msgs('提现失败','warning');
                }else {
                    ybb.msgs('提现成功','success');
                }
            }
            //if(data.flag ==1){
            //    ybb.msgs(data.msg,'warning');
            //    return
            //}
            //ybb.msgs('提现成功！', 'success');
            //setTimeout(function () {
            //    //location.reload();
            //}, 1000);
        })
    }
    //支付密码
    $('#topicPass').on('click',function(){
        var passw=$('#Passw').val();
        var withdrawInput=$('#withdrawInput').val();
        console.log(withdrawInput);
        console.log(passw);
        if(passw.length !==6 || isNaN(passw)){
            $('.virbox').find('span').css('background','#fff').html('');
            $('#Passw').val('');
            ybb.msgs('请输入正确的6位数字密码', 'warning');
            return
        }
        AjaxWithdraw(withdrawInput,passw);
    });
$('.c3-button').on('click',function () {
    location.reload();
});

//    自定义密码输入框
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
})(window, $, undefined);