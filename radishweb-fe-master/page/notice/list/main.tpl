{include file="radishweb/widgets/header/header.tpl"}
<body class="page-template-default page page-id-1605 woocommerce dokan-theme-dokan">

{include file="radishweb/widgets/nav/nav.tpl"}

<div class="container wrapper p-t30">
   <!-- 
    <div class="pull-right w-120 h-240" style="background: #fff">
        我是百度广告
    </div>
    
    <div class="content w-920 pull-right wrap-content section m-r18 content_div container">
        <div class="searchbar">
            <form action="/radishweb/notice/list" method="get" id="submit_then">
                {if $page.params.genre}
                <input type="hidden" name="genre" value="{$page.params.genre}" >
                {/if}
                <ul class="container">
                    <li class="form-group">
                        <label class="title pull-left">区域：</label>
                        <select class="form-control pull-left " name="province" id="province"></select>
                    </li>
                    <li class="form-group collapse">
                        <select class="form-control" name="city" id="city"></select>
                    </li>
                    <li class="form-group collapse">
                        <select class="form-control" name="area" id="area"></select>
                    </li>
                    <li class="form-group m-l10">
                        <label class="title pull-left">二级场所：</label>
                        <select class="form-control pull-left" name="site_two" id="site">
                            <option value="">请选择二级单位</option>
                            <!--<option value="" selected>请选择场所</option>
                            <!--{foreach from=$site key=i item=item}
                            <!--<option value="{$item.id}" {if $page.params.site == $item.id}selected{/if}>{$item.name}</option>
                            <!--{/foreach}
                        </select>
                    </li>
                    <br/>
                    <li class="form-group m-t3 time-select">
                        <label for="select_year" class="title pull-left">时间：</label>
                        <select id="select_year"  class="form-control w-100 m-r5 pull-left" rel="{$time[0]}" style="max-height: 50px"></select>  <!--年设置rel 可以设置默认的年月日
                        <label for="select_month" class="p-w15" style="display: none"></label>
                        <select id="select_month" class="form-control w-70 m-r5 pull-left" rel="{$time[1]}"></select>  <!--月
                        <label for="select_day" class="p-w15" style="display: none"></label>
                        <select id="select_day" class="form-control w-70 pull-left" rel="{$time[2]}"></select>  <!--日
                        <input type="hidden" value="" id="time" name="time">
                    </li>
                    <li class="form-group pull-right">
                        <button type="submit" class="btn btn-warning">确定</button>
                    </li>
                </ul>
                <input type="hidden" value="{$site_id.id}">
            </form>
        </div>-->
        <div class="col-list m-t20">
            {if $list}
            <ul>
                {foreach from=$list key=i item=item}
                <li class="m-b25">
                    <a href="/radishweb/notice/info?id={$item.id}" data-id2="{$item.user_id}">
                        {if $item.avatar.b}
                        <img src="{$item.avatar.b}" class="pull-left imgWrap" width="60" height="60">
                        {else}
                        <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
                        {/if}
                        <div class="info pull-right p-w89" style="border-bottom:1px solid #c7c7c7;padding-bottom: 28px;">
                            <p> {$item.name}<label class="pull-right" style="color:#999">{$item.time}</label> </p>
                            <p class="">&nbsp;</p>
                            {if $item.images}
                            <div class="show_img">
                                {foreach from=$item.images key=i item=items}
                                <img src="{$items.b}" alt="" class="w-202 h-160 m-b10 m-r10">
                                {/foreach}
                            </div>
                            {else}
                            {if $item.video}
                            <video src="{$item.video}" controls="controls" class="videoMp4"></video>
                            {/if}
                            {/if}
                            <p class="content m-b10">{$item.content|truncate:90:"..."}</p>
                            <P class="m-b10"><label>联系人：</label>{$item.name} <label class="m-l20">联系电话：</label>{$item.phone}</P>
                        </div>
                    </a>
                </li>
                {/foreach}
            </ul>
            {else}
            没有数据
            {/if}
        </div>
    </div>
     {include file="radishweb/widgets/nav/usernav-left.tpl"}
    <!--{include file="radishweb/widgets/nav/nav-primary.tpl"}-->
</div>
<input type="hidden" value="{$site_id.name}" id="site_id">
<input type="hidden" value="" id="positionCity">
<input type="hidden" id="SearchCity" data-province="{$get.province}" data-city="{$get.city}" data-area="{$get.area}" data-site="{$get.site}">
{include file="radishweb/widgets/page/page.tpl"}
<link rel="stylesheet" href="list.css"><!--
<link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
<link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />

<script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
<script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
<script src="/libs/birthday/birthday.js"></script>
<!--<script src="/libs/map/gaodeMap.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=b253a2b2c53202149a1e6f1aa1e90a88&plugin=AMap.CitySearch"></script>
<script src="list.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}
noticsBetter.css
<link rel="stylesheet" type="text/css" href="/css/noticsBetter.css" />-->
{include file="radishweb/widgets/footer/footer.tpl"}