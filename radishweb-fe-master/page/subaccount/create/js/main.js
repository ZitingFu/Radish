
$(".compony_account").keyup(function(){
	var o = /(?![0-9]+$)[0-9A-Za-z]{2,16}/
	if(o.test(this.value)){
			$(".Subaccount_span1").css({"display": "none"})
			$(".Subaccount_img1").css({"display": "inline-block"})
			// $(this).removeClass("warning")
	}
	else{
		$(".Subaccount_span1").css({"display": "inline-block"})
		$(".Subaccount_span1").html("昵称必须3-15,不能为汉字纯数字")
		$(".Subaccount_img1").css({"display": "none"})
		// $(this).addClass("warning")
	}
})

$(".compony_name").keyup(function(){
	if($(this).val().length>1){
		$(".Subaccount_span2").css({"display": "none"})
		$(".Subaccount_img2").css({"display": "inline-block"})
	}	
	else{
		$(".Subaccount_span2").css({"display": "inline-block"})
		$(".Subaccount_img2").css({"display": "none"})
		$(".Subaccount_span2").html("不能少于1位")
	}
})


$(".compony_password").keyup(function(){
	if($(this).val().length>=6){
		$(".Subaccount_span3").css({"display": "none"})
		$(".Subaccount_img3").css({"display": "inline-block"})
	}	
	else{
		$(".Subaccount_span3").css({"display": "inline-block"})
		$(".Subaccount_img3").css({"display": "none"})
		$(".Subaccount_span3").html("密码必须大于6位")
	}
})

$(".confirm").click(function(){
 	var account  = $(".compony_account").val()
	var name  = $(".compony_name").val()
	var password  = $(".compony_password").val()
	if(account.length<1||name.length<1||password.length<1){
		alert("不能为空")
	}
	else{

		//判断账号是否存在
		$.ajax({
			type:"post",
			url:"/radishweb/subaccount/check",
			async:false,
			data:{
				account:account
			},
			success:function(data){
				var msg = data.data.msg
				var flag = data.flag
			 	$(".alert-warning").css({
                    opacity:"1"
               	})	
				if(flag == 0){
				 	//账号不存在
					$.ajax({
						type:"post",
						url:"/radishweb/subaccount/create",
						data:{
							name:name,
							account:account,
							password:password
						},
						success:function(data){
							$(".alert-warning").css({
			                    opacity:"1"
			               	})	
							if(flag == 0){
							 	$(".message").html("输入成功")
							 	setTimeout(function(){
			                 		 window.location.href ="/radishweb/subaccount/index"
			                  },1000);
							}
						}
					})
				}
				else{
					$(".message").html(msg)
				}
				setTimeout(function(){
                      $(".alert-warning").css({
                            opacity:"0"
                        })
             	},3000);

         	}
		})
 	}

})