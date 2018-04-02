/*
 * 爱就投2.0-投资行家
 * 
 * */
$(function(){
	
	$(".prjShare").click(function(){//新增分享
		$("#share_mask").fadeIn(500);
	});
	$("#share_mask").bind("click" , function(){//分享取消
		$(this).fadeOut(500);
		$(".common_mask").hide();
	});
	
	$(".expertTask").click(function(){//任务
		$(".expertTaskCon").show();
		$(".creat_center,.expertBidCon,.basic_info_con,.person_info_con,.assist_info_con").hide();
	});
	$(".expertBid").click(function(){//竞标
		$(".expertBidCon,.bidShow").show();
		$(".creat_center,.expertTaskCon,.basic_info_con,.person_info_con,.assist_info_con").hide();
	});
	$(".basic_info").click(function(){//个人信息
		$(".basic_info_con").show();
		$(".creat_center,.expertTaskCon,.expertBidCon,.person_info_con,.assist_info_con").hide();
	});
	$(".person_info").click(function(){//个人履历
		$(".person_info_con").show();
		$(".creat_center,.expertTaskCon,.expertBidCon,.basic_info_con,.assist_info_con").hide();
	});
	$(".assist_info").click(function(){//辅导项目
		$(".assist_info_con").show();
		$(".creat_center,.expertTaskCon,.expertBidCon,.basic_info_con,.person_info_con").hide();
	});
	$(".back").bind("click" , function(){
		$(".creat_center").show();
		$(".assist_info_con,.expertTaskCon,.expertBidCon,.basic_info_con,.person_info_con").hide();
	});
	
	//展开与收起
	 var hidd=$(".case li");
	 for(var i=0;i<hidd.length;i++){
		 hidd[i].onclick=function(){
			 var fafa=this.nextSibling;
			 var deLine = $(this).find("pre").hasClass("lineTwo") ;
			 if(deLine){
				 $(this).find("b").html("收起");
				 $(this).find("pre").toggleClass("lineTwo", false);
			 }else{
				 $(this).find("b").html("展开");
				 $(this).find("pre").toggleClass("lineTwo", true);
			 }
		 }
	 }
	
	Wa_SetImgAutoSize();
	 wechatConfig();//微信初始化
});

function Wa_SetImgAutoSize(){
	var img=$('.teach_featherImg');
	var windowWidth = $("body").width();
	var imgRealHeight = windowWidth * 360/640;
	img.css({
		height : imgRealHeight,
		width: windowWidth
	});
}

