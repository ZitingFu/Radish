{include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper p-t30">
    <div class="guanggao1">
      <div class="content w-830 pull-right w-baifen80">
        <div class="titlebar m-t0 m-b20">
          <label>发布公告</label>
        </div>
        <form id="form-create" class="p-l5 p-r5">
          <div class="form-group form-content">
            <textarea class="form-control m-t5 txt1" rows="8" name="content" placeholder="请输入发布公告内容" maxlength="500" id="contentwp"></textarea>
            <span class="txtbar1">(0/500)</span>
          </div>
          <!--<p class="pull-right txtbar1">0/500</p>-->
          <p class="text-left pull-left p-w30">
            <button type="button" class="btn btn-warning btn-primary p-w100 fabu">发布</button>
          </p>
        </form>
      </div>
    </div>
    <div class="guanggao">
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
    </div>
  </div>
  <!--select2-->
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
 
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
  <script src="index.js"></script> 

