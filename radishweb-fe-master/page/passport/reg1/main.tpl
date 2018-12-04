{include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper container">
    <div class="register_img pull-left ">
      <img src="http://img.qa.xluob.com/%E6%B3%A8%E5%86%8C%E9%A1%B5%E9%9D%A2_03.png">
    </div>
    <div class="section reg pull-right register-table">
      <h2 class="register-welcome-title">欢迎来到小萝卜注册中心</h2>
      <div class="register-border">
      <div class="titlebar m-t30 m-b30">
        <label>注册</label> <span class="first-step">第一步</span> > <span class="second-step">第二步</span>
      </div>
      <form id="form-create">
      <ul class="clearFix w-310">
        <li class="form-group form-phone"> 
          <label for="phone" class="p-w25">手机号</label> 
          <input id="phone" name="phone" type="tel" class="form-control p-w70 pull-right" placeholder="请输入手机号码"> 
        </li>
        <li class="form-group form-code" style="display:block;hegiht:31px;display:none" id="yanzheng">
          <label for="code" class="p-w25 pull-left">验证码</label>
       
          <button type="button" class="btn btn-outline btn-warning code pull-right w-95 identifyCode" id="TencentCaptcha" data-appid="{$captcha}" data-cbfn="callback" style="color:#fff;background-color:#fda249">获取验证码</button>

          <input id="code" name="code" type="text" class="form-control p-w35 pull-right" placeholder="请输入验证码">
           
        </li>
        <li class="form-group form-password"> 
          <label for="password" class="p-w25">密码</label> 
          <input type="text" id="password" name="password"  class="form-control p-w70 pull-right" onfocus="this.type='password'" placeholder="请输入密码"> 
        </li>
        <li class="form-group userIdentification"> 
          <label class="p-w25 pull-left radio">身份</label>
          <label class="radio-inline"><input type="radio" name="type" value="0" checked>普通用户</label>
          <label class="radio-inline"><input type="radio" name="type" value="1">志愿者</label>
          <label class="radio-inline"><input type="radio" name="type" value="2" >机构</label>
        </li>
        <li class="form-group next-step"> <button type="button" id="nextStep" class="btn btn-warning btn-primary p-w70 pull-right">下一步</button>  <label class="p-w25"></label> </li>
      </ul>
        <div id="protocol" class="m-l115">
          <label><input type="checkbox" class="cbox"  value="" checked />已阅读并同意<a href='/radishweb/index/user'>《用户协议》</a><div class="show-box"/></div></label>
        </div>
      </form>
    </div>
    </div>
  </div>
  <script>
    $(document).ready(function(){
      $(".cbox").click(function(){
      $(".show-box").toggle();
      });
  });
  </script>
  <link rel="stylesheet" type="text/css" href="index.css" />
  <link rel="stylesheet" type="text/css" href="checkbox.less" />
  <script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
   <script type="text/javascript" src="/util/FormValid.js"></script>
  <script src="index.js"></script>
  

{include file="radishweb/widgets/footer/footer.tpl"}