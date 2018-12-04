  {include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper p-t30 paddingLg">
    <div class="content w-930 pull-right wrap-content section w-baifen80">
      <div class="titlebar m-t0 m-b20">
        <div class="listHead"><a href="/radishweb/passport/myquestion" {if $org !=1}class="listActive"{/if}>我的信息</a>{if $session.type==2}<a href="/radishweb/passport/mynotice2" style="border-right: 2px solid #fff;">我的公告</a>{/if}<a href="/radishweb/passport/claim">认领审核</a></div>
      </div>
      <div class="col-list m-t20">
        {if $question}
        <ul>
          {foreach from=$question key=i item=item}
          <li class="m-b25" style="border-bottom: 1px solid #c7c7c7;">
<!--             <a href="/radishweb/question/info?id={$item.id}">-->
              {if $session.avatar}<img src="{$session.avatar.s}" class="pull-left" width="60" height="60">{else}<img src="/images/avatar2.png" width="60" height="60" class="pull-left">{/if}
              <div class="info pull-right p-w91 p-b15" data-id="{$item.id}" data-open="{$item.open}">
                <a href="/radishweb/question/info?id={$item.id}">
                <p>{$session.name}{$item.subname}<label class="pull-right" style="color:#999">{$item.time}</label> </p>
                <p class="m-t10 m-b10">{$item.genre_name}</p>
                  {if $item.status ==!11}
                  {if $item.images}
                  <div class="show_img">
                    {foreach from=$item.images key=i item=items}
                    <img src="{$items.b}" alt="" class="w-248 h-160 m-b10 m-r10">
                    {/foreach}
                  </div>
                  {else}
                  {if $item.video}
                  <video src="{$item.video}" controls="controls" class="videoMp4"></video>
                  {/if}
                  {/if}
                  {else}
                  {if $item.f_g_id ==1 || $item.f_g_id ==2 }
                  <div class="show_img ">
                    <img src="/images/yizhaodao.png" alt="" class="w-248 h-160 m-b10 m-r10">
                  </div>
                  {/if}
                  {if $item.f_g_id ==3 || $item.f_g_id ==4 }
                  <div class="show_img ">
                    <img src="/images/yirenl.png" alt="" class="w-248 h-160 m-b10 m-r10">
                  </div>
                  {/if}
                  {/if}
                <p class="content m-b10">{$item.content|truncate:100:"..."}</p>
                <P class="m-b10"><label>联系人：</label>{$item.name} <label class="">联系电话：</label>{$item.phone}</P>
                </a>
                  {if $session.type == '2'}
                  <a class="btn-a" href="/radishweb/question/barcode?id={$item.id}&Release=y">打印条形码</a>
                {/if}
                {if $item.status !== '11'}
                {if $item.f_g_id ==1 || $item.f_g_id ==2 }
                <a class="btn-a btn-find"  data-toggle="modal" data-target="#find-confirm" data-love="{if $item.f_g_id==1||$item.f_g_id==2}1{else if $item.f_g_id==3||$item.f_g_id==4}3{/if}">寻找中</a>
                {/if}
                {if $item.f_g_id ==3 || $item.f_g_id ==4 }
                <a class="btn-a btn-find"  data-toggle="modal" data-target="#find-confirm" data-love="{if $item.f_g_id==1||$item.f_g_id==2}1{else if $item.f_g_id==3||$item.f_g_id==4}3{/if}">认领中</a>
                {/if}
                {else}
                {if $item.f_g_id ==1 || $item.f_g_id ==2 }
                <a class="btn-a btn-find"  style="cursor: auto">已找到</a>
                {/if}
                {if $item.f_g_id ==3 || $item.f_g_id ==4 }
                <a class="btn-a btn-find"  style="cursor: auto">已认领</a>
                {/if}
                {/if}
                <div class="dian">
                  <p>
                    <span></span>
                    <span></span>
                    <span></span>
                  </p>
                </div>
                <span class="3dian" style="opacity: 0">
                <a class="btn-a" href="/radishweb/passport/editquestion?id={$item.id}">修改信息</a>
                <a class="btn-a btn-delete"  data-toggle="modal" data-target="#delete-confirm">删除信息</a>
                <a class="btn-a btn-delete"  data-toggle="modal" data-target="#edit-confirm">{if $item.open ==0}关闭信息{else}开启消息{/if}</a>
                </span>
              </div>
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
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
  <link rel="stylesheet" href="myquestion.css">
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
  
  <script src="index.js"></script>

{include file="radishweb/widgets/footer/footer.tpl"}