function countDown(time,id){
	var day_elem = $(id).find('.day');
	var hour_elem = $(id).find('.hour');
	var minute_elem = $(id).find('.minute');
	var second_elem = $(id).find('.second');
	var end_time = new Date(time).getTime(),//月份是实际月份-1
	sys_second = (end_time-new Date().getTime())/1000;
	var timer = setInterval(function(){
		if (sys_second > 1) {
			sys_second -= 1;
			var day = Math.floor((sys_second / 3600) / 24);
			var hour = Math.floor((sys_second / 3600) % 24);
			var minute = Math.floor((sys_second / 60) % 60);
			var second = Math.floor(sys_second % 60);
			day_elem && $(day_elem).text(day);//计算天
			$(hour_elem).text(hour<10?"0"+hour:hour);//计算小时
			$(minute_elem).text(minute<10?"0"+minute:minute);//计算分钟
			$(second_elem).text(second<10?"0"+second:second);//计算秒杀
	   }else{
		   clearInterval(timer);
	   }
	}, 1000);
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

var sts;
var taskCurrentPage = 1;
//加载更多任务列表页
function loadMoreTask(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_task").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/5) < taskCurrentPage){
		$("#load_more_task").html("没有更多数据啦！");
		return;
	}
	taskCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!myTasks.action?rtnType=ajax', //目标地址 
	    data: {"nosession": true,"pageInfo.pageSize":5,"pageInfo.currentPage":taskCurrentPage,"sts":sts},//nosession 未登录ajax 请求有效
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
				$.each(msgData , function(k , v){
					
					var expRspTime = new Date(v.rspBidBean.expRspTime.time).Format("yyyy-MM-dd");
					var idtmp = v.prjBean.prePrjCode;
					var exid = 'calculagraph'+idtmp;
					countDown(expRspTime,'#'+exid);
					//alert(expRspTime);
					
					//实际交稿时间
					var rspTime = "${list.rspBidBean.rspTime}";
					var date = new Date(rspTime.replace(/-/g , "/"));
					var jsMidYear = date.getFullYear();
					var jsMidMonth = date.getMonth()+1;
					var jsMidDay = date.getDate();
					
					//倒计时结束时间
					var jsTime = 'target_time'+idtmp;
					var dt = new Date(expRspTime.replace(/-/g, "/"));
					var jsYear = dt.getFullYear();
					var jsMonth = dt.getMonth()+1;
					var jsDay = dt.getDate();
					var timeShow = new Date();
					
					html +='<a class="expert_con" href="PtlTf!taskDetail.action?tfPrjInfo.prePrjCode="'+v.prjBean.prePrjCode+'>'
					+'<div class="business_man">'
					 	+'<img src="'+ webroot + "/"+ v.memberBean.userLogo +'" class="user_mission"/>'
						+'<span>'+ v.memberBean.userName +'</span>'
						+'<span class="crtTime">'+ new Date(v.prjBean.crtTime.time).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
					+'</div>'
					+'<p class="business_title">'+  v.prjBean.prjName  +'</p>'
					+'<div class="expert_res">'
					 	+'<span class="target_mon">'+"任务佣金：<b>"+  v.rspBidBean.bidAmtStr  +'</b></span>'
					 	+'<span class="time_exp">'+ '结束时间：' 
						 	+'<div class="target_time target_time'+v.prjBean.prePrjCode+'">'
						 	/*计时器*/
							if(dt > date){
								$("."+jsTime).html('<div class="calculagraph">'
										+'<span class="day">'+jsMidYear+'</span><span class="lang">年</span>'
							 			+'<span class="hour">'+jsMidMonth+'</span><span class="lang">月</span>'
							 			+'<span class="minute">'+jsMidDay+'</span><span class="lang">日</span>'
							 		+'</div>');
							}else if(timeShow > dt){
								if(sts == 1){
									html+='<div class="calculagraph" id="calculagraph +prjCodeTask">'
										+'<span class="day">'+ jsYear +'</span>'
									 	+'<span class="lang">'+ '年' +'</span>'
									 	+'<span class="hour">'+ jsMonth +'</span>'
									 	+'<span class="lang">'+ '月' +'</span>'
									 	+'<span class="minute">'+ jsDay +'</span>'
									 	+'<span class="lang">'+ '日' +'</span>'
									 +'</div>';
								}else{
									html+='<div class="calculagraph" id="calculagraph +prjCodeTask">已过期</div>';
								}
							}else{
								html+='<div class="calculagraph" id="calculagraph +prjCodeTask">'
								 	+'<span class="day">'+ '00' +'</span>'
								 	+'<span class="lang">'+ '天' +'</span>'
								 	+'<span class="hour">'+ '00' +'</span>'
								 	+'<span class="lang">'+ '小时' +'</span>'
								 	+'<span class="minute">'+ '00' +'</span>'
								 	+'<span class="lang">'+ '分' +'</span>'
								 	+'<span class="second">'+ '00' +'</span>'
								 	+'<span class="lang">'+ '秒' +'</span>'
							 	+'</div>';
							}
							html+='</div>'
					 	+'</span>'
					+'</div>'
				+'</a>';
				
		});
			$("#moreTask").append(html);
			loadingMore();
  		}else{
  			$("#load_more_task").html("无更多数据！").unbind('');
  			taskCurrentPage--;
  		}
      }
	});
}

var bidCurrentPage = 1;
//加载更多竞标列表页
function loadMoreBid(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_btn").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/5) < bidCurrentPage){
		$("#load_more_btn").html("没有更多数据啦！");
		return;	
	}
	bidCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!myBids.action?rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":5,"pageInfo.currentPage":bidCurrentPage},//nosession 未登录ajax 请求有效
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
					var tags=v.prjBean.prjTag;
					var tag=tags.split(',');
					html +='<a class="expert_bid" href="PtlTf!prj.action?prjCode='+v.prjBean.prePrjCode+'&uid='+v.prjBean.userId+'">'
							+'<div class="business_man">'
							 	+'<img src="'+ webroot + "/"+ v.memberBean.userLogo +'" class="user_mission"/>'
								+'<span>'+ v.memberBean.userName +'</span>'
								+'<span class="crtTime">'+ new Date(v.prjBean.crtTime.time).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
							+'</div>'
							+'<p class="business_title">'+ v.prjBean.prjName +'</p>'
							+'<ul class="business_tag_con expert_bid_tag">'
								for(var i=0; i< tag.length; i ++ )
					    		{
					    		   html+= '<li class="business_tag">'+tag[i]+'</li>';
					    		}
							html+='</ul>'
							+'<div class="expert_res expert_bid_res">'
								+'<span class="target_mon">'+ '任务佣金：'+':'
									+'<b>'+v.bidDtlBean.csAmtStr+'元 '+'</b>'
								+'</span>'
								+'<span class="target_bid">'+ '竞标：'+':'
									+'<b>'+v.bidDtlBean.bidNum+'人'+ '</b>'
								+'</span>'
								+'<span class="target_sup">'+ '助创：'+':'
									+'<b>'+v.objFocusBean.paramInt1+'人' +'</b>'
								+'</span>'
							+'</div>'
						+'</a>';
				});

				$("#moreBid").append(html);
				loadingMore();
  		}else{
  			$("#load_more_btn").html("无更多数据！");
  			bidCurrentPage--;
  		}
      }
	});
}

