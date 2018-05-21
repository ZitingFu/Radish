{include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper container content">
    <img class="backgroundImg pull-left" src="http://img.qa.xluob.com/%E7%99%BB%E5%BD%95%E9%A1%B5_03.png">
    <div class="section reg pull-right">
      <h3></h3>
      <div class="contentBorder">
      <!--<div class="titlebar m-t30 m-b30">
        <label>忘记密码</label>
      </div>-->
      <form id="form-create">
      <ul class="clearFix w-310">
        <li class="form-group form-phone"> <input id="phone" name="phone" type="tel" class="form-control p-w70 pull-right"> <label for="phone" class="p-w25">手机号</label> </li>
        <li class="form-group form-code">
          <button type="button" class="btn btn-outline btn-warning code pull-right w-95" style="color:#fff">验证码</button>
          <input id="code" name="code" type="text" class="form-control p-w35 pull-right"> 
          <label for="code" class="p-w25">验证码</label> </li>
        <li class="form-group form-pass"> <input id="password" name="pass" type="text" onfocus="this.type='password'" class="form-control p-w70 pull-right"> <label for="pass" class="p-w25">密码</label> </li>
        <li class="form-group lastLi"> <button type="button" class="btn btn-warning btn-primary p-w70 ">重置密码</button>  <label class="p-w25"></label> </li>
      </ul>
      </form>
    </div>
    </div>
  </div>
  <link rel="stylesheet" type="text/css" href="index.css" />
  <script type="text/javascript" src="/util/FormValid.js"></script>
  <script src="index.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}