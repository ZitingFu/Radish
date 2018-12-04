 id = $(".id").html()
$("#yes").click(function(){
	$.ajax({
		type:"post",
		url:"/radishweb/question/ClaimConfirm",
		data:{
			id:id,
			status:1
		},
		success:function(data){
			if(data.flag == 0){
				location.href="/radishweb/passport/claim"
			}
			else{
				alert("网络不好，再试试")
			}
		}
	})
})
$("#no").click(function(){
	$.ajax({
		type:"post",
		url:"/radishweb/question/ClaimConfirm",
		data:{
			id:id,
			status:2
		},
		success:function(data){
			if(data.flag == 0){
				location.href="/radishweb/passport/claim"
			}
			else{
				alert("网络不好，再试试")
			}
		}
	})
})