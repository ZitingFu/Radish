{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-830 pull-right wrap-content section">
        <div class="titlebar m-t0 m-b20">
            <label>个人中心</label>&nbsp;&nbsp;<a href="/radishweb/passport/lovelist?type=1" class="activeLove">爱心值&nbsp;{$pass.love}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/radishweb/question/stat">发布数&nbsp;{$pass.issue_num}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/radishweb/question/foundlist">已找到&nbsp;{$pass.found_num}</a>
        </div>
        <div class="col-list m-t20">
            <div class="love">
                <a  href="/radishweb/passport/lovelist?type=1" {if $love=='1'}class="love_active"{/if}>发布的爱心值</a>
                <a href="/radishweb/passport/lovelist?type=2"{if $love=='2'}class="love_active"{/if}>已找到的爱心值</a>
            </div>
            <ul class="list-group">
                {if $love=='1'}
                {foreach from=$list key=i item=item}
                <li class="list-group-item">
                    <span class="badge">{$item.create_time}</span>
                    发布信息&nbsp +{$item.love}
                </li>
                {/foreach}
                {else}
                {foreach from=$list key=i item=item}
                <li class="list-group-item">
                    <span class="badge">{$item.create_time}</span>
                    已找到&nbsp +{$item.love}
                </li>
                {/foreach}
                {/if}
            </ul>
        </div>
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
{if $page.nc >= 1}
<div class="pagebar">
    <ul class="pagination">
        {if $page.has_prev != 0}
        <li class="paginate_button previous">
            <a href="{$page.uri}&rn={$page.rn}&pn={$page.pn-1}">上一页</a>
        </li>
        {/if} {foreach from=$page.display_pages key=i item=item}
        <li class="paginate_button {if $page.pn==$item} active{/if}">
            <a href="{if $page.pn==$item} javascript:void(0) {else}{$page.uri}&rn={$page.rn}&pn={$item}&type={if $love=='1'}1{else}2{/if}{/if}">{$item}</a>
        </li>
        {/foreach} {if $page.has_next != 0}
        <li class="paginate_button">
            <a href="{$page.uri}&rn={$page.rn}&pn={$page.pn+1}">下一页</a>
        </li>
        {/if}
    </ul>
</div>
{/if} <link rel="stylesheet" href="lovelist.css">
{include file="radishweb/widgets/footer/footer.tpl"}