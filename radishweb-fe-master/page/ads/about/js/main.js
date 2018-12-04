var componyName = $(".compony_name").val()
var taxNum = $(".tax_num").val()
var componyAddr = $(".compony_addr").val()
var componyBank = $(".compony_bank").val()
var deliverName = $(".deliver_name").val()
var deliverTel = $(".deliver_tel").val()
var deliverAddr = $(".deliver_addr").val()
//上传图片内容发生改变
var confirm =  $(".confirm")
var Extension2 = $(".Extension2")
var statusloading = $(".statusloading")

//立即充值弹出层
 	var ImmediatePayment = $(".ImmediatePayment")
	var Popup = $(".Popup")
	var Recharge = $(".Recharge")
	//点击立即充值
		Recharge.click(function(){	
			liList.find(".bigsize").removeClass("white")
			liList.find(".size").removeClass("white")
			$(".PopupRecharge").find("li").removeClass("orange")
			Popup.css({
				display:"block"
			})
			PopupRecharge.css({
				display:"block"
			})
			Popup.find("img").css({
				display:"none"
			})
			savior({
				title:"",
				details:Popup,
				position:"middle",
				fix:"fixed",
				animationTime:5, 
				btn:[] ,
				animateMethod:"zoom" ,
				width:"auto", 
				height:"auto" 
			});
		//取消键
			var cancel = $(".cancel")
			var PPpopup = $(".Hpopup")
			var mask = $(".mask")
			PPpopup.css({
				    padding:" 0 35px"
				})
			cancel.click(function(){
				PPpopup.css({
					display:"none",
				    padding:" 0 35px"
				})
				mask.css({
					display:"none"	
				})
			})
		})
//其他金额
	var AmountMoney = $(".AmountMoney")
	var promptBox = $(".promptBox")
	var liList = $(".li")
	var PopupRecharge = $(".PopupRecharge")
	var id = $(".id")
	
//充值套餐
liList.click(function(){
	//套餐钱数
	var Amountmoney123 = $(".Amount-money").html()
	$(this).addClass("orange").siblings().removeClass("orange")
	$(this).find(".bigsize").addClass("white")
	var QianYuan = $(this).find("strong").html()
	$(this).siblings().find(".bigsize").removeClass("white")
	$(this).find(".size").addClass("white")
	$(this).siblings().find(".size").removeClass("white")

	//立即支付
	 ImmediatePayment.click(function(){
		 	$.ajax({
	        type:"post",
	        url:"/radishweb/ads/charge",
	        data:{
	        	package_id:QianYuan,
	        	pay:2
	        },
	        success:function(data){
	        	var msg = data.msg
            	if(data.data.msg){
            		$(".fadeInDown").css({
            			"display":"block",
            			"opacity":1
            		})
            		$(".message").html(msg)
            		setTimeout(function(){
						$(".fadeInDown").css({
            				display:"none"
            			})
					},2000);	
            	}
            	else{
		        	var ordeID = data.data.order_id

					//二维码图片
					var qrcode = (data.data.qrcode)

					id.html(ordeID)
					PopupRecharge.css({
						display:"none"
					})
					$(".imgQR").attr("src",qrcode)

		        	$(".imgQR").css({
						display:"block",
						opacity:"1"
					})
					//判断是否支付成功
			 		setTimeout(function(){
					 	$.ajax({
					        type:"post",
					        async: false,  
					        url:"/radishweb/pay/query",
					        data:{
					   			id:id.html(),
					        },
					        success:function(data){
						        var	StaTus = data.data.status
						        var cw = data.data.url1
						        var zq = data.data.url2
						        if(StaTus == "20"){
						        	$(".imgQR").css({
										opacity:"0"
									})
						        	$(".ico").attr("src",cw)
						        	$(".ico").css({
										display:"block"
									})
						        }
					        	else{
					        		$(".imgQR").css({
										opacity:"0"
									})
					        		$(".ico").attr("src",zq)
					        		$(".ico").css({
										display:"block"
									})
					          	}
								setTimeout(function(){
									var PPpopup = $(".Hpopup")
									var mask = $(".mask")
										PPpopup.css({
											display:"none"	
										})
										mask.css({
											display:"none"	
										})
										PopupRecharge.css({
											display:"block"
										})
										// window.location.href = "/radishweb/ads/index"		
								},3000);
				        	}
				 		 });
					},50000);
            	}

	          }
 		 });
	 })
		
})		
//选项卡
	var tab = $(".click") 
	var Survey = $(".Survey") 
	var Extension = $(".Extension") 
	var account =  $(".account") 
	var pagebar = $(".pagebar")
	var SUBMIT = $("#SUBMIT")
	SUBMIT.click(function(){
		 $.ajax({
        type:"get",
        url:"http://qa.xluob.com:8080/radishweb/upload/image",
        success:function(data){
	 	// var logoimgimg = $(".logoimgimg")
			// logoimgimg.attr("src",data)	
          }
		 });
	})
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
var Extension2 = $(".Extension2")
var statusloading = $(".statusloading")
var state = $(".state").html()
var Extension2 = $(".Extension2")
var statusloading = $(".statusloading")

//审核中
if($(".state").html() == 0){
	if(!$(".compongName").val()==""||!$(".compongBrief").val()==""){
		Extension2.css({
			display:"none"
		})
		statusloading.css({	
			display:"block"	
		})
	}
}
//失败
if(state == 2){
	// alert("审核失败")
	Extension2.css({
		display:"block"
	})
	statusloading.css({
		display:"none"
	})
}
	//成功
if(state == 1){
	// alert("审核成功")
	Extension2.css({
		display:"block"
	})
	statusloading.css({
		display:"none"
	})
}

$("#logout").click(function(){
	$(".alert-warning").css({
        "opacity":"1",
         "display":"block",
         "backgroundColor":"#51b993"
   	})	
	$(".message").html("成功退出登录")
	setTimeout(function(){
		$(".alert-warning").css({
         	"display":"none"
		})
		window.location = window.location
 	},1000);
})