{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper">
    <div class="content w-846 pull-right wrap-content section">
        <div class="m-t20 m-b20 head-bar">
            {if $info.avatar.s}
            <img src="{$info.avatar.s}" alt="" class="h-60 w-60">
            {else}
            <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
            {/if}
            <div class="session">
                <h3>{$info.name}</h3>
                <p><span>爱心值&nbsp;{$info.love}</span><b class="lineI"></b><span>发布数&nbsp;{$publish}</span><b class="lineI"></b><span>已找到&nbsp;{$find}</span></p>
            </div>
            <a href="/radishweb/chat/body?to={$info.id}"><button type="button" class="btn btn-outline btn-warning code2 pull-right w-78 m-t13" style="width: 80px;height: 35px;line-height: 35px; padding: 0">私信</button></a>
            <input type="hidden" value="{$fav}" id="favId">
            <input type="hidden" value="{$info.id}"  id="userId">
            <button type="button" id="dsBtn" class="btn btn-outline btn-warning code2  pull-right w-80 h-35 m-t13" style="width: 80px;height: 35px;line-height: 35px; padding: 0">打赏</button>
            {if $fav == 99}
            <button type="button" class="btn btn-outline btn-warning code  pull-right w-80 h-35 m-t13 favLove" style="width: 80px;height: 35px;line-height: 35px; padding: 0">关注</button>
            {else}
            <button type="button" class="btn btn-outline btn-warning code pull-right w-80 h-35 m-t13 fav favLove" style="width: 80px;height: 35px;line-height: 35px; padding: 0">已关注</button>
            {/if}
        </div>
        <div class="col-list">
            <div class="listHead"><a href="/radishweb/passport/center?id={$info.id}" {if $org !=1}class="listActive"{/if}>信息</a>{if $info.type!=0}<a href="/radishweb/passport/center?id={$info.id}&org=1" {if $org ==1}class="listActive"{/if}>公告</a>{/if}</div>
            {if $list}
            <ul class="p-t20">
                {if $org ==1}
                {foreach from=$list key=i item=item}
                <li class="m-b25">
                    <a href="/radishweb/question/info?id={$item.id}" data-id2="{$item.user_id}">
                        {if $info.avatar.b}
                        <img src="{$info.avatar.b}" class="pull-left imgWrap" width="60" height="60">
                        {else}
                        <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
                        {/if}
                        <div class="info pull-right p-w91">
                            <p> {$item.user_name}<label class="pull-right">{$item.time}</label> </p>
                            <p class="m-t10 m-b10">{$item.genre_name}</p>
                            {if $item.images}
                            <div class="show_img ">
                                {foreach from=$item.images key=i item=items}
                                <img src="{$items.b}" alt="" class="w-248 h-160 m-b10 m-r10">
                                {/foreach}
                            </div>
                            {/if}
                            <p class="content m-b10">{$item.content|truncate:100:"..."}</p>
                            <!--<P class="m-b10"><label>联系人：</label>{$item.name} <label class="m-l20">联系电话：</label>{$item.phone}</P>-->
                        </div>
                    </a>
                </li>
                {/foreach}
                {else}
                {foreach from=$list key=i item=item}
                <li class="m-b25">
                    <a href="/radishweb/question/info?id={$item.id}" data-id2="{$item.user_id}">
                        {if $info.avatar.b}
                        <img src="{$info.avatar.b}" class="pull-left imgWrap" width="60" height="60">
                        {else}
                        <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60">
                        {/if}
                        <div class="info pull-right p-w91">
                            <p> {$item.name}<label class="pull-right">{$item.time}</label> </p>
                            <p class="m-t10 m-b10">{$item.genre_name}</p>
                            {if $item.images}
                            <div class="show_img ">
                                {foreach from=$item.images key=i item=items}
                                <img src="{$items.b}" alt="" class="w-248 h-160 m-b10 m-r10">
                                {/foreach}
                            </div>
                            {/if}
                            <p class="content m-b10">{$item.content|truncate:100:"..."}</p>
                            <P class="m-b10"><label>联系人：</label>{$item.name} <label class="m-l20">联系电话：</label>{$item.phone}</P>
                        </div>
                    </a>
                </li>
                {/foreach}
                {/if}
            </ul>
            {else}
            <p>暂无数据</p>
            {/if}
        </div>
    </div>
</div>

<!--打赏-->
<div class="Cover">
    <div class="m-Cover" id="Cover1">
        <div class="m-title">打赏<img src="/images/Onclose.png" alt="关闭"></div>
        <div class="m-list">
            <span>打赏金币:</span>
            <ul>
                <li data-money="1" class="active">1金币</li>
                <li data-money="5">5金币</li>
                <li data-money="10">10金币</li>
                <li data-money="20">20金币</li>
                <li data-money="50">50金币</li>
                <li data-money="100">100金币</li>
            </ul>
            <input type="hidden" value="{$info.id}" id="topicId">
            <input type="hidden" value="" id="orderId">
            <input type="hidden" value="1" id="dataMoney">
            <input type="hidden" value="{$banlance}" id="banlance">
            <input type="text" name="gold" class="gold" autocomplete="off" placeholder="请输入您的打赏金币数量">
            <p class="goldInadequate">金币余额不足，当前余额{$banlance}金币 <a href="/radishweb/money/default">去充值</a></p>
            <button type="button" class="btn btn-warning w-130 h-36  m-l72 m-t30" id="withdraw">确认支付</button>
        </div>
    </div>
    <div class="m-Cover" id="Cover2">
        <div class="m-title">输入密码<img src="/images/Onclose.png" alt="关闭"></div>
        <div class="m-password">
            <p>请输入支付密码</p>
            <!---->
            <div class='virbox'>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
            <br><br>
            <input type="password" class="realbox" maxlength="6" id="Passw"  autocomplete="off">
            <i class="virboxI"></i>
            <!--支付密码-->
        </div>
        <!---->
        <button id="topicPass" type="button" class="btn btn-warning w-130 h-36">确定</button>
        <div class="forget-password m-t16">
            <a href="/radishweb/passport/modifywithdrawpass?id={$info.id}&type=4">忘记密码 ?</a>
        </div>
    </div>
</div>
<input type="hidden" id="session"  value="{$session.id}">
<input type="hidden" class="topicId" value="{$info.id}">
{include file="radishweb/widgets/page/page.tpl"}
<link rel="stylesheet" href="center.css">
<script src="center.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}