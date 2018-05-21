(function (window, $, undefined) {
  $(function () {
		
		
		$(".big-img").hide();
    $(".img_box").on('click',function(){
			var imgSrc = $(this).attr('data-img');
			$(".big-img img").attr('src',imgSrc);
			$(".big-img span").html($(this).index() + "/" + $(".img_box").length);
			$(".big-img").show();
			document.ontouchmove=function(){
         return false;
       }
		});
		$(".big-img").click(function(){
			$(this).hide();
			document.ontouchmove=function(){
         return true;
       }
		});
		
		var browser = {
			versions: function () {
				var u = navigator.userAgent,
					app = navigator.appVersion;
				return { //移动终端浏览器版本信息

					mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端

				};

			}(),
			language: (navigator.browserLanguage || navigator.language).toLowerCase()
		}

		if (browser.versions.mobile) { //判断是否是移动设备打开。browser代码在下面
			var ua = navigator.userAgent.toLowerCase(); //获取判断用的对象
			if (ua.match(/MicroMessenger/i) == "micromessenger") {

				$('.download button').on('click',function(){

					$(".uu").show();
					document.ontouchmove = function () {
						return false;
					}
				})
				$(".uu").click(function () {
					$(this).hide();
					document.ontouchmove = function () {
						return true;
					}

				})

			} else {

				$('.download button').on('click',function(){
					location.href = "http://openbox.mobilem.360.cn/index/d/sid/3747005";
					//location.href = "http://a.app.qq.com/o/simple.jsp?pkgname=com.yunbix.meida";
				})

			}
		}
    

  })
})(window, $, undefined)