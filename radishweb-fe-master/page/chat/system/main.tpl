{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30 paddingLg">
    <div class="content w-930 pull-right section w-baifen80" style="padding-top:0">
        <div class="titlebar">
        <label>系统消息</label>
        </div>
        <div class="col-list system">
            {if $list}
            <ul>
                {foreach from=$list key=i item=item}
                <li>
                    <p class="bodtCnt">{$item.body.cnt}</p>
                    <p class="systemTime">{$item.create_time}<span class="cancelled" data-id="{$item.id}">删除</span></p>
                </li>
                {/foreach}
            </ul>
            {else}
            <p>暂无数据</p>
            {/if}
        </div>
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
{include file="radishweb/widgets/page/page.tpl"}
<script src="system.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}