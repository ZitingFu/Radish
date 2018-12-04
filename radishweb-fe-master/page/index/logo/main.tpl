
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
		border-bottom: solid #c7c7c7 1px;
		margin-bottom:76px; 
	}
	.listHead{
		margin-bottom:0 
	}
	.listHead a{
		display: inline-block;
		/*width: 84px;*/
		height: 35px;
		line-height: 35px;
		text-align: center;
		/*background: #ececec;*/
		font-size: 16px;
		color: #333333;
	}
	a.listActive{
		color: #fff;
		background: #fda249;
	}
	.footer{
		bottom: 0;
	}
	.boxp{
		text-align: right;
		margin-top:30px;
		margin-right:8px;
		font-size:16px;
	}
	.boxp span{
		cursor: pointer;
		margin-left:34px; 
	}
	.boxp span:hover{
		color:#fda249
	}
	/*.preview:hover{
		display: none;
		
	}*/
	.img2{
		width: 199px;
	    height: 153px;
	    margin-left: 13%;
	    margin-top: 15%;
	}
	.img1{
	    width: 189px;
	    height: 75px;
	    margin-left: 13%;
	    margin-top: 32%;
	}
	.box{
		float: left;
		margin-right:111px; 
		width: 266px;
	}
	.materiel{
	 	margin-left: 20px;
		box-shadow:2px 5px 41px 2px #cfcece;
		width: 240px;
		height:240px;
	}
	
	.Popup{
		width: 100%;
		height: 100%;
		top:0;
		left: 0;
		z-index: 99;
		position: fixed;
		background-color: #000;
		opacity: 0.5;
	}
	.Popup img{
		width: 50%;
	    z-index: 100;
	    margin-left: 25%;
	}

	.table tr{
		height: 49.5px;
		text-align: center;
	}
	.width580{
		width: 580px;
	}
	.width750{
		width: 750px;
		left: -15%;
	 	top: 50%;
	 	margin-top: 154.95px;
	}
	.modal-title{
		font-size: 16px;
	}
	/*#preview1{
		 display: table;
	}
	#preview1 .modal-content{
	  display: table-cell;
	  text-align: center;
	  vertical-align: middle;
	}*/
	 @media (max-width:480px){
	    .width750{
	    	width: 100%;
	    	left: 0
	    }
	     .width580{
	    	width: 100%
	    }
	  }
	  @media (min-width: 576px){
		.modal-dialog {
		    max-width: 500px;
		    margin: 225px auto;
		}
	}
