{include file="radishweb/widgets/header/header.tpl"}
<body class="page-template-default page page-id-1605 woocommerce dokan-theme-dokan">
  <!--
  <nav class="navbar navbar-expand-lg navbar-light signbar">
		<div class="container">
			<a href="#" class="navbar-brand text-warning" id="logoTxt"><img src="http://img.qa.xluob.com/life-better.jpg"></a>

        
        <li class="indexSearch">
            <form class="pull-right" action="/radishweb/index/index" method="get" id="Search">
                <input type="text" name="content" value="" placeholder="搜索">
                <img src="/images/icon_serch.png" alt="" class="iconSerch">
                <input type="hidden" value="search" name="type">
            </form>
        </li>
        </nav>
      <!--
      {if $type == 131}
			<li class="indexSearch collapse navbar-collapse justify-content-end" id="Search">
				<form class="form-inline form-navbar my-2 my-lg-0 order-2" action="/radishweb/index/index" method="get" id="Search">
					<input class="form-control" id="input-search" name="content" type="text" placeholder="搜索" value maxlength="255" value=""> </input>
          <input type="hidden" value="search" name="type">
				</form>
			</li>
      {/if}-->
      <!--
			<ul class="navbar-nav d-none d-lg-flex ml-2 order-3">
				<li class="nav-item">
					<a class="nav-link" href="/radishweb/passport/login">登录</a><i></i>
				</li>
        <li><i class="i w-2 h-12"></i></li>
				<li class="nav-item">
					<a class="nav-link" href="/radishweb/passport/reg1">注册</a>
				</li>
			</ul>
			
			<ul class="navbar-nav d-lg-none hidden">
				<li class="nav-item-divider"></li>
				<li class="nav-item"><a class="nav-link" href="//themes.getbootstrap.com/signin/">Sign in</a></li>
				<li class="nav-item"><a class="nav-link" href="//themes.getbootstrap.com/my-account/">Sign up</a></li>
			</ul>
		
		</div>
	</nav>
  -->
 
	
	 {include file="radishweb/widgets/nav/nav.tpl"}
	
	<div id="demo" class="carousel slide" data-ride="carousel">
 
	  <!-- 指示符 -->
	  <ul class="carousel-indicators">
		<li data-target="#demo" data-slide-to="0" class="active"></li>
		<li data-target="#demo" data-slide-to="1"></li>
		<li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	 
	  <!-- 轮播图片 -->
	  <div class="carousel-inner">
		
		<div class="carousel-item active">
		  <img src="//img.qa.xluob.com/lunbo3.png">
		</div>
		<div class="carousel-item">
		  <img src="//img.qa.xluob.com/%E5%9B%BE1.png">
		</div>
    <div class="carousel-item">
		  <img src="//img.qa.xluob.com/%E5%9B%BE2.png">
		</div>
	  </div>
	 
	  <!-- 左右切换按钮 -->
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		<span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
		<span class="carousel-control-next-icon"></span>
	  </a>
	 
	</div>
	
	<!-- 省市区 -->
	  <div class="searchbar nav container" style="border-radius:6px;w-1152">
        <form class="" action="/radishweb/index/index" method="get" id="submit_then">
        {if $page.params.genre}
        <input type="hidden" name="genre" value="{$page.params.genre}" >
        {/if}
        <ul class="container">
          <li class="form-group">
            <label class="title pull-left">区域：</label> 
            
            <select class="form-control pull-left " name="province" id="province"></select>
          </li>
          <li class="form-group collapse"> 
            <select class="form-control" name="city" id="city"></select>
          </li>
          <li class="form-group collapse"> 
            <select class="form-control" name="area" id="area"></select>
          </li>
          <li class="form-group m-l10">
            <label class="title pull-left">场所：</label>
            <select class="form-control pull-left" name="site" id="site">
              {foreach from=$site key=i item=item}
              <option value="{$item.id}" {if $get.site == $item.id}selected{/if}>{$item.name}</option>
              {/foreach}
            </select>
          </li>
          <li class="form-group collapse">
            <select class="form-control" name="site_two" id="siteTwo">
              <option value="">请选择二级场所</option>
            </select>
          </li>
          <br/>
          <li class="form-group m-t3">
            <label for="select_year" class="title pull-left">时间：</label>
            <select id="select_year"  class="form-control w-40 m-r5 pull-left" rel="{$time[0]}" style="max-height: 50px"></select>  <!--年设置rel 可以设置默认的年月日-->
            <label for="select_month" class="p-w15" style="display: none"></label>
            <select id="select_month" class="form-control w-70 m-r5 pull-left" rel="{$time[1]}"></select>  <!--月-->
            <label for="select_day" class="p-w15" style="display: none"></label>
            <select id="select_day" class="form-control w-70 pull-left" rel="{$time[2]}"></select>  <!--日-->
            <input type="hidden" value="" id="time" name="time">
          </li>
          <li class="form-group pull-right queding">
            <button type="submit" class="btn btn-warning queding" style="background-color:#fda249;color:#fff;margin-top:6px;width:60px;height:30px;padding:0;">确定</button>
          </li>
        </ul>
        </form>
      </div>
    
	  <!--导航栏-->
    {include file="radishweb/widgets/nav/indexnav-left.tpl"}
    <!--
	  <div class="navbar navbar-expand-sm "  id="nav-all" style="padding:0px;border:0;border-radius:5px;margin-top:5px;">
		<ul class="container list-unstyled text-primary" style="background-color:#fda249;padding:15px;border-radius:6px">
			<li><a class="text-muted" style="color:#fff!important" src="http://xluob.com/radishweb/index/index">全部</a></li>
			<li><a class="text-muted" style="color:#fff!important" src="http://xluob.com/radishweb/index/index?genre=1">寻人</a></li>
			<li><a class="text-muted" style="color:#fff!important" src="http://xluob.com/radishweb/index/index?genre=2">寻物</a></li>
			<li><a class="text-muted" style="color:#fff!important" src="http://xluob.com/radishweb/index/index?genre=3">认人</a></li>
			<li><a class="text-muted" style="color:#fff!important" src="http://xluob.com/radishweb/index/index?genre=4">认领</a></li>
			<li><a class="text-muted" style="color:#fff!important" src="http://xluob.com/radishweb/index/index?genre=5">活动展示</a></li>
		</ul>
	  </div>-->
    <p id="l" style="display:none"></p>
    <p id="new-time" style="display:none;"></p>
	<div class="col-list m-t20">
        {if $list}
        <ul class="container">
          {foreach from=$list key=i item=item}
          <li class="m-b25 border-99">
            
            <div class="ma-ri15">
             
                  {if $item.avatar.b}
                    <img src=" {$item.avatar.b}" class="pull-left imgWrap w-80 h-80" style="border-radius:50%;border:1px solid transparent"> 
                    {else}
                    <img src="/images/avatar2.png" class="pull-left imgWrap  " style="border-radius:50%">
                    {/if}
                    <a class="aimg" href="/radishweb/passport/center?id={$item.user_id}" style="height: 80px;"></a>
               
            </div>
              
              <div class="ma-le15">
                <a href="/radishweb/question/info?id={$item.id}" data-id2="{$item.user_id}">
                        <p class="timespan" style="display:none"></p>
                        <!-- <p class="expire">{$item.expire}</p> -->
                        <!-- <p class="status">{$item.status}</p> -->
                        <!-- <p class="y-status">{$item.status}</p> -->

                         <!-- 距认领期结束还有 -->
                         <!-- 发布时间 -->
                          <p class=" p-t13">{$item.user_name}
                            <label class="pull-right y-time indexnone">{$item.time}
                             </label>
                             <!--。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。 -->
                             <!-- <div class=""> -->
                                <label class="pull-right tong xian index">
                               </label> 
                               <label class="pull-right tong index renling">距{if $item.annouce}公告期{else}认领期{/if}结束还有</label> 
                               <label class="pull-right xian tong index"></label> 
                             <!-- </div> -->
                             <!-- 。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。 -->
                          </p>
                          <!-- 天时分秒 -->
                          <p class="p-t10 p-b14">
                            <span class="y-center" > {$item.gen_name}</span>
                            <!-- 。。。。。。。。。。。。。。。。。。。。。。。。。 -->
                              <label class="pull-right ma_r19 index">
                                 <button class="btn Reverse_Smallbtn y-d">开</button>
                                <span class="Reverse_span">天</span>
                                <button class="btn Reverse_Smallbtn y-h">开</button>
                                <span class="Reverse_span">时</span>
                                 <button class="btn Reverse_Smallbtn y-m">开</button>
                                <span class="Reverse_span">分</span>
                                 <button class="btn Reverse_Smallbtn y-s">开</button>
                                <span class="Reverse_span">秒</span>
                                <!-- 。。。。。。。。。。。。。。。。。。。。。。。。。。。 -->
                              </label> 
                          </p>
                       
                        <div class="info pull-left p-w91" style="width:100%;padding:right:10px;margin-top:15px;">
                      
                       <!-- 已领取 -->

                       {if $item.status !=11}
                          {if $item.images}
                               <div class="show_img m-b15" id="contentImgDiv">
                                  {foreach from=$item.images key=i item=items}
                                  <img data-original="{$items.b}" src="{$items.b}" width="240" height="160" data-imgIndex="{$i}">
                                  {/foreach}
                              <div>
                          {else}
                            {if $item.video}
                            <video src="{$item.video}" controls="controls" class="videoMp4"></video>
                            {/if}
                          {/if}
                        {else}
                          {if $item.f_g_id ==1 || $item.f_g_id ==2}
                           <div class="show_img m-b15" id="contentImgDiv">
                            <img src="//img.qa.xluob.com/logo/fond.png" alt="" width="240" height="160">
                          <div>
                          {/if}
                          {if $item.f_g_id ==3 || $item.f_g_id ==4 }
                           <div class="show_img m-b15" id="contentImgDiv">
                            <img src="//img.qa.xluob.com/logo/fond.png" alt=""  width="240" height="160">
                          <div>
                          {/if}
                      {/if}
                      </div>
                      <p class="content container p-b10" style="padding:0">{$item.content|truncate:100:"..."}</p>
                      <P class="p-b10 container dd-f0 p-b20"><label>联系人：</label>{$item.name} <label class="m-l20 mm-f0">联系电话：</label>{$item.phone}</P>
                </a>
              </div>
          </li>
          {/foreach}
        </ul>
        {else}
        <p class="container">暂无数据</p>
        {/if}
      </div>
	
		 {include file="radishweb/widgets/nav/usernav-left.tpl"}
		{include file="radishweb/widgets/page/page.tpl"}
	    <!-- Optional JavaScript -->


{include file="radishweb/widgets/footer/footer.tpl"}
  <!--select2-->
  <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.3&key=b253a2b2c53202149a1e6f1aa1e90a88&plugin=AMap.CitySearch"></script>
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
  <link rel="stylesheet" href="css.css">
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
  <script src="/libs/birthday/birthday.js"></script>
  <!--<script src="/libs/map/gaodeMap.js"></script>-->
  <script src="js.js"></script>
  <script src="index.js"></script> 