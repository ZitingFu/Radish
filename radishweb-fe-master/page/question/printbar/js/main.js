
var u = location.search
var id = u.split("=")[1]
$.ajax({
	url:"/radishweb/question/barcode",
	type:"get",
	data:{
		action:"json",
		id:id
	},
	success:function(data){
		var urlimg = data.data.barcode.data[0]
		$(".urlimg")[0].src = urlimg
	}
})
			
// $(".Print").click(function(){
	 // doPrint() 
	// $(".leftpop").hide()
	// $("h2").hide()
	// $(".navbar-light").hide()
	// $(".footer").hide()
	// $(this).hide();
 //      window.print();
 //    $(".leftpop").show()
	// $("h2").show()
	// $(".navbar-light").show()
	// $(this).show();
// })

//页面加载事件
	$(function(){
		$(".Print").click(function(){
			$(this).hide();
			$(".Survey").css({
				"transform":"rotate(90deg)",
				"width":"300px",
				"height":"203px",
				"position":"relative",
				"top":"65",
				"left":"-30"
			})
			$(".modal-content").css({
				"height":"203px"
			})
			$(".gd").css({
				"height":"9%",
				"font-size":"3px",
				"*font-size":"3px"
			})
			doPrint()
		})
	//构建打印参数页面
	// function build_print(ids){
	// 	//根据id的集合发送ajax查询
	// 	$.post(getPath()+"/storage/getQRCode",{"ids":ids},function(result){
	// 		var list = result.extend.stoList;
	// 		$(list).each(function(index,sto){
	// 			//资产编码
	// 			var tr_code = $("<tr></tr>");
	// 			var code = $("<td style='text-align: center;font-size: 0.3cm;width: 1.8cm'>资产编码</td>");
	// 			var code1 = $("<td colspan='2'></td>").append(sto.barCode);
	// 			tr_code.append(code).append(code1);
	// 			//使用公司
	// 			var tr_comp = $("<tr></tr>");
	// 			var comp = $("<td style='text-align: center;'>使用公司</td>");
	// 			var comp1 = $("<td colspan='2'></td>").append(sto.companyInfo==null?"":sto.companyInfo.deptName);
	// 			tr_comp.append(comp).append(comp1);
	// 			//使用部门
	// 			var tr_dept = $("<tr></tr>");
	// 			var dept = $("<td style='text-align: center;'>使用部门</td>");
	// 			var dept1 = $("<td></td>").append(sto.deptInfo==null?"":sto.deptInfo.deptName);
	// 			tr_dept.append(dept).append(dept1);
	// 			//存放地点
	// 			var tr_locate = $("<tr></tr>");
	// 			var locate = $("<td style='text-align: center;'>存放地点</td>");
	// 			var locate1 = $("<td></td>").append(sto.address==null?"":sto.address.addrName);
	// 			tr_locate.append(locate).append(locate1);
	// 			//资产名称
	// 			var tr_name = $("<tr></tr>");
	// 			var name = $("<td style='text-align: center;'>资产名称</td>");
	// 			var name1 = $("<td></td>").append(sto.assName);
	// 			var photo = $("<td rowspan='3' style='text-align: center;width: 1.5cm;height: 1.5cm' ></td>");
	// 			var img = $("<img style='width:97%'>");
	// 			var url = "../../QCImg/"+sto.extend1;
	// 			img.attr("src",url);
	// 			photo.append(img);
	// 			tr_name.append(name).append(name1).append(photo);
	// 			//创建table
	// 			var table = $("<table border='1' style='width: 100%'></table>");
	// 			table.append(tr_code).append(tr_comp).append(tr_name).append(tr_dept).append(tr_locate);
	// 			//创建顶部div
	// 			var div_top = $("<div style='width: 100%;margin:0 auto;'><h4 style='text-align:center;margin-bottom: -22px'>渭南城投集团</h4>"+
	// 			"<br><h6 style='text-align:center;margin-bottom: -0.3px'>固定资产管理标签</h6></div>");
	// 			//分页
	// 			var page_break = $("<div style='page-break-after:always'></div>");
	// 			//创建一个打印页面的div
	// 			var div = $("<div></div>");
	// 			div.append(div_top).append(table);
	// 			//将单个打印页面放入整个打印页面
	// 			$("#dataPanel").append(div).append(page_break);
	// 		});
	// 	});
	// }
	
	//打印
  	function doPrint() {  
	    var print_html;
	    //获取页面所有内容
	    //bdhtml=window.document.body.innerHTML; 
	    //获取打印区域所有内容
	    var html_bak = document.getElementById("dataPanel").innerHTML;
	    //alert(html_bak)
	   	//将打印内容放入body
	    window.document.body.innerHTML = html_bak;
	   	//执行打印	
	    /* if(getExplorer() == "IE"){
		　　　　pagesetup_null();
		　} */
	    window.print();
	   	//将body内容换回
	    //document.body.innerHTML = bdhtml;
	   	//关闭页面
	   	window.location = window.location
	    // window.close();
 	 } 
  
	//获取浏览器型号
	function getExplorer() {
	    var explorer = window.navigator.userAgent ;
	    //ie 
	    if (explorer.indexOf("MSIE") >= 0||explorer.indexOf("rv:11") >= 0) {
	        return "IE";
	    }
	    //firefox 
	    else if (explorer.indexOf("Firefox") >= 0) {
	        return "Firefox";
	    }
	    //Chrome
	    else if(explorer.indexOf("Chrome") >= 0){
	        return "Chrome";
	    }
	    //Opera
	    else if(explorer.indexOf("Opera") >= 0){
	        return "Opera";
	    }
	    //Safari
	    else if(explorer.indexOf("Safari") >= 0){
	        return "Safari";
	    }
	} 


});