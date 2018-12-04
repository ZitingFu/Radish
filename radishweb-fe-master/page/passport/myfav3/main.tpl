{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30 paddingLg">
    <div class="content w-930 pull-right wrap-content section w-baifen80">
        <div class="titlebar m-t0">
            <label>我的关注</label>
        </div>
        <div class="col-list fav3List">
            {if $question}
            <ul>
                {foreach from=$question key=i item=item}
                <li data-id2="{$item.id}">
                    {if $item.avatar.b}
                    <img src="{$item.avatar.b}" alt=""  width="60" height="60" class="pull-left imgWrap">
                    {else}
                    <img src="//img1.yunbix.cn/radishweb/static/images/avatar2_d7af2a3.png" class="pull-left imgWrap" width="60" height="60">
                    {/if}
                    <div class="session">
                    <h3>{$item.name}</h3>
                     <p><span>爱心值&nbsp;{$item.love}</span><b class="lineI"></b><span>发布数&nbsp;{$item.publish}</span><b class="lineI"></b><span>已找到&nbsp;{$item.find}</span></p>
                    </div>
                    <p class="cancelled" data-id="{$item.id}">取消关注</p>
                </li>
                {/foreach}
            </ul>
            {else}
            暂无数据
            {/if}
        </div>
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
{include file="radishweb/widgets/page/page.tpl"}
<link rel="stylesheet" href="myfav3.css">
<script src="myfav3.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}