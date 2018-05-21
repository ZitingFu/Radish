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
		position: fixed;
		bottom: 0;
	}
	p{
		font-size:16px!important;
	}
</style>
<body>
	{include file="radishweb/widgets/nav/nav.tpl"}
	<div class="wrapper p-t30">
		<div class="content reg">
			<div class="titlebar2 m-b30">
				<div class="listHead">
					<a href="/radishweb/index/about">关于我们</a>
					<a href="/radishweb/index/manual">使用说明</a>
					<a href="/radishweb/advertise/create" class="listActive">帮助与反馈</a>
				</div>
			</div>
			<!--<div class="titlebar m-b30">-->
				<!--<div class="listHead"><a href="/radishweb/notice/create" class="listActive">关于我们</a><a href="/radishweb/notice/create">使用说明</a></div>-->
			<!--</div>-->
			<div class="about">3
				{}
				
			</div>
		</div>
	</div>
	{include file="radishweb/widgets/footer/footer.tpl"}