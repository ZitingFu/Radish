
var u = location.search
var id = u.split("=")[1]
$.ajax({
	url:"/radishweb/question/barcode",
	type:"get",
	data:{
		action:"json",
		id:id
	},
	success:function(data){
		var urlimg = data.data.barcode.data[0]
		$(".urlimg")[0].src = urlimg
	}
})
			
$(".Choice").click(function(){
	$(".information").css({
		"display":"block"
	})
})

$(".compony_account").change(function(){
	var position = $(this).val()
	$.ajax({
		url:"/radishweb/question/editposition",
		type:"post",
		data:{
			action:"json",
			id:id,
			position:position
		},
		success:function(data){
		}
	})
})
console.log($(".compony_account").val())
