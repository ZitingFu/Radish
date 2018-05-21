{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper">
    <div class="section reg create m-b50">
        <div class="titlebar m-t30 m-b30">
            <div class="listHead"><a href="/radishweb/question/create">信息</a><a href="/radishweb/notice/create"  class="listActive">公告</a></div>
        </div>
        <form id="form-create">
            <div class="form-group form-content">
                <label for="content" class="font-14">内容详情</label>
                <textarea name="content" id="forup" class="form-control p-w100 m-t5 txt1" rows="8" maxlength="500" placeholder="请输入详细的信息发布内容"></textarea>
                <span class="txtbar1">(0/500)</span>
            </div>
            <div class="form-group">
                <input type="hidden" name="images" value="">
                <label for="name" class="p-w25 show font-14 m-b5">上传照片</label>
                <a id="upload" data-toggle="modal" data-target="#img-upload-confirm"><img src="/images/picadd.png"> </a>
                <div class="form-group m-t10 collapse p-w100">
                    <div class="img-list"></div>
                </div>
            </div>
             <button type="button" class="btn btn-warning btn-primary w-217 h-36">确认发布</button>
        </form>
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
              <input type="file" multiple accept="image/jpg,image/jpeg,image/png">
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
<!--FileUpload-->
<link rel="stylesheet" type="text/css" href="/util/FileUpload/FileUpload.css" />
<link rel="stylesheet" href="create.css">
<script type="text/javascript" src="/util/FormValid.js"></script>
<!--<script src="/util/FileUpload/FileUpload-create.js"></script>-->
<script src="FileUpload-create4.js"></script>

<script src="create.js"></script>

{include file="radishweb/widgets/footer/footer.tpl"}