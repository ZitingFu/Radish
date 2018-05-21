{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-830 pull-right wrap-content section">
        <div class="titlebar m-t0">
            <label>我的私信</label>
        </div>
        <div class="col-list">
            <ul class="list-group">
                <li class="list-group-item listHead">
                        <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
                    <div class="dialogue">
                        <p class="dialogue_content">dqwdqwdqwdqwdqwdqwdqwdq</p>
                        <p class="dialogue_time">12121212121&nbsp;&nbsp;&nbsp;&nbsp;<a>查看对话</a>&nbsp;&nbsp;|&nbsp;&nbsp;删除</p>
                    </div>
                </li>
                <li class="list-group-item listHead">
                    <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
                    <div class="dialogue">
                        <p class="dialogue_content">dqwdqwdqwdqwdqwdqwdqwdq</p>
                        <p class="dialogue_time">12121212121&nbsp;&nbsp;&nbsp;&nbsp;<a>查看对话</a>&nbsp;&nbsp;|&nbsp;&nbsp;删除</p>
                    </div>
                </li>
                <li class="list-group-item listHead">
                    <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
                    <div class="dialogue">
                        <p class="dialogue_content">dqwdqwdqwdqwdqwdqwdqwdq</p>
                        <p class="dialogue_time">12121212121&nbsp;&nbsp;&nbsp;&nbsp;<a>查看对话</a>&nbsp;&nbsp;|&nbsp;&nbsp;删除</p>
                    </div>
                </li>
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
{/if} <link rel="stylesheet" href="0.css">
{include file="radishweb/widgets/footer/footer.tpl"}