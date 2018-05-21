(function (window, $, undefined) {
  $(function () {
	  var love;
    $(document).on('click', 'a.btn-a', function(){	
			$('.list-id').val($(this).parents('div.info').attr('data-id'));
			var opid=$(this).parents('div.info').attr('data-open');
		    var edit_confirm=$('#edit-confirm');
				if(opid=='1'){
					edit_confirm.find('.modal-title').html('开启消息');
					edit_confirm.find('.modal-body .body-title').html('确定要将该信息从系统中开启吗?');
					$('.list-open').val('0');
				}else {
					edit_confirm.find('.modal-title').html('关闭消息');
					edit_confirm.find('.modal-body .body-title').html('确定要将该信息从系统中关闭吗?');
					$('.list-open').val('1');
				}
		 	love=$(this).attr('data-love');
		});

		ybb.ajaxSubmit({
			url:  '/radishweb/passport/editstatus',
			form: '#find-confirm form',
			selector: '.btn-primary',
      regs: {
        remark: /\S/
      },
			done: function(data){
				ybb.msgs('修改成功！爱心值+'+love+'', 'success');
        setTimeout(function(){
          location.reload();
        }, 1000);					
			}	
		});
    
    ybb.ajaxSubmit({
			url:  '/radishweb/passport/delete',
			form: '#delete-confirm form',
			selector: '.btn-primary',
			done: function(data){
				ybb.msgs('删除成功！', 'success');
        setTimeout(function(){
          location.reload();
        }, 1000);					
			}	
		});

	  ybb.ajaxSubmit({
		  url:  '/radishweb/question/editopen',
		  form: '#edit-confirm form',
		  selector: '.btn-primary',
		  done: function(data){
			  ybb.msgs('操作成功！', 'success');
			  setTimeout(function(){
				  location.reload();
			  }, 1000);
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
})(window, $, undefined)