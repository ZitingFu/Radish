
{include file="radishweb/widgets/header/header.tpl"}
	{include file="radishweb/widgets/nav/nav.tpl"}

 <div class="wrapper p-t30 paddingLg" style="overflow: hidden;">
	<div class="Survey-head">
		<h2>
			<span>修改</span>
		</h2>
		<div class="Survey">
				<div class="form-group form-tel">
					<label for="tel" class="control-label">修改子账号</label>
					<label for="tel">
						<input id="tel" type="text" value="{$info.account}" name="tel" class="form-control compony_account" autocomplete="off">
					</label>
					<label for="tel">
						<span class="none red Subaccount_span1"></span>
						<img class="none Subaccount_img1" src="1.png" alt="">
					</label>
				</div>
				<div class="form-group form-pw">
					<label for="pw" class="control-label">修改子账号名称</label>
					<label for="tel">
						<input id="tel" type="text" value="{$info.name}"  name="tel" class="form-control compony_name" autocomplete="off">
					</label>
					<label for="tel">
						<span class="none red Subaccount_span2"></span>
						<img class="none Subaccount_img2" src="1.png" alt="">
					</label>
				</div>
				<div class="form-group form-name">
						<label for="name" class="control-label ">修改登录密码</label>
						<label for="tel">
							<input id="tel" type="password" value="{$info.password}"  name="tel" class="form-control compony_password">
						</label>	
						<label for="tel">
							<span class="none red Subaccount_span3"></span>
							<img class="none Subaccount_img3" src="1.png" alt="">
						</label>
					</div>
				<p>
					<button class="btn btn-warning confirm" style="width:193px;line-height:19px;font-size: 17px;margin: 49px 103px;">提交</button>
				</p>
		</div>
	</div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
	
<div data-notify="container" class="col-xs-4 alert alert-warning animated fadeInDown" role="alert" data-notify-position="top-center" style="display: inline-block; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out; z-index: 9999999; top: 20px; left: 0px; right: 0px; animation-iteration-count: 1;"><button type="button" aria-hidden="true" class="close" data-notify="dismiss"></button><span data-notify="icon" class="fa fa-warning fa-fw"></span> <span data-notify="title"></span> <span data-notify="message" class="message">用户名或密码不正确</span><a href="#" target="_blank" data-notify="url"></a></div>


		<link rel="stylesheet" href="css.css">
		<script src="js/main.js"></script>
	</style>
<div style="text-align:center;border-top:#e9e9e9 solid 1px;
    padding: 40px 0;margin-top:100px;">
	小萝卜服务热线：400-679-0057 | 陕ICP备16009841号 | 邮箱：2848336902@qq.com
</div>
</body>
</html>