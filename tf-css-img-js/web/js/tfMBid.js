/*
 * 
 * 我的竞标列表
 * 
 * */

function bidStatuBidding(){
	document.location=webroot+'/PtlTf!myBids.action?sts=0&pageInfo.pageSize=8&pageInfo.currentPage=1';
}

function bidStatuBidded(){
	document.location=webroot+'/PtlTf!myBids.action?sts=1&pageInfo.pageSize=8&pageInfo.currentPage=1';
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
var bidCurrentPage = 1;
//加载更多任务列表页
function loadMoreTaskVote(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_btn").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/8) < bidCurrentPage){
		$("#load_more_btn").html("没有更多数据啦！");
		return;	
	}
	bidCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!myBids.action?rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":8,"pageInfo.currentPage":bidCurrentPage,"sts":sts},//nosession 未登录ajax 请求有效
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
					var tags=v.prjBean.prjTag;
					var tag=tags.split(',');
					html +='<a class="bidding_con" href="PtlTf!prj.action?prjCode='+v.prjBean.prePrjCode+'&uid='+v.prjBean.userId+'">'
							+'<div class="target_info">'
							 	+'<img src="'+ webroot + "/"+ v.memberBean.userLogo +'" class="user_mission"/>'
								+'<span>'+ v.memberBean.userName +'</span>'
								+'<span>'+ new Date(v.prjBean.crtTime.time).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
							+'</div>'
							+'<p class="target_title">'+ v.prjBean.prjName +'</p>'
							+'<ul class="bidding_tag_con">'
								for(var i=0; i< tag.length; i ++ )
					    		{
					    		   html+= '<li class="bidding_tag">'+tag[i]+'</li>';
					    		}
							html+='</ul>'
							/*html+='<ul class="bidding_tag_con">';
							
								$.each(v.subs , function(ex , el){
									html +=+'<li class="bidding_tag">'+el.prjBean.prjTag+'</li>'
								});
							
							html+='</ul>'*/
							+'<i class="bidding_score">'+ v.prjBean.IScore+'分' +'</i>'
							+'<div class="bidding_follow">'
								+'<ul>'
									+'<li>'
										+'<img src="'+webroot +'/file/tf/web/images/bidding_realAmt.png" />'
										+'<span>'+ '筹资'+':'+v.tfChouInfo.realAmt+'元 '+'</span>'
									+'</li>'
									+'<li>'
										+'<img src="'+webroot +'/file/tf/web/images/bidding_targAmt.png" />'
										+'<span>'+ '竞标'+':'+v.tfChouInfo.targAmt+'元 '+ '</span>'
									+'</li>'
									+'<li>'
										+'<img src="'+webroot +'/file/tf/web/images/bidding_paramInt1.png" />'
										+'<span>'+ '助创'+':'+v.objFocusBean.paramInt1+'人' +'</span>'
									+'</li>'
								+'</ul>'
							+'</div>'
						+'</a>';
				});
			
				
				$("#bid_status").append(html);
				loadingMore();
    		}else{
    			$("#load_more_btn").html("无更多数据！");
    			bidCurrentPage--;
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






















