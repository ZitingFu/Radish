
{include file="radishweb/widgets/header/header.tpl"}
<style>
	.about p {
		font-size: 16px;
		line-height: 24px;
		text-indent: 2em;
	}
	.about p:first-child {
		text-indent: 0;
	}
	.titlebar2{
		border-bottom: solid #ececec 1px;
	}
	.listHead{
		margin-bottom:0 
	}
	.listHead a{
		display: inline-block;
		width: 84px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		background: #ececec;
		font-size: 14px;
		color: #999;
	}
	a.listActive{
		color: #fff;
		background: #fda249;
	}
	.footer{
		
		bottom: 0;
	}
</style>
<body>
	{include file="radishweb/widgets/nav/nav.tpl"}
	<div class="wrapper p-t30">
		<div class="content reg">
			<div class="titlebar2">
				<div class="listHead">
					<a href="/radishweb/index/about">关于我们</a>
					<a href="/radishweb/index/manual">使用说明</a>
					<a href="/radishweb/advertise/create">帮助与反馈</a>
					<a href="/radishweb/index/download" class="listActive">物料下载</a>
				</div>
			</div>
			<div class="materiel" style="margin-bottom: 140px">
				<ul>
					<a href="/radishweb/index/logo"><li>小萝卜公益logo</li></a>
					<a href="/radishweb/index/radish"><li>小萝卜公益APP二维码</li></a>
					<a href="/radishweb/index/qrcode"><li>小萝卜公益微信公众号二维码</li></a>
				</ul>
			</div>
		</div>
		<style>
			.materiel li{
				display: block;
				height:80px;
				line-height: 80px;
			  	border-bottom: 1px solid #c7c7c7;
			  	color: #333;
			  	font-size: 16px;
			}
			.materiel li:hover{
				background-color:#f3f5f9;
			}
		</style>
	{include file="radishweb/widgets/nav/usernav-left.tpl"}
	{include file="radishweb/widgets/footer/footer.tpl"}
	</div>