<div class="wrapper header over-visible">
  <div class="logo pull-left">
    <!--<img src="/images/logo.png">-->
  </div>
   
  <div class="login-info pull-right">
    {if $session.id}
    <div href="javascript:;" class="logined">
      <i class="fa fa-caret-right"></i>
      {if $session.avatar}
      <img src="{$session.avatar.b}" style="width: 40px;height: 40px">
      {else}
      <img src="/images/avatar2.png" style="width: 40px;height: 40px" alt="1">
      {/if}
      <label class="loginUserName">{if $session.type == 0}普通用户{elseif $session.type == 1}志愿者{elseif $session.type == 2}机构{/if} {$session.name}</label>
      <ul  id="userCenter" class="collapse" style="margin-top:-6px ;">
        <!--<li> <a href="/radishweb/passport/mycomments">我的评论</a> </li>-->
        <!--<li> <a href="/radishweb/passport/myquestion">我的发布</a> </li>-->
        <li> <a href="/radishweb/passport/info">个人中心</a> </li>
        <li> <a id="logout" href="javascript:logout();">退出登录</a> </li>
      </ul>
    </div>
    {else}
    <a href="/radishweb/passport/login">登录</a>
    <a class="line" href="javascript:;">|</a>
    <a href="/radishweb/passport/reg1">注册</a>
    {/if}
  </div>
</div>
<script language="javascript">
    function logout(){
            $.ajax({
          url:'http://qa.xluob.com:8080',
          dataType:'json',
          data:{},
          cache:false, 
          ifModified :true ,
          
          success:function(response){
            //操作
            alert('成功退出')
          }
          async:false
        });
    }
</script>