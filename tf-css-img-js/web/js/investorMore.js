/*
 * 
 * 投资人列表
 *  
 */

function successBack(){
	document.location=webroot+'/PtlTf!suptRtnList.action?dtype=supt';
}

function successAgree(){
	document.location=webroot+'/PtlTf!suptRtnList.action?dtype=rtn';
}

$(function (){
	//项目列表hover特效
	$(".invest_con").hover(function(){
		var thisObj = $(this);
		thisObj.stop().animate({"top" : "-2px"} , 200);
		thisObj.addClass("hover");
	} , function(){
		var thisObj = $(this);
		thisObj.stop().animate({"top" : "0"} , 200);
		thisObj.removeClass("hover");
	});
	
	menu_rightBar_defaultFun();
	
	if(dtype == 'supt'){
		$(".status_agree_con").show();
		$(".status_back_con").hide();
	}else{
		$(".status_back_con").show();
		$(".status_agree_con").hide();
	}
	
	
});

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
function loadMoreAgreeVote(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_agree").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/8) < agreeCurrentPage){
		$("#load_more_agree").html("没有更多数据啦！");
		return;	
	}
	agreeCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!suptRtnList.action?dtype=supt&rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":8,"pageInfo.currentPage":agreeCurrentPage},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.list;
	    	var pageSum = msg.total/8;
			if(msg.result=='0')
			{
				var html = "";
				$(obj).attr("page-num" , msg.total);
				$.each(msgData , function(k , v){
					html +='<div class="invest_con">'
							+'<div class="target_info">'
							 	+'<img src="'+ webroot + "/"+ v.userLogo +'" class="user_mission"/>'
								+'<span>'+ v.userName +'</span>'
								+'<span>'+ new Date(v.crtTime).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
							+'</div>'
							+'<p class="target_title">'+ v.prjName +'</p>'
							+'<ul class="asset_repay">'
								+'<li>'
									+'打赏金额：'+'<b>'+ v.suptAmt+'元 '+'</b>'
								+'</li>'
								+'<li>'
									+'回报率：'+'<b>'+v.rtnMulNum+'%' +'</b>'
								+'</li>'
							+'</ul>'
							+'<a class="enter_prj" href="'+webroot+'/PtlTf!prj.action?prjCode='+v.ppCode+'">查 看 详 情</a>'
						+'</div>';
				});
			
				
				$("#status_agree_con").append(html);
				loadingMore();
    		}else{
    			$("#load_more_agree").html("无更多数据！");
    			agreeCurrentPage--;
    		}
        }
	});
}

var backCurrentPage = 1;
//成功回馈更多
function loadMoreBackVote(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_back").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/8) < backCurrentPage){
		$("#load_more_back").html("没有更多数据啦！");
		return;	
	}
	backCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!suptRtnList.action?dtype=rtn&rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":8,"pageInfo.currentPage":backCurrentPage},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.list;
	    	var pageSum = msg.total/8;
			if(msg.result=='0')
			{
				var html = "";
				$(obj).attr("page-num" , msg.total);
				$.each(msgData , function(k , v){
					html +='<div class="invest_con">'
							+'<div class="target_info">'
							 	+'<img src="'+ webroot + "/"+ v.userLogo +'" class="user_mission"/>'
								+'<span>'+ v.userName +'</span>'
								+'<span>'+ new Date(v.crtTime).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
							+'</div>'
							+'<p class="target_title">'+ v.prjName +'</p>'
							+'<ul class="asset_repay">'
								+'<li>'
									+'打赏金额：'+'<b>'+ v.suptAmt+'元' +'</b>'
								+'</li>'
								+'<li>'
									+'回报率：'+'<b>'+v.rtnMulNum+'%' +'</b>'
								+'</li>'
								+'<li>'
									+'已回报：'+'<b>'+v.rntAmt+'元'+'</b>'
								+'</li>'
								+'<li>'
									+'回报日期：'+'<b>'+v.rtnTime+'</b>'
								+'</li>'
							+'</ul>'
							+'<a class="enter_prj" href="'+webroot+'/PtlTf!prj.action?prjCode='+v.ppCode+'">查 看 详 情</a>'
						+'</div>';
				});
			
				
				$("#status_back_con").append(html);
				loadingMore();
    		}else{
    			$("#load_more_agree").html("无更多数据！");
    			backCurrentPage--;
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









