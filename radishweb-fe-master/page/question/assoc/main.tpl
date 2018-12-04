
{include file="radishweb/widgets/header/header.tpl"}
	{include file="radishweb/widgets/nav/nav.tpl"}

 <div class="wrapper p-t30 paddingLg" style="overflow: hidden;">
	<div class="Survey-head">
		<h2>
			<a class="aorange" href="/radishweb/passport/myassoc">已关联个人信息</a>
			<i class="Y"></i>
			<a class="aorange orange1" href="/radishweb/question/assoc">新增关联信息</a>
		</h2>
		<div class="Survey">
				<!-- <form action="" id="form"> -->
					<div class="form-group form-tel">
						<label for="tel">
							<input id="tel" type="text" placeholder="请输入信息编码" class="form-control compony_account" autocomplete="off">
						</label> 
						<label for="tel">
							<button class="btn query">查询</button>
						</label>
					</div>
				<!-- </form> -->
		</div>
		<div class="Survey_box">
			<div class="Survey_left">
				<div>
					<img class="images" src="1.png" alt="">
				</div>
			</div>
			<div class="Survey_right">
				<h6 class="name"></h6>
				<p class="content"></p>
				<p>编码信息：<i class="id"></i></p>
				<span class="add">联系人：<i class="name"></i></span>
				<span>联系电话: <i class="phone"></i></span>
				<p><button class="btn margin status"></button>
				</p>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
	

	<div data-notify="container" class="col-xs-4 alert alert-warning animated fadeInDown" role="alert" data-notify-position="top-center" style="display:none; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out; z-index: 9999999; top: 20px; left: 0px; right: 0px; animation-iteration-count: 1;"><button type="button" aria-hidden="true" class="close" data-notify="dismiss"></button><span data-notify="icon" class="fa fa-warning fa-fw"></span> <span data-notify="title"></span> <span data-notify="message" class="message"></span><a href="#" target="_blank" data-notify="url"></a></div>

		<link rel="stylesheet" href="css.css">
		<script src="js/main.js"></script>
	</style>
<div style="text-align:center;border-top:#e9e9e9 solid 1px;
    padding: 40px 0;margin-top:100px;">
	小萝卜服务热线：400-679-0057 | 陕ICP备16009841号 | 邮箱：2848336902@qq.com
</div>
</body>
</html>