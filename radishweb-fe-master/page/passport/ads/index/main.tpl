
<body>
{include file="radishweb/widgets/header/header.tpl"}
	{include file="radishweb/widgets/nav/nav.tpl"}

 <div class="wrapper p-t30 paddingLg" style="overflow: hidden">

		<!-- <div class="banxin"> -->
			<div class="Survey-head">
				<h2>
					<span>广告助手</span>
				</h2>
				<ul class="ul">
					<li></li>
					<li class="click change">概况</li>
					<li></li>
					<li class="click">推广计划</li>
					<li></li>
					<li class="click">账户</li>
					<li></li>
				</ul>
				<!-- 概况 -->
				<div class="Survey">
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th>未展现</th>
								<th>累计展现</th>
								<th>累计充值</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td>1000条</td>
								<td>2000条</td>
								<td>800条</td>
							</tr>
						</tbody>
					</table>
					<p>
						<button class="btn btn-warning Recharge" style="width:193px;line-height:20px">立即充值</button>
					</p>
				</div>
				<!-- 推广计划 -->
				<div class="Extension">
					<table class="table">
						<tr>
							<td style="width:117px;">公司名称</td>
							<td>
								<input type="text" class="paddingLeft" style="width:242px;height:41px;border-radius:6px;outline:none;border: 1px solid #dddddd;">
							</td>
						</tr>
						<tr>
							<td>上传公司logo</td>
							<td>
								<div class="logoIMG">
									<!-- 上传logo -->
									<img class="logoimgimg" name src="{if $pass.avatar}{$pass.avatar.b}{else}//img1.yunbix.cn/radishweb/static/images/avatar2_d7af2a3.png{/if} " alt="">
									<input type="file" accept="/radishweb/upload/image" name="flie" id="logowidth" style="opacity: 0">
										<!-- <form action="http://qa.xluob.com:8080/radishweb/upload/image" method="post" enctype="multipart/form-data" target="file_upload">
										    <input type="file" name="file"><br />
										    <input type="submit" value="提交" id="SUBMIT">
										</form> -->
								</div>
								<p style="text-align:left;color:#d2d2d2">图片不能超过200KB</p>
							</td>
						</tr>
						<tr>
							<td>设置广告语</td>
							<td>
								<textarea name=" " id="" cols="30" rows="10" maxlength="15" placeholder="数字不能超过15个字" style="padding:5px 5px;border: 1px solid #dddddd;"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<!-- 账户 -->
				<div class="account">
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th>未展现</th>
								<th>累计展现</th>
								<th>累计充值</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td>1000条</td>
								<td>2000条</td>
								<td>800条</td>
							</tr>
						</tbody>
					</table>
					<p>
						<button class="btn btn-warning Recharge marginR48" style="width:193px;height:34px;margin-top:60px">立即充值</button>
						<button class="btn btn-warning invoice" style="width:193px;height:34px;margin-top:60px;">开发票</button>
					</p>
				</div>

			</div>
			<!-- <div class="Survey-left" style="width:15%;"> -->
				 
		    {include file="radishweb/widgets/nav/usernav-left.tpl"}

			<!-- </div> -->
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>	
</div>
	<!-- 立即充值弹出层数据页面 -->
	<div class="Popup">
		<h3>充值金额</h3>
		<ul>
			<li>500元</li>
			<li>500元</li>
			<li>500元</li>
		</ul>
		<ul>
			<li>5000元</li>
			<li>1000元</li>
			<li>5000元</li>
		</ul>
		<p class="money">其他金额：<span class="AmountMoney" style="color:#fda249"></span></p>
		<p class="payment">
			<span class="ImmediatePayment" class="btn btn-warning" style="width:165px;line-height:30px;">立即支付</span>
			<!-- <a class="ImmediatePayment" class="btn btn-warning" href="" style="width:165px;line-height:30px;">立即支付</a> -->
			<span class="btn cancel" style="background-color:#d9d9d9;color:#000;width:165px;line-height:30px;">取消</span>
		</p>
	</div>
	<!-- 发票弹出层数据页面 -->
	<div class="PopupInvoice">
		<h4>发票类型：纸质发票</h4>
		<form action="/radishweb/ads/invoice" method="post">
			<table>
				<thead>
					<tr>
						<th>企业名称：</th>
						<td>
							<input type="text">
						</td>
					</tr>
					<tr>
						<th>税号：</th>
						<td>
							<input type="text">
						</td>
					</tr>
					<tr>
						<th>企业地址和电话：</th>
						<td>
							<input type="text">
						</td>
					</tr>
					<tr>
						<th>开户行和账号：</th>
						<td>
							<input type="text">
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td>填写收集人地址及联系方式</td>
					</tr>
					<tr>
						<th>姓名：</th>
						<td>
							<input type="text">
						</td>
					</tr><tr>
						<th>电话：</th>
						<td>
							<input type="text">
						</td>
					</tr><tr>
						<th>邮箱地址：</th>
						<td>
							<input type="text">
						</td>
					</tr>
				</tbody>
			</table>
		<P style="text-align:center;margin-top:35px;">
			<input type="submit" class="btn btn-warning" style="margin-right:32px;width:120px;line-height:30px" value="提示发票信息">
			<span class="btn cancel" style="background-color:#d9d9d9;color:#000;width:120px;line-height:30px">取消</span>
		</P>
		</form>
	</div>
	<style>
		*{
			margin: 0;padding: 0;
		}
		a{
			text-decoration: none;
			color: #fff;
		}
		.wrapper{
			width:1152px;
			margin: 0 auto;
		}
		li{
			list-style:none;
		}
		.Survey-left{
			width: 15%;
			float: left;
		}
		.Survey-head{
			width: 80%;
			float: right;
		}
		.Survey-head h2{
			padding-top: 0;
			border-bottom:1px solid #000;
			margin-bottom:58px; 
			margin-top:0; 
		}
		.Survey-head h2 span{
			font-weight: normal;
			text-align: center;
			width: 70px;
			height: 28px;
	    	text-align: center;
			display: inline-block;
			font-size: 14px;
			padding:6px 3px;
			background-color:#fda249;
			color: #fff;
		}
		.Survey-head .ul li{
			color: #c6c6c6;
			margin-bottom:47px;
			float: left;
			width: 99px;
			height: 22px;
			line-height: 22px;
			text-align: center;
		}
		.Survey-head .ul li:hover{
			color:#000;
			cursor: pointer 
		}
		.Survey-head .ul li:nth-child(odd){
			border-bottom:1px solid #e6e6e6;
		}
		.Survey-head .ul li:nth-child(even){
			border:1px solid #e6e6e6;
		}
		.Survey-head .ul li:first-child{
			width: 22px;
		}
		.Survey-head .ul li:last-child{
			width: 22px;
		}
		.Survey-head p{
			text-align: center;
		}
		.Survey td:last-child{
			color:#fe9b8e;
		}
		.Survey-head th:first-child{
			width: 53px;
		}
		.Popup{
			display: none;
			width: 377px;
			height: 261px;
		}
		.Popup ul li{
			text-align: center;
			width: 95px;
			height: 38px;
			line-height: 38px;
			border:1px solid #fda249;
			float: left;
			border-radius: 4px;
		}
		.Popup ul li:nth-child(2){
			margin: 0 45px;
		}
		.Popup ul li:hover{
			background-color: #fda249;
		}
		.Popup ul{
			width: auto;
			margin-top:21px;
			overflow: hidden;
		}
		.Popup h3{
			text-align: center;
		}
		.Popup .money span{
			padding:0 41px 0 13px;
			border-bottom:1px solid #000;
		}
		.Popup .money{
			margin-top:28px; 
		}
		.Popup .payment{
			margin-top:26px; 
		}
		.Popup .payment a{
			width: 165px;
			height: 39px;	
		}
		.Survey,.Extension,.account{
			display: none;
		}
		body .Survey-head .ul .change{
			color:#000;
			border-bottom: none;
		}
		body .Survey-head .change:hover{
			color:#000;	
		}
		textarea{
			width: 281px;
			height: 59px;
		}
		.marginR48{
			margin-right:48px; 
		}
		.PopupInvoice input:focus{
			border: 1px solid #cecece;			
		}
		.PopupInvoice{
			display: none;
			font-size: 15px;
			color: #878787;
			height: 557px;
			clear: both;
			width: 508px;
		}
		.PopupInvoice table{
			margin-left: 30px;
			border-collapse: separate;
			border-spacing: 0px 24px;  
		}
		.PopupInvoice h4{
			padding-left:18px; 
			color: #a9a9a9;
			line-height: 43px;
			border-bottom:1px solid #dddddd;
		}
		.PopupInvoice table input{
			padding-left: 5px;
			width: 280px;
			height: 27px;
		}
		.PopupInvoice table th{
			text-align: right;
			font-weight: normal;

		}
		body .Extension .table>tbody>tr>td{
			border-top:none;

		}
		.paddingLeft{
			padding-left:5px;
		}
		.clear{
			clear: both;
		}
		.banxin{
			width: 1152px;
			margin: 0 auto;
		}
		.logoIMG{
			border:1px solid #dddddd;
			width: 50px;
			height: 50px;
			position:relative; 
		}
		.logoIMG img{
			position: absolute;
			width:100%;
			height:100%;
			top:0%;
			left:0%;
		}
		.Extension table{
			padding-left: 23px;
			border-collapse: separate;
			border-spacing: 0px 24px;  
		}
		html #logowidth{
			width: 50px;
			position: relative;
			line-height: 50px;
			opacity: 0;
		}
		</style>
		<script src ="jquery.min.js"></script>
		<script src="savior.js"></script>
		<style>
			*{
			margin: 0;padding: 0;
		}
	</style>
	<script>

	//发票弹出层
	var invoice = $(".invoice")
	var PopupInvoice = $(".PopupInvoice")
		invoice.click(function(){
			
			PopupInvoice.css({
					display:"block"
				})
				savior({
					title:"",
					details:PopupInvoice,
					position:"middle",
					fix:"fixed",
					animationTime:5, 
					btn:[] ,
					animateMethod:"zoom" ,
					width:"auto" , 
					height:"auto" ,
					fn:function(){ }
				});
				var pad = $(".padding")
				console.log(pad)
				//取消键
				var cancel = $(".cancel")
				var PPpopup = $(".Hpopup")
				var mask = $(".mask")
				cancel.click(function(){
					PPpopup.css({
						display:"none"	
					})
					mask.css({
						display:"none"	
					})
				})

		})
	//立即充值弹出层
	var Popup = $(".Popup")
	var Recharge = $(".Recharge")			
		Recharge.click(function(){	
			Popup.css({
				display:"block"
			})
			savior({
				title:"",
				details:Popup,
				position:"middle",
				fix:"fixed",
				animationTime:5, 
				btn:[] ,
				animateMethod:"zoom" ,
				width:"auto" , 
				height:"326" ,
				fn:function(){ }
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
					display:"none"	,
				    padding:" 0 35px"
				})
				mask.css({
					display:"none"	
				})
			})
		})
	//其他金额
		var AmountMoney = $(".AmountMoney")	
 		var liList = $(".Popup").find("li")
 		liList.click(function(){
 			clhtml =  $(this).html()
 			AmountMoney.html(clhtml)  
 			var QianYuan = (String(clhtml).split("元")[0])
	 		//立即支付
	 		 var ImmediatePayment = $(".ImmediatePayment")
	 		 ImmediatePayment.click(function(){
	 		 	$.ajax({
			        type:"post",
			        data:{
			        	name:QianYuan
			        },
			        url:"/radishweb/ads/charge",
			        success:function(data){
				 		
						console.log(data)
			          }
	     		 });
	 		 })
 		})

 	//选项卡
 		var tab = $(".click") 
 		var Survey = $(".Survey") 
 		var Extension = $(".Extension") 
 		var account =  $(".account") 
 		Survey.css({
 			display:"block"
 				})
 		tab.click(function(){
 			var	number = ($(this).index())
 			$(this).addClass("change").siblings().removeClass("change")
 			
 			if(number == "1"){
 				Survey.css({
 					display:"block"
 				})
 				Extension.css({
 					display:"none"
 				})
 				account.css({
 					display:"none"
 				})
 				
 			}
 			if(number == "3"){
 				Extension.css({
 					display:"block"
 				})
 				Survey.css({
 					display:"none"
 				})
 				account.css({
 					display:"none"
 				})
 				
 			}
 			if(number == "5"){
 				account.css({
 					display:"block"
 				})
 				Survey.css({
 					display:"none"
 				})
 				Extension.css({
 					display:"none"
 				})
 				
 			}
 		})
 		var SUBMIT = $("#SUBMIT")
 		SUBMIT.click(function(){
 			 $.ajax({
		        type:"get",
		        url:"http://qa.xluob.com:8080/radishweb/upload/image",
		        success:function(data){
			 	// var logoimgimg = $(".logoimgimg")
					// logoimgimg.attr("src",data)	
					console.log(data)
		          }
     		 });
 		})
 		 
 		 
	</script>
</body>

</html>