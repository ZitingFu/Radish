{include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}

  <div class="wrapper container">
    <ul class="nav nav-pills mb-3 container" id="pills-tab" role="tablist" style="width:100%">
      <li class="nav-item p-w25">
        <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">1.请填写内容</a>
        
      </li>
      <li class="nav-item p-w25">
        <a class="nav-link" id="img-upload-confirm-tab" data-toggle="" href="#img-upload-confirm" role="tab" aria-controls="pills-profile" aria-selected="false">2.上传照片</a>
        
      </li>
      <li class="nav-item p-w25">
        <a class="nav-link" id="pills-contact-tab" data-toggle="" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">3.完成发布</a>
        
      </li>
    </ul>
<div class="tab-content" id="pills-tabContent">
    <div class="section reg create m-b50 tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" style="float:none">
      <!--<div class="titlebar m-t30 m-b30">
        <div class="listHead"><a href="/radishweb/index/about" class="listActive">信息</a>{if $session.type=='2'}<a href="/radishweb/notice/create">公告</a>{/if}</div>
      </div>-->
      <form id="form-create">
      <div class="form-group form-content">
        <label for="content" class="titleContent">内容详情</label>
        <textarea name="content" id="forup" class="form-control p-w100 m-t5" rows="8" maxlength="500" placeholder="请输入详细的信息发布内容"></textarea>
        <span class="txtbar1">(0/500)</span>
      </div>
      
      <div class="form-group tab-pane fade" style="display:none">
        <input type="hidden" name="images" value="">
        <label for="name" class="p-w25 show font-14 m-b5">上传照片</label>
        <a id="upload" data-toggle="modal" data-target="#img-upload-confirm"><img src="/images/picadd.png"> </a>
        <div class="form-group m-t10 collapse p-w100">
          <div class="img-list"></div> <div class="img-list2"></div>
        </div>
      </div>
        <!--2-->
        <!--<div class="form-group">-->
          <!--<input type="hidden" name="images2" value="">-->
          <!--<label for="name" class="p-w25 show font-14 m-b5">上传照片2</label>-->
          <!--<a id="upload2" data-toggle="modal" data-target="#img-upload-confirm2"><img src="/images/picadd.png"> </a>-->
          <!--<div class="form-group m-t10 collapse p-w100">-->
            <!--<div class="img-list2"></div>-->
          <!--</div>-->
        <!--</div>-->
  
      <ul class="clearFix w-310">
        
        <li class="form-group form-name"> 
          <label for="name" class="p-w25">联系人</label> 
          <input id="name" name="name" type="text" class="form-control p-w62" value="{$session.name}">
        </li>
        <li class="form-group form-phone"> 
          <label for="phone" class="p-w25">联系电话</label> 
          <input id="phone" name="phone" type="text" class="form-control p-w62" value="{if $apply.phone}{$apply.phone}{else}{$session.phone}{/if}">
        </li>
        <li class="form-group form-assoc_id"> 
          <label for="assoc_id" class="p-w35">关联（选填）</label> 
          <input id="assoc_id" name="assoc_id" type="text" class="form-control p-w62" value="" maxlength=11  placeholder="请输入上交用户的账号">
        </li>
        <div id="form-location" class="form-group form-location">
          <input type="hidden" id="loca-input" name="location" class="form-control"  value="">
          <li class="form-group">
            <label for="phone" class="p-w25">区域</label> 
            <select class="form-control p-w62" name="province" id="province"></select>
          </li>
          <li class="form-group collapse"> 
            <select class="form-control p-w62" name="city" id="city"></select>
          </li>
          <li class="form-group collapse"> 
            <select class="form-control p-w62" name="area" id="area"></select>
          </li>
        </div>
        <div id="form-type" class="form-group form-type">
          <input type="hidden" id="type-input" name="type" class="form-control"  value="">
          <li class="form-group form-unit">
            <label for="f_g_id" class="p-w25">类型</label>
            <select class="form-control p-w62" name="f_g_id" id="f_g_id">
              <option value="0" selected>请选择类型</option>
              {foreach from=$genre key=i item=item}
              <option id="unit_one" value="{$item.id}">{$item.name}</option>
              {/foreach} 
            </select>
          </li>
          <li class="form-group form-unit_two collapse">
            <select class="form-control p-w62" name="g_id" id="unit_two"></select>
          </li>
        </div>
         <div style="display:none">
         <li class="form-group"> 
          <input id="ticket" name="ticket" type="text" class="form-control p-w62" value="">
        </li>
         <li class="form-group form-name"> 
          <input id="randstr" name="randstr" type="text" class="form-control p-w62" value="">
        </li>
         </div>

         <li class="form-group form-unit" id="sid-type"  style="display:none">
            <label for="" class="p-w25" >是否贵重</label>
            <input type="hidden" name="sid-type" value="">
            <select class="form-control p-w62" id="israch">
               {foreach from=$foodcates key=i item=item1}
                <option value="{$item1.id}" selected>{$item1.name}</option>
               {/foreach} 
            </select> 
          </li>
           <li class="form-group form-s_name" style="display:none">
            <select class="form-control p-w62" id="type">
              <option  value="">请选择物品种类</option>
            </select>
          </li>
  
        <li class="form-s_id form-sid-type">
          <label for="s_id" class="p-w25">场所</label>
          <input type="hidden" name="sid-type" value="">
          <select class="form-control p-w62" name="s_id" id="s_id">
            <option value="0" selected>请选择场所</option>
            {foreach from=$site key=i item=item}
            <option id="" value="{$item.id}">{$item.name}</option>
            {/foreach}
          </select>
        </li>
        <li class="form-group collapse">
          <label for="f_g_id" class="p-w25">二级场所</label>
          <select class="form-control p-w62" name="site_two" id="siteTwo">
            <option  value="">请选择二级场所</option>
          </select>
        </li>
        <li>
          <div class="form-group form-content">
            <label for="q_remark" class="font-14">给警方的留言（选填）</label>
            <textarea name="q_remark" id="q_remark" class="form-control p-w100 m-t12" rows="8" maxlength="500" placeholder="请输入详细的信息发布内容"></textarea>
            <span class="txtbar2">(0/500)</span>
          </div>
        </li>
        <div>
          <li class="contentButton"><a id="contentButton">下一步</a></li>
        </div>
        <li class="form-group m-t50" style="display:none"> <button type="button" id="submitInddenBtn" class="btn btn-warning btn-primary p-w70">确认发布</button>  <label class="p-w25"></label> </li>
      </ul>
     
        <!--经度-->
        <input type="hidden" name="longitude" id="longitude" value="">
        <!--纬度-->
        <input type="hidden" name="latitude" id="latitude" value="">
      </form>
    
  </div>
  <div class="tab-pane fade"  tabindex=""  aria-hidden="" id="img-upload-confirm" role="tabpanel" aria-labelledby="pills-profile-tab">
    <div class="">
      <div class="modal-content">
      <!--
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="">&times;</button>
          <h4 class="modal-title" id="myModalLabel">上传图片</h4>
        </div>-->
        <div id="shortcut-card" class="modal-body">
          <div class="table-responsive">
            <p class="add-file">
              <span class="btn btn-success fileinput-button">请上传图片（选填）：
                  <!--<i class="fa fa-plus fa-fw"></i>-->
                  <img src="/images/picadd.png"></img>
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
          <button type="button" class="btn btn-primary" id="pictureUpload" <!-- style="display:none" -->>确认</button>
         <!-- <button type="button" class="btn btn-danger btn-cancel" data-dismiss="modal">取消</button>-->
        </div>
      </div>
      <!-- {include file="radishweb/widgets/nav/Verification/main.tpl"} -->
      <button  type="button" class="btn btn-primary fabu pull-right m-t10" id="TencentCaptcha"  data-appid="{$captcha}"
        data-cbfn="callback">验证信息</button>
      <button  type="button" class="btn btn-primary fabu pull-right m-t10" style="display:none" id="pictureBtn">确认发布</button>

    </div> 
  </div>
  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" style="margin-bottom:100px; ">
    <li class="form-group m-t240 w-451" style="box-shadow: rgb(107, 101, 101) 3px 3px 50px;"> 
         <div class="Success_top"> 
           <span>
             <img src="1.png" alt=""  style="margin-right: 24px;">
           </span>
           发布成功，爱心值+1！
         </div>
         <div class="Success_box">
           <div class="SU">
              <div class="Success_left">
                <img class="Success_logo" src="1.png" alt="" style="width:60px">
              </div>
              <div class="Success_right">
                <h5 class="Success_compony_name" style="font-size: 16px;">阿里巴巴集团桂花</h5>
                <p style="position: absolute;bottom: 0;font-size: 16px;" class="Success_compony_brief">阿里巴巴集团桂花糕桂花酒</p>
              </div>
              <div class="clear"></div>
           </div>
         </div>
         <p class="w-268">以上企业感谢您对公益事业的支持已将<i class="fb492c">1.5元</i>
          公益金打入您的
          <i style="color:#fda249">账户余额</i>
          <button style="width:135px;margin:0 auto;margin-top: 27px;height: 43px;background-color: #fda249;position: relative;margin-left: 67.5px;margin-bottom:31px;color:#fff" class="btn know">我知道了</button>
         </p>
    </li>
  </div>
 <!--新增2-->
  <div class="modal fade" id="img-upload-confirm2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel2">上传图片</h4>
        </div>
        <div id="shortcut-card2" class="modal-body">
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
                <th>状态22</th>
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
    </div>
  </div>
   {include file="radishweb/widgets/nav/usernav-left.tpl"}
  <input type="hidden" value="" id="positionCity">
  <!--FileUpload-->
  <link rel="stylesheet" type="text/css" href="/util/FileUpload/FileUpload.css" />
  <script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
  <script src="FileUpload-create2.js"></script>
  <script src="FileUpload-create3.js"></script>

  <!--select2-->
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
  <link rel="stylesheet" href="create.css">
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>

 <script type="text/javascript" src="plupload.full.min.js"></script>
  <script type="text/javascript" src="upload.js"></script>
  <!--<script src="/libs/map/gaodeMap.js"></script>-->
  <script type="text/javascript" src="//webapi.amap.com/maps?v=1.3&key=b253a2b2c53202149a1e6f1aa1e90a88&plugin=AMap.CitySearch"></script>
  <script type="text/javascript" src="/util/FormValid.js"></script>
 
  <script src="index.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}