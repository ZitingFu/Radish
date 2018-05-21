{include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper p-t30">
    <div class="content w-841 pull-right section wrap-content">
      <div class="titlebar m-t0 m-b20">
        <div class="listHead"><a href="/radishweb/passport/mycomments" >信息评论</a>{if $session.type==2}<a href="/radishweb/passport/mynotice2" class="listActive">公告评论</a>{/if}</div>
      </div>
      <div class="col-list m-t20">
        <ul>
          {foreach from=$comments key=i item=item}
          <li class="m-b25">
            <p class="com m-b10"><label>我的评论</label>：{$item.content}</p>
            <a href="/radishweb/notice/info?id={$item.question.id}" data-id2="{$session.id}">
              {if $session.avatar}<img src="{$session.avatar.s}" class="pull-left imgWrap" width="60" height="60">{else}<img src="/images/avatar.jpg" width="60" height="60" class="pull-left imgWrap">{/if}
              <div class="info pull-right p-w91">
                <p> {$item.question.user_name}<label class="pull-right">{$item.question.time}</label> </p>
                <p class="m-t10 m-b10">{$item.question.genre_name}</p>
                {if $item.question.images}
                <div class="show_img">
                  {foreach from=$item.question.images key=i item=items}
                  <img src="{$items.b}" alt="" class="w-248 h-160 m-b10 m-r10">
                  {/foreach}
                </div>
                {/if}
                <p class="content m-b10">{$item.question.content|truncate:120:"...":true}<span class="cancelled" data-id="{$item.id}">删除</span></p>
                <!--<P class="m-b25"><label>联系人：</label>{$item.question.name} <label class="m-l20">联系电话：</label>{$item.question.phone}</P>-->
              </div>
            </a>
          </li>
          {/foreach}
        </ul>
      </div>
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}
  </div>
  {include file="radishweb/widgets/page/page.tpl"}
  <!--select2-->
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
  <link rel="stylesheet" href="mycomments.css">
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
  <script src="index.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}