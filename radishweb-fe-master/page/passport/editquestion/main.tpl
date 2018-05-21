{include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper p-t30">
    <div class="content w-830 pull-right">
      <div class="section reg create">
        <div class="titlebar m-b30">
          <label>编辑信息</label>
        </div>
        <form id="form-create">
          <input type="hidden" name="id" value="{$question.id}">
        <div class="form-group form-content">
          <label for="content" class="font-14">内容详情</label>
          <textarea name="content" class="form-control p-w100 m-t5" rows="15" maxlength="500" placeholder="请输入详细的信息发布内容">{$question.content}</textarea>
        </div>
        <div class="form-group">
          <input type="hidden" name="images" value="">
          <label for="name" class="p-w25 show font-14 m-b5">上传照片</label>
          <a id="upload" data-toggle="modal" data-target="#img-upload-confirm"><img src="/images/picadd.png"> </a>
          {if $question.images}
          <div class="form-group m-t10 p-w100">
          {else}
          <div class="form-group m-t10 collapse p-w100">
          {/if}
            <div class="img-list">{foreach from=$question.images key=i item=item}<img src="{$item.image.b}">{/foreach}</div>
          </div>
        </div>
        <ul class="clearFix w-310">
          <li class="form-group form-name"> 
            <label for="name" class="p-w25">联系人</label> 
            <input id="name" name="name" type="text" class="form-control p-w70" placeholder="请填写昵称" value="{$question.name}"> 
          </li>
          <li class="form-group form-phone"> 
            <label for="phone" class="p-w25">联系电话</label> 
            <input id="phone" name="phone" type="text" class="form-control p-w70" placeholder="请填写昵称" value="{$question.phone}"> 
          </li>
          <div id="form-location" class="form-group form-location">
            <input type="hidden" id="loca-input" name="location" class="form-control"  value="1">
            <li class="form-group">
              <label for="phone">区域：<code>{$question.province_name} {$question.city_name} {$question.area_name}</code></label> 
              <select class="form-control p-w70" name="province" id="province">
              </select>
            </li>
            <li class="form-group"> 
              <select class="form-control p-w70" name="city" id="city">
              <option value="" selected="selected">请选择城市</option>
              </select>
            </li>
            <li class="form-group "> 
              <select class="form-control p-w70" name="area" id="area">
                <option value="" selected="selected">请选择区域</option>
              </select>
            </li>
          </div>
          <div id="form-type" class="form-group form-type">
            <input type="hidden" id="type-input" name="type" class="form-control"  value="1">
            <li class="form-group form-unit">
              <label for="f_g_id" >类型：<code>{$question.f_g_name} {$question.g_name}</code></label>
              <select class="form-control p-w70" name="f_g_id" id="f_g_id">
                <option value="" selected>请选择类型</option>
                {foreach from=$genre key=i item=item}
                <option value="{$item.id}">{$item.name}</option>
                {/foreach} 
              </select>
            </li>
            <li class="form-group form-unit_two">
              <select class="form-control p-w70" name="g_id" id="unit_two">
                <option value="" selected="selected">请选择二级类型</option>
              </select>
            </li>
          </div>
          <li class="form-group form-s_id">
            <label for="s_id" class="p-w25">场所</label>
            <select class="form-control p-w70" name="s_id">
              {foreach from=$site key=i item=item}
              <option value="{$item.id}" {if $item.id == $question.s_id}selected{/if}>{$item.name}</option>
              {/foreach}
            </select>
          </li>
          <li class="form-group"> <button type="button" class="btn btn-warning btn-primary p-w70">保存</button>  <label class="p-w25"></label> </li>
        </ul>
        </form>
      </div>
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
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
          <p class="help-block">最多上传<code>8</code>个图片，请确认每个图片小于<code>10MB</code>。您也可以将需要上传的图片拖动到此处。</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary">确认</button>
          <button type="button" class="btn btn-danger btn-cancel" data-dismiss="modal">取消</button>
        </div>
      </div>
    </div> 
  </div>
    
  <script type="text/html" id="data-image">
    {$question.images|json_encode}
  </script>
  
  <!--FileUpload-->
  <link rel="stylesheet" type="text/css" href="/util/FileUpload/FileUpload.css" />
  <script type="text/javascript" src="/util/FileUpload/FileUpload-create.js"></script>
  <!--select2-->
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
  
  <script type="text/javascript" src="/util/FormValid.js"></script>
  
  <script src="index.js"></script>
  
{include file="radishweb/widgets/footer/footer.tpl"}