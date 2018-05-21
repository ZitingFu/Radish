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
        <div class="section login w-420" style="margin-top: 54px">
            <form id="form-create">
                <ul class="clearFix w-310">
                    <li class="form-group form-phone">
                        <label for="phone" class="p-w25">新手机号码</label>
                        <input id="phone" name="phone" type="tel" class="form-control p-w70 pull-right">
                    </li>
                    <li class="form-group form-code">
                        <label for="code" class="p-w25">验证码</label>
                        <button type="button" class="btn btn-outline btn-warning code pull-right w-95" style="height: 34px;line-height: 0">获取验证码</button>
                        <input id="code" name="code" type="text" class="form-control p-w35 pull-right">
                    </li>
                    <li class="form-group"> <button type="button" class="btn btn-warning btn-primary p-w70 pull-right">修改</button><label class="p-w25"></label> </li>
                </ul>
            </form>
        </div>
        </div>
        </div>



        <!--修改密码-->
        <!--<div class="titlebar m-t0 m-b20">-->
            <!--<label>修改密码</label>-->
        <!--</div>-->
        <!--<div class="col-list m-t20">-->
            <!--<div class="section login w-420" style="margin-top: 54px">-->
                <!--<form id="password_form" class="form-vertical">-->
                    <!--<ul class="clearFix w-300">-->
                        <!--<li class="form-group"> <input id="password1" name="password" type="text" class="form-control p-w80 pull-right"> <label class="p-w15">原密码</label> </li>-->
                        <!--<li class="form-group"> <input id="password2" name="password" type="text" class="form-control p-w80 pull-right"> <label class="p-w15">新密码</label> </li>-->
                        <!--<li class="form-group"> <button type="submit" class="btn btn-warning p-w85 pull-right" id="password-btn">修改</button>  <label class="p-w15"></label> </li>-->
                        <!--<li class="form-group"></li>-->
                    <!--</ul>-->
                <!--</form>-->
            <!--</div>-->
        <!--</div>-->
    <!--</div>-->
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
<link rel="stylesheet" href="editphone.css">
<script type="text/javascript" src="/util/FormValid.js"></script>
<script src="editphone.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}