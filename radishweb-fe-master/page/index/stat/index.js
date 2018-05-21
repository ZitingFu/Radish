(function (window, $, undefined) {
  $(function () {
    
    $('#cate,#site,#role').select2();
    //init
    ybb.location('#province', '/radishweb/area/list', 'code=0');
    $(document).on('change', '#province', function () {
        var code = $(this).val();
        if (!code) {
          $('#city').empty().prepend('<option value="0">请选择城市</option>').select2();
          $('#area').empty().prepend('<option value="0">请选择区域</option>').select2();
          return false;
        }
        $('#city').parents('li').removeClass('collapse');
        ybb.location('#city', '/radishweb/area/list', 'code=' + code);
      })
      .on('change', '#city', function () {
        var code = $(this).val();
        if (!code) {
          return false;
        }
        $('#area').parents('li').removeClass('collapse');
        ybb.location('#area', '/radishweb/area/list', 'code=' + code);
      })
      .on('change', '#area', function () {
        var code = $(this).val();
        if (!code) return false;
      });


    var obj = JSON.parse($("#listcount").html()),
      day = JSON.parse($("#day").html()),
      num = JSON.parse($("#num").html()),
      bar_data = new Array(), //柱
      pie_data = new Array(), //饼
      line_data_not = new Array(), //折
      line_data_seek = new Array(); //折
    bar_data[0] = obj.not;
    bar_data[1] = obj.seek;

    pie_data[0] = {
      name: '未找到',
      value: obj.not
    };
    pie_data[1] = {
      name: '已找到',
      value: obj.seek
    };


    $.each(num, function (i, item) {
      line_data_not.push(item.not);
      line_data_seek.push(item.seek);
    });



    var bar = echarts.init(document.getElementById('bar'));
    var pie = echarts.init(document.getElementById('pie'));
    var line = echarts.init(document.getElementById('line'));

    // 指定图表的配置项和数据
    var bar_option = {
      backgroundColor: '#ddd',
      title: {
        text: '柱状图',
      },
      tooltip: {
        trigger: 'axis'
      },
      legend: {
        data: ""
      },
      color: ['#aaa'],
      grid: {
        left: '1%',
        right: '12%',
        bottom: '1%',
        top: '15%',
        containLabel: true
      },
      xAxis: [
        {
          type: 'category',
          name: '类型',
          boundaryGap: true,
          //					data: date
          data: ["未找到", "已找到"]
        }
    	],
      yAxis: [
        {
          type: 'value'
        }
    	],
      series: [
        {
          name: '数量',
          type: 'bar',
          barWidth: '50px',
          barGop: '20%',
          label: {
            normal: {
              show: true,
              position: 'top'
            }
          },
          areaStyle: {
            normal: {}
          },
          //					data: num
          data: bar_data
        }
    	]
    };
    var pie_option = {
      backgroundColor: '#ddd',
      title: {
        text: '饼图',
        x: 'center'
      },
      tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
      },
      legend: {
        data: ""
      },
      series: [
        {
          name: '数量',
          type: 'pie',
          radius: '50%',
          center: ['50%', '60%'],
          data: pie_data,
          itemStyle: {
            emphasis: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }
    	]




    };
    var line_option = {
      backgroundColor: '#ddd',
      title: {
        text: '折线图'
      },
      tooltip: {
        trigger: 'axis'
      },
      legend: {
        data: ['已找到', '未找到']
      },
      grid: {
        left: '1%',
        right: '5%',
        bottom: '2%',
        top: '15%',
        containLabel: true
      },
      xAxis: {
        type: 'category',
        boundaryGap: false,
        data: day
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          name: '未找到',
          type: 'line',
          data: line_data_not
        },
        {
          name: '已找到',
          type: 'line',
          data: line_data_seek
        }
    ]
    };


    bar.setOption(bar_option);
    pie.setOption(pie_option);
    line.setOption(line_option);




    /*因选择范围不能大于30天,且不能大于当前*/
    $('#start_time').datetimepicker({
      minView: 2,
      language: "zh-CN",
      autoclose: true,
      clearBtn: true,
      todayBtn: false,
      format: "yyyy-mm-dd",
      endDate: new Date()
    }).on("changeDate", function (ev) {
      $('#end_time').datetimepicker('remove');
      $('#end_time').datetimepicker({
        minView: 2,
        language: "zh-CN",
        autoclose: true,
        clearBtn: true,
        todayBtn: false,
        format: "yyyy-mm-dd",
        startDate: transferDate($("#start_time").val(), 'other'),
        endDate: transferDate($("#start_time").val(), 'start')
      }).on("changeDate", function (ev) {
        setEndTime($("#end_time").val());
      });
    });
    $('#end_time').datetimepicker({
      minView: 2,
      language: "zh-CN",
      autoclose: true,
      clearBtn: true,
      todayBtn: false,
      format: "yyyy-mm-dd",
      endDate: transferDate(new Date(), 'other')
    }).on("changeDate", function (ev) {
      setEndTime($("#end_time").val());
    });

    function setEndTime(enddate) {
      $('#start_time').datetimepicker('remove');
      $('#start_time').datetimepicker({
        minView: 2,
        language: "zh-CN",
        autoclose: true,
        clearBtn: true,
        todayBtn: false,
        format: "yyyy-mm-dd",
        startDate: transferDate(enddate, 'end'),
        endDate: transferDate(enddate, 'other')
      })

    }

    function transferDate(data, type) {
      var transfer = undefined;
      if (type == 'start') {
        var diff = parseInt(new Date().getTime() - new Date(data).getTime());
        if (diff > 2592000000) {
          transfer = new Date(new Date(data).getTime() + 2592000000); //30天的毫秒数
        } else {
          transfer = new Date();
        }
      } else if (type == 'end') {
        transfer = new Date(new Date(data).getTime() - 2592000000);
      } else {
        transfer = new Date(data);
      }
      return transfer;
    }


    /*因选择范围不能大于30天,且不能大于当前*/
    $('#start_time').datetimepicker({
      minView: 2,
      language: "zh-CN",
      autoclose: true,
      clearBtn: true,
      todayBtn: false,
      format: "yyyy-mm-dd",
      endDate: new Date()
    }).on("changeDate", function (ev) {
      $('#end_time').datetimepicker('remove');
      $('#end_time').datetimepicker({
        minView: 2,
        language: "zh-CN",
        autoclose: true,
        clearBtn: true,
        todayBtn: false,
        format: "yyyy-mm-dd",
        startDate: transferDate($("#start_time").val(), 'other'),
        endDate: transferDate($("#start_time").val(), 'start')
      }).on("changeDate", function (ev) {
        setEndTime($("#end_time").val());
      });
    });
    $('#end_time').datetimepicker({
      minView: 2,
      language: "zh-CN",
      autoclose: true,
      clearBtn: true,
      todayBtn: false,
      format: "yyyy-mm-dd",
      endDate: transferDate(new Date(), 'other')
    }).on("changeDate", function (ev) {
      setEndTime($("#end_time").val());
    });

    function setEndTime(enddate) {
      $('#start_time').datetimepicker('remove');
      $('#start_time').datetimepicker({
        minView: 2,
        language: "zh-CN",
        autoclose: true,
        clearBtn: true,
        todayBtn: false,
        format: "yyyy-mm-dd",
        startDate: transferDate(enddate, 'end'),
        endDate: transferDate(enddate, 'other')
      })

    }

    function transferDate(data, type) {
      var transfer = undefined;
      if (type == 'start') {
        var diff = parseInt(new Date().getTime() - new Date(data).getTime());
        if (diff > 2592000000) {
          transfer = new Date(new Date(data).getTime() + 2592000000); //30天的毫秒数
        } else {
          transfer = new Date();
        }
      } else if (type == 'end') {
        transfer = new Date(new Date(data).getTime() - 2592000000);
      } else {
        transfer = new Date(data);
      }
      return transfer;
    }



    //		条件筛选
    $('.btn-warning').on('click', function () {
      if ($('#start_time').val()) $('.form-inline').find('[name=start]').val($('#start_time').val());
      if ($('#end_time').val()) $('.form-inline').find('[name=end]').val($('#end_time').val());

      var data = $('.form-inline').serialize();
      console.log(data);
      //			$(this).attr('href', '/radishweb/index/stat?' + data);
      location.href = '/radishweb/index/stat?' + data;
    });

  })
})(window, $, undefined)