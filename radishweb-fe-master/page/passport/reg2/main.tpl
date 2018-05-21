{include file="radishweb/widgets/header/header.tpl"}
<body>
  {include file="radishweb/widgets/nav/nav.tpl"}
  <div class="wrapper container contentShow">
    <img class="backgroundImg-reg2 pull-left" src="http://img.qa.xluob.com/%E6%B3%A8%E5%86%8C%E9%A1%B5%E9%9D%A2_03.png">
    <div class="section reg pull-right">
      <h3>欢迎来到小萝卜注册中心</h3>
      <div class="content-border">
          <div class="titlebar m-t30 m-b45 ">
            <label>注册</label><a href="http://xluob.com/radishweb/passport/reg1"> 第一步</a> > <span class="user1">普通用户</span>
          </div>
          <form id="form-create">
          <input type="hidden" name="id" value="{$id}">
          <ul class="clearFix w-310">
            <div id="form-location" class="form-group form-location">
              <input type="hidden" id="loca-input" name="location" class="form-control"  value="">
              <li class="form-group"> 
                <select class="form-control p-w70 pull-right" name="province" id="province"></select>
                <label for="phone" class="p-w25">区域</label> 
              </li>
              <li class="form-group collapse"> 
                <select class="form-control p-w70 pull-right" name="city" id="city"></select>
              </li>
              <li class="form-group collapse"> 
                <select class="form-control p-w70 pull-right" name="area" id="area"></select>
              </li>
            </div>
            
            <li class="form-group form-name"> 
              <input id="name" name="name" type="text" class="form-control p-w70 pull-right" placeholder="请填写昵称"> 
              <label for="name" class="p-w25">昵称</label> 
            </li>
            <li class="form-group lastLi"> <button type="button" class="btn btn-warning btn-primary p-w70 pull-right" style="
    width: 193px;
    margin-right: 31px;border:0;
">完成注册</button>  <label class="p-w25"></label> </li>
          </ul>
          </form>
      </div>
    </div>
  </div>
  
  <!--select2-->
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2.css" />
  <link rel="stylesheet" type="text/css" href="/libs/select2-3.5.2/select2-bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="index.css" />
  <script type="text/javascript" src="/libs/select2-3.5.2/select2.min.js"></script>
  <script type="text/javascript" src="/libs/select2-3.5.2/select2_locale_zh-CN.js"></script>
  
  <script type="text/javascript" src="/util/FormValid.js"></script>
  
  <script src="index.js"></script>
  
{include file="radishweb/widgets/footer/footer.tpl"}