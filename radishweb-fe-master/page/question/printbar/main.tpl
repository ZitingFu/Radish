
{include file="radishweb/widgets/header/header.tpl"}
	{include file="radishweb/widgets/nav/nav.tpl"}

 <div class="wrapper p-t30 paddingLg" style="overflow: hidden;">
	<div class="Survey-head">
		<h2>
			<a  style="color:#fda249;font-size: 16px;">打印条形码</a>
		</h2>
		<div id="dataPanel">
		<div class="Survey" id="dataPanel">
			<div class="modal-content" style="border: 1px solid #000;">
			<form class="modal-body" style="padding-bottom: 0;height:360px;">
			<input type="hidden" name="id" class="list-id" value="268482859">
			<div class="form-group form-remark" >
				<div class="form-control height" style="border: none;padding:0;width: 80%;margin: 0 auto;">
					<img class="urlimg" src="" alt="" style="width: 100%;">
				</div>
			</div>
			<!-- form-group  -->
			<div class="form-remark">
				<div>
					<div class="row row1"style="border-top: 1px solid #000;line-height:30px;">
	 				  	<span class="gd" style="margin-left: 4%;width:100%;overflow: hidden; height:9%;font-size: 19px;">{$name}</span>
				  	
			  		</div>
					<div class="row row2" style="border-top: 1px solid #000;width:1365px
	   					border-left: 1px solid #000;">
						<span class="width80" style="margin-left:4%;position:relative;bottom:-9px;width: 50%;">发布时间:{$info.create_time}</span>
				  		<span class="width20" style="line-height:4;width: 40%; text-align: right;" >品类：贵重</span>
			  		</div>
			  		<div class="row row3"style="border-top: 1px solid #000; height:16%;">
		  				<span class="width20" style="margin-left: 4%;width:50%">
	 				  		<img src="2.png" alt="" style="width: 50%;margin-top: 6px;font-size: 20px;">
	 				  	</span>
	 				  	<span class="width20" style="width:45%; text-align: right;position: relative;top: 21px;overflow: hidden;" >{$info.position}</span>
					</div>
				</div>
			</div>
			</form>
			</div>

			<p class="p">
				<a class="barcode-btn Print">确认</a>
			</p>
		</div>
		</div>
	</div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
		<style media="print">
			 @page {
		      size: auto;  /* auto is the initial value */
		      margin: 1mm; /* this affects the margin in the printer settings */
		    }
		</style> 

		<link rel="stylesheet" href="css.css">
		<script src="js/main.js"></script>
	</style>
<div class="footer" style="text-align:center;border-top:#e9e9e9 solid 1px;
    padding: 40px 0;margin-top:100px;">
	小萝卜服务热线：400-679-0057 | 陕ICP备16009841号 | 邮箱：2848336902@qq.com
</div>
</body>
</html>