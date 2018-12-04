{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-830 pull-right wrap-content section">
        <div class="titlebar m-t0">
            <label>个人中心</label>&nbsp;&nbsp;
             <a href="/radishweb/passport/balance?type=1">余额账户&nbsp;</a><b class="lineI"></b>
            <a href="/radishweb/passport/lovelist?type=1">爱心值&nbsp;{$pass.love}</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="/radishweb/question/stat"  class="activeLove">发布数&nbsp;{$pass.issue_num}</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="/radishweb/question/foundlist">已找到&nbsp;{$pass.found_num}</a>
        </div>
        <div class="col-list">
            <ul class="list-group">
                {foreach from=$stat key=i item=item}
                <li class="list-group-item">
                    <a href="/radishweb/question/listbytype?type={$item.id}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$item.name}
                    <span class="badge">{$item.count}</span>
                    </a>
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
{include file="radishweb/widgets/page/page.tpl"}
<style>
    @media only screen and (min-width: 1200px) {
        body .leftpop{
            display: block;
        }
    }
</style>
<link rel="stylesheet" href="stat.css">
{include file="radishweb/widgets/footer/footer.tpl"}