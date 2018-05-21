{include file="radishweb/widgets/header/header.tpl"}

<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper container">
    <img class="registerImg pull-left" src="http://img.qa.xluob.com/%E6%B3%A8%E5%86%8C%E9%A1%B5%E9%9D%A2_03.png">
    <div class="section reg m-height pull-right">
      <h3>欢迎来到小萝卜注册中心</h3>
      <div class="content-border">
      <div class="titlebar m-t36 m-b45">
        <label>注册</label> 第一步 > <span class="user1">机构</span>
      </div>
      <form id="form-create">
        <input type="hidden" name="id" value="{$id}">
        <input type="hidden" name="type" value="{$type}">
        <ul class="clearFix w-350">
          <div id="form-location" class="form-group form-location">
            <input type="hidden" id="loca-input" name="location" class="form-control" value="">
            <li class="form-group">
              <select class="form-control p-w70 pull-right" name="province" id="province"></select>
              <label for="phone" class="p-w29">区域</label>
            </li>
            <li class="form-group collapse">
              <select class="form-control p-w70 pull-right" name="city" id="city"></select>
            </li>
            <li class="form-group collapse">
              <select class="form-control p-w70 pull-right" name="area" id="area"></select>
            </li>
            <li class="form-group form-unit collapse">
              <select class="form-control p-w70 pull-right" name="site" id="unit">
                <option value="0" selected>请选择场所</option>
                 {foreach from=$cate key=i item=item}
                <option value="{$item.id}">{$item.name}</option>
                {/foreach}
              </select>
              <label for="unit" class="p-w29">场所</label>
            </li>
            <li class="form-group form-unit2 collapse site_two2">
              <select class="form-control p-w70 pull-right" name="site_two" id="site_two">
                <option value="" selected>请选择单位名称</option>
              </select>
              <label for="unit" class="p-w29">单位名称</label>
            </li>
            <!--<li class="form-group form-unit_two collapse">-->
              <!--<select class="form-control p-w70 pull-right" name="unit_two" id="unit_two">-->
                <!--<option value="0" selected>其他</option>-->
              <!--</select>-->
              <!--<label for="unit_two" class="p-w29"></label>-->
            <!--</li>-->
          </div>
          <li class="form-group " id="BmName">
            <input id="name" name="name" type="text" class="form-control p-w70 pull-right" placeholder="请填写部门名称（选填）" {if $apply.status == 2} value="{$apply.name}" {/if}>
            <label for="name" class="p-w29">部门名称</label>
          </li>
          <li class="form-group form-address">
            <input id="address" name="address" type="text" class="form-control p-w70 pull-right" placeholder="请填写单位地址" {if $apply.status == 2} value="{$apply.address}" {/if} >
            <label for="address" class="p-w29">单位地址</label>
          </li>
          <li class="form-group form-phone">
            <input id="phone" name="phone" type="text" class="form-control p-w70 pull-right" placeholder="请填写单位联系方式"  {if $apply.status == 2} value="{$apply.phone}" {/if}>
            <label for="phone" class="p-w29">单位联系方式</label>
          </li>
          <li class="nblx">
            以下内容仅供内部联系使用
          </li>
          <li class="form-group form-linkname">
            <input id="linkname" name="linkname" type="text" class="form-control p-w70 pull-right" placeholder="请填写单位联系人名字 "  {if $apply.status == 2} value="{$apply.linkname}" {/if}>
            <label for="linkname" class="p-w29">单位联系人</label>
          </li>
          <li class="form-group form-linkphone">
            <input id="linkphone" name="linkphone" type="text" class="form-control p-w70 pull-right" placeholder="请填写单位联系人方式"  {if $apply.status == 2} value="{$apply.linkphone}" {/if}>
            <label for="linkphone" class="p-w29">联系方式</label>
          </li>
          <li class="form-group">
            <input type="hidden" name="img" value="">
            <label for="name" class="p-w29 pull-left">上传证件照</label>
            <a id="upload" data-toggle="modal" data-target="#img-upload-confirm" class="m-l20"><img src="/images/picadd.png"> </a>
            <div class="form-group m-t10 collapse p-w70 pull-right">
              <div class="img-list"></div>
            </div>
          </li>
          <li class="sampleImg">
            <label class="">示例照片</label>
            <img src="/images/company.jpg" alt="机构示例照片">
            <!--<img src="/images/company1.jpg" alt="机构示例照片">
            <div>
              <p>1.请上传相关执照信息</p>
              <p>2.请上传申请书照片</p>
            </div>-->
          </li>
          <li class="form-group lastLi">
            <button type="button" class="btn btn-warning btn-primary p-w70 pull-right">提交申请</button>
            <!--<label class="p-w25"></label>-->
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
  <!--<script src="/libs/map/gaodeMap.js"></script>-->
  <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=b253a2b2c53202149a1e6f1aa1e90a88&plugin=AMap.CitySearch"></script>
  <!--FormValid-->
  <script type="text/javascript" src="/util/FormValid.js"></script>

  <script src="index.js"></script>

{include file="radishweb/widgets/footer/footer.tpl"}