
{include file="radishweb/widgets/header/header.tpl"}
	{include file="radishweb/widgets/nav/nav.tpl"}

 <div class="wrapper p-t30 paddingLg" style="overflow: hidden;">
	<div class="Survey-head">
		<h2>
			<a class="aorange orange1" style="font-size: 16px" href="/radishweb/subaccount/index">子账号管理</a>
			<i class="Y"></i>
			<a class="aorange" style="font-size: 16px;" href="/radishweb/subaccount/create">添加子账号</a>
		</h2>
		<div class="Survey">
			<table class="table">
				<thead>
					<tr>
						<th>子账号</th>
						<th>名称</th>
						<!-- <th>运营者</th> -->
						<th>联系方式</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody class="TemplateBox">
					{if $list}
					 {foreach from=$list key=i item=item}
					<tr class="Template">
						<td class="none id">{$item.id}</td>
						<td class="account">{$item.account}</td>
						<td class="name">{$item.name}</td>
						<td class="phone">{$session.phone}</td>	
						<td>
							<a class="edit" href="">编辑</a>
							<i class="Y2"></i>
							<span style="cursor:pointer" class="ared delete" data-toggle="modal" data-target="#delete-confirm">删除</span>
						</td>
					</tr>
					{/foreach}
					{else}
						<tr class="Template">
							<td class="none id">0</td>
							<td class="account">0</td>
							<td class="name">0</td>
							<td class="phone">0</td>	
							<td>
							<a class="edit" href="">编辑</a>
							<i class="Y2"></i>
							<span style="cursor:pointer" class="ared delete" data-toggle="modal" data-target="#delete-confirm">删除</span>
						</td>
					</tr>
					{/if}
				</tbody>
			</table>
			<span class="state"></span>
			<!-- <p class="paging">
				<i class="tiaoshu" style="display:none"></i>
				<span class="upper">上一页</span>
				<span class="number">1</span>
				<span class="lower">下一页</span>
			</p> -->

		</div>
		{include file="radishweb/widgets/page/page.tpl"}
	</div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
	

	<div data-notify="container" class="col-xs-4 alert alert-warning animated fadeInDown" role="alert" data-notify-position="top-center" style="display: inline-block;display:none; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out; z-index: 9999999; top: 20px; left: 0px; right: 0px; animation-iteration-count: 1;">
		<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>
		<span data-notify="icon" class="fa fa-warning fa-fw"></span>
		 <span data-notify="title"></span> 
		 <span data-notify="message" class="message">用户名或密码不正确</span>
		 <a href="#" target="_blank" data-notify="url"></a>
	</div>
	<!-- delete -->
	<div class="modal fade show" id="delete-confirm" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            <h4 class="modal-title" id="myModalLabel">删除确认</h4>
	        </div>
	        <form class="modal-body">
	          <p>确定要将该信息从系统中删除么?</p>
	          <input type="hidden" name="id" class="list-id" value="268482987">
	          <p class="text-right m-t10">
	            <button type="button" class="btn btn-primary queren">确认</button>
	            <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
	          </p>
	        </form>
	      </div>
	    </div>
  	</div>
		<link rel="stylesheet" href="css.css">
		<script src="js/main.js"></script>
		{include file="radishweb/widgets/footer/footer.tpl"}