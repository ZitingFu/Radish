{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30 paddingLg">
    <div class="content w-830 pull-right wrap-content section w-baifen80">
        <div class="titlebar m-t0">
            <label>发送私信</label>
        </div>
        <form id="form-create" style="overflow: hidden">
            <input type="hidden" value="0" name="type">
            <input type="hidden" value="{$to.id}" name="to">
            <input type="hidden" value="{$identifier}" name="identifier">
            <div class="form-group form-content">
                <label for="content" class="font-14"></label>
                <textarea name="body" id="forup" class="form-control p-w100 m-t5 txt1" rows="8" maxlength="500" placeholder="发送给：{$to.name}"></textarea>
                <span class="txtbar1">(0/500)</span>
            </div>
            <button type="button" class="btn btn-warning btn-primary pull-right w-217 h-36" style="width: 224px;">发送</button>
        </form>
        {if $list}
        <ul class="list-group">
            {foreach from=$list key=i item=item}
            <li class="list-group-item listHead" data-id2="{$item.from}">
                {if $item.img}
                <img src="{$item.img}" class="pull-left imgWrap" width="60" height="60">
                {else}
                <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
                {/if}
                <div class="dialogue">
                    <p class="dialogue_content">{$item.name}：{if $item.type ==1} <img src="{$item.body.m0}" alt="" style="display: inline-block" width="50" height="50">{else if $item.type==0}{$item.body.cnt}{else if $item.type==2}收到语音,请在App端查看{else if $item.type==3}收到视频,请在App端查看{/if}</p>
                    <p class="dialogue_time">{$item.create_time|date_format:'%m月%d日  %H:%M'}</p>
                </div>
                <p class="pull-right m-t40"><span class="deleteBody" data-deID="{$item.id}">删除</span></p>
            </li>
            {/foreach}
        </ul>
        {else}
        <p>暂无数据</p>
        {/if}
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
{include file="radishweb/widgets/page/page.tpl"}
<script type="text/javascript" src="/util/FormValid.js"></script>
<link rel="stylesheet" href="body.css">
<script src="body.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}