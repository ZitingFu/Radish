
{include file="radishweb/widgets/header/header.tpl"}
	{include file="radishweb/widgets/nav/nav.tpl"}

 <div class="wrapper p-t30 paddingLg" style="overflow: hidden;">
	<div class="Survey-head">
		<h2>
			<a class="aorange orange1" href="/radishweb/passport/myassoc">打印条形码</a>
			<!-- <i class="Y"></i>
			<a class="aorange Relation" href="/radishweb/question/assoc">新增关联信息</a> -->
		</h2>
		<div class="Survey">
			<div class="modal-content">
			<!-- <div class="modal-header"> -->
			<!-- <h4 class="modal-title" id="myModalLabel">打印条形码</h4> -->
			<!-- </div> -->
			<form class="modal-body">
			<input type="hidden" name="id" class="list-id" value="268482859">
			<div class="form-group form-remark">
			<div class="form-control height">
				<img class="urlimg" src="" alt="">
			</div>
			</div>
			<div>
			<div class="form-group form-tel information" style="display:none">
					<label for="tel">
						<input id="tel" type="text" placeholder="输入位置信息" class="form-control compony_account" autocomplete="off">
					</label> 
					<label for="tel" style="color:#333">
						如：1-3-53
						1货架三排53号(填写完点击直接打印)
					</label>
				</div>
			</div>
			<p class="p">
				<a class="barcode-btn Choice">选择物品摆放位置</a>
				<a style="margin-top: 12px" href="/radishweb/question/printbar?id={$info.id}" class="barcode-btn">下一步</a>
			</p>
			</form>
			</div>
		</div>
	</div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>

	<link rel="stylesheet" href="css.css">
	<script src="js/main.js"></script>
	</style>
<div class="footer" style="text-align:center;border-top:#e9e9e9 solid 1px;
    padding: 40px 0;margin-top:100px;">
	小萝卜服务热线：400-679-0057 | 陕ICP备16009841号 | 邮箱：2848336902@qq.com
</div>
</body>
</html>