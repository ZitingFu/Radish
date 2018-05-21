(function (window, $, undefined) {
  
  $(function () {
    
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
    
    ybb.ajaxSubmit({
      url: '/radishweb/passport/reg2',
      form: '#form-create',
      type: 'post',
      selector: '.btn-primary',
      regs: {
        'name': /\S/,
        'location': /\S/,
      },
      done: function (data) {
        ybb.msgs('注册成功！', 'success');
        setTimeout(function () {
          location.href = '/radishweb/passport/login';
        },1000)
      }
    });

  })
})(window, $, undefined)