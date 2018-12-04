{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-830 pull-right wrap-content section">
<!--修改手机号-->
        <div class="titlebar m-t0 m-b20">
        <label>修改手机号</label>
        </div>
        <div class="col-list m-t20">
        <div class="section login" style="">
            <form id="form-create">
                <ul class="clearFix w-310" style="margin-top: 70px;">
                    <li class="form-group form-phone">
                        <label for="phone" class="p-w25">新手机号码</label>
                        <input id="phone" name="phone" type="tel" class="form-control p-w70 pull-right">
                    </li>
                    <li class="form-group form-code" style="display:none" id="yanzheng">
                        <label for="code" class="p-w25">验证码</label>
                        <button type="button"  id="TencentCaptcha" data-appid="{$captcha}"data-cbfn="callback" class="btn-outline  code pull-right w-95 disabled" style="height: 34px;line-height: 0">获取验证码</button>
                        <input id="code" name="code" type="text" class="form-control p-w35 pull-right">
                    </li>
                    <li class="form-group"> <button type="button" class="btn btn-warning btn-primary p-w70 pull-right">修改</button><label class="p-w25"></label> </li>
                </ul>
            </form>
        </div>
        </div>
        </div>
    <div class="block">
        {include file="radishweb/widgets/nav/usernav-left.tpl"}
    </div>
</div>
<link rel="stylesheet" href="editphone.css">
<script type="text/javascript" src="/util/FormValid.js"></script>
<script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
<script src="editphone.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}