var itemCurrentPage = 1;
//投资案例
function loadMoreItem(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_item").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/5) < itemCurrentPage){
		$("#load_more_item").html("没有更多数据啦！");
		return;	
	}
	itemCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!prjCases.action?dtype=supt&rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":5,"pageInfo.currentPage":itemCurrentPage,"investMemInfo.userId":userId},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.list;
	    	var pageSum = msg.total/5;
			if(msg.result=='0'){
				var html = "";
				$(obj).attr("page-num" , msg.total);
				$.each(msgData , function(k , v){
					html +='<li>'
						 	+'<img src="'+ webroot + "/"+ v.featureImgUrl +'" />'
							+'<h3 class="ml10">'+ v.featureTitle +'</h3>'
							+'<pre class="lineTwo">'+ v.featureDesc +'</pre>'// hh:mm:ss.S
							+'<b>展开</b>'
						+'</li>';
				});
				$(".case").append(html);
				loadingMore();
	  		}else{
	  			$("#load_more_item").html("无更多数据！");
	  			itemCurrentPage--;
	  		}
	    }
	});
}

var successCurrentPage = 1;
//成功辅导项目
function loadMoreSuccess(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_success_item").attr("page-num");
	if( pageNo == undefined )	pageNo = Math.floor($(obj).attr("page-num"));
	if( Math.floor(totalNo/5) <= successCurrentPage){
		$("#load_success_item").html("没有更多数据啦！");
		return;	
	}
	successCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!rspBidSuccess.action?dtype=rtn&rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":5,"pageInfo.currentPage":successCurrentPage,"investMemInfo.userId":userId},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.list;
	    	var pageSum = msg.total/5;
			if(msg.result=='0'){
				var html = "";
				$(obj).attr("page-num" , msg.total);
				$.each(msgData , function(k , v){
					html +='<a class="business_con"  href="'+webroot+'/pay/PtlTf!prj.action?prjCode='+v.prePrjCode+'&uid='+v.userId+'">'
							+'<div class="business_man support_man">'
							 	+'<img src="'+ webroot + "/"+ v.relUserLogo +'" class="user_mission"/>'
								+'<span>'+ v.relUserName +'</span>'
								+'<span class="crtTime">'+ new Date(v.CTime.time).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
							+'</div>'
							+'<p class="business_title">'+ v.prjName +'</p>'
							+'<pre>'+ v.prjDesc +'</pre>'
						+'</a>';
				});
				$("#item_con").append(html);
				loadingMore();
		}else{
			$("#load_success_item").html("无更多数据！");
			successCurrentPage--;
		}
    }
	});
}

//wechat share end
function wechatConfig(){
	var localUrl = window.location.href;

	var dataForWeixin={
		appId: shareAppId,//"wx52222341d8f2e13f"
		imgUrl:commUrl+"/file/tf/tfManager/images/share_pic.jpg",
		link: localUrl.split("/Ptl")[0] + webroot+"/PtlTf!investMemHome.action?eqType=mb&investMemInfo.userId="+userId,
		title: shareTitle,
		desc: shareDesc,
		fakeid:	""
	};
	
	var jsapi_a = "jsapi_ticket="+ shareTicket +"&noncestr="+ shareNonceStr +"&timestamp="+ shareTimestamp +"&url="+window.location.href;
	var signature = hex_sha1(jsapi_a);
	wx.config({
		debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: shareAppId, // 必填，公众号的唯一标识
	    timestamp:shareTimestamp, // 必填，生成签名的时间戳 
	    nonceStr: shareNonceStr, // 必填，生成签名的随机串 
	    signature: signature,// 必填，签名，见附录1
	    jsApiList: [
	        'checkJsApi',
	        'onMenuShareTimeline',
	        'onMenuShareAppMessage',
	        'onMenuShareQQ',
	        'onMenuShareWeibo'
	    ]
	});
	wx.ready(function () {
		wx.onMenuShareAppMessage(dataForWeixin);
		wx.onMenuShareTimeline(dataForWeixin);
		wx.onMenuShareQQ(dataForWeixin);
		wx.onMenuShareWeibo(dataForWeixin);
	});
	wx.error(function(res){
	    //config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		//alert(res);
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









