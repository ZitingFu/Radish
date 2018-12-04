
var id = $(".id").html()
$.ajax({
	type: 'get', 
    url: '/radishweb/ads/share',
    data: {
    	id:id,
    	action:"json"
    },
    success:function(data) {
       var time = data.data.now
       $(".time").html(time)
    	var date = data.data.top
    	for(var a=0;a<date.length;a++){
    		var logo = date[a].logo.s
    		var compony_name = date[a].compony_name
    		var charge = date[a].charge
    		var newdata = $(".data").clone(true)
    		newdata.removeClass("data")
    		newdata.addClass("newdata")
    		newdata.find(".logo")[0].src = logo
    		newdata.find(".compony_name").html(compony_name)
    		newdata.find(".charge").html(charge)
    		newdata.appendTo($(".databox"))

    	}
    	$(".data").remove()


    	var charge_num =data.data.stat.charge_num
         if(charge_num.length == undefined ){
            $(".charge_num").html(charge_num)
        }
        else{
            for(var i=0;i<charge_num.length;i++){
                var charge_num_new = $(".charge_num").clone(true)
                charge_num_new.removeClass("charge_num")
                charge_num_new.addClass("e9")
                charge_num_new.html(charge_num[i])
                charge_num_new.appendTo($(".e9_numnewbox"))
            }
            $(".charge_num").remove()
        }

        var ads_num = data.data.stat.ads_num
        if(ads_num.length == undefined ){
            $(".ads_num").html(ads_num)
        }
        else{
            for(var j=0;j<ads_num.length;j++){
                var ads_num_new = $(".ads_num").clone(true)
                ads_num_new.removeClass("ads_num")
                ads_num_new.addClass("e9")
                ads_num_new.html(ads_num[j])
                ads_num_new.appendTo($(".e_numnewbox"))
            }
            $(".ads_num").remove()
        }

    	var info_charge = data.data.info.charge
    	var info_compony_name  = data.data.info.compony_name
    	var info_logo  = data.data.info.logo.s
    	$(".info_charge").html(info_charge)
    	$(".info_name").html(info_compony_name)
    	$(".info_logo")[0].src = info_logo


    }
})