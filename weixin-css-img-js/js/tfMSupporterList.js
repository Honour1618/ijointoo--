/*
 * 爱就投2.0-爱助创投资人-项目列表
 * 
 */

$(function(){
	/*所属行业*/
	$(".classifyOne").click(function(){
		$(".classifyTwo,.classifyThree").removeClass("classifyCur");
		$(".classifyOne").addClass("classifyCur");
		$(".one").show();
		$(".two,.three").hide();
	});
	/*排序*/
	$(".classifyTwo").click(function(){
		$(".classifyOne,.classifyThree").removeClass("classifyCur");
		$(".classifyTwo").addClass("classifyCur");
		$(".two").show();
		$(".one,.three").hide();
	});
	/*平台职业*/
	$(".classifyThree").click(function(){
		$(".classifyOne,.classifyTwo").removeClass("classifyCur");
		$(".classifyThree").addClass("classifyCur");
		$(".three").show();
		$(".one,.two").hide();
	});
	/*点击跳转*/
	$(".classify a").click(function(){
		$(".classify").hide();
	});
	/*点击关闭筛选*/
	$("#share_mask").click(function(){
		$(".classify,#share_mask").hide();
	});
	
});

/*筛选*/
function choose(){
	$(".classify,#share_mask").show();
}


//遮罩出现
var alertTimer = null;
function loadingMore(){
	$(".loadingPic").show();
	$(".common_mask").show();
	alertTimer = setTimeout(function(){
		$(".loadingPic").hide();
		$(".common_mask").hide();
	} , 300);
}

var agreeCurrentPage = 1;
//成功助创更多
function loadMoreSup(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_btn").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/5) < agreeCurrentPage){
		$("#load_more_btn").html("没有更多数据啦！");
		return;	
	}
	agreeCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!prjList.action?rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":5,"pageInfo.currentPage":agreeCurrentPage,"sts":sts,"tfPrjInfo.industry":industry,"sort":sort},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.list;
	    	var pageSum = msg.total/5;
			if(msg.result=='0')
			{
				var html = "";
				$(obj).attr("page-num" , msg.total);
				$.each(msgData , function(k , v){
					var tags = v.prjTag;
					var tag = tags.split(',');
					html +='<a class="bidding_con" href="'+ webroot +'/PtlTf!prj.action?prjCode='+v.prePrjCode+'">'
							+'<div class="business_man">'
							 	+'<img src="'+ webroot + "/"+ v.userLogo +'" class="user_mission"/>'
								+'<span>'+ v.userName +'</span>'
								+'<span class="crtTime">'+ new Date(v.crtTime.time).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
							+'</div>'
							+'<p class="target_title">'+ v.prjName +'</p>'
							+'<p class="target_tag">'+ v.industryStr +'|'+ v.finStageStr +'</p>'
							+'<p class="target_info">'+ v.prjDesc +'</p>'
							+'<ul class="bidding_tag_con">'
							for(var i=0; i<tag.length ;i++ ){
								if(tag[i] != ""){
									html+='<li class="bidding_tag">'+tag[i]+'</li>';
								}
							}
							html+='</ul>'
							if(v.prjStep == 2 || v.prjStep == 4){
								html+='<i class="bidding_score gray_bg">'+v.flowStsStr+'</i>';
							}else{
								html+='<i class="bidding_score pink_bg">'+v.flowStsStr+'</i>';
							}
							html+='<div class="bidding_follow">'
								+'<ul>'
									+'<li>'
										+'<img src="'+webroot+'/file/h5/weixin/images/bidding_realAmt.png" />'
										+'<span>筹资：'+v.targAmtStr+ '元</span>'
									+'</li>'
									+'<li>'
										+'<img src="'+webroot+'/file/h5/weixin/images/bidding_targAmt.png" />'
										+'<span>已筹：'+v.realAmtStr+ '元</span>'
									+'</li>'
									+'<li>'
										+'<img src="'+webroot+'/file/h5/weixin/images/bidding_realAmt.png" />'
										+'<span>助创：'+v.goodNum+ '人</span>'
									+'</li>'
								+'</ul>'
							+'</div>'
						+'</a>';
				});
				
				$("#prjShow").append(html);
				loadingMore();
    		}else{
    			$("#load_more_btn").html("无更多数据！");
    			agreeCurrentPage--;
    		}
        }
	});
}


//对Date的扩展，将 Date 转化为指定格式的String   
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.Format = function(fmt)   
{ //author: meizz   
var o = {   
"M+" : this.getMonth()+1,                 //月份   
"d+" : this.getDate(),                    //日   
"h+" : this.getHours(),                   //小时   
"m+" : this.getMinutes(),                 //分   
"s+" : this.getSeconds(),                 //秒   
"q+" : Math.floor((this.getMonth()+3)/3), //季度   
"S"  : this.getMilliseconds()             //毫秒   
};   
if(/(y+)/.test(fmt))   
fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
for(var k in o)   
if(new RegExp("("+ k +")").test(fmt))   
fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
return fmt;   
}


























