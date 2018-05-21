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
	<div class="message">
		<div class="message_desc">
			<p>{$info.user_name}</p>
			{if $info.images}
			{foreach from=$info.images key=i item=item}
			<div class="img_box" data-img="{$item.images.m}">
				<img src="{$item.image.s}">
			</div>
			{/foreach}
			{else}
			{if $info.video}
			<video src="{$info.video}" controls="controls" class="videoMp4"></video>
			{/if}
			{/if}
			{if $info.content}
			<p>{$info.content}</p>
			{/if}
		</div>
		<div class="clearFix">
			<p class="f-left">来自{if $info.user_name}{$info.user_name}{else}匿名{/if}&nbsp;&nbsp;{if $info.time}{$info.time}{else}未知{/if}</p>
			<p class="f-right">{if $info.city_name}{$info.city_name}{else}城市{/if}&nbsp;·&nbsp;{if $info.area_name}{$info.area_name}{else}区/县{/if}</p>
		</div>
	</div>
	<div class="people clearFix">
		{if $info.avatar && $info.avatar.s}
		<img src="{$info.avatar.s}" width="50px" height="50px" class="f-left">
		{else}
		<img src="/images/portrait.jpg" width="50px" height="50px" class="f-left">
		{/if}
		<div class="f-left">
			<p>{if $info.user_name}{$info.user_name}{else}匿名{/if}</p>
			<p>发布数&nbsp;·&nbsp;{if $info.issue_num}{$info.issue_num}{else}0{/if}&nbsp;&nbsp;已找到&nbsp;·&nbsp;{if $info.find_num}{$info.find_num}{else}0{/if}&nbsp;&nbsp;爱心值&nbsp;·&nbsp;{if $info.love}{$info.love}{else}0{/if}</p>
		</div>
	</div>
	{if $info.comments}
	<div class="comment">
		<p class="title">评论</p>
		{foreach from=$info.comments key=i item=item}
		<div class="comment-list">
			<div class="comment_man clearFix">
				{if $item.avatar && $item.avatar.s}
				<img src="{$item.avatar.s}" width="50px" height="50px" class="f-left">
				{else}
				<img src="/images/portrait.jpg" width="50px" height="50px" class="f-left">
				{/if}
				<div class="comment_man_name f-left">
					<p>{if $item.user_name}{$item.user_name}{else}匿名{/if}</p>
					<p>{if $item.create_time}{$item.create_time}{else}未知时间{/if}</p>
				</div>
				<div class="f-right">
					<span class="support"></span>
					<span>{if $item.num_like}{$item.num_like}{else}0{/if}</span>
				</div>
			</div>
			<p class="comment_mes">{if $item.type==2}回复{$item.to_user_name}：{/if}{$item.content}</p>
		</div>
		{/foreach}
	</div>
	{/if}
	<div style="width:100%;height:45px"></div>
	<div class="download">
		<button>小萝卜公益APP下载</button>
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
</body>
<script> var SMARTY_DEBUG = {$SMARTY_DEBUG|json_encode}; </script>
</html>