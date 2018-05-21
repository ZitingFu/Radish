{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<link rel="stylesheet" href="info.css">
<div class="wrapper p-t30">
    <div class="content w-830 container">
        <div class="details clearFix m-b50" data-id2="{$info.user_id}">
            {if $info.avatar}
            <img src="{$info.avatar.b}" class="pull-left imgWrap" width="60" height="60" style="cursor: pointer">
            {else}
            <img src="/images/avatar2.png" class="pull-left imgWrap" width="60" height="60" style="cursor: pointer">
            {/if}
            <div class="info pull-right p-w90">
                <p class="clearFix"> <label class="pull-left">{$info.user_name}</label> <label class="grey m-l20 pull-left m-t2">爱心值 · {$info.love}  发布数 · {$info.user_issue}   找到数 · {$info.user_find} </label> <label class="pull-right">{$info.time}</label> </p>
                <p class="m-t10 m-b10">&nbsp;</p>
                <!--{if $info.remark}<p class="m-t12 m-b12">已找到：{$info.remark}</p>{/if}-->
                {if $info.images}
                <p class="images m-b15" id="pimg">
                    {foreach from=$info.images key=i item=item}
                    <img src="{$item.image.b}" width="240" height="160" data-imgIndex="{$i}">
                    {/foreach}
                </p>
                {else}
                {if $info.video}
                <video src="{$info.video}" controls="controls" class="videoMp4"></video>
                {/if}
                {/if}
                <input type="hidden" value="{$fav}" id="favId">
                <input type="hidden" value="{$info.id}"  id="userId">
                <p class="content m-b30">{$info.content}</p>
                {if $session.id !== $info.user_id}
               <!-- <button type="button" class="btn btn-outline btn-warning  w-100 h-28 p-play" >打赏</button>-->
                {if $fav==99}
                <button type="button" class="btn btn-outline btn-warning  w-100 h-28 collection">收藏</button>
                {else}
                <button type="button" class="btn  btn-warning  w-100 h-28 collection">已收藏</button>
                {/if}
                {/if}
                <!--<P class="m-b20"><label>联系人：</label>{$info.name} <label class="m-l20">联系电话：</label>{$info.phone}</P>-->
            </div>
            <div id="alImg">
                <img src="/images/lbClose.png" alt="" class="gbClose">
                <img src="/images/lbLeft.png" alt="" class="gbLeft">
                <img src="/images/lbRight.png" alt="" class="gbRight">
                <div id="alertImg"><img src="" alt="logo" class="logPng"></div>
            </div>
            {if $session.id == $info.user_id || $session.type !== '0'}
            <div class="desc pull-right p-w90">
                <!--<div class="titlebar">-->
                    <!--备注-->
                    <!--{if !$session.id}-->
                    <!--<a href="/radishweb/passport/login" class="pull-right add">添加备注</a>-->
                    <!--{elseif $session.id !== $info.user_id}-->
                    <!--<a type="button" class="pull-right add" data-toggle="modal" data-target="#addModal" data-id="{$info.id}" >添加备注</a>-->
                    <!--{/if}-->
                <!--</div>-->
                {if $info.note}
                <div class="list">
                    <ul>
                        {foreach from=$info.note key=i item=item}
                        <li class="m-b10 p-b10">
                            {if $item.avatar}
                            <img src="{$item.avatar.b}" class="pull-left" width="40" height="40">
                            {else}
                            <img src="/images/avatar2.jpg" class="pull-left" width="40" height="40">
                            {/if}
                            <div class="pull-right info p-w92">
                                <p> <label class="name m-r20">{$item.user_name}</label> <label class="grey">{$item.create_time}</label> </p>
                                <p class="content m-b15">{$item.content}</p>
                            </div>
                        </li>
                        {/foreach}
                    </ul>
                </div>
                {/if}
            </div>
            {/if}

            <div class="desc pull-right p-w90">
                <div class="titlebar">
                    评论 {if $session.id !== $info.user_id}<a type="button" class="pull-right rep" data-toggle="modal" data-target="#preModal" data-id="{$info.id}" >举报该信息</a>{/if}
                </div>
                {if $info.comments}
                <div class="list">
                    <ul>
                        {foreach from=$info.comments key=i item=item}
                        <li class="m-b10 p-b10">
                            {if $item.avatar}
                            <img src="{$item.avatar.b}" class="pull-left" width="40" height="40">
                            {else}
                            <img src="/images/avatar.jpg" class="pull-left" width="40" height="40">
                            {/if}
                            <div class="pull-right info p-w92">
                                <p class="name-bar">
                                    <label class="name m-r20">{$item.user_name}</label>
                                    <label class="grey m-r20 m-t2">{$item.create_time} </label>
                                    {if $session.id}
                                    {if $item.is_like == 0}
                                    <a type="button" class="pra m-r10 is_pra" data-id="{$item.id}">
                                        {else}
                                        <a type="button" class="pra m-r10 un_pra" data-id="{$item.id}">
                                            {/if}
                                            {else}
                                            <a href="/radishweb/passport/login" class="m-r10" >
                                                {/if}
                                                <img src="/images/pra.png" width="16" class="pull-left m-r5 is_pra {if $item.is_like == 1}collapse{/if}">
                                                <img src="/images/pra2.png" width="16" class="pull-left m-r5 un_pra {if $item.is_like == 0}collapse{/if}">
                                                <span>{$item.num_like}</span>
                                            </a>
                                            {if $session.id}
                                            {if $session.id !== $item.user_id}
                                            <a type="button" class="com" data-id="{$info.id}" data-toid="{$item.id}" data-type="2" data-name="{$item.user_name}">
                                                {/if}
                                                {else}
                                                <a href="/radishweb/passport/login">
                                                    {/if}
                                                    <img src="/images/com.png" width="16" class="pull-left m-r5 com">
                                                    <img src="/images/com-2.jpg" width="16" class="pull-left m-r5 com2 collapse">
                                                </a>
                                </p>
                                <p class="content m-b15">
                                    {if $item.to_id !== '0'}
                                    回复:<label class="orange">{$item.to_user_name}</label>
                                    {/if}
                                    {$item.content}
                                </p>
                            </div>
                        </li>
                        {/foreach}
                    </ul>
                </div>
                {/if}
            </div>

            {if $session.id}
            <div class="pull-right p-w90 m-t20" id="comments">
                <form class="form" >
                    <input type="hidden" name="notice_id" class="classid" value="{$info.id}">
                    <input type="hidden" name="to_id" class="toid" value="0">
                    <input type="hidden" name="type" class="classtype" value="0">
                    <p class="coms collapse m-b15">回复：<label></label></p>
                    <div class="form-group form-content">
                        <textarea  class="form-control com-content txt1" rows="12" name="content" maxlength="300" placeholder="输入在这里开始"></textarea>
                        <span class="txtbar1">(0/300)</span>
                    </div>
                    <button type="button" id="subCon"  class="btn btn-warning m-t15 btn-primary w-217">提交</button>
                </form>
            </div>
            {/if}
        </div>
    </div>
   <!-- <div class="sidebar pull-left w-138">
        <ul>
            {foreach from=$site key=i item=item}
            <li class="{if $item.id==$info.site}active{/if}"><a href="/radishweb/notice/list?site={$item.id}">{$item.name}</a> </li>
            {/foreach}
        </ul>
        <button>显示全部</button>
    </div>-->
</div>
{include file="radishweb/widgets/page/page.tpl"}

<!--add-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加备注</h4>
            </div>
            <form class="modal-body" id="bzop">
                <input type="hidden" name="cotice_id" class="classid" value="">
                <input type="hidden" name="type" id="type" value="1">
                <input type="hidden" name="to_id" value="0">
                <div class="form-group form-content1">
                    <label class="control-label">内容</label>
                    <textarea class="form-control m-t5 txt1" rows="8" name="content1" maxlength="300"></textarea>
                    <span class="txtbar1">(0/300)</span>
                </div>
                <p class="text-right">
                    <button type="button" class="btn btn-primary" >确认</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </p>
            </form>
        </div>
    </div>
</div>
<!--pre-->
<div class="modal fade" id="preModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">举报</h4>
            </div>
            <form class="modal-body" id="note">
                <input type="hidden" name="q_id" class="classid" value="{$info.id}">
                <div class="form-group form-note">
                    <label class="control-label">内容</label>
                    <textarea class="form-control m-t5 txt1" rows="8" name="note" maxlength="300"></textarea>
                    <span class="txtbar1">(0/300)</span>
                </div>
                <p class="text-right">
                    <button type="button" class="btn btn-primary">确认</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </p>
            </form>
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
            <input type="hidden" value="1" id="dataMoney" data-rate="{$rate}">
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
            <a href="/radishweb/passport/modifywithdrawpass?id={$info.id}&type=2">忘记密码 ?</a>
        </div>
    </div>
</div>

<input type="hidden" id="session"  value="{$session.id}">
<!--select2-->
<link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
<link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" /  >
<script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
<script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
<!--FormValid-->
<script type="text/javascript" src="/util/FormValid.js"></script>

<script src="info.js"></script>

{include file="radishweb/widgets/footer/footer.tpl"}