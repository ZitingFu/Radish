{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content  wrap-content section">
        <div class="titlebar m-t0 m-b20">
            <label>设置支付密码</label>
        </div>
        <div class="col-list m-t20">
            <div class="section login w-420" style="margin-top: 54px;float: left;">
                <form id="password_form" class="form-vertical">
                    <input type="hidden" name="phone" value="{$session.phone}">
                    <ul class="clearFix w-300" style="padding-top: 101px;">
                        <li class="form-group"> <input id="phoneV"  disabled="disabled" value="{$session.phone}" type="text" class="form-control p-w76 pull-right"> <label class="p-w19">手机号码</label> </li>
                        <li class="form-group"> <input id="passV" name="password" type="password" class="form-control p-w76 pull-right" maxlength="6"> <label class="p-w19">支付密码</label> </li>
                        <li class="form-group"> <button type="button" class="btn btn-warning p-w77 pull-right" id="password-btn">修改</button>  <label class="p-w15"></label> </li>
                        <li class="form-group"></li>
                    </ul>
                </form>
            </div>
        </div>
        <input type="hidden" value="{$id}" id="topicId">
        <input type="hidden" value="{$type}" id="topicType">
    </div>
</div>
<script type="text/javascript" src="/util/FormValid.js"></script>
<script src="createwithdrawpass.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}