(function (window, $, undefined) {
    $.ms_DatePicker({               //实例化年月日
        YearSelector: "#select_year",
        MonthSelector: "#select_month",
        DaySelector: "#select_day"
    });
    var passid=$('#passid').val();//ID
    var headImg=$('#headImg');//头像
    $('#avater').change(function(){
        var avatar=document.querySelector('input[type=file]').files[0];
        var reader = new FileReader();
        reader.onloadend = function () {
            headImg.attr('src',reader.result)
        };
        if (avatar) {
            reader.readAsDataURL(avatar);
        } else {
            headImg.attr('src',headImg.attr('src'))
        }
        //var dataWrap=null;
        setTimeout(function(){
            $.post('/radishweb/upload/imgbase',{avatar:headImg.attr('src')},function(data){
                if(data.flag==1){
                    ybb.msgs(data.msg,'warning');
                }else {
                    $('#Head').val(data.data.url.b);
                    $('#avatar_id').val(data.data.id);
                }
                console.log(data)
            })
        },500);
    });

    ybb.ajaxSubmit({
        url: '/radishweb/passport/info',
        form: '#form-edit',
        selector: '.btn-primary',
        regs: {
            'name': /\S/,
        },
        preFilter: function () {
            var isRight = true;
            var year=$('#select_year').val();//年
            var month=$('#select_month').val();//月
            var day=$('#select_day').val();//日
            //$('#Head').val(headImg.attr('src'));//设置头像表单
            if(!(year-0) || !(month-0) || !(day-0)) {
                isRight = false;
                ybb.msgs('请选择出生日期', 'warning');
            }else {
                month=isTime(month);
                day=isTime(day);
                $('#birthday').val(year+"-"+month+"-"+day);
            }
            return isRight;
        },
        done: function (data) {
            ybb.msgs('修改个人资料成功！', 'success');
            setTimeout(function () {
                location.reload();
            }, 1000);
        }
    })

})(window, $, undefined);
