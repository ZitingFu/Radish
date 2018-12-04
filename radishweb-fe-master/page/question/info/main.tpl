<!-- 普通页面 -->
{include file="radishweb/widgets/header/header.tpl"}
<link rel="stylesheet" href="info.css">
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper p-t30 container">
    <div class="content ">
      <div class="details clearFix m-b50" data-id2="{$info.user_id}">
        {if $info.avatar}
        <img src="{$info.avatar.b}" class="pull-left imgWrap"  style="cursor: pointer" id="cdd">
        {else}
        <img src="/images/avatar2.png" class="pull-left imgWrap" tyle="cursor: pointer" id="cdd" s>
        {/if}
         <span id="new-time" style="display:none">456</span>
        <div class="info pull-right p-w90 ma-le15" style="border-bottom: 1px solid #e7e7e7;">
           <p class="y-end indexnone"></p>
            <p class="y-expire indexnone"></p>
          <p class="clearFix"> 
            <label class="pull-left user_name">{$info.user_name}</label> <label class="grey m-l20 pull-left m-t2">爱心值 · {$info.love}  发布数 · {$info.issue_num}   找到数 · {$info.find_num} </label> 
          
          {if $info.food_cate.expire != 0}
            {if $info.status !=11}
             <label class="pull-right y-time" style="display:none">{$info.time}</label>
                <!-- 。。。。。。。。。。。。。。。。。。。。。 -->
                <!-- <label class="pull-right y-time" >{$info.time}</label> -->
                <!-- ......................................... -->
                <label class="pull-right tong xian indexnone"></label> 
               <label class="pull-right tong indexnone" style="color:#333;font-size:0.9rem;margin:-4px 27px 0 27px;">距{if $info.annouce}公告期{else}认领期{/if}结束还有</label> 
               <!-- .............................................. -->
               <label class="pull-right xian tong indexnone"></label> 
               </p>
              <!-- 倒计时时分秒 -->
              <p class="m-t10 m-b10" style="padding-bottom:32px">
                <span class="y-center">{$info.genre_name}</span>
                <!-- ............................................. -->
                 <label class="pull-right ma_r19 indexnone">
                   <button class="btn Reverse_Smallbtn y-d">23</button>
                  <span class="Reverse_span">天</span>
                  <button class="btn Reverse_Smallbtn y-h">23</button>
                  <span class="Reverse_span">时</span>
                   <button class="btn Reverse_Smallbtn y-m">23</button>
                  <span class="Reverse_span">分</span>
                   <button class="btn Reverse_Smallbtn y-s">23</button>
                  <span class="Reverse_span">秒</span>
                </label>
              </p>
               {else}
               <label class="pull-right y-time">{$info.time}</label>
                <p class="m-t10 m-b10" style="margin-bottom: 26px">
                  <span class="y-center">{$info.genre_name}</span>
                </p>
               {/if}
            {else}
               <label class="pull-right y-time">{$info.time}</label>
                <p class="m-t10 m-b10" style="margin-bottom: 26px">
                  <span class="y-center">{$info.genre_name}</span>
                </p>
            {/if}
            
          {if $info.remark}<p class="m-t12 m-b12">已找到：{$info.remark}</p>{/if}



          {if $info.status !=11}
          {if $info.images}
          <p class="images m-b15" id="pimg">
            {foreach from=$info.images key=i item=item}
            <img data-original="{$item.images.b}" src="{$item.images.b}" width="240" height="160" data-imgIndex="{$i}">
            {/foreach}
          </p>
          {else}
          {if $info.video}
          <video src="{$info.video}" controls="controls" class="videoMp4"></video>
          {/if}
          {/if}
          {else}
          {if $info.f_g_id ==1 || $info.f_g_id ==2 }
          <p class="images m-b15" id="pimg">
          <img src="/images/yizhaodao.png" alt="" width="240" height="160">
          </p>
          {/if}
          {if $info.f_g_id ==3 || $info.f_g_id ==4 }
          <p class="images m-b15" id="pimg">
          <img src="/images/yirenl.png" alt=""  width="240" height="160">
          </p>
          {/if}
          {/if}


          <p class="content m-b20 yy-conter">{$info.content}</p>
          <input type="hidden" value="{$fav}" id="favId">
          <input type="hidden" value="{$info.id}"  id="userId">
          <p class="m-b20"><label>联系人：</label>{$info.name} <label class="m-l20 y-dianhua">联系电话：</label>{$info.phone}</p>
          
            
          {if $info.site_two_name}
          <p  class="m-b30" style="display: block"><a href="/radishweb/question/map?id={$info.id}" target='_blank'><img src="/images/map.png" alt="" width="10px" height="15px" style="margin-top: -4px"> &nbsp;{$info.site_two_name}</a><br/>
            <br/>
            信息编码 ：{$info.id}
          </p>
          {/if}
          
          {if $info.assoc=''|| 'undefined'}`
            {if $info.assoc.org_name=''|| 'undefined'}
          <p  class="m-b30" style="display: block">已放到：{$info.assoc.org_name}</a></p>
            {/if}
          {/if}
          {if $session.id !== $info.user_id}
          <button type="button" class="btn btn-outline btn-warning  p-play" style="margin-left:0;padding:5px 35px;line-height:0px;height:28px">打赏</button>
          {if $info.f_g_id == 4}
            {if $info.status == 0}
           <button type="button" class="btn btn-warning  h-28" data-toggle="modal" data-target="#exampleModal1" style="margin-left:0;margin-bottom: 30px;line-height:0px;height:28px;width: 100px;">认领</button>
           {/if}
           {if $info.status == 1}
           <button type="button" class="btn h-28" style="margin-left:0;margin-bottom: 30px;line-height:0px;height:28px;width: 100px;color:#fff">正在认领中</button>
           {/if}
           {if $info.status == 11}
           <button type="button" class="btn h-28" style="margin-left:0;margin-bottom: 30px;line-height:0px;height:28px;width: 100px;color:#fff">已认领</button>
           {/if}
          {/if}
          <div style="float: right;display: inline-block;">

            {if $fav==99}
            <img class="collection_img" src="icon-sc.png" alt="" style="width:14px;cursor: pointer;">
            <span class="collection" style="font-size:14px;color: #000;cursor: pointer;">收藏</span>
            {else}
             <img class="collection_img" src="icon-s.png" alt="" style="width:14px;cursor: pointer;">
            <span class="collection" style="font-size:14px;color: #f6881b;cursor: pointer;">已收藏</span>
             {/if}

            <img src="icon-tousu.png" alt=""  style="width:14px;margin-left: 22px;">
            {if $session.id !== $info.user_id}<span  style="cursor:pointer;border:5px solid #fff;" class="pull-right rep" data-toggle="modal" data-target="#preModal" data-id="{$info.id}" >投诉</span>{/if}
          </div>
          {/if}
        </div>
        <div id="alImg">
          <img src="/images/lbClose.png" alt="" class="gbClose">
          <img src="/images/lbLeft.png" alt="" class="gbLeft">
          <img src="/images/lbRight.png" alt="" class="gbRight">
          <div id="alertImg"><img src="" alt="logo" class="logPng"></div>
        </div>
        {if $session.id == $info.user_id || $session.type !== '0'}
        <div class="desc pull-right p-w90">
          {if $privilege == 1 || $info.user_id==$session.id}
          {if $info.r_remark}
          <div class="titlebar"> 给警方的留言 :{$info.r_remark }
          {else}
          <div class="titlebar"> 给警方的留言 :无;
          {/if}
            {$info.q_remark}
          </div>
          {/if}
          {if $info.note}
          <div class="list">
            <ul>
              {foreach from=$info.note key=i item=item}
              <li class="m-b10 p-b10">
                {if $item.avatar}
                <img src="{$item.avatar.b}" class="pull-left" width="40" height="40">
                {else}
                <img src="/images/avatar2.jpg" class="pull-left" width="40" height="40">
                {/if}
                <div class="pull-right info p-w92">
                  <p> <label class="name m-r20">{$item.user_name}</label> <label class="grey">{$item.create_time}</label> </p>
                  <p class="content m-b15">{$item.content}</p>
                </div>
              </li>
              {/foreach}
            </ul>
          </div>
          {/if}
        </div>
        {/if}
       
        <div class="desc pull-right p-w90">
         <div class="titlebar" style="width: 59%;">
            评论
            <!--  {if $session.id !== $info.user_id}<a type="" class="pull-right rep" data-toggle="modal" data-target="#preModal" data-id="{$info.id}" >举报该信息</a>{/if} -->
         </div>
          {if $info.comments}
          <div class="list">
            <ul>
              {foreach from=$info.comments key=i item=item}
              <li class="m-b10 p-b10">
                {if $item.avatar}
                <img src="{$item.avatar.b}" class="pull-left" width="40" height="40">
                {else}
                <img src="/images/avatar.jpg" class="pull-left" width="40" height="40">
                {/if}

                <div class="pull-right info p-w92">
                  <p class="name-bar">
                    <label class="name m-r20">{$item.user_name}</label>
                    <label class="grey m-r20 m-t2">{$item.create_time} </label>
                    {if $session.id}
                      {if $item.is_like == 0}
                      <a type="button" class="pra m-r10 is_pra" data-id="{$item.id}" style="-webkit-appearance:caret;">
                      {else}
                      <a type="button" class="pra m-r10 un_pra" data-id="{$item.id}" style="-webkit-appearance:caret;">
                      {/if}
                    {else}
                    <a href="/radishweb/passport/login" class="m-r10" >  
                    {/if}
                      <img src="/images/pra.png" width="16" class="pull-left m-r5 is_pra {if $item.is_like == 1}collapse{/if}">
                      <img src="/images/pra2.png" width="16" class="pull-left m-r5 un_pra {if $item.is_like == 0}collapse{/if}">
                      <span>{$item.num_like}</span>
                    </a>
                    {if $session.id}   
                      {if $session.id !== $item.user_id}
                      <a type="button" class="com" data-id="{$info.id}" data-toid="{$item.id}" data-type="2" data-name="{$item.user_name}" style="-webkit-appearance:  caret;">
                      {/if}
                    {else}
                      <a href="/radishweb/passport/login"> 
                    {/if}
                       <img src="/images/com.png" width="16" class="pull-left m-r5 com">
                       <img src="/images/com-2.jpg" width="16" class="pull-left m-r5 com2 collapse">
                     </a>   
                  </p>
                  <p class="content m-b15">
                    {if $item.to_id !== '0'}
                    回复:<label class="orange">{$item.to_user_name}</label>
                    {/if}
                    {$item.content}
                  </p>
                </div>
              </li>
              {/foreach}
            </ul>
          </div>
          {/if}  
        </div>
        
        {if $session.id}
        <div class="pull-right p-w90 m-t20" id="comments">
          <form class="form" >
          <input type="hidden" name="q_id" class="classid" value="{$info.id}">
          <input type="hidden" name="to_id" class="toid" value="0">
          <input type="hidden" name="type" class="classtype" value="0">
          <p class="coms collapse m-b15">回复：<label></label></p>
          <div class="form-group form-content txt">
            <textarea  class="form-control com-content txt1" rows="12" name="content" maxlength="300" placeholder="输入在这里开始"></textarea>
            <span class="txtbar1">(0/300)</span>
          </div>  
          <button type="button" id="subCon"  class="btn btn-warning m-t15 btn-primary w-80" style="width: 80px;height: 36px;">提交</button>
          </form>
        </div>
        {/if}
      </div>
    </div>
    <!--
    <div class="sidebar pull-left w-140">
      <ul>
        <li {if !$page.params.genre}class="active"{/if}> <a href="/radishweb/index/index">全部分类</a> </li>
        {foreach from=$genre key=i item=item}
        <li> 
          <a href="/radishweb/index/index?genre={$item.id}">{$item.name}</a> 
        </li>
        {/foreach}
      </ul>
    </div>-->
  </div>
  {include file="radishweb/widgets/page/page.tpl"}
  
  <!--add-->
  <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">添加备注</h4>
        </div>
        <form class="modal-body" id="bzop">
          <input type="hidden" name="q_id" class="classid" value="">
          <input type="hidden" name="type" id="type" value="1">
          <input type="hidden" name="to_id" value="0">
          <div class="form-group form-content1">
            <label class="control-label">内容</label>
            <textarea class="form-control m-t5 txt1" rows="8" name="content1" maxlength="300"></textarea>
            <span class="txtbar1">(0/300)</span>
          </div>
          <p class="text-right">
            <button type="button" class="btn btn-primary" >确认</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
          </p>
        </form>
      </div>
    </div>
  </div>
  <!--pre-->
  <div class="modal fade" id="preModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">举报</h4>
        </div>
        <form class="modal-body" id="note">
          <input type="hidden" name="q_id" class="classid" value="{$info.id}">
          <div class="form-group form-note">
            <label class="control-label">内容</label>
            <textarea class="form-control m-t5 txt1" rows="8" name="note" maxlength="300"></textarea>
            <span class="txtbar1">(0/300)</span>
          </div>
          <p class="text-right">
            <button type="button" class="btn btn-primary">确认</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
          </p>
        </form>
      </div>
    </div>
  </div>
  <!--打赏-->
  <div class="Cover">
    <div class="m-Cover" id="Cover1">
      <div class="m-title">打赏<img src="/images/Onclose.png" alt="关闭"></div>
      <div class="m-list">
        <span>打赏金币:</span>
        <ul>
          <li data-money="1" class="active">1金币</li>
          <li data-money="5">5元</li>
          <li data-money="10">10元</li>
          <li data-money="20">20元</li>
          <li data-money="50">50元</li>
          <li data-money="100">100元</li>
        </ul>
        <input type="hidden" value="{$info.id}" id="topicId">
        <input type="hidden" value="" id="orderId">
        <input type="hidden" value="1" id="dataMoney" data-rate="{$rate}">
        <input type="hidden" value="{$banlance}" id="banlance">
        <span style="margin-left: 83px;">
          其他金额：
         <input type="text" name="gold" class="gold" autocomplete="off" placeholder="请输入您的打赏金额" style="width:70%">
        </span>
        <p class="goldInadequate">金币余额不足，当前余额{$banlance}金币 <a href="/radishweb/money/default">去充值</a></p>
        <button type="button" class="btn btn-warning w-130 h-36  m-l72 m-t30" id="withdraw">确认支付</button>
      </div>
    </div>
    <div class="m-Cover" id="Cover2">
      <div class="m-title">输入密码<img src="/images/Onclose.png" alt="关闭"></div>
      <div class="m-password">
        <p>请输入支付密码</p>
        <!---->
        <div class='virbox'>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </div>
        <br><br>
        <input type="password" class="realbox" maxlength="6" id="Passw"  autocomplete="off">
        <i class="virboxI"></i>
          <!--支付密码-->
        </div>
        <!---->
        <button id="topicPass" type="button" class="btn btn-warning w-130 h-36">确定</button>
      <div class="forget-password m-t16">
        <a href="/radishweb/passport/modifywithdrawpass?id={$info.id}&type=1">忘记密码 ?</a>
      </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="session"  value="{$session.id}">
 <!--认领中-->
 <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header" style="border: navajowhite">
            <h4 style="font-size:18px; width: 106.95px; margin: 0 auto;">填写认领信息</h4>
           <!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
          </div>
          <div class="modal-body">
              <div class="form-group Claim">
                <span id="infoid">{$info.id}</span>
                <table style="border-collapse:separate; border-spacing:0 20px;margin-left:19px;">
                  <tr>
                    <td>填写姓名：</td>
                    <td><input type="text" id="uer" style="width:120px;height:32px;background-color: #e7e7e7;"></td>
                  </tr>
                  <tr>
                    <td>填写联系方式：</td>
                    <td><input type="text"  id="tel" style="width:200px;height:32px;"></td>
                  </tr>
                  <tr>
                    <td>填写证件号码：</td>
                    <td><input id="identity" class="user_idcard" type="text" placeholder="如身份证或港澳通行证" style="width:254px;height:32px;"></td>
                  </tr>
                  <tr>
                    <td>备注：</td>
                    <td>
                      <textarea name="" id="merark"  maxlength="600" style="width:322px;height:140px;background-color: #e7e7e7; border: 0px;outline:none; padding-left: 7px; padding-top: 8px;" cols="30" rows="10"></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td style="color:#999999;font-size:14px;position: relative;top: -13px;">
                      温馨提示：发布者核实您的信息后,才能领取成功哦。
                    </td>
                  </tr>
                </table>
               <span class="btn" id="identity_sub123"  style="width:124px;height:38px;color:#333;font-size:0.9rem;margin:-4px 0px 0 0px;float: right;color:#fff;background-color:#f6881b;line-height: 29px;">提交</span>
              </div>
          </div>
        </div>
      </div>
  </div>
  <!--select2-->
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="preview.css">
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
  <!--FormValid-->
  <script type="text/javascript" src="/util/FormValid.js"></script>
  <script type="text/javascript" src="index.js"></script> 
  <script type="text/javascript" src="preview.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}

