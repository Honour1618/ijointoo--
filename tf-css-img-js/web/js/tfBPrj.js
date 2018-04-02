/*
 * 
 * 我的项目列表
 * 
 * */

function taskStatuBidding(){
	document.location=webroot+'/PtlTf!myPrjs.action?sts=0&pageInfo.pageSize=8&pageInfo.currentPage=1';
}

function taskStatuBidded(){
	document.location=webroot+'/PtlTf!myPrjs.action?sts=1&pageInfo.pageSize=8&pageInfo.currentPage=1';
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
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!myPrjs.action?rtnType=ajax', //目标地址 
	    data: {"nosession": true,"pageInfo.pageSize":8,"pageInfo.currentPage":taskCurrentPage,"sts":sts},//nosession 未登录ajax 请求有效
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
				//$(obj).attr("page-num" , pageNo+1);
				//alert(msg.list);
				$.each(msgData , function(k , v){
					var tags=v.prjTag;
					var tag=tags.split(',');
					html +='<div class="mission_con business_con" >'
							+'<div class="business_man penInput_enter">'
								+'<p class="target_title business_title">'+ v.prjName +'</p>'
								if(v.doStep == 1){
									html+='<span class="business_time penInput" onclick="window.location.href=\'PtlTf!myPrjEdit.action?tfPrjInfo.prePrjCode='+ v.prePrjCode +'\';">信息完善</span>';
								}else{
									html+='<span class="business_time">'+ new Date(v.crtTime.time).Format("yyyy-MM-dd") +'</span>';
								}
							html+='</div>'
							+'<a href="PtlTf!prj.action?prjCode='+ v.prePrjCode +'&uid='+ v.userId +'" >'
								+'<ul class="bidding_tag_con">'
								for(var i=0; i< tag.length; i ++ )
					    		{
					    		   html+= '<li class="bidding_tag">'+tag[i]+'</li>';
					    		}
								html+='</ul>'
								+'<div class="bidding_follow">'+'缺乏资源：'+ v.rscDesc +'</div>'
							+'</a>'
						+'</div>';
				});
				$("#prj_status").append(html);
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


























