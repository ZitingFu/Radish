	
{include file="radishweb/widgets/header/header.tpl"}
	{include file="radishweb/widgets/nav/nav.tpl"}

 <div class="wrapper p-t30 paddingLg" style="overflow: hidden;">
 <!-- <img class="dakai" src="http://rd.xluob.com/%E7%BB%84%202.png" style="" alt=""> -->
		<!-- <div class="banxin"> -->
			<div class="Survey-head">
				<div class="id" style="display:none">123</div>		
				<h2>
					<span>广告助手</span>
				</h2>
				<ul class="ul" style="overflow: hidden">
					<li></li>
					<li class="click change">
						<a href="/radishweb/ads/index">广告设置</a></li>
					<li></li>
					<li class="click">
						<a href="/radishweb/ads/about">概况</a>
					</li>
					<li></li>
					<li class="click">
						<a href="/radishweb/ads/so">账户</a></li>
					<li></li>
				</ul>
				
				<!-- 广告设置修改 -->
				<div class="Extension">
					<img class="statusloading" src="status-loading.jpg" alt="">
					<span class="state">{$info.state}</span>
					<div class="Extension2 edit">
						<table class="table">
							<tr>
								<td class="gongsi">公司名称</td>
								<td>
									<input type="text" value="{$info.pre_compony_name}" class="paddingLeft compongName" style="">
								</td>
							</tr>
							<tr>
								<td>上传公司logo</td>
								<td>
									<div class="logoIMG">
										<!-- 上传logo -->
										{if $info.logo.s}
										<img id="logoimgimg" src="{$info.pre_logo.s}">
										{else}
										<img id="logoimgimg" src="1.png">
										{/if}
										<input type="file" class="images" accept="image/*"/  id="logowidth" style="opacity: 0">
									</div>
									<p style="text-align:left;color:#d2d2d2">图片不能超过200KB</p>
								</td>
							</tr>
							<tr>
								<td>设置广告语</td>
								<td>
									<input type="text" class="compongBrief" value="{$info.pre_compony_brief}" placeholder="数字不能超过15个字" style="">
								</td>
							</tr>
						</table>
						<p class="center"><button class="btn btn-warning confirm" id="p-left">提交</button></p>
					</div>
				</div>
				<!-- 广告设置成功 -->
				<div class="Extension ">
					<img class="statusloading" src="status-loading.jpg" alt="">
					<span class="state">{$info.state}</span>
					<div class="Extension2 success">
						<table class="table">
							<tr>
								<td class="gongsi">公司名称</td>
								<td>
									<span>{$info.pre_compony_name}</span>
									<!-- <input type="text" value="{$info.compony_name}" class="paddingLeft compongName" style=""> -->
								</td>
							</tr>
							<tr>
								<td>上传公司logo</td>
								<td>
									<div class="logoIMG">
										<!-- 上传logo -->
										{if $info.logo.s}
										<img id="logoimgimg" src="{$info.pre_logo.s}">
										{else}
										<img id="logoimgimg" src="1.png">
										{/if}
										<!-- <input type="file" class="images" accept="image/*"/  id="logowidth" style="opacity: 0"> -->
									</div>
									<p style="text-align:left;color:#d2d2d2">图片不能超过200KB</p>
								</td>
							</tr>
							<tr>
								<td>设置广告语</td>
								<td>
									<span>{$info.pre_compony_brief}</span>
									<!-- <input type="text" class="compongBrief" value="{$info.compony_brief}" placeholder="数字不能超过15个字" style=""> -->
								</td>
							</tr>
						</table>
						<p class="center"><button class="btn btn-warning c-edit" id="p-left">修改信息</button></p>
					</div>
				</div>
			</div>
		    {include file="radishweb/widgets/nav/usernav-left.tpl"}

			<!-- </div> -->
		<div class="clear"></div>
</div>

	<div data-notify="container" class="col-xs-4 alert alert-warning animated fadeInDown" role="alert" data-notify-position="top-center" style="display: none; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out; z-index: 9999999; top: 20px; left: 0px; right: 0px; animation-iteration-count: 1;"><button type="button" aria-hidden="true" class="close" data-notify="dismiss"></button><span data-notify="icon" class=""></span> <span data-notify="title"></span> <span data-notify="message" class="message">用户名或密码不正确</span><a href="#" target="_blank" data-notify="url"></a></div>
	<!-- 审核未通过 -->
    </div>
  </div>
		<link rel="stylesheet" href="css.css">
		<script src ="js/jquery.min.js"></script>
		<script src="js/savior.js"></script>
		<script src="js/main.js"></script>
		{include file="radishweb/widgets/footer/footer.tpl"}
