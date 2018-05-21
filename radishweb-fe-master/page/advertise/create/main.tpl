{include file="radishweb/widgets/header/header.tpl"}
<style>
	.about p {
		font-size: 16px;
		line-height: 24px;
		text-indent: 2em;
	}
	.about p:first-child {
		text-indent: 0;
	}
	.titlebar2{
		border-bottom: solid #ececec 1px;
	}
	.listHead{
	}
	.listHead a{
		display: inline-block;
		width: 84px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		background: #ececec;
		font-size: 14px;
		color: #999;
	}
	a.listActive{
		color: #fff;
		background: #fda249;
	}
	.footer{
		
		bottom: 0;
	}
    
	#textareaBtn{
		position:relative;
		
		font-size:18px;
		border:0;
		background-color:#fda249;
		border-radius:5px;
		color:white;
		padding:5px;
		top:40px;
		z-index:9;
		margin-bottom:50px;
		left:35px;
	}
	.txtbar1{
		position:relative;
		
		top:0px;
		float:right;
	}
    
</style>
<link rel="stylesheet" href="create.css">
<body>
	{include file="radishweb/widgets/nav/nav.tpl"}
	<div class="wrapper container p-t30">
		<div class="content reg">
			<div class="titlebar2 m-b30">
				<div class="listHead">
					<a href="/radishweb/index/about">关于我们</a>
					<a href="/radishweb/index/manual">使用说明</a>
					<a href="/radishweb/advertise/create" class="listActive">帮助与反馈</a>
				</div>
			</div>
			<!--<div class="titlebar m-b30">-->
				<!--<div class="listHead"><a href="/radishweb/notice/create" class="listActive">关于我们</a><a href="/radishweb/notice/create">使用说明</a></div>-->
			<!--</div>-->
			<div class="">

                
                <div id="" class="feedback-title">
                    <i class=""></i>
                    <p>您好，我是<span id="">小萝卜PC端</span>产品经理，欢迎您给我们提产品的使用感受和建议！</p> 
                </div>
                
            
            
                <form id="form-create">
                    <div class="form-group form-content ">    
                    <textarea style="font-size:15px" name="content" id="areaTxt" class="container" maxlength="500" style=""  placeholder="感谢您给我们提出建议。
抱歉我们不能逐一回复您的意见。
您的感受和建议一旦在此发表，即表示您同意我们可无偿参考您的感受和建议来优化我们的产品和服务。
若您有商业合作意向，请联系公司相关业务部门。
联系方式：****"></textarea>
 					<span class="txtbar1">(0/500)</span>
                    <input class="pull-right " type="button" id="textareaBtn"  value="提交" style="padding:3px 8px;">
                   
                    </div>
                </form>
			</div>
			
		</div>
	</div>
    <script type="text/javascript">
        $('#textareaBtn').click(function(){
            var txt3=$('#areaTxt').val();
			//console.log(txt3)
			var logined =$('.loginUserName').val();
			//console.log(logined)
			if(logined== undefined){
				alert('请登陆！！！');
				return;
			}
			else if(txt3 == ''){
				alert('请填写内容！');
				return;
			}
            $.ajax({
                type: "POST",
                url: '/radishweb/advertise/create',
                data: { content:txt3 },
                async: true,
                success: function (res) {
                    console.log(res)
					alert('提交成功，感谢您的建议');
					location.reload();
					
                }

            })
    })
    </script>
	{include file="radishweb/widgets/footer/footer.tpl"}