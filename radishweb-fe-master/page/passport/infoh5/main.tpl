<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, user-scalable=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>小萝卜公益</title>
  <script type="text/javascript" src="/libs/jquery/jquery.min.js"></script>
  <!--font-awesome-->
  <link rel="stylesheet" type="text/css" href="/libs/font-awesome-4.1.0/css/font-awesome.min.css" />
  <link rel="stylesheet" href="main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="project">
	<span id="id_">{$info.id}</span>
	<div class="message">
		<div class="people clearFix">
			{if $info.avatar && $info.avatar.s}
			<img src="{$info.avatar.b}" width="50px" height="50px" class="f-left">
			{else}
			<img src="/images/portrait.jpg" width="50px" height="50px" class="f-left">
			{/if}
			<div class="f-left">
				<h2 style="color:#333333;">{if $info.name}{$info.name}{else}匿名{/if}</h2>
				</p>
				<p>
					<span>爱心值&nbsp;·&nbsp;{if $info.love}{$info.love}{else}0{/if}</span>&nbsp;
					<span class="ranking">{$info.city_name}&nbsp;&nbsp;NO.{$info.num}</span>
				</p>
			</div>
		</div>
	</div>
	<div class="Release">
		<h5><i class="xian"></i>发布信息</h5>
		<table class="table">
			<tr>
				<td>{$info.thing_publish}</td>
				<td>{$info.people_publish}</td>
				<td>{$info.founded}</td>
			</tr>
			<tr>
				<th>物品认领</th>
				<th>人口认领</th>
				<th>认领成功</th>
			</tr>
		</table>
	</div>

	<div class="phone">
		<h4><i class="xian"></i>联系方式</h4>
		<p>联系电话：{$info.linkphone}</p>
		<p>机构地址：{$info.address}&nbsp;<img src="option.png" alt="" width="12"></p>
	</div>
	<p class="message_tiao">最近发布</p>
	<div class="conterr">
		<p id="new-time"></p>
		{foreach from=$recent_post key=i item=item}
		<div class="message morder_bottom box">
			 <p class="timespan"></p>
			  <p class="y-expire"></p>
			<div class="message_desc">
				<p>
					<span class="gen_name"><img src="jinghao.png" alt="">
					{if $item.gen_name}{$item.gen_name}{else}#未知#{/if}</span>
					<span class="f-right" style="color:#999;font-size: 12px;">
						{$item.display_time}
						<span class="indexnone">
							剩余
							<i class="y-d "></i>
							<span class="h-box">
								<i class="y-h"></i>
								<i class="y-m"></i>
								<i class="y-s"></i>
							</span>
						</span>
					</span>
				</p>
				{if $item.content}
					<p style="font-size:14px;color:#323232">{$item.content}</p>
				{/if}
				{if $item.images}
					{if count($item.images) == 1}
						{foreach from=$item.images  key=i item=items}
						<div class="img_box" data-img="{$items.m}" style="width:70%">
							<img src="{$items.m}" width="100%" height="100%">
						</div>
						{/foreach}
					{else}
						{foreach from=$item.images  key=i item=items}
						<div class="img_box" data-img="{$items.m}" width="140px" height="160px">
							<img src="{$items.m}">
						</div>
						{/foreach}
					{/if}
				{else}
					{if $item.video}
					<video src="{$item.video}" controls="controls" class="videoMp4"></video>
					{/if}
				{/if}
			</div>
			<div>
				<img class="avatar" src="{$item.avatar.m}" alt="">&nbsp;&nbsp;<span>{$item.user_name }</span>
			</div>
		</div>
		{/foreach}
	</div>
	<div style="width:100%;height:45px"></div>
	<div class="people clearFix download" style="padding: 5px 10px">
		<img src="/images/avatar2.png" width="50px" height="50px" class="f-left">
		<div class="f-left">
			<p style="margin-bottom: 0;">小萝卜公益</p>
			<p style="color:#999999;letter-spacing:2px;font-size: 12px;">让生活更美好</p>
		</div>
		<button>下载APP</button>
	</div>
</div>

<div class="big-img">

	<img src="">
	<span></span>

</div>
<a class="aa">

	<div class="uu"></div>

</a>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.3&key=b253a2b2c53202149a1e6f1aa1e90a88&plugin=AMap.CitySearch"></script>
<script type="text/javascript" src="index.js"></script>
</body>
<script> var SMARTY_DEBUG = {$SMARTY_DEBUG|json_encode}; </script>
</html>