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
		
		bottom: 0;
	}
</style>
<body>
	{include file="radishweb/widgets/nav/nav.tpl"}
	<div class="wrapper p-t30">
		<div class="content reg">
			<div class="titlebar2 m-b30">
				<div class="listHead">
					<a href="/radishweb/index/about">关于我们</a>
					<a href="/radishweb/index/manual"  class="listActive">使用说明</a>
					<a href="/radishweb/advertise/create">帮助与反馈</a>
					<a href="/radishweb/index/download">物料下载</a>
				</div>
			</div>
			<!--<div class="titlebar m-b30">-->
				<!--<div class="listHead"><a href="/radishweb/notice/create" class="listActive">关于我们</a><a href="/radishweb/notice/create">使用说明</a></div>-->
			<!--</div>-->
			<div class="about container">
				
			<!-- 	<img src="http://img.qa.xluob.com/radish/images/618b89d6984c83a988655cb3f9145832.png"> -->
				
				{$content}<!--<p class="m-b10">小萝卜公益网</p>-->
				<!--<p class="m-b10">小萝卜公益网由陕西省榆林小萝卜社会公益服务中心建设，协会成立于2015年6月，主管单位为榆林市民政局，也得到共青团中央、陕西省公安厅大力支持的社会公益组织。</p>-->
				<!--<p class="m-b10">小萝卜公益秉承“关爱社会，传递爱心，方便你我”的服务宗旨，根据会员实际需要开发了小萝卜公益APP，形成了一个集失踪人口找回、失物招领、出行购票、话费充值等便民服务为主的社交化网络平台。会员可以通过平台发布信息，帮助会员实现寻人、寻物，实现不同用户间的信息共享。</p>-->
				<!--<p class="m-b10">小萝卜公益应用主要分为同城、公益、生活、公告四个模块。同城包括用户所在城市的所有失物招领、失踪人口找回等信息; 公益下设寻人、寻物、认人、认物、好人风采、突发事件具体分类信息；生活模块提供飞机票购买、火车票购买、话费充值、游戏充值等快速、便捷、舒适服务；公告为注册机构发布的紧急公告信息。</p>-->
				<!--<p class="m-b10">我们的愿景</p>-->
				<!--<p class="m-b10"> 更多的公益单位和志愿者及个人能够参与进来，通过我们的努力，共同构建一个和谐美丽的生活圈。</p>-->
        		<!--<p class="m-t30">小萝卜公益志愿者群欢迎您的加入！QQ群：278594073</p>-->
			</div>
		</div>
	{include file="radishweb/widgets/footer/footer.tpl"}
	</div>