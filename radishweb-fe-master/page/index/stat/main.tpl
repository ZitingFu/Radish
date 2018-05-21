{include file="radishweb/widgets/header/header.tpl"}

<body>
	{include file="radishweb/widgets/nav/nav.tpl"}
	<div class="wrapper p-t30">
		<div class="content reg">
			<div class="titlebar m-b20">
				<label>统计</label>
			</div>
			<div class="searchbar">
				<form role="form" class="form-inline">
					{if $page.params.genre}
					<input type="hidden" name="genre" value="{$page.params.genre}"> {/if}
					<ul class="m-t5 p-l10">
						<li class="form-group">
							<label class="title">区域：</label>
						</li>
						<li class="form-group">
							<select class="form-control pull-left" name="province" id="province"></select>
						</li>
						<li class="form-group collapse">
							<select class="form-control" name="city" id="city"></select>
						</li>
						<li class="form-group collapse">
							<select class="form-control" name="area" id="area"></select>
						</li>
						<li class="form-group m-l20">
							<label for="province" class="pull-left">场所：</label>
							<select class="form-control pull-left" name="site" id="site">
								<option>请选择场所</option>
								{foreach from=$site key=i item=item}
								<option value="{$item.id}" {if $page.params.site==$item.id}selected{/if}>{$item.name}</option>
								{/foreach}
							</select>
						</li>
						<li class="form-group m-l20">
							<label for="role" class="pull-left">用户类型：</label>
							<select class="form-control pull-left" name="role" id="role">
								<option>请选择用户类型</option>
								<option value="3" {if $page.params.site==$item.id}selected{/if}>普通用户</option>
								<option value="1" {if $page.params.site==$item.id}selected{/if}>志愿者</option>
								<option value="2" {if $page.params.site==$item.id}selected{/if}>机构</option>
							</select>
						</li>
						
					</ul>
					<ul class="m-t15 m-b5 p-l10">
            <li class="form-group">
							<label class="control-label pull-left">单位类型：</label>
							<select class="form-control pull-left" name="cate" id="cate">
								<option>请选择单位类型</option>
								{foreach from=$cate key=i item=item}
								<option value="{$item.id}" {if $page.params.site==$item.id}selected{/if}>{$item.name}</option>
								{/foreach}
							</select>
						</li>
						<li class="form-group m-l20">
							<label for="start_time" class="pull-left">时间：</label>
							<input type="text" class="form-control" id="start_time" style="width:100px;background:#fff;cursor:inherit" placeholder="开始" readonly>
							<input type="hidden" name="start" value="">
						</li>
						<li class="form-group">
							<input type="text" class="form-control" placeholder="结束" id="end_time" style="width:100px;background:#fff;cursor:inherit" readonly>
							<input type="hidden" name="end" value="">
						</li>
						<li class="form-group m-l20">
							<button type="button" class="btn btn-warning">确定</button>
						</li>
					</ul>
				</form>
			</div>
			<div class="col-list m-t20 m-b50">
					<!--折线图-->
					<div id="line" class="col-lg-12" style="width:100%; height:400px;"></div>
					<!--饼图-->
					<div id="pie" class="col-lg-12 m-t20" style="width:30%; height:400px;"></div>
					<!--柱状图-->
					<div id="bar" class="col-lg-12 m-t20" style="width:68%; height:400px;margin-left:2%"></div>

			</div>
		</div>
	</div>
  
	<!--select2-->
	<link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
	<link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
	<script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
	<script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>

	<!--echarts-->
	<script type="text/javascript" src="/libs/echarts.js"></script>

	<!--bootstrap-datetimepicker-->
	<link rel="stylesheet" href="/libs/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
	<script type="text/javascript" src="/libs/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="/libs/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

	<script type="text/javascript" src="index.js"></script>

	<script type="text/html" id="listcount">
		{$listcount|json_encode nofilter}
	</script>
	<script type="text/html" id="num">
		{$num|json_encode nofilter}
	</script>
	<script type="text/html" id="day">
		{$day|json_encode nofilter}
	</script>

	{include file="radishweb/widgets/footer/footer.tpl"} 