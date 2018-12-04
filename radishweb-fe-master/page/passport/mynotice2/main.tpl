{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-840 pull-right wrap-content section w-baifen80">
        <div class="titlebar m-t0 m-b20">
            <div class="listHead"><a href="/radishweb/passport/myquestion" >我的发布</a>{if $session.type==2}<a href="/radishweb/passport/mynotice2" class="listActive">我的公告</a>{/if}<a href="/radishweb/passport/claim">认领审核</a></div>
        </div>
        <div class="col-list m-t20">
            {if $question}
            <ul>
                {foreach from=$question key=i item=item}
                <li class="m-b25">
                    <!--             <a href="/radishweb/question/info?id={$item.id}">-->
                    {if $session.avatar}<img src="{$session.avatar.s}" class="pull-left" width="60" height="60">{else}<img src="/images/avatar2.png" width="60" height="60" class="pull-left">{/if}
                    <div class="info pull-right p-w91 p-b15" data-id="{$item.id}" data-open="{$item.open}">
                        <a href="/radishweb/notice/info?id={$item.id}">
                            <p> {$session.name}<label class="pull-right">{$item.time}</label> </p>
                            <p class="m-t10 m-b10">{$item.genre_name}</p>
                            {if $item.images}
                            <div class="show_img ">
                                {foreach from=$item.images key=i item=items}
                                <img src="{$items.b}" alt="" class="w-248 h-160 m-b10 m-r10">
                                {/foreach}
                            </div>
                            {else}
                            {if $item.video}
                            <video src="{$item.video}" controls="controls" class="videoMp4"></video>
                            {/if}
                            {/if}
                            <p class="content m-b10">{$item.content|truncate:100:"..."}</p>
                            <!--<P class="m-b10"><label>联系人：</label>{$item.name} <label class="m-l20">联系电话：</label>{$item.phone}</P>-->
                        </a>
                        <a class="btn-a" href="/radishweb/notice/edit?id={$item.id}">修改信息</a>
                        <a class="btn-a btn-delete" data-toggle="modal" data-target="#delete-confirm">删除信息</a>
                        <a class="btn-a btn-delete" data-toggle="modal" data-target="#edit-confirm">{if $item.open ==0}关闭信息{else}开启消息{/if}</a>
                    </div>
                    <!--             </a>-->
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
<!--find-->
<div class="modal fade" id="find-confirm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">已找到</h4>
            </div>
            <form class="modal-body">
                <input type="hidden" name="id" class="list-id" value="">
                <div class="form-group form-remark">
                    <label for="remark" class="control-label">内容</label>
                    <textarea class="form-control m-t5 txt1" rows="8" name="remark" id="forup" maxlength="500"></textarea>
                    <span class="txtbar1">(0/500)</span>
                </div>
                <p class="text-right">
                    <button type="button" class="btn btn-primary">确认</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </p>
            </form>
        </div>
    </div>
</div>
<!--delete-->
<div class="modal fade" id="delete-confirm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">删除确认</h4>
            </div>
            <form class="modal-body">
                <p>确定要将该信息从系统中删除么?</p>
                <input type="hidden" name="id" class="list-id" value="">
                <p class="text-right m-t10">
                    <button type="button" class="btn btn-primary">确认</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </p>
            </form>
        </div>
    </div>
</div>
<!--edit-->
<div class="modal fade" id="edit-confirm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <form class="modal-body">
                <p class="body-title">确定要将该信息从系统中{if $info.open ==0}开启{else}关闭{/if}么?</p>
                <input type="hidden" name="id" class="list-id" value="">
                <input type="hidden" name="open" value="" class="list-open">
                <p class="text-right m-t10">
                    <button type="button" class="btn btn-primary">确认</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                </p>
            </form>
        </div>
    </div>
</div>
<!--FormValid-->
<script type="text/javascript" src="/util/FormValid.js"></script>
<!--select2-->
<style>
    @media (min-width: 1200px){
        body .leftpop {
            display: block;
        }
    }
</style>
<link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
<link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
<link rel="stylesheet" href="mynotice2.css">
<script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
<script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>

<script src="index.js"></script>

{include file="radishweb/widgets/footer/footer.tpl"}