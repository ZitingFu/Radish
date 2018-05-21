<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>点标记</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <style>
        .marker {
            color: #ff6600;
            padding: 4px 10px;
            border: 1px solid #fff;
            white-space: nowrap;
            font-size: 12px;
            font-family: "";
            background-color: #0066ff;
        }
    </style>
</head>
<body>
<input type="hidden" value="{$info.longitude}" id="lat">
<input type="hidden" value="{$info.latitude}" id="lnt">
<input type="hidden" value="{$info.site_two_name}" id="mapName">
<div id="container"></div>
<script src="http://webapi.amap.com/maps?v=1.3&key=f9dfd7f68f40684fc08992d66eb84e5a"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<script src="/libs/jquery/jquery.min.js"></script>
<script>

$(function(){
    var lat=$('#lat').val();
    var lnt=$('#lnt').val();
    var mapName=$('#mapName').val();
    $(document).attr('title',mapName);
    var marker, map = new AMap.Map("container", {
        resizeEnable: true,
        center: [lat, lnt],
        zoom: 17
    });
    addMarker();
    AMap.event.addDomListener(document.getElementById('addMarker'), 'click', function() {
        addMarker();
    }, false);
    AMap.event.addDomListener(document.getElementById('updateMarker'), 'click', function() {
        marker && updateMarker();
    }, false);
    AMap.event.addDomListener(document.getElementById('clearMarker'), 'click', function() {
        if (marker) {
            marker.setMap(null);
            marker = null;
        }
    }, false);

    // 实例化点标记
    function addMarker() {
        marker = new AMap.Marker({
            icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
            position: [lat, lnt]
        });
        marker.setMap(map);
    }

    function updateMarker() {
        // 自定义点标记内容
        var markerContent = document.createElement("div");

        // 点标记中的图标
        var markerImg = document.createElement("img");
        markerImg.className = "markerlnglat";
        markerImg.src = "http://webapi.amap.com/theme/v1.3/markers/n/mark_r.png";
        markerContent.appendChild(markerImg);

        // 点标记中的文本
        var markerSpan = document.createElement("span");
        markerSpan.className = 'marker';
        markerSpan.innerHTML = "Hi，我换新装备啦！";
        markerContent.appendChild(markerSpan);

        marker.setContent(markerContent); //更新点标记内容
        marker.setPosition([116.391467, 39.927761]); //更新点标记位置
    }
})


</script>
</body>
</html>