$("#file").change(function(){
		var logowidth = $("#file").get(0).files[0];
	 	var reader = new FileReader();
	 	 reader.readAsDataURL(logowidth);
	 	 reader.onload=function(e){
	 	 	$("#logoimgimg").get(0).src = e.target.result;
	 	 }
	})

var imgs=[];//存储图片链接
 //为文件上传添加change事件
 var fileM=document.querySelector("#file");
$("#file").on("change",function(){
	  //获取文件对象，files是文件选取控件的属性，存储的是文件选取控件选取的文件对象，类型是一个数组
	  var fileObj=fileM.files[0];
	  //创建formdata对象，formData用来存储表单的数据，表单数据时以键值对形式存储的。
	  var formData=new FormData();
	  formData.append('file',fileObj);

	  //创建ajax对象
	 var ajax=new XMLHttpRequest();
	 //发送POST请求
	ajax.open("POST","/radishweb/upload/ocr",true);
	ajax.send(formData);
	ajax.onreadystatechange=function(){
		if (ajax.readyState == 4) {
			if (ajax.status>=200 &&ajax.status<300||ajax.status==304) {
				var da = JSON.parse(ajax.responseText).data
				var time = JSON.parse(da[0])
				var name = time.name
				var sex = time.sex
				var nationality = time.nationality
				var birth = time.birth
				var address = time.address
				var num = time.num
				$(".name").html(name)
				$(".sex").html(sex)
				$(".nationality").html(nationality)
				$(".birth").html(birth)
				$(".address").html(address)
				$(".num").html(num)
				// var obj=JSON.parse(ajax.responseText);
			}
		}
	}
});	

