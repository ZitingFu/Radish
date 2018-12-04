
for(var a=0;a<$(".btn").length;a++){
	var content = $(".btn").eq(a).html()
	if(content == "已认领"){
		$(".btn").eq(a).attr("data-toggle","1231645")
		$(".btn").eq(a).css({
			"backgroundColor":"#fff",
		    "border": "1px solid #999",
		    "color":"#999"
		})
		$(".btn").eq(a).closest(".Survey_right").find($(".Printing")).remove()
	}
	else{
		$(".btn").eq(a).click(function(){
			$(".btn").eq(a).attr("data-toggle","#find-confirm")
			var btn_id = $(this).closest(".Survey_right").find(".id").html()
			$(".ok").click(function(){
				var remark = $(".remark").val()
				$.ajax({
					url:"/radishweb/passport/editstatus",
					type:"post",
					data:{
						id:btn_id,
						remark:remark
					},
					success:function(data){
						window.location=window.location
					}

				})
			})
				
		})
	}
}



var u = location.search
var er = u.split("=")[1]
$(".active_span").eq(er-1).css({
	"backgroundColor":"#fda249",
	"color":"#fff"
})



