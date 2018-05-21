(function (window, $, undefined) {
  $(function () {
    //获取默认城市
    var map = new AMap.Map("container", {           //实例化地图
      resizeEnable: true
    });
    showCityInfo();
    var positionCity;
    setTimeout(function(){
      positionCity=$('#positionCity').val();
      return positionCity;
    },1000);

    //
    $('#f_g_id,#s_id').select2();

    
    new aaa1({
      limit: 8,
      inputName: 'image[]',
      $wrapper: $('#shortcut-card')
    });
    //new aaa2({
    //  limit: 8,
    //  inputName: 'image2[]',
    //  $wrapper: $('#shortcut-card2')
    //});
    var imgdata = [];
    //var imgdata2 = [];

    //danger
    $(document).on('click', '#img-upload-confirm .btn-primary', function () {
      var html = '';
      $('tr.fl1').each(function(e){
        var url = $(this).find('input.aaa1I').val();
        var data = $(this).find('label.aaa1L').html();
        console.log(url,data);
        html += '<img src="'+url+'">';
        imgdata.push(data);
      });
      $('.img-list').html($.trim(html)).parents('div.form-group').removeClass('collapse');
      html = '';
      $('#img-upload-confirm').modal('hide');
      $('input[name="images"]').val(imgdata);
      imgdata = []
    });

    //上传第二个
    //$(document).on('click', '#img-upload-confirm2 .btn-primary', function () {
    //  var html = '';
    //  $('tr.fl2').each(function(e){
    //    var url2 = $(this).find('input.aaa2I').val();
    //    var data2 = $(this).find('label.aaa2L').html();
    //    console.log(url2,data2);
    //    html += '<img src="'+url2+'">';
    //    imgdata2.push(data2);
    //  });
    //  $('.img-list2').html($.trim(html)).parents('div.form-group').removeClass('collapse');
    //  html = '';
    //  $('#img-upload-confirm2').modal('hide');
    //  $('input[name="images2"]').val(imgdata2);
    //  imgdata2 = []
    //});

    
    //init
    ybb.location('#province','/radishweb/area/list', 'code=0');
    $(document).on('change', '#province', function () {  
      var code = $(this).val();
      if(!code){
        $('#city').empty().prepend('<option value="0">请选择城市</option>').select2();
        $('#area').empty().prepend('<option value="0">请选择区域</option>').select2();  
        $('#loca-input').val('');
        return false;
      } 
      $('#city').parents('li').removeClass('collapse');
      ybb.location('#city', '/radishweb/area/list', 'code='+code);
    })
    .on('change', '#city', function () {
      var code = $(this).val();
      $("#s_id").trigger("change");
      if(!code){
        return false;
      }
      $('#area').parents('li').removeClass('collapse');
      ybb.location('#area', '/radishweb/area/list', 'code='+code);
    })
    .on('change', '#area', function() {
      var code = $(this).val();
      if(!code) return false;
    });
    $('#form-location').on('change', 'select', function(){	
      if($('#province').val() == '' || $('#city').val() == null || $('#area').val() == null || $('#city').val() == '' || $('#area').val() == ''){
        $('#loca-input').val('');   
      }else{
        $('#loca-input').val('1');   
      }
    });

    $('#s_id').change(function () {
      if($(this).val){
        $('input[name=sid-type]').val('0');
      }else{
        $('input[name=sid-type]').val('');
      };
      var code = $(this).val();
      var City=$('#city').val();
      var Code= $(this).find("option:selected").text();
      if(!City){
        City=positionCity;
      }
      var siteTwo=$('#siteTwo');
      if(code =='268479979'){
        siteTwo.empty().prepend('<option value="">请选择二级场所</option>').select2();
        siteTwo.parents('li').addClass('collapse');
        return false;
      }
      if(!code){
        siteTwo.empty().prepend('<option value="0">请选择二级场所</option>').select2();
        return false;
      }
      siteTwo.parents('li').removeClass('collapse');

      AMap.service(["AMap.PlaceSearch"], function() {             //实例化地图
        var placeSearch = new AMap.PlaceSearch({ //构造地点查询类
          pageSize: 100,          //返回的数目
          pageIndex: 1,
          city: City  //一级场所
        });
        placeSearch.search(Code, function(status, result) {
          if(status === 'complete' && result.info === 'OK'){
            var outcome=result.poiList.pois;
            var outSting='<option value="0">请选择二级场所</option>';
            for(var i=0;i<outcome.length;i++){
              outSting+='<option value='+outcome[i].name+' data-lat='+outcome[i].location.lat+' data-lng='+outcome[i].location.lng+'>'+outcome[i].name+'</option>';
            }
            siteTwo.empty().prepend(outSting).select2();
          }
          //TODO:开发者使用result自己创建交互面板和地图展示
        });
      });
    });
    $('#siteTwo').change(function(){
      var siteC= $(this).find("option:selected");//被选中的二级
      var longitude=siteC.attr('data-lat'); //经度
      var latitude=siteC.attr('data-lng'); //维度
      $('#longitude').val(longitude);
      $('#latitude').val(latitude);
    });


    //type
    $(document).on('change', '#f_g_id', function () {
      var parent = $(this).val();
      if(parent == 0){
        $('.form-unit_two').addClass('collapse');
        return false;
      }
      ybb.location('#unit_two', '/radishweb/genre/list', 'id='+parent);
    });
    
    $('#form-type').on('change', 'select', function(){	
      if($('#f_g_id').val() == '0'){
        $('#type-input').val(''); 
      }else{
        $('#type-input').val('1'); 
      }
    });
    
    ybb.ajaxSubmit({
      url: '/radishweb/question/create',
      form: '#form-create',
      type: 'post',
      selector: '.btn-primary',
      regs: {
        's_id':/\S/,
        'content': /\S/,
        'name': /\S/,
        'phone': /^1[3-9]{1}[0-9]{9}$/ig | /^0\d{2,3}-?\d{7,8}$/,
        'assoc_id': /^1[3-9]{1}[0-9]{9}$/ig | /^0\d{2,3}-?\d{7,8}$/,
        'location': /\S/,
        'type': /\S/,
        'sid-type': /\S/
      },
      
      done: function (data) {
        ybb.msgs('发布信息成功！爱心值+1 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   5秒后自动跳转首页', 'success');
        setTimeout(function () {
          location.href = '/radishweb/index/index';
        },5000)
        
      }
    });

    var maxCount = 500;  // 最高字数，这个值可以自己配置
    $("#forup").on('keyup', function() {
      var len = getStrLength(this.value);
      if (len>maxCount){
        $(this).val().slice(0,maxCount);
        return
      }
      $(".txtbar1").text("("+(len)+"/"+(maxCount)+")");
    });
    $("#q_remark").on('keyup', function() {
      var len = getStrLength(this.value);
      if (len>maxCount){
        $(this).val().slice(0,maxCount);
        return
      }
      $(".txtbar2").text("("+(len)+"/"+(maxCount)+")");
    });
    $('#contentButton').on('click',function(){
      var b=$('#img-upload-confirm-tab');
      
                 var forup = document.getElementById("forup");
                 var province = document.getElementById("province");
                 var city = document.getElementById("city");
                 var area = document.getElementById("area");
                 var f_g_id = document.getElementById("f_g_id");
                 var unit_two = document.getElementById("unit_two");
                 var s_id = document.getElementById("s_id");
                 var siteTwo = document.getElementById("siteTwo");
                 if(forup.value==null || forup.value==""){
                     ybb.msgs("请完整输入内容",'warning');
                    forup.focus();
                   return;
                 }
                 if(province.value==null || province.value==""){
                    ybb.msgs("请选择省份",'warning');
                    return;
                }
                if(city.value==null || city.value==""){
                  ybb.msgs("请选择城市",'warning');
                  return;
                }
                if(area.value==null || area.value==""){
                  ybb.msgs("请选择区域",'warning');
                  return;
                }
                
                if(unit_two.value==null || unit_two.value=="" ){
                  ybb.msgs("请选择二级类型",'warning');
                  return;
                }
                console.log(s_id[0].value)
                if(s_id.value==null || s_id.value=="" || s_id.value==0){
                  ybb.msgs("请选择场所",'warning');
                  return;
                }
                if(siteTwo.value==null || siteTwo.value=="" || siteTwo.value==0){
                  ybb.msgs("请选择二级场所",'warning');
                  return;
                }
                $("#img-upload-confirm-tab").attr("data-toggle","pill");
      b.click();
    });
    
    $('#pictureBtn').on('click',function(){
      var forup = document.getElementById("forup");
                 var province = document.getElementById("province");
                 var city = document.getElementById("city");
                 var area = document.getElementById("area");
                 var f_g_id = document.getElementById("f_g_id");
                 var unit_two = document.getElementById("unit_two");
                 var s_id = document.getElementById("s_id");
                 var siteTwo = document.getElementById("siteTwo");
                 if(forup.value==null || forup.value==""){
                     ybb.msgs("请完整输入内容",'warning');
                    forup.focus();
                   return;
                 }
                 if(province.value==null || province.value==""){
                    ybb.msgs("请选择省份",'warning');
                    return;
                }
                if(city.value==null || city.value==""){
                  ybb.msgs("请选择城市",'warning');
                  return;
                }
                if(area.value==null || area.value==""){
                  ybb.msgs("请选择区域",'warning');
                  return;
                }
                
                if(unit_two.value==null || unit_two.value=="" ){
                  ybb.msgs("请选择二级类型",'warning');
                  return;
                }
                console.log(s_id[0].value)
                if(s_id.value==null || s_id.value=="" || s_id.value==0){
                  ybb.msgs("请选择场所",'warning');
                  return;
                }
                if(siteTwo.value==null || siteTwo.value=="" || siteTwo.value==0){
                  ybb.msgs("请选择二级场所",'warning');
                  return;
                }
      $('#pictureUpload').click();
      $("#pills-contact-tab").attr("data-toggle","pill");          
      $('#pills-contact-tab').click(); 
      $('#submitInddenBtn').click();   
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

  })
})(window, $, undefined);