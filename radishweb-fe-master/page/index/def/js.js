//  window.onload=function(){
//     //每1秒刷新时间
// }

// setInterval(function (){
    $.ajax({
        type:"OPTIONS",
        url:"window.location.href",
        async:false,
        error:function(a){
            time = new Date(a.getResponseHeader("Date"));
            year = time.getFullYear();
            // console.log(123,time)
                
            //以下是通过三元运算对日期进行处理,小于10的数在前面加上0
            month = (time.getMonth()+1)<10?("0"+(time.getMonth()+1)):(time.getMonth()+1)
            date = time.getDate()<10?("0"+time.getDate()):time.getDate();
            hours = time.getHours()<10?("0"+time.getHours()):time.getHours();
            minutes = (time.getMinutes()<10?("0"+time.getMinutes()):time.getMinutes());
            seconds = (time.getSeconds()<10?("0"+time.getSeconds()):time.getSeconds());
                
            //拼成自己想要的日期格式，2018-01-15 19:05:33
            time = year+"/"+month+"/"+date+" "+hours+":"+minutes+":"+seconds;
             // console.log(time)
             
            // 时间转时间戳
            var nowTime = time;
            var thisTime = nowTime;
            thisTime = thisTime.replace(/-/g, '/');
            var new_time = new Date(thisTime);
            new_time = new_time.getTime()/1000;

            //给相应的位置赋值
            setInterval(function (){
             new_time =  new_time + 1
              function add0(m){return m<10?'0'+m:m }
                function format(new_time){
                    //shijianchuo是整数，否则要parseInt转换
                    var time = new Date(new_time*1000);
                    var y = time.getFullYear();
                    var m = time.getMonth()+1;
                    var d = time.getDate();
                    var h = time.getHours();
                    var mm = time.getMinutes();
                    var s = time.getSeconds();
                    return y+'/'+add0(m)+'/'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
                }
                // console.log("456",format(new_time))
                 $("#new-time").html( format(new_time))
            },1000)
        }
    });
// },500)
 
var pn = $(".pagebar").find(".active").find("span").html()
$.ajax({
    url:"/radishweb/index/index",
    type:"get",
    async:false,
    data:{
        pn:pn,
        action:"json"
    },
    success:function(data){
        var list = data.data.list
        setInterval(function (){
            for(var a=0;a<list.length;a++){
                var create_time = Number(list[a].create_time)
                var expire = Number(list[a].expire*86400)
                // 截止时间
                var timestamp = create_time+expire
                if(list[a].expire != 0){
                    if(list[a].status !=11){
                        //倒计时显示
                        $(".ma-le15").eq(a).find(".index").css({
                            "display":"block"
                        })
                    }
                    else{
                        $(".ma-le15").eq(a).find(".indexnone").css({
                            "display":"block"
                        }) 
                    }
                }
                else{
                    //发布时间显示
                     $(".ma-le15").eq(a).find(".indexnone").css({
                            "display":"block"
                    })

                }
                //截止时间
                function add0(m){return m<10?'0'+m:m }
                function format(timestamp){
                    //shijianchuo是整数，否则要parseInt转换
                    var time = new Date(timestamp*1000);
                    var y = time.getFullYear();
                    var m = time.getMonth()+1;
                    var d = time.getDate();
                    var h = time.getHours();
                    var mm = time.getMinutes();
                    var s = time.getSeconds();
                    return y+'/'+add0(m)+'/'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
                } 
                $(".timespan").eq(a).html(format(timestamp))
                    // 最终  
                     end_time = $(".timespan").eq(a).html()
                    //现在
                     new_time1 = $("#new-time").html()

                    date1 = new Date(new_time1)
                    
                    date2 = new Date(end_time)
                   
                     s1 = date1.getTime();
                     s2 = date2.getTime();
                    total_end = (s2 - s1)/1000;
                    timeCountDown(total_end)
                    function timeCountDown(total){
                        // console.log("total",total)
                        // 
                        // console.log("123",total)
                        var day = parseInt(total / (24*60*60));//计算整数天数
                        var afterDay = total - day*24*60*60;//取得算出天数后剩余的秒数
                        var hour = parseInt(afterDay/(60*60));//计算整数小时数
                        var afterHour = total - day*24*60*60 - hour*60*60;//取得算出小时数后剩余的秒数
                        var min = parseInt(afterHour/60);//计算整数分
                        var afterMin = total - day*24*60*60 - hour*60*60 - min*60;//取得算出分后剩余的秒数
                            days = checkTime(day); 
                            hours = checkTime(hour); 
                            minutes = checkTime(min); 
                            seconds = checkTime(afterMin);
                        $(".y-d").eq(a).html(days)
                        $(".y-h").eq(a).html(hours)
                        $(".y-m").eq(a).html(minutes)
                        $(".y-s").eq(a).html(seconds)
                    }
                    function checkTime(i){ //将0-9的数字前面加上0，例1变为01 
                      if(i<10)   
                      { 
                        i = "0" + i; 
                      } 
                      return i; 
                    } 
            }
        },1100)
     }
})

