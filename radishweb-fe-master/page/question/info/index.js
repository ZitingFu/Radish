(function (window, $, undefined) {
  $(function () {
    
    //add/pre/com
    $(document).on('click', 'a.add,a.pre,a.rep', function () {
      $('.classid').val($(this).attr('data-id'));
    });
    //to_com
    $(document).on('click', 'a.com', function () {
      $('.classid').val($(this).attr('data-id'));
      if($(this).hasClass('is_com')){
        $('.toid').val('0');
        $('.classtype').val('0');
        $('.com-content').val('').focus();
        $(this).removeClass('is_com');
        $(this).find('img').addClass('collapse');
        $(this).find('img.com').removeClass('collapse');
        $('p.coms').addClass('collapse');
      }else{
        $(this).addClass('is_com');
        $(this).find('img').addClass('collapse');
        $(this).find('img.com2').removeClass('collapse');
        $(this).parents('li').siblings('li').find('.com').removeClass('is_com').find('img.com2').addClass('collapse');
        $(this).parents('li').siblings('li').find('img.com2').addClass('collapse').prev('img.com').removeClass('collapse');
        $('p.coms').removeClass('collapse').find('label').html($(this).attr('data-name'));
        $('.toid').val($(this).attr('data-toid'));
        $('.classtype').val($(this).attr('data-type'));
        $('.com-content').val('').focus();
        var srolltop = $(document).scrollTop();
        $('.wrapper').animate({
          scrollTop: srolltop
        },1000);
      }
    })
    //is_pra
    .on('click', 'a.pra', function () {
      var id = $(this).attr('data-id');
      var num = parseInt($(this).find('span').html());
      if($(this).hasClass('is_pra')){
        $(this).removeClass('is_pra').addClass('un_pra');
        $(this).find('img').addClass('collapse');
        $(this).find('img.un_pra').removeClass('collapse');
        $(this).find('span').html(num+1);
      }else{
        $(this).removeClass('un_pra').addClass('is_pra');
        $(this).find('img').addClass('collapse');
        $(this).find('img.is_pra').removeClass('collapse');
        $(this).find('span').html(num-1);
      }
      $.post('/radishweb/question/editlike',{id:id}, function(data) {
        //console.log(data);
      });
    });
    var regs=/\S/;

//add
    $("#bzop button.btn-primary").on("click",function(){
      var txt1=$("#bzop textarea.txt1").val();
      if (!regs.test(txt1)){
        ybb.msgs('请输入正确的字符', 'warning');
        return
      }
      if (txt1.length<=20 && txt1.length>=300){
        ybb.msgs('请输入20位以上的字符', 'warning');
        return
      }

      $.ajax({
        type:"post",
        url:"/radishweb/comments/create",
        data:{
          q_id:$("input[name='q_id']").val(),
          content:txt1,
          type:1,
          to_id:0
        },
        success:function(data){
          $("#bzop button.btn-primary").attr("disabled","true");
          ybb.msgs('备注成功', 'success');
          setTimeout(function () {
            location.reload();
          }, 1000);
        },error:function(){
          ybb.msgs('备注失败', 'warning');
        }
      });

    });
//pre
  $("#note button.btn-primary").on("click",function(){
    var txt1=$("#note textarea.txt1").val();
    if (!regs.test(txt1)){
      ybb.msgs('请输入正确的字符', 'warning');
      return
    }
      if (txt1.length<=20 && txt1.length>=300){
        ybb.msgs('请输入20~300位以的字符', 'warning');
        return
      }

    $.ajax({
      type:"post",
      url:"/radishweb/question/report",
      data:{
        q_id:$("input[name='q_id']").val(),
        note:txt1
      },
      success:function(data){
        $("#note button.btn-primary").attr("disabled","true");
        ybb.msgs('举报成功', 'success');
        setTimeout(function () {
          console.log(data)
          location.reload();
        }, 1000);
      },error:function(){
        ybb.msgs('举报失败', 'warning');
      }
    });

  });

    //com
    ybb.ajaxSubmit({
      url: '/radishweb/comments/create',
      form: '#comments form',
      selector: '.btn-primary',
      regs: {
        content: /\S/
      },
      done: function (data) {
          ybb.msgs('提交成功', 'success');
          setTimeout(function () {
            location.reload();
          }, 1000);
  }
    });
    var maxCount = 300;  // 最高字数，这个值可以自己配置
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


  //  img view
  var  imgDataSrc=[];
    (function(){
      var pimgImg=$('#pimg').find('img');
      for(var l=0;l<pimgImg.length;l++){
        imgDataSrc.push(pimgImg.eq(l).attr('src'))
      }
    })();
    console.log(imgDataSrc);

    //图片预览
    /*
    var alImg=$("#alImg");
    $("#pimg").on("click","img",function(){
      var imgIndex=$(this).attr('data-imgIndex');
      console.log(imgIndex);
      if(imgIndex == 0){
        $('.gbLeft').hide();
      }
      if(((imgIndex-0)+1) >=imgDataSrc.length){
        $('.gbRight').hide();
      }
      if(imgDataSrc.length == 1){
        $('.gbLeft').hide();
        $('.gbRight').hide();
        var src=this.attributes["src"].nodeValue;
        if (alImg.is(':hidden')){
          alImg.find(".logPng").attr("src",src);
          alImg.css("display","block");
          isWidth()
        }
      }else {
        console.log(imgIndex);
        var src2=imgDataSrc[(imgIndex-0)];
        console.log(src2);
        if (alImg.is(':hidden')){
          console.log();
          alImg.find(".logPng").attr("src",src2).attr('data-imgIndex',imgIndex);
          alImg.css("display","block");
          isWidth()
        }
      }

    });*/
    window.addEventListener('DOMContentLoaded', function () {
      var galley = document.getElementById('pimg');
      var viewer = new Viewer(galley, {
        url: 'data-original',
        toolbar: {
          oneToOne: true,
          prev: function() {
            viewer.prev(true);
          },
          play: true,
          next: function() {
            viewer.next(true);
          },
          download: function() {
            const a = document.createElement('a');
            a.href = viewer.image.src;
            a.download = viewer.image.alt;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
          },
        },
      });
    });

    $(".gbClose").on("click",function(){
      alImg.css("display","none");
    });

    $('.gbLeft').on('click',function(){
      $('.gbRight').show();
      var IndexNum=alImg.find(".logPng").attr("data-imgIndex");
      alImg.find(".logPng").attr("src",imgDataSrc[parseInt(IndexNum)-1]);
      alImg.find(".logPng").attr("data-imgIndex",parseInt(IndexNum)-1);
      isWidth();
      if((IndexNum-1) ==0){
        $('.gbLeft').hide();
        $('.gbRight').show();
      }
    });

    $('.gbRight').on('click',function(){
      $('.gbLeft').show();
      var IndexNum=alImg.find(".logPng").attr("data-imgIndex");

      alImg.find(".logPng").attr("src",imgDataSrc[parseInt(IndexNum)+1]);
      alImg.find(".logPng").attr("data-imgIndex",parseInt(IndexNum)+1);
      isWidth();
      if((parseInt(IndexNum)+1) >=imgDataSrc.length-1){
        $('.gbRight').hide();
        $('.gbLeft').show();
      }
    });
  function  isWidth(){
    var ImgWidth2=alImg.find(".logPng").width()/2;
    var ImgHeigth2=alImg.find(".logPng").height()/2;
    $("#alertImg").animate({"marginLeft":-ImgWidth2,"marginTop":-ImgHeigth2});
  }

  //收藏
    var favId=$('#favId').val();
    var userId=$('#userId').val();
    $('.collection').on('click',function(){
      if(!$('#session').val()){
        location.href='/radishweb/passport/login';
        return
      }
      if( favId == '99'){
        favId='0';
        $(this).html('已收藏').removeClass('btn-outline');
        favAjax(userId,1);
      }else {
        favId='99';
        $(this).html('收藏').addClass('btn-outline');
        favAjax(userId,1);
      }
    });






    var topicId=$('#topicId').val();
  //  打赏确认支付
    $('#withdraw').on('click',function(){
      var dataMoney=$('#dataMoney');
      var gold=$('.gold').val();
      var rate=dataMoney.attr('data-rate');
      var isNum=/^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,2})?$/;　　//大于0 且支持2位小数
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

      if((1-rate)*dataMoney <0.01){
        ybb.msgs('打赏金额低于最低额度', 'warning');
        return
      }

      $.post('/radishweb/reword/submit',{price:(dataMoney*100),q_id:topicId},function(data){
        if(data.flag ==1){
          ybb.msgs(data.msg, 'warning');
          if(data.msg == '金币不足'){
            $('.goldInadequate').show();
          }
          if(data.msg == '请先设置提现密码'){
            setTimeout(function () {
              location.href='/radishweb/passport/createwithdrawpass?id='+topicId+'&type=1' ;
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
  //  关闭浮层
    $('.m-title').find('img').on('click',function(){
      isShow($('.Cover'));
      $('#Cover1').show();
      $('#Cover2').hide();
      $('#Passw').val('');
      $('.virbox').find('span').html('').css('background','#ffffff');
    });

  //点击打赏弹出浮层
    $('.p-play').on('click',function(){
      if(!$('#session').val()){
        location.href='/radishweb/passport/login';
        return
      }
      isShow($('.Cover'));
      $('.gold').val('');
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
      $.post('/radishweb/reword/pay',{id:$('#orderId').val(),pass:passw,pay:4},function(data){
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


  })
})(window, $, undefined);