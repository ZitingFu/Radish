  {include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper p-t30 paddingLg">
    <div class="content w-930 pull-right wrap-content section w-baifen80">
      <div class="titlebar m-t0 m-b20">
        <div class="listHead"><a href="/radishweb/passport/myquestion" {if $org !=1}{/if}>我的信息</a>{if $session.type==2}<a href="/radishweb/passport/mynotice2" style="border-right: 2px solid #fff;border-left: 2px solid #fff;">我的公告</a>{/if}<a class="listActive" href="/radishweb/passport/claim">认领审核</a></div>
      </div>
      <div class="col-list m-t20">
        <span class="id none">{$info.id}</span>
        {if $info}
        <div style="border-bottom: 1px solid #e7e7e7;overflow: hidden;">
          <table style="border-collapse: separate;border-spacing: 0 20px;margin-bottom: 11px;">
            <tr>
              <td>认&nbsp;&nbsp;领&nbsp;人：</td>
              <td>{$info.user}</td>
            </tr>
            <tr>
              <td>联系方式：</td>
              <td>{$info.tel}</td>
            </tr>
            <tr>
              <td>证件号码：</td>
              <td>{$info.user_idcard} </td>
            </tr>
            <tr>
              <td>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
              <td>{$info.remark}</td>
            </tr>
          </table>
            <span id="yes" class="btn">同意</span>
            <span id="no" class="btn">拒绝</span>
        </div>
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