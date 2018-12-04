<div class="sidebar pull-left w-140 leftpop">
  <ul>
    <li {if $type ==1}class="active"{/if}> <a href="/radishweb/passport/info">个人中心</a> </li>
    <li id="redDost2" {if $type =='chat'}class="active"{/if}> <a href="/radishweb/chat/default">我的私信</a> <i class="iCont"></i></li>
    <li {if $type=='publish2'}class="active"{/if}> <a href="/radishweb/passport/myquestion">我的发布</a> </li>
    <li {if $comments}class="active"{/if}> <a href="/radishweb/passport/mycomments">我的评论</a> </li>
    {if $session.type == '2'}
        <li {if $type =='assoc'}class="active"{/if}><a href="/radishweb/passport/myassoc?&pn=1">关联信息</a></li>
     {/if}
     {if $session.type == '2' && $session.parent == '0'}
          <li {if $type =='subaccount'}class="active"{/if}><a href="/radishweb/subaccount/index?&pn=1">子账号管理</a></li>
          <li {if $notice}class="active"{/if}> <a href="/radishweb/passport/notice">发布公告</a> </li>
          <li {if $type =='ads'}class="active"{/if}><a href="/radishweb/ads/index?&pn=1">广告助手</a></li>
     {/if}
    {if $session.type == '0'}
      {if $user_type == '0' || $user_type == '2' }
      <li {if $type == '2'}class="active"{/if}> <a href="/radishweb/passport/myapply">我的申请</a></li>
      {else}
      <li> <a href="/radishweb/passport/volunapply?id={$session.id}&type=1">申请志愿者</a> </li>
      <li> <a href="/radishweb/passport/orgapply?id={$session.id}&type=1">申请机构</a> </li>
      {/if}
    {/if}
    <!--<li {if $type =='money'}class="active"{/if}> <a href="/radishweb/money/default">我的金币</a> </li>-->
    <li {if $type =='fav3'}class="active"{/if}> <a href="/radishweb/passport/myfav3">我的关注</a> </li>
    <li {if $type =='fav'}class="active"{/if}> <a href="/radishweb/passport/myfav">我的收藏</a> </li>
    <li {if $type =='system'}class="active"{/if}> <a href="/radishweb/chat/system">系统消息<!-- <i class="Tips"></i> --></a> </li>
  </ul>
</div>
<style>
  .Tips{
    width: 8px;
    height: 8px;
    display: inline-block;
    border-radius: 50%;
    background-color: #fb492c;
    position: relative;
    right: -7px;
    top:-2px;
  }
</style>
<script>
  var dianji = $(".dianji")
  var leftpop = $(".leftpop")
   dianji.click(function(){
      leftpop.animate({
        marginLeft:"-221px"
      })
   })

</script>