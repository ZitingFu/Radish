{include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper p-t30">
    <div class="content w-930 pull-right p-t0 section">
      <div class="titlebar m-t0 m-b20">
        <label>审核状态</label>
      </div>
      <div class="text-center p-t30">
        {if $user_type == '0'}
        <img src="/images/status-loading.jpg">
        {elseif $user_type == '2'}
        <img src="/images/status-fail.jpg" class="show margin-auto">
          {if $type == '1'}
          <a href="/radishweb/passport/volunapply?id={$session.id}&type=1"><img src="/images/status-btn.jpg" class="m-t20"></a>
          {elseif $type == '2'}
        <a href="/radishweb/passport/orgapply?id={$session.id}&type=1"><img src="/images/status-btn.jpg" class="m-t20"></a>
          {/if}
        {elseif $user_type == '1'}
        <img src="/images/status-ok.jpg">
        {/if}
      </div>
    </div>
    <div id="block">
      {include file="radishweb/widgets/nav/usernav-left.tpl"}
    </div>
  </div>
  {include file="radishweb/widgets/page/page.tpl"}
  <!--select2-->
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
  <script src="index.js"></script> 
  <style>
    @media only screen and (min-width: 1200px){
      #block .leftpop {
         display: block;
      }
    }
  </style>

{include file="radishweb/widgets/footer/footer.tpl"}