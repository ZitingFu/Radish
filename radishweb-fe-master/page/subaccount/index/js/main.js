
var tiaoshu = $(".tiaoshu").html()
var number = $(".number")
var upper = $(".upper")
var lower = $(".lower")
var spanlist = $(".numberr")
var time = $(".time")
var count = $(".count")
var used = $(".used")
var left = $(".left")
var toname = $(".toname")
var TemplateBox = $(".TemplateBox")
var Template1 = $(".Template1")

$(".edit").click(function(){
	var id = $(this).closest("tr").find(".id").html()
	$(this)[0].href = "/radishweb/subaccount/edit?id="+id
})
$(".delete").click(function(){
	var delete_tr = $(this).closest("tr")
	var delete_id = $(this).closest("tr").find(".id").html()
	$(".queren").click(function(){
		$.ajax({
			url:"/radishweb/subaccount/delete",
			type:"post",
			data:{
				id:delete_id
			},
			success:function(data){
				delete_tr.remove()
				$(".modal").removeClass("show")
				$(".modal-backdrop").removeClass("show")
				window.location.href = window.location
			}
		})
	})

	
})