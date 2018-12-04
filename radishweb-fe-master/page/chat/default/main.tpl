{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30 paddingLg">
    <div class="content w-930 pull-right wrap-content section w-baifen80">
        <div class="titlebar m-t0">
            <label>我的私信</label>
        </div>
        <div class="col-list">
            {if $list}
            <ul class="list-group">
                {foreach from=$list key=i item=item}
                <li class="list-group-item listHead" data-id2="{$item.from}">
                    {if $item.count> 0}<i class="redDots"></i>{/if}
                    {if $item.img}
                    <img src="{$item.img}" class="pull-left imgWrap" width="60" height="60">
                    {else}
                    <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
                    {/if}
                    <input type="hidden" value="{$item.count}" class="itemCount">
                    <div class="dialogue">
                        <p class="dialogue_content">{$item.name}：{if $item.last_type ==1}<img src="{$item.last_message}" alt="" width="50" height="50">{else}{$item.last_message}{/if}</p>
                        <p class="dialogue_time">{$item.last_time}</p>
                    </div>
                    <p class="pull-right m-t40"><a href="/radishweb/chat/body?to={$item.to}&identifier={$item.identifier}" class="deleteBody">查看对话</a>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="deleteBody" data-deID="{$item.identifier}">删除</span></p>
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
<link rel="stylesheet" href="list.css">
<script src="default.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}