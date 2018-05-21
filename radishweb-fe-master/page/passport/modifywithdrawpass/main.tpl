{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper">
    <div class="section reg">
        <div class="titlebar m-t30 m-b30">
            <label>忘记支付密码</label>
        </div>
        <form id="form-create">
            <input type="hidden" value="{$type}"  id="isType">
            <input type="hidden" value="{$id}"  id="userId">
            <ul class="clearFix w-310">
                <li class="form-group form-phone">
                    <input id="phone"  type="tel" class="form-control p-w70 pull-right" value="{$session.phone}" disabled="true">
                    <input type="hidden" name="phone" value="{$session.phone}">
                    <label for="phone" class="p-w25">手机号</label> </li>
                <li class="form-group form-code">
                    <button type="button" class="btn btn-outline btn-warning code pull-right w-95" style="height: 34px;line-height: 0">验证码</button>
                    <input id="code" name="code" type="text" class="form-control p-w35 pull-right">
                    <label for="code" class="p-w25">验证码</label> </li>
                <li class="form-group form-pass"> <input id="password" name="pass" type="text" onfocus="this.type='password'" class="form-control p-w70 pull-right"> <label for="pass" class="p-w25">密码</label> </li>
                <li class="form-group"> <button type="button" class="btn btn-warning btn-primary p-w70 pull-right">找回密码</button>  <label class="p-w25"></label> </li>
            </ul>
        </form>
    </div>
</div>
<script type="text/javascript" src="/util/FormValid.js"></script>
<script src="index.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}