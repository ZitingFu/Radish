{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-841 pull-right wrap-content section">
        <div class="titlebar m-t0 m-b20">
            <label>个人中心</label>&nbsp;&nbsp;<a href="/radishweb/passport/lovelist?type=1">爱心值&nbsp;{$pass.love}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/radishweb/question/stat"  class="activeLove">发布数&nbsp;{$pass.issue_num}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/radishweb/question/foundlist">已找到&nbsp;{$pass.found_num}</a>
        </div>
        <div class="col-list m-t20">
            {if $list}
            <ul>
                {foreach from=$list key=i item=item}
                <li class="m-b25">
                    <a href="/radishweb/question/info?id={$item.id}" data-id2="{$info.user_id}">
                        {if $session.avatar.b}
                        <img src="{$session.avatar.b}" class="pull-left imgWrap" width="60" height="60">
                        {else}
                        <img src="1.png" class="pull-left imgWrap" width="60" height="60">
                        {/if}
                        <div class="info pull-right p-w91">
                            <p> {$item.user_name}<label class="pull-right">{$item.time}</label> </p>
                            <p class="m-t10 m-b10">{$item.gen_name}</p>
                            <div class="show_img">
                                {foreach from=$item.images key=i item=items}
                                <img src="{$items.images.b}" alt="" class="w-248 h-160 m-b10 m-r10">
                                {/foreach}
                            </div>
                            <p class="content m-b10">{$item.content|truncate:100:"..."}</p>
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
    <div id="left">
         {include file="radishweb/widgets/nav/usernav-left.tpl"}
    </div>
</div>
{include file="radishweb/widgets/page/page.tpl"}
<link rel="stylesheet" href="listbytype.css">
{include file="radishweb/widgets/footer/footer.tpl"}