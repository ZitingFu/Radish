{include file="radishweb/widgets/header/header.tpl"}

<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper container">
    <img class="registerImg pull-left" src="http://img.qa.xluob.com/%E6%B3%A8%E5%86%8C%E9%A1%B5%E9%9D%A2_03.png">
    
      <div class="section reg m-height pull-right">
      <h3>欢迎来到小萝卜注册中心</h3>
      <div class="content-border">
        
        <div class="titlebar m-t36 m-b45">
          <label>注册</label> 第一步 > <span class="user1">志愿者</span>
        </div>
        <form id="form-create">
          <input type="hidden" name="type" value="{$type}">
          <input type="hidden" name="id" value="{$id}">
          <ul class="clearFix w-310">
            <div id="form-location" class="form-group form-location">
              <input type="hidden" id="loca-input" name="location" class="form-control" value="">
              <li class="form-group">

                <select class="form-control p-w70 pull-right" name="province" id="province"></select>
                <label for="phone" class="p-w25">区域</label>
              </li>
              <li class="form-group collapse">
                <select class="form-control p-w70 pull-right" name="city" id="city"></select>
              </li>
              <li class="form-group collapse">
                <select class="form-control p-w70 pull-right" name="area" id="area"></select>
              </li>
            </div>
            <li class="form-group form-name">
              <input id="name" name="name" type="text" class="form-control p-w70 pull-right" placeholder="请填写真实姓名" {if $apply.status == 2} value="{$apply.name}" {/if}>
              <label for="name" class="p-w25">真实姓名</label>
            </li>
            <li class="form-group form-card_num">
              <input id="card_num" name="card_num" type="text" class="form-control p-w70 pull-right" placeholder="请填写身份证号" {if $apply.status == 2} value="{$apply.card_num}" {/if}>
              <label for="card_num" class="p-w25">身份证号</label>
            </li>
            <li class="form-group form-address">
              <input id="address" name="address" type="text" class="form-control p-w70 pull-right" placeholder="请填写单位名称" {if $apply.status == 2} value="{$apply.address}" {/if}>
              <label for="address" class="p-w25">单位名称</label>
            </li>
            <li class="form-group">
              <input type="hidden" name="img" value="">
              <label for="name" class="p-w25 pull-left">上传证件照</label>
              <a id="upload" data-toggle="modal" data-target="#img-upload-confirm" class="m-l15"><img src="/images/picadd.png"> </a>
              <div class="form-group m-t10 collapse p-w70 pull-right">
                <div class="img-list"></div>
              </div>
            </li>
            <li class="sampleImg">
              <label class="Img">示例照片</label>
              <img src="/images/identity.jpg" alt="身份示例照片" class="img1">
              <img src="/images/identity1.jpg" alt="身份示例照片" class="img1">
              <div class="sampleP">
                <p>1.请手持身份证自拍一张，证明您本人</p>
                <p>2.请拍一张身份证正面照片</p>
              </div>
            </li>
            <li class="form-group lastBtn">
              <button type="button" class="btn btn-warning btn-primary p-w70 pull-right">提交申请</button>
              <label class="p-w25"></label>
            </li>
          </ul>
        </form>
      </div>
    </div>
  </div>
  <div class="modal fade" id="img-upload-confirm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">上传图片</h4>
        </div>
        <div id="shortcut-card" class="modal-body">
          <div class="table-responsive">
            <p class="add-file">
              <span class="btn btn-success fileinput-button">
                  <i class="fa fa-plus fa-fw"></i>
                  <span>添加并上传</span>
              <input type="file" multiple accept="image/*">
              </span>
            </p>
            <table class="table table-striped table-hover table-file-upload m-t20">
              <tr>
                <th>预览</th>
                <th>状态</th>
                <th></th>
              </tr>
            </table>
          </div>
          <p class="help-block">最多上传<code>2</code>个图片，请确认每个图片小于<code>10MB</code>。您也可以将需要上传的图片拖动到此处。</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary">确认</button>
          <button type="button" class="btn btn-danger btn-cancel" data-dismiss="modal">取消</button>
        </div>
      </div>
    </div>
  </div>


  <!--select2-->
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>

  <!--FileUpload-->
  <link rel="stylesheet" type="text/css" href="/util/FileUpload/FileUpload.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />
  <script type="text/javascript" src="/util/FileUpload/FileUpload.js"></script>

  <!--FormValid-->
  <script type="text/javascript" src="/util/FormValid.js"></script>

  <script src="index.js"></script>

{include file="radishweb/widgets/footer/footer.tpl"}