var ybb = {
    msgs: function(info, type){
        $.notify({
            icon: 'fa fa-warning fa-fw',
            // options
            message: info 
        },{
            // settings
            type: type,
            newest_on_top: true,
            placement: {
                from: "top",
                align: "center"
            },
            z_index: 9999999
        });
    },
    ajaxSubmit: function(data){
        var fv = null;
        $(document).on(data.event || 'click', data.form + ' ' + data.selector, function(e){
            var self = $(this); 

            var $form = $(data.form);
            

            var fv = !fv && data.regs && new FormValid($form, data.regs);
            if(fv && !fv.getValid()) {
                return false;
            }

            if(data.preFilter && !data.preFilter()){
                return false;
            }

            data.data = $form.serialize();

            self.button('loading');
            var buttontext=self.html();

            data._always = function(){
                self.html(buttontext).addClass('disabled');
            }

            data._done = function(){
                self.html(buttontext).addClass('disabled');
            }

            ybb.ajax(data);
            e.preventDefault();
        })
    },
    ajax: function(conf){
        if(!conf) {
            ybb.msgs('无请求参数', 'danger');
            return false;
        }
        
        return $.ajax({
            url: conf && conf.url,
            data: conf && conf.data || {},
            type: conf.type || 'post',
            dataType: conf.dataType || 'json'
        })        
        .always(function(){
            conf._always && conf._always();
            conf.always && conf.always();
        })
        .done(function(data){
            if(data.flag == 0){
                conf._done && conf._done();
                conf.done && conf.done(data.data);
            }else{
                ybb.msgs(data.msg, 'warning');
                conf.fail && conf.fail(data.data);
                setTimeout(function () {
                    //location.reload();
                }, 1000);
                return false;
            }
        })
        .fail(function(xhr, status, stText){
            ybb.msgs(stText, 'danger');
            conf.fail && conf.fail();
        })
    },
    location: function (ele, url, data) {
      ybb.ajax({
        url: url,
        data: data,
        done: function (data) {
          ybb.loc_option(ele,data.list);
        }
      });
    },
    loc_option: function (ele,data) {
      var html = '',
          subhtml = '';
      var loc = ele.substr(1),
          name = '';
      for(var i = 0; i < data.length; i++){
        html += '<option value="'+data[i].adcode+'">'+data[i].name+'</option>'
        subhtml += '<option value="'+data[i].id+'">'+data[i].name+'</option>'
      }
      
      if(loc == 'province') name = '省份';
      if(loc == 'area')  name = '区域';
      if(loc == 'city'){
        name = '城市';
        $(ele).empty().append(html).prepend('<option value="" selected="selected">请选择'+name+'</option>').select2();
        $('#area').empty().prepend('<option value="" selected="selected">请选择区域</option>').select2();
      }else if(loc == 'unit_two'){
        if(data.length == 0){
          $(ele).empty().append('<option value="0" selected>其他</option>');
          $(ele).select2();
          return false;
        }
        $(ele).parents('li.form-unit_two').removeClass('collapse');
        $(ele).empty().append(subhtml);
      }else{
        $(ele).empty().append(html).prepend('<option value="" selected="selected">请选择'+name+'</option>').select2();
      }
      $(ele).select2();
    }
};

$(function() {
  
  //退出账号
  $('#logout').on('click', function(){
    $.ajax({
      url: '/radishweb/passport/logout'
    })
    .done(function(){
      ybb.msgs('成功退出登录', 'success');
      setTimeout(function(){
        location.href = '/radishweb/index/index';
      },1000)
    })
  });
  //跳转
  $('.pageHref').on('click', function(){  
    var $pn = $(".pageNum").val();
    var $rn = $(this).attr("data-rn");
    var $pageurl = $(this).attr("data-uri");
    if(!$pn){
      location.reload();
    }else{
      location.href = $pageurl+'&rn='+$rn+'&pn='+$pn;
    }
  });
    //头像点击
    $(document).on('click','img.imgWrap',function(){
        var id=$(this).parent().attr('data-id2');
        location.href='/radishweb/passport/center?id='+id;
        return false
    });
//    用户协议
    $(document).on('click','#protocol input',function(){
        if($(this).is(':checked')){
            $('#nextStep').removeAttr('disabled');
        }else{
            $('#nextStep').attr('disabled','true')
        }
    //var protocol=$('#protocol')

    });
    //我的私信红点。
    var redDots2=$('#redDots2');
    var itemCount=$('.itemCount');
    for(var i=0;i<itemCount.length;i++){
        if(itemCount.eq(i).val()>0){
            console.log(1);
            $('.iCont').show();
        }else {
            console.log(2);
            $('.iCont').hide();
        }
    }
});

//    判断日期
function isTime(time){
    //后台需要 月份日子小于10的需要加0
    time=(time-0)<10?('0'+time):time;
    return time
}
//    地理位置
function showCityInfo() {
    //实例化城市查询类
    var citysearch = new AMap.CitySearch();
    //自动获取用户IP，返回当前城市
    citysearch.getLocalCity(
        function(status, result) {
        if (status === 'complete' && result.info === 'OK') {
            if (result && result.city && result.bounds) {
                $('#positionCity').val(result.city);    //在HTML里新建一个隐藏地域
            }
        } else {
            ybb.msgs(result.info, 'warning');
        }
    }
    );
}

//关注收藏函数
function favAjax(userId,type){
    $.post('/radishweb/favorite/fav',{
        id:userId,
        type:type
    })
}

//是否显示的
function isShow(ele){
    if(ele.is(":hidden")){
        ele.show();
    }else {
        ele.hide();
    }
}

//默认选中城市的
function ItemSelected(cityId, dataCS) {
    var SearchP = $('#SearchCity').attr('data-' + dataCS + '');
    if (!SearchP) {
        return;
        //判断 如果不是搜索的话，直接返回
    }
    var optionItem = $(cityId).find('option');
    optionItem.each(function (i, item) {
        var $item = $(item); //Dom 转 JQ
        if ($item.val() == SearchP) {
            $item.attr("selected", 'selected');
            $(cityId).change();
        }
    });
}

