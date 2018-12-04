	
{include file="radishweb/widgets/header/header.tpl"}
	{include file="radishweb/widgets/nav/nav.tpl"}

 <div class="wrapper p-t30 paddingLg" style="overflow: hidden;">
 <!-- <img class="dakai" src="http://rd.xluob.com/%E7%BB%84%202.png" style="" alt=""> -->
		<!-- <div class="banxin"> -->
			<div class="Survey-head">
				<div class="id" style="display:none">123</div>		
				<h2>
					<span>广告助手</span>
				</h2>
				<ul class="ul" style="overflow: hidden">
					<li></li>
					<li class="click">
						<a href="/radishweb/ads/index">广告设置</a></li>
					<li></li>
					<li class="click">
						<a href="/radishweb/ads/about">概况</a>
					</li>
					<li></li>
					<li class="click change">
						<a href="/radishweb/ads/so">账户</a></li>
					<li></li>
				</ul>
				<!-- 账户 -->
				<div class="account">
					<table class="table">
						<thead>
							<tr>
								<th>累计剩余广告数量</th>
								<th>累计使用广告数量</th>
								<th>累计充值广告数量</th>
							</tr>
						</thead>
						<tbody>
							{if $info}
								<tr>
									<td class="left_num">{$info.left_num }</td>
									<td class="used_num">{$info.used_num}</td>
									<td class="count_num">{$info.count}</td>
								</tr>
							{else}
								<tr>
									<td class="left_num">0</td>
									<td class="used_num">0</td>
									<td class="count_num">0</td>
								</tr>
							{/if}
						</tbody>
					</table>
					<p id="btnp" style="text-align: center">
						<button class="btn btn-warning Recharge right-40" style="width:193px;height:34px;margin-top:60px;">立即充值</button>
						<!-- <button class="btn btn-warning invoice" style="width:193px;height:34px;margin-top:60px;">开发票</button> -->
					</p>
				</div>
			</div>
		    {include file="radishweb/widgets/nav/usernav-left.tpl"}

			<!-- </div> -->
		<div class="clear"></div>
</div>
	<!-- 立即充值弹出层数据页面 -->
	<div class="Popup">
		<img src="" alt="" class="ico">
		<img src=" " alt="" style="width:100%;" class="imgQR">
		<div class="PopupRecharge">
			<h3>充值金额</h3>
			<ul>
				{foreach $packages as $color}
				<li class="li">
					<strong>{$color.id}</strong>
					<i class="bigsize Amount-money">{$color.money}元</i>
					<span class="size block">投放<i class="size">{$color.num}</i>条</span>
				</li>
				{/foreach}
			</ul>
			<!-- <p class="money">其他金额：<input class="AmountMoney" style="color:#fda249" type="text"><i class="promptBox"></i></p> -->
			<div style="margin-left:23px;margin-top:31px;">
				<!-- <span  style="margin-right:98px"><input type="radio" name="name" value="balance">&#8195;余额支付</span> -->
				<input type="radio" name="name" checked="true" value="WeChat">&#8195;微信支付
				<!-- <p style="color:#fd492c;margin-left:16px;margin-top:14px">账户余额<span>1</span>元</p> -->
			</div>
			<p class="payment">
				<span class="btn cancel" style="background-color:#d9d9d9;color:#000;width:165px;line-height:30px;">取消</span>
				<span class="ImmediatePayment btn btn-warning" style="width:165px;line-height:30px;FLOAT: right">立即支付</span>
			</p>
		</div>
	</div>
	<!-- 发票弹出层数据页面 -->
	<div class="PopupInvoice">
		<img src="" alt="" class="InvoiceIco" style="display:none">
		<form id="FORM">
		<h4>发票类型：纸质发票</h4>
			<table>
				<thead>
					<tr>
						<th>企业名称：</th>
						<td>
							<input type="text" class="compony_name" name="compony_name">
						</td>
					</tr>
					<tr>
						<th>税号：</th>
						<td>
							<input type="text" class="tax_num" name="tax_num">
						</td>
					</tr>
					<tr>
						<th>企业地址和电话：</th>
						<td>
							<input type="text" class="compony_addr" name="compony_addr">
						</td>
					</tr>
					<tr>
						<th>开户行和账号：</th>
						<td>
							<input type="text" class="compony_bank" name="compony_bank">
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td>填写收集人地址及联系方式</td>
					</tr>
					<tr>
						<th>姓名：</th>
						<td>
							<input type="text" class="deliver_name" name="deliver_name">
						</td>
					</tr><tr>
						<th>电话：</th>
						<td>
							<input type="text"  class="deliver_tel" name="deliver_tel">
						</td>
					</tr><tr>
						<th>邮箱地址：</th>
						<td>
							<input type="text" class="deliver_addr" name="deliver_addr">
						</td>
					</tr>
				</tbody>
			</table>
		<P style="text-align:center;margin-top:35px;">
			<span class="Submission btn btn-warning" style="width:120px;line-height:23px">提示发票信息</span>
			<span class="btn cancel" style="background-color:#d9d9d9;color:#000;width:120px;line-height:23px">取消</span>
		</P>
		</form>
	</div>
	<!-- 弹出层 -->
	<!-- <div class="modal fade show" id="find-confirm" tabindex="-1" role="dialog" style="padding-right: 17px; display: block;">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">已找到</h4>
        </div>
        <form class="modal-body">
          <input type="hidden" name="id" class="list-id" value="268482859">
          <div class="form-group form-remark">
            <label for="remark" class="control-label">内容</label>
            <textarea class="form-control m-t5 txt1 remark" rows="8" name="remark" id="forup" maxlength="500"></textarea>
            <span class="txtbar1">(0/500)</span>
          </div>
          <p class="text-right">
            <button type="button" class="btn btn-primary ok">确认</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
          </p>
        </form>
      </div>
    </div>
  </div> -->
	<div data-notify="container" class="col-xs-4 alert alert-warning animated fadeInDown" role="alert" data-notify-position="top-center" style="display: none; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out; z-index: 9999999; top: 20px; left: 0px; right: 0px; animation-iteration-count: 1;"><button type="button" aria-hidden="true" class="close" data-notify="dismiss"></button><span data-notify="icon" class=""></span> <span data-notify="title"></span> <span data-notify="message" class="message">用户名或密码不正确</span><a href="#" target="_blank" data-notify="url"></a></div>
		<link rel="stylesheet" href="css.css">
		<script src ="js/jquery.min.js"></script>
		<script src="js/savior.js"></script>
		<script src="js/main.js"></script>
	</style>
{include file="radishweb/widgets/footer/footer.tpl"}