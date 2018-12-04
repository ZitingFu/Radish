
{include file="radishweb/widgets/header/header.tpl"}
	{include file="radishweb/widgets/nav/nav.tpl"}

 <div class="wrapper p-t30 paddingLg" style="overflow: hidden;">
	<div class="Survey-head">
		<h2>
			<a class="aorange orange1" href="/radishweb/passport/myassoc">已关联个人信息</a>
			<i class="Y"></i>
			<a class="aorange Relation" href="/radishweb/question/assoc">新增关联信息</a>
		</h2>
		<div class="Survey">
		{if $question}
		  {foreach from=$question key=i item=item}
			<div class="Survey_box">
				<div class="Survey_left">
					<div>
						 {if $item.avatar.b}
						<img src="{$item.avatar.s}" alt="">
						 {else}
						 <img src="http://img1.yunbix.cn/radish/images/399f06005849a9a207de916064e8b8a9/1.png" alt="">
						 {/if}
					</div>
				</div>
				<div class="Survey_right">
					<a href="/radishweb/question/info?id={$item.id}">
						<h6>{$item.name}</h6>
						<p class="genre_name">{$item.genre_name}</p>
						<p>{$item.content }</p>	
						<p>编码信息：<i class="id">{$item.id}</i></p>
						<span class="add">联系人：{$item.name}</span>
						<span>联系电话:{$item.phone}</span>
					</a>
						<p>
							<button class="btn btn-a btn-find" data-toggle="modal" data-target="#find-confirm">{if $item.status==0}认领中{else if $item.status==11}已认领{/if}</button>
							<a href="../question/barcode?id={$item.id}">
								<button class="btn btn-a btn-find Printing">打印条形码</button>
							</a>
						</p>
				</div>
				<div class="clear"></div>
			</div>
			{/foreach}
			{else}
			暂无关联
			{/if}
		</div>
	</div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
{include file="radishweb/widgets/page/page.tpl"}
<div class="modal fade show" id="find-confirm" tabindex="-1" role="dialog" style="padding-right: 17px; display: none;">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">已找到</h4>
        </div>
        <form class="modal-body">
          <input type="hidden" name="id" class="list-id" value="268482859">
          <div class="form-group form-remark">
            <label for="remark"  class="control-label">内容</label>
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
  </div>
	<link rel="stylesheet" href="css.css">
	<script src="js/main.js"></script>
	{include file="radishweb/widgets/footer/footer.tpl"}

