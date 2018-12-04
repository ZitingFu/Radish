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
</head>
<body>
<div class="project">
	<div class="message morder_bottom">
	<span id="id_">{$info.id}</span>
	<p id="new-time"></p>
	<p class="y-end"></p>
    <p class="y-expire"></p>
		<div class="message_desc">
			<div class="banxin">
				<p style="height: 24px;padding:10px 0px;">
					<span class="name f-left">
						<img src="jinghao.png" alt="">
						{if $info.genre_name}{$info.genre_name}{else}#未知#{/if}
					</span>
					<span class="f-right" style="color:#999;font-size: 12px;">{$info.display_time }</span>
				</p>
				{if $info.content}
				<p style="color:#323232;font-size: 14px;padding:2px 4px; ">{$info.content}</p>
				{/if}
				{if $info.images}
					{if count($info.images) == 1}
						{foreach from=$info.images key=i item=item}
						<div class="img_box" data-img="{$item.images.m}" style="width:70%;">
							<img src="{$item.images.s}" width="100%" height="100%">
						</div>
						{/foreach}
					{else}
						{foreach from=$info.images key=i item=item}
						<div class="img_box" data-img="{$item.images.m}" style="width:31.3%;height:110px;">
							<img src="{$item.images.s}" width="100%" height="100%">
						</div>
						{/foreach}
					{/if}
			</div>
			{if $info.food_cate.expire != 0 && $info.food_cate.expire != 11}
				<p class="clock">
					<img class="colock" src="colock.png" alt="">
					距离认领结束
					<span class="y-d">00</span>天
					<span class="y-h">00</span>时
					<span class="y-m">00</span>分
					<span class="y-s">00</span>秒
				</p class="clock">
			{else}
				<p></p>
			{/if}	
			{if $info.q_remark}
			<p class="message_fiattime">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：{$info.q_remark}</p>
			{else}
				<p class=""></p>
			{/if}

			{else}
			{if $info.video}
			<video src="{$info.video}" controls="controls" class="videoMp4"></video>
			{/if}
			{/if}
			
			{if $info.name}
			<p>联&nbsp;&nbsp;系&nbsp;&nbsp;人： {$info.name}</p>
			{/if}
			{if $info.phone}
			<p>联系电话：<span style="color: #005bc8">{$info.phone}</span> </p>
			{/if}
			<p>发送位置：
				<a style="color:#000" href="/radishweb/question/map?id={$info.id}" target='_blank'> {$info.site_two_name}&nbsp;&nbsp;<img class="option" src="option.png" alt="">
				</a>
			<p>信息编码：{$info.id}</p>
		</div>
		<div class="people clearFix user_name_top">
				{if $info.avatar && $info.avatar.s}
				<img src="{$info.avatar.s}" width="40px" height="45px" class="f-left">
				{else}
				<img src="/images/portrait.jpg" width="40px" height="45px" class="f-left">
				{/if}

			<div class="f-left user_name_bottom " style="width:78%;">
				<p>{$info.user_name}</p>
				<p style="margin-top:0">发布数&nbsp;{if $info.issue_num}{$info.issue_num}{else}0{/if}&nbsp;
				<span class="radiu"></span>&nbsp;&nbsp;已找到&nbsp;{if $info.find_num}{$info.find_num}{else}0{/if}&nbsp;
				<span class="radiu"></span>
				&nbsp;爱心值&nbsp;{if $info.love}{$info.love}{else}0{/if}</p>
			</div>
		</div>
	</div>
	<p class="message_tiao banxin">评论</p>
	<!-- {if $info.comments.length > 0}
	<p class="message_tiao">评论：{$info.comments.length}条</p>
	{else}
	<p class="message_tiao">评论：0条</p>
	{/if} -->
	<div class="conterr banxin">
		{if $info.comments}
			{foreach from=$info.comments  key=i item=item}
			<div class="people clearFix">
				{if $item.avatar && $item.avatar.s}
				<img src="{$item.avatar.s}" width="50px" height="50px" class="f-left">
				{else}
				<img src="/images/portrait.jpg" width="50px" height="50px" class="f-left">
				{/if}
				<div class="f-left left">
					<p>{$item.user_name }
						<span class="f-right" style="color:#999999">{$item.num_like}</span>
						<img class="f-right zan" style="margin-right:10px" src="zan.png" alt="" width="15px">
					</p>
					<p style="color:#999999;font-size:12px;margin-top:9px ">{$item.create_time}</p>
					<p style="line-height:20px">{$item.content}</p>
				</div>
			</div>
			{/foreach}
		{else}
			<p style="text-align: center;margin:20px 0 30px 0;">暂无评论</p>	
		{/if}

	</div>
	<div style="width:100%;height:45px"></div>
	<div class="people clearFix download">
		<img src="/images/avatar2.png" width="50px" height="50px" class="f-left">
		<div class="f-left">
			<p>小萝卜公益</p>
			<p style="color:#999999;letter-spacing:2px">让生活更美好</p>
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

<script type="text/javascript" src="index.js"></script>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.3&key=b253a2b2c53202149a1e6f1aa1e90a88&plugin=Amap.Geocode"></script>
</body>
<script> var SMARTY_DEBUG = {$SMARTY_DEBUG|json_encode}; </script>
</html>