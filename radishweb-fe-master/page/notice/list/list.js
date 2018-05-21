(function (window, $, undefined) {
    $(function () {
        showCityInfo();
        $.ms_DatePicker({               //实例化年月日
            YearSelector: "#select_year",
            MonthSelector: "#select_month",
            DaySelector: "#select_day"
        });
        var positionCity;
        setTimeout(function(){
            positionCity=$('#positionCity').val();
            $("#city").trigger("change");
            return positionCity;
        },1000);
        var map = new AMap.Map("container", {           //实例化地图
            resizeEnable: true
        });
        //提交搜索事件
        $("#submit_then").submit(function(e){
            var year=$('#select_year').val();//年
            var month=$('#select_month').val();//月
            var day=$('#select_day').val();//日
            //因为input取出来的是字符串 所以要做隐式转换
            if((year-0) || (month-0) || (day-0)){
                month=isTime(month);
                day=isTime(day);
                $('#time').val(year+'-'+month+'-'+day)
            }
        });

        //$('#site').select2();
        (function(){
            //判断搜索不到信息时候提示
            var conList=$('.col-list').find('li.m-b25').length;
            if(!conList){
                setTimeout(function(){
                    ybb.msgs('未搜索到符合条件的信息', 'warning');
                },300);
            }
        })();
        //init
        ybb.location('#province','/radishweb/area/list', 'code=0');
        $(document).on('change', '#province', function () {
                var code = $(this).val();
                if(!code){
                    $('#city').empty().prepend('<option value="0">请选择城市</option>').select2();
                    $('#area').empty().prepend('<option value="0">请选择区域</option>').select2();
                    return false;
                }
                $('#city').parents('li').removeClass('collapse');
                ybb.location('#city', '/radishweb/area/list', 'code='+code);
            })
            .on('change', '#city', function () {
                var code = $(this).val();
                if(!code){
                    code=positionCity;
                }
                var site_id=$('#site_id').val();
                if(!code){
                    return false;
                }
                AMap.service(["AMap.PlaceSearch"], function() {             //实例化地图
                    var placeSearch = new AMap.PlaceSearch({ //构造地点查询类
                        pageSize: 55,          //返回的数目
                        pageIndex:1,
                        city: code  //城市
                    });
                    placeSearch.search(site_id, function(status, result) {        //关键字查询
                        console.log(status, result);
                        if(status === 'complete' && result.info === 'OK'){
                            var outcome=result.poiList.pois;
                            console.log(outcome);
                            var outSting='<option value="">请选择二级场所</option>';
                            for(var i=0;i<outcome.length;i++){
                                outSting+='<option value='+outcome[i].name+'>'+outcome[i].name+'</option>';
                            }
                            $('#site').empty().prepend(outSting).select2();
                        }
                        //TODO:开发者使用result自己创建交互面板和地图展示
                    });
                });
                $('#area').parents('li').removeClass('collapse');
                ybb.location('#area', '/radishweb/area/list', 'code='+code);
            })
            .on('change', '#area', function() {
                var code = $(this).val();
                if(!code) return false;
            });
        (function () {
            setTimeout(function(){
                ItemSelected('#province', 'province');
                setTimeout(function(){
                    ItemSelected('#city', 'city');
                    $('#site').change();
                    setTimeout(function(){
                        ItemSelected('#area', 'area');
                    },500)
                },500);
            },500)
        })();

    })
})(window, $, undefined)
