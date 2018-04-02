/*
 * 
 * 我的任务列表
 * 
 * */

function taskStatuBidding(){
	document.location=webroot+'/PtlTf!myTasks.action?sts=0&pageInfo.pageSize=8&pageInfo.currentPage=1';
}

function taskStatuBidded(){
	document.location=webroot+'/PtlTf!myTasks.action?sts=1&pageInfo.pageSize=8&pageInfo.currentPage=1';
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

var taskCurrentPage = 1;
//加载更多任务列表页
function loadMoreTask(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_btn").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/8) < taskCurrentPage){
		$("#load_more_btn").html("没有更多数据啦！");
		return;
	}
	taskCurrentPage++;
	//alert(totalNo);
	//alert(taskCurrentPage);
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!myTasks.action?rtnType=ajax', //目标地址 
	    data: {"nosession": true,"pageInfo.pageSize":8,"pageInfo.currentPage":taskCurrentPage,"sts":sts},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.list;
	    	var pageSum = msg.total/8;
	    	/*if(pageSum<pageNo){
	    		$("#load_more_btn").html("没有更多数据啦！").attr("onclick" , "");
	    		pageNo == pageSum;
	    	}*/
			if(msg.result=='0')
			{
				var html = "";
			//	$(obj).attr("page-num" , pageNo+1);
				//alert(msg.list);
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
					
					html +='<a class="mission_con" href="PtlTf!taskDetail.action?tfPrjInfo.prePrjCode="'+v.prjBean.prePrjCode+'>'
							+'<div class="target_info">'
							 	+'<img src="'+ webroot + "/"+ v.memberBean.userLogo +'" class="user_mission"/>'
								+'<span>'+ v.memberBean.userName +'</span>'
								+'<span>'+ new Date(v.prjBean.crtTime.time).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
							+'</div>'
							+'<p class="target_title">'+  v.prjBean.prjName  +'</p>'
							+'<div class="target_mon">'
							 	+'<strong>'+  v.rspBidBean.bidAmt  +'</strong>'
							 	+'<span>'+ '任务佣金' +'</span>'
							+'</div>'
							+'<div class="target_time target_time'+v.prjBean.prePrjCode+'">'
						 	/*计时器*/
							if(dt > date){
								$("."+jsTime).html('<div class="calculagraph">'
										+'<span class="day">'+jsMidYear+'</span><span class="lang">年</span>'
							 			+'<span class="hour">'+jsMidMonth+'</span><span class="lang">月</span>'
							 			+'<span class="minute">'+jsMidDay+'</span><span class="lang">日</span>'
							 		+'</div>'
							 		+'<span>结束时间</span>');
							}else if(timeShow > dt){
								if(sts == 1){
									html+='<div class="calculagraph" id="calculagraph +prjCodeTask">'
										+'<span class="day">'+ jsYear +'</span>'
									 	+'<span class="lang">'+ '年' +'</span>'
									 	+'<span class="hour">'+ jsMonth +'</span>'
									 	+'<span class="lang">'+ '月' +'</span>'
									 	+'<span class="minute">'+ jsDay +'</span>'
									 	+'<span class="lang">'+ '日' +'</span>'
									 +'</div>'
									 +'<span>'+'结束时间'+'</span>';
								}else{
									html+='<div class="calculagraph" id="calculagraph +prjCodeTask">已过期</div>'
										+'<span>'+'距离结束'+'</span>';
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
							 	+'</div>'
							 	+'<span>'+'距离结束'+'</span>';
							}
							html+='</div>'
						+'</a>';
						
				});
				$("#bid_status").append(html);
				loadingMore();
    		}else{
    			$("#load_more_btn").html("无更多数据！").unbind('');
    			taskCurrentPage--;
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

























