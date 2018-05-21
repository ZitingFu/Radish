{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-830 pull-right wrap-content section">
    <div class="titlebar m-t0 m-b20">
    <label>修改密码</label>
    </div>
    <div class="col-list m-t20">
    <div class="section login w-420" style="margin-top: 54px">
    <form id="password_form" class="form-vertical">
        <input type="hidden" value="{$session.id}" name="id" id="passid">
    <ul class="clearFix w-300">
    <li class="form-group"> <input id="oldpass" name="oldpass" type="password" class="form-control p-w80 pull-right"> <label class="p-w15">原密码</label> </li>
    <li class="form-group"> <input id="newpass" name="newpass" type="password" class="form-control p-w80 pull-right"> <label class="p-w15">新密码</label> </li>
    <li class="form-group"> <button type="submit" class="btn btn-warning p-w85 pull-right" id="password-btn">修改</button>  <label class="p-w15"></label> </li>
    <li class="form-group"></li>
    </ul>
    </form>
    </div>
    </div>
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
<link rel="stylesheet" href="editpass.css">
<script type="text/javascript" src="/util/FormValid.js"></script>
<script src="editpass.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}