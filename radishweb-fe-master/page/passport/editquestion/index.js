(function (window, $, undefined) {
  $(function () {
   
    var imgdata = [];
    
    var data_img = JSON.parse($('#data-image').html());
    var input_data = [];
    var data = [];
    if(data_img.length > 0){
      $.each(data_img, function (i, v) {
        input_data.push(v.id);
        data.push({
          id: v.id,
          url: { b : v.image.b}
        });
      });
      $('input[name="images"]').val(input_data);
    };
    
    new FileUpload({
      limit: 8,
      inputName: 'image[]',
      $wrapper: $('#shortcut-card'),
      data:data
    });
    
    //danger
    $(document).on('click', '#img-upload-confirm .btn-cancel',function () {
      //$('#shortcut-card').find('tr.file-uploaded').remove()
    })
    .on('click', '#img-upload-confirm .btn-primary', function () {
      var html = '';
      $('tr.file-uploaded').each(function(e){
        var url = $(this).find('input.file-uploaded-input').val();
        var data = $(this).find('label.file-uploaded-input-data').html();
        html += '<img src="'+url+'">';
        imgdata.push(data);
      });
      $('.img-list').html($.trim(html)).parents('div.form-group').removeClass('collapse');
      html = '';
      $('#img-upload-confirm').modal('hide');
      $('input[name="images"]').val(imgdata);
      imgdata = [];
    });
    
    //init
    ybb.location('#province','/radishweb/area/list', 'code=0', 120000);
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
      url: '/radishweb/passport/editquestion',
      form: '#form-create',
      type: 'post',
      selector: '.btn-primary',
      regs: {
        'content': /\S/,
        'name': /\S/,
        'phone': /^1[3-8]{1}[0-9]{9}$/ig | /^0\d{2,3}-?\d{7,8}$/,
        //'location': /\S/,
        //'type': /\S/
      },
      done: function (data) {
        ybb.msgs('信息修改成功！', 'success');
        setTimeout(function () {
          location.href = '/radishweb/passport/myquestion';
        },1000)
      }
    });

  })
})(window, $, undefined)