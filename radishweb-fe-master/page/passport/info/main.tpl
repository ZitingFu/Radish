{include file="radishweb/widgets/header/header.tpl"}
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-930 pull-right wrap-content section">
        <div class="titlebar m-t0 m-b20">
            <label>个人中心</label>&nbsp;&nbsp;<a href="/radishweb/passport/lovelist?type=1" class="love_active">爱心值&nbsp;{$pass.love}</a><b class="lineI"></b><a href="/radishweb/question/stat">发布数&nbsp;{$pass.issue_num}</a><b class="lineI"></b><a href="/radishweb/question/foundlist">已找到&nbsp;{$pass.found_num}</a>
        </div>
        <div class="col-list m-t20">
            <form id="form-edit">
                <ul class="clearFix w-400">
                    <li class="form-group form-phone">
                        <label for="photo" class="p-w15">当前头像</label>
                        <div class="photoWrap">
                            <!--<form action="/radishweb/passport/unde" method="post" id='headerForm'>-->
                                <input type="file" accept="image/jpg,image/jpeg,image/png"  name="avatar" id="avater">
                            <!--</form>-->
                            <input type="hidden" name="avatar" value="{if $pass.avatar}{$pass.avatar.b}{else}//img1.yunbix.cn/radishweb/static/images/avatar_6ace0b8.jpg{/if}" id="Head">
                            <img src="{if $pass.avatar}{$pass.avatar.b}{else}//img1.yunbix.cn/radishweb/static/images/avatar2_d7af2a3.png{/if}" id="headImg">
                            <span>点击更换</span>
                        </div>
                        <input type="hidden" value="" name='avatar_id' id="avatar_id">
                        <input type="hidden" value="{$pass.id}" id="passid">
                    </li>
                    <li class="form-group form-name">
                        <label for="name" class="p-w15">昵称</label>
                        <input type="text" id="name" name="name" class="form-control p-w60 m-l10" value="{$pass.name}">
                    </li>
                    <li class="form-group">
                        <label class="p-w15 pull-left radio">身份</label>
                        <label class="radio-inline boy"><input type="radio" name="sex" value="0" {if $pass.sex=="0"}checked=""{/if}>男</label>
                        <label class="radio-inline girl"><input type="radio" name="sex" value="1" {if $pass.sex=="1"}checked=""{/if}>女</label>
                    </li>
                    <li class="form-group">
                        <label for="select_year" class="p-w15">出生日期</label>
                        <select id="select_year"  class="form-control w-100 m-l3 m-r10" rel="{$pass.birthday|date_format:'%Y'}" style="width:390px!important"></select>  <!--年设置rel 可以设置默认的年月日-->
                        <label for="select_month" class="p-w15" style="display: none"></label>
                        <select id="select_month" class="form-control w-70 m-r10" rel="{$pass.birthday|date_format:'%m'}"></select>  <!--月-->
                        <label for="select_day" class="p-w15" style="display: none"></label>
                        <select id="select_day" class="form-control w-70" rel="{$pass.birthday|date_format:'%d'}"></select>  <!--日-->
                        <input type="hidden" value="{$pass.birthday|date_format:'%Y-%m-%d'}" id="birthday" name="birthday">
                    </li>
                    <li class="form-group editTel">
                        <label class="p-w15">手机号码</label>
                        <span>{$pass.phone}</span><a href="/radishweb/passport/editphone">修改号码</a>
                    </li>
                    <li class="form-group editTel">
                        <label class="p-w15">密码</label>
                        <span>*******</span><a href="/radishweb/passport/editpass">修改密码</a>
                    </li>
                    <li class="form-group"> <button type="button" class="btn btn-warning btn-primary m-l78 w-192">保存</button><label class="p-w25"></label> </li>
                </ul>
            </form>
        </div>
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
</div>
<link rel="stylesheet" type="text/css" href="info.css">
<script type="text/javascript" src="/util/FormValid.js"></script>
<script src="/libs/birthday/birthday.js"></script>
<script src="info.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}