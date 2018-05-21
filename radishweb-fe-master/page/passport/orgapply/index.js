(function (window, $, undefined) {
  $(function () {
    
    $('#unit').select2();
    var map = new AMap.Map("container", {           //实例化地图
      resizeEnable: true
    });
    new FileUpload({
      limit: 2,
      inputName: 'image[]',
      $wrapper: $('#shortcut-card')
    });
    
    var imgdata = [];
    //danger
    $(document).on('click', '#img-upload-confirm .btn-primary', function () {
      var html = '';
      $('tr.file-uploaded').each(function(e){
        var url = JSON.parse($(this).find('label.file-uploaded-input-data').html());
        html += '<img src="'+url.b+'">';
        imgdata.push(url);
      });
      $('.img-list').html(html).parents('div.form-group').removeClass('collapse');
      html = '';
      $('#img-upload-confirm').modal('hide');
      $('input[name="img"]').val(JSON.stringify(imgdata));
    });
    
    //locatio-init
    ybb.location('#province','/radishweb/area/list', 'code=0');
    $(document).on('change', '#province', function () {  
      var code = $(this).val();
      if(!code){
        $('#city').empty().prepend('<option value="">请选择城市</option>').select2();  
        $('#area').empty().prepend('<option value="">请选择区域</option>').select2();  
        $('#loca-input').val('');
        return false;
      } 
      $('#city').parents('li').removeClass('collapse');
      ybb.location('#city', '/radishweb/area/list', 'code='+code);
    })
    .on('change', '#city', function () {
      var code = $(this).val();
      if(!code){
        $('#area').empty().prepend('<option value="">请选择区域</option>').select2();  
        $('#loca-input').val('');
        return false;
      }
      $("#unit").trigger("change");
      $('#area').parents('li').removeClass('collapse');
      ybb.location('#area', '/radishweb/area/list', 'code='+code);
    })
    .on('change', '#area', function() {
      var code = $(this).val();
      if(!code){
        $('#unit').parents('li.form-unit').addClass('collapse');
        $('#unit').val('0');
        $('#loca-input').val('');
        return false;
      }
    });
    $('#form-location').on('change', 'select', function(){	
      if($('#province').val() == '' || $('#city').val() == null || $('#area').val() == null || $('#city').val() == '' || $('#area').val() == ''){
        $('#loca-input').val('');
        $('#unit').val('0');
        $('.form-unit').addClass('collapse');
        $('.form-unit_two').addClass('collapse');
      }else{
        $('#loca-input').val('1');
        if($('#unit').val() == '' || $('#unit').val() == '0'){
          $('#loca-input').val('');
        }
        $('.form-unit').removeClass('collapse');
      }
    })
    .on('change', '#unit', function () {
      var area = $('#area').val(),
          parent = $(this).val();
      var siteC= $(this).find("option:selected").text();
      if(parent == 0){
        //$('.form-unit_two').addClass('collapse');
        return false;
      }
      if( parent =='268479979'){
        $('.form-unit2').addClass('collapse');
        $('#site_two').empty().prepend('<option value="">请选择单位名称</option>').select2();
        return false;
      }
      if( parent =='268479927'){
        $('#site_two').parents('li.site_two2').addClass('collapse').removeClass('form-unit2');
        $('#name').attr('placeholder','请填写单位和部门名称');
        $('#BmName').addClass('form-name').find('label.p-w25').html('单位和部门名称');
        return false;
      }else {
        $('#site_two').parents('li.site_two2').removeClass('collapse').addClass('form-unit2');
        $('#name').attr('placeholder','请填写部门名称（选填）');
        $('#BmName').removeClass('form-name has-error').find('label.p-w25').html('部门名称');
      }
      $('.form-unit2').removeClass('collapse');
      AMap.service(["AMap.PlaceSearch"], function() {             //实例化地图
        var placeSearch = new AMap.PlaceSearch({ //构造地点查询类
          pageSize: 100,          //返回的数目
          pageIndex: 1,
          city: $('#city').val()  //一级场所
        });
        console.log($('#city').val(),siteC);
        placeSearch.search(siteC, function(status, result) {
          if(status === 'complete' && result.info === 'OK'){
            console.log(result);
            var outcome=result.poiList.pois;
            var outSting='<option value="0">请选择单位名称</option>';
            for(var i=0;i<outcome.length;i++){
              outSting+='<option value='+outcome[i].name+' data-lat='+outcome[i].location.lat+' data-lng='+outcome[i].location.lng+'>'+outcome[i].name+'</option>';
            }
            $('#site_two').empty().prepend(outSting).select2();
          }
          //TODO:开发者使用result自己创建交互面板和地图展示
        });
      });
      ybb.location('#unit_two', '/radishweb/unit/getunit', 'type=2&parent='+parent+'&area='+area);
      
    });
    
    ybb.ajaxSubmit({
      url: '/radishweb/passport/orgapply',
      form: '#form-create',
      type: 'post',
      selector: '.btn-primary',
      regs: {
        'name': /\S/,
        'address': /\S/,
        'phone': /^1[3-8]{1,}[0-9]{9}$/ | /^0\d{2,3}-?\d{7,8}$/,
        'linkname': /\S/,
        'linkphone': /^1[3-8]{1,}[0-9]{9}$/ | /^0\d{2,3}-?\d{7,8}$/,
        'location': /\S/
      },
      preFilter: function () {
        var isRight = true;
        if (!$('.img-list').find('img').length || $('.img-list').find('img').length != 2) {
          isRight = false;
          ybb.msgs('请上传证件照或数量不够', 'warning');
        }
        if( $('#unit option:selected').val() != '268479927'){
          if($('#site_two option:selected').val() == 0){
            isRight = false;
            ybb.msgs('请选择单位名称', 'warning');
          }
        }
        return isRight;
      },
      done: function (data) {
        ybb.msgs('申请成功，请您耐心等待审核！', 'success');
        if(data.type == 1){
          setTimeout(function () {
            location.href = '/radishweb/passport/myapply'
          },1000);
        }else{
          setTimeout(function () {
            location.href = '/radishweb/passport/login'
          },1000);
        };
      }
    });

  })
})(window, $, undefined)