</style>
<body>
	{include file="radishweb/widgets/nav/nav.tpl"}
	<div class="wrapper p-t30">
		<div class="content reg">
			<div class="titlebar2">
				<div class="listHead">
					<a href="">小萝卜公益logo下载</a>
				</div>
			</div>
			<div class="box">
				<div class="materiel">
					<img class="img1" src="logo1.png" alt="">
				</div>
				<p class="boxp">
					<span class="preview" data-toggle="modal" data-target="#preview1" data-whatever="@getbootstrap" >预览</span>
					<span  style="cursor: pointer" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">下载</span>
				</p>
			</div>
			<div class="box">
				<div class="materiel">
					<img class="img2" src="logo.png" alt="">
				</div>
				<p class="boxp">
					<span class="preview" data-toggle="modal" data-target="#preview" data-whatever="@getbootstrap">预览</span>
					<span style="cursor: pointer" data-toggle="modal" data-target="#exampleModal1" data-whatever="@getbootstrap">下载</span>
				</p>
			</div>
		</div>


		<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content width750">
		      <div class="modal-header" style="border: navajowhite">
		        <h4 class="modal-title" id="exampleModalLabel">更多尺寸</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="form-group">
		            <table class="table width580" style="margin: 0 auto;border: 1px solid #cecece;">
		            	<tr style="background-color:#f3f5f9">
		            		<td>二维码边长(px)</td>
		            		<td>建议扫描距离(m)</td>
		            		<td>下载链接</td>
		            	</tr>
		            	<tr>
		            		<td>300px</td>
		            		<td>0.6m</td>
		            		<td>
		            			<a href="https://img.qa.xluob.com/logo/logo%20%28300x300%29.rar">
		            				<img src="x.png" alt="">
		            			</a>
		            		</td>
		            	</tr>
		            	<tr>
		            		<td>500px</td>
		            		<td>1m</td>
		            		<td>
		            			<a href="https://img.qa.xluob.com/logo/logo%20%28500x-x500%29.rar">
		            				<img src="x.png" alt="">
		            			</a>
		            		</td>
		            	</tr>
		            	<tr>
		            		<td>100px</td>
		            		<td>2m</td>
		            		<td>
		            			<a href="https://img.qa.xluob.com/logo/logo%20%28100x1000%29.rar">
		            				<img src="x.png" alt="">
		            			</a>
		            		</td>
		            	</tr>
		            </table>
		          </div>
		         <!--  <div class="form-group">
		            <label for="message-text" class="control-label">Message:</label>
		            <textarea class="form-control" id="message-text"></textarea>
		          </div> -->
		        </form>
		      </div>
		      <!-- <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Send message</button>
		      </div> -->
		    </div>
		  </div>
		</div>

		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content width750">
		      <div class="modal-header" style="border: navajowhite">
		        <h4 class="modal-title" id="exampleModalLabel">更多尺寸</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="form-group">
		            <table class="table width580" style="margin: 0 auto;border: 1px solid #cecece;">
		            	<tr style="background-color:#f3f5f9">
		            		<td>二维码边长(px)</td>
		            		<td>建议扫描距离(m)</td>
		            		<td>下载链接</td>
		            	</tr>
		            	<tr>
		            		<td>300px</td>
		            		<td>0.6m</td>
		            		<td>
		            			<a href="https://img.qa.xluob.com/logo/logo2%28300x300%29.rar">
		            				<img src="x.png" alt="">
		            			</a>
		            		</td>
		            	</tr>
		            	<tr>
		            		<td>500px</td>
		            		<td>1m</td>
		            		<td>
		            			<a href="https://img.qa.xluob.com/logo/logo2%28500x500%29.rar">
		            				<img src="x.png" alt="">
		            			</a>
		            		</td>
		            	</tr>
		            	<tr>
		            		<td>100px</td>
		            		<td>2m</td>
		            		<td>
		            			<a href="https://img.qa.xluob.com/logo/logo2%281000x1000%29.rar">
		            				<img src="x.png" alt="">
		            			</a>
		            		</td>
		            	</tr>
		            </table>
		          </div>
		         <!--  <div class="form-group">
		            <label for="message-text" class="control-label">Message:</label>
		            <textarea class="form-control" id="message-text"></textarea>
		          </div> -->
		        </form>
		      </div>
		      <!-- <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Send message</button>
		      </div> -->
		    </div>
		  </div>
		</div>
		<!-- 预览1 -->
		<div class="modal fade" id="preview1"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <!-- div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
		      </div> -->
		      <div class="modal-body">
		      	<img src="logo1.png" alt="">
		       <!--  <form>
		          <div class="form-group">
		            <label for="recipient-name" class="control-label">Recipient:</label>
		            <input type="text" class="form-control" id="recipient-name">
		          </div>
		          <div class="form-group">
		            <label for="message-text" class="control-label">Message:</label>
		            <textarea class="form-control" id="message-text"></textarea>
		          </div>
		        </form> -->
		      </div>
		     <!--  <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Send message</button>
		      </div> -->
		    </div>
		  </div>
		</div>
		<!-- 预览2 -->
		<div class="modal fade" id="preview"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <!-- div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
		      </div> -->
		      <div class="modal-body">
		      	<img src="logo.png" alt="">
		       <!--  <form>
		          <div class="form-group">
		            <label for="recipient-name" class="control-label">Recipient:</label>
		            <input type="text" class="form-control" id="recipient-name">
		          </div>
		          <div class="form-group">
		            <label for="message-text" class="control-label">Message:</label>
		            <textarea class="form-control" id="message-text"></textarea>
		          </div>
		        </form> -->
		      </div>
		     <!--  <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Send message</button>
		      </div> -->
		    </div>
		  </div>
		</div>
	{include file="radishweb/widgets/nav/usernav-left.tpl"}
	{include file="radishweb/widgets/footer/footer.tpl"}
	</div>