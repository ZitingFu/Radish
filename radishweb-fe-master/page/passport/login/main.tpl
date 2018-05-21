<meta charset="utf-8">

{include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
   <table style="margin:0 auto">
  <div class="wrapper loginDiv container">
 
    <div class="backgroundImg">
        <img class="" src="http://img.qa.xluob.com/%E7%99%BB%E5%BD%95%E9%A1%B5_03.png">
    </div>
    
    <div class="section login w-420 pull-right">
      <form id="loginform" class="form-vertical">
      <ul class="clearFix w-300 container">
        <li class="form-group user_name"> <input id="phone" name="phone" type="tel" class="form-control" placeholder="用户名"><!--<label class="w-38"></label>--> </li>
        <li class="form-group user_password"> <input id="password" name="password" type="text" class="form-control p-w85 pull-right"  onfocus="this.type='password'" placeholder="密码" autocomplete="off"><!--<label class="w-38">密码</label>--> </li>
        <li class="form-group li-forget"><!-- <label class="p-w15 pull-left"></label>--> <a href="/radishweb/passport/editpassword" class="forget">忘记密码</a> <a href="/radishweb/passport/reg1" class="free_register pull-right">免费注册</a>  </li>
        <li class="form-group login-btn"> <button type="submit" class="btn btn-warning p-w85 pull-right" id="login-btn">登录</button> <!-- <label class="p-w15"></label> </li>-->
        
      </ul>
      </form>
    </div>
    
  </div>
  </table>
  <link type="text/css" rel="stylesheet" href="1.css">
  <script src="index.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}