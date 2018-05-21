(function (window, $, undefined) {
  $(function () {
    
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
    
    //init
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
    
    ybb.ajaxSubmit({
      url: '/radishweb/passport/volunapply',
      form: '#form-create',
      type: 'post',
      selector: '.btn-primary',
      regs: {
        'name': /\S/,
        'address': /\S/,
        'card_num': /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/,
        'location': /\S/,
      },
      preFilter: function () {
        var isRight = true;
        if (!$('.img-list').find('img').length || $('.img-list').find('img').length != 2) {
          isRight = false;
          ybb.msgs('请上传证件照或数量不够', 'warning');
        }
        return isRight;
      },
      done: function (data) {
        console.log(111);
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