{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-930 pull-right section">
        <!--<div class="titlebar m-t0 m-b20">-->
            <!--<label>我的收藏</label>-->
        <!--</div>-->
        <div class="titlebar2 m-b20">
            <div class="listHead"><a href="/radishweb/passport/myfav">信息</a>{if $session.type=='2'}<a
                    href="/radishweb/passport/myfav2" class="listActive">公告</a>{/if}
            </div>
        </div>
        <div class="col-list">
            {if $question}
            <ul>
                {foreach from=$question key=i item=item}
                <li class="m-b25">
                    <a href="/radishweb/notice/info?id={$item.id}" data-id2="{$item.user_id}">
                        {if $item.avatar.b}
                        <img src="{$item.avatar.b}" class="pull-left imgWrap" width="60" height="60">
                        {else}
                        <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
                        {/if}
                        <div class="info pull-right p-w91">
                            <p> {$item.user_name}<label class="pull-right">{$item.create_time}</label> </p>
                            <p class="m-t10 m-b20"> </p>
                            {if $item.images}
                            <div class="show_img">
                                {foreach from=$item.images key=i item=items}
                                <img src="{$items.b}" alt="" class="w-248 h-160 m-b10 m-r10">
                                {/foreach}
                            </div>
                            {/if}
                            <p class="content m-b10">{$item.content|truncate:100:"..."}<span class="cancelled" data-id="{$item.id}">取消关注</span></p>
                            <!--<P class="m-b20"><label>联系人：</label>{$item.name} <label class="m-l20">联系电话：</label>{$item.phone}</P>-->
                        </div>
                    </a>
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
<link rel="stylesheet" href="myfav2.css">
<script src="myfav2.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}