<!-- <div class="wrapper header over-visible<!-- <!-- "> -->
  
 <div class="login-info pull-right">
    {if $session.id}
    <!-- nav左上角 -->
    <div href="javascript:;" >

        <!-- 搜索图标 -->
        <li class="indexSearch">
            <form class="pull-right" action="/radishweb/index/index" method="get" id="Search">
                <input type="text" name="content" value="" placeholder="搜索">
                <img  src="/images/icon_serch.png" alt="" class="iconSerch">
                <input type="hidden" value="search" name="type">
            </form>
           <img class="dakai" src="//rd.xluob.com/%E7%BB%84%202.png" style="position: absolute;left:12px;" alt="">

        </li>

        <div class="logined">
        <i class="fa fa-caret-right"></i>
        {if $session.avatar}
        <img src="{$session.avatar.b}" style="width: 40px;height: 40px">
     <!--  <div class="a-caret">
      </div> -->
      {else}
      <img src="/images/avatar2.png" style="width: 40px;height: 40px" alt="1">
      {/if}
        <div class="loginUserName" id="loginUserName"><span>{if $session.type == 0}普通用户:</span>
          <span id="User-name">{elseif $session.type == 1}志愿者</span>
          <span id="User-name">{elseif $session.type == 2}机构</span>
          <span id="User-name">{/if} {$session.name}</span>
        </div>
      <!-- 鼠标移上个人中心登录 -->
      <ul  id="userCenter" class="collapse" style="margin-top:-6px;" >
        <!--<li> <a href="/radishweb/passport/mycomments">我的评论</a> </li>-->
        <!--<li> <a href="/radishweb/passport/myquestion">我的发布</a> </li>-->
        <li> <a href="/radishweb/passport/info">个人中心</a> </li>
        <li> <a id="logout" href="javascript:logout();">退出登录</a></li>
      </ul>
    </div>
    {else}
    <a href="/radishweb/passport/login">登录</a>
    <a class="line" href="javascript:;">|</a>
    <a href="/radishweb/passport/reg1">注册</a>
    {/if}
    </div>
  </div>
<!-- </div> -->
<script>
    //放大镜
     // var search = document.getElementById('search')
     // var SearchBox = document.getElementById('SearchBox')

     var search = document.getElementById('search')
   
    var about =  document.getElementsByClassName("about container")
          // about.style.height = "auto"
        // about.style.height = 15px
     // var SearchBox = document.getElementById('SearchBox')
    

     //   search.onclick = function(){
     //      SearchBox.style.display = 'block'
     //      // search.id = 
     //   }
       
      //  http://qa.xluob.com:8080/radishweb/index/index?content=456&type=search

       //  loginUserName.onclick = function(){
       //   var span document.createElement('span')
       // }
       // input框
       // SearchBox.onclick = function(){
       //  alert(2)
       // }
</script>

<script>
    var  leftpoplist =  $(".leftpop").find("li")
     var leftpop = $(".leftpop")
     var dakai = $(".dakai")
      dakai.click(function(){
        leftpop.show()
         leftpop.animate({
          marginLeft:"0px"
      })
     })

   //  leftpoplist.click(function(){
       
   // })
</script>
<script language="javascript">
    function logout(){
            $.ajax({
          url:'//qa.xluob.com:8080',
          dataType:'json',
          data:{},
          cache:false, 
          ifModified :true ,
          
          success:function(response){
            //操作
            alert('成功退出')
          }
          // async:false
        });
    }

</script>