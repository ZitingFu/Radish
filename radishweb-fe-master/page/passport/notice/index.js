(function (window, $, undefined) {
  $(function () {
    
  //    ybb.ajaxSubmit({
		// 	url:  '/radishweb/passport/notice',
		// 	form: '#form-create',
		// 	type: 'post',
		// 	selector: '.btn-primary',
		// 	regs: {
		// 			"content":/\S/
		// 		},
		// 	done: function(data){
		// 		console.log(data)
		// 		ybb.msgs('发布成功！', 'success');
		//         setTimeout(function(){
		//           location.reload();
		//         }, 1000);					
		// 	}	
		// });

     
	  var maxCount = 500;  // 最高字数，这个值可以自己配置
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
 
  })
})(window, $, undefined)

$(".fabu").click(function(){
	var txt1 = $(".txt1").val()
  	$.ajax({
     	url:  '/radishweb/passport/notice',
     	type: 'post',
     	data:{
     		content:txt1
     	},
     	success:function(data){
     		ybb.msgs('发布成功！', 'success');
		        setTimeout(function(){
		          location.reload();
	        }, 1000);	
     	}
     })

})