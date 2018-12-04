$(".query").click(function(){
	var id = $(".compony_account").val()
	$.ajax({
		type:"get",
		url:"/radishweb/question/assoc",
		data:{
			action:"json",
    		id:id
		},
		success:function(data){	
			if(data.data.info == ""){
				$(".Survey_box").css({
					"opacity":"0"
				})
				$(".message").html("输入有误,请核对信息")
				 $(".alert-warning").css({
                        "opacity":"1",
                        "display":"block"
                    })
				setTimeout(function(){
                  $(".alert-warning").css({
                        "opacity":"0",
                        "display":"none"
                    })
             	},3000);
			}
			else{
				var id = data.data.info.id
				var name = data.data.info.name	
				var content = data.data.info.content
				var phone = data.data.session.phone
				var status = data.data.info.status
				var images = data.data.info.user_image
				if(images ==""){
					$(".images")[0].src = "//img.qa.xluob.com/radishweb/static/images/avatar2_d7af2a3.png"
				}
				else{
					$(".images")[0].src = data.data.info.user_image.s
				}

				$(".id").html(id)
				$(".name").html(name)
				$(".content").html(content)
				$(".phone").html(phone)
				
				if(status == 0){
					$(".status").html("关联")
				}
				else{
					$(".status").html("已认领")
					$(".status").css({
					    "border": "1px solid rgb(153, 153, 153)",
						"color": "rgb(153, 153, 153)"
					})
				}
				$(".Survey_box").css({
	                opacity:"1"
	           	})	
			}
		}
	})
})

if($(".status").html("关联")){
	$(".status").css({
		"color":" #fda249",
		"border":"1px solid #fda249"
	})
	$(".status").click(function(){
		var id = $(".compony_account").val()
			$.ajax({
				type:"post",
				url:"/radishweb/question/assoc",
				data:{
					action:"json",
		    		id:id
				},
			success:function(data){	
				var msg = data.data.msg
				var flag = data.flag
				$(".alert-warning").css({
                    "opacity":"1",
                     "display":"block"
               	})	
				if(flag == 0){
			 		$(".message").html("关联成功")
			 		$(".status").html("寻找中")
                 		 // window.location.href ="/radishweb/subaccount/index"
				}
				else{
			 		$(".message").html(msg)
                 		 // window.location.href ="/radishweb/subaccount/index"
				}
				setTimeout(function(){
                      $(".alert-warning").css({
                            "opacity":"0",
                            "display":"none"
                        })
             	},3000);

			}
		})

	})
}