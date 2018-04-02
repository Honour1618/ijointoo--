/*
 * 
 * 爱就投2.0-爱助创投资人
 *  
 */

$(function(){
	$(".expertTask").click(function(){
		$(".expertTask").addClass("expertCur");
		$(".expertBid").removeClass("expertCur");
		$(".agreeShow").show();
		$(".backShow").hide();
	});
	$(".expertBid").click(function(){
		$(".expertBid").addClass("expertCur");
		$(".expertTask").removeClass("expertCur");
		$(".backShow").show();
		$(".agreeShow").hide();
	});
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
	if( parseInt(totalNo/5) < agreeCurrentPage){
		$("#load_more_agree").html("没有更多数据啦！");
		return;	
	}
	agreeCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!suptRtnList.action?dtype=supt&rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":5,"pageInfo.currentPage":agreeCurrentPage},//nosession 未登录ajax 请求有效
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
					html +='<a class="expert_con" href="'+ webroot +'/PtlTf!prj.action?prjCode='+v.ppCode+'">'
							+'<div class="business_man support_man">'
							 	+'<img src="'+ webroot + "/"+ v.userLogo +'" class="user_mission"/>'
								+'<span>'+ v.userName +'</span>'
								+'<span class="crtTime">'+ new Date(v.crtTime).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
							+'</div>'
							+'<p class="business_title">'+ v.prjName +'</p>'
							+'<div class="expert_res support_res">'
								+'<span class="target_mon">'
									+'<b>'+ v.suptAmt+'元 '+'</b><br/>'+'打赏金额'
								+'</span>'
								+'<span class="time_exp">'
									+'<b>'+v.rtnMulNum+'%' +'</b><br/>'+'回报率'
								+'</span>'
							+'</div>'
						+'</a>';
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
	if( parseInt(totalNo/5) < backCurrentPage){
		$("#load_more_back").html("没有更多数据啦！");
		return;	
	}
	backCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!suptRtnList.action?dtype=rtn&rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":5,"pageInfo.currentPage":backCurrentPage},//nosession 未登录ajax 请求有效
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
					var timeDay = (v.rtnTime-v.crtTime)/1000/60/60/24;
					html +='<a class="expert_bid"  href="'+webroot+'/PtlTf!prj.action?prjCode='+v.ppCode+'">'
							+'<div class="business_man support_man">'
							 	+'<img src="'+ webroot + "/"+ v.userLogo +'" class="user_mission"/>'
								+'<span>'+ v.userName +'</span>'
								+'<span class="crtTime">'+ new Date(v.crtTime).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
							+'</div>'
							+'<p class="business_title">'+ v.prjName +'</p>'
							+'<div class="expert_res expert_bid_res support_res">'
								+'<span class="target_mon">'
									+'<b>'+ v.suptAmt+'元' +'</b><br/>'+'回报金额'
								+'</span>'
								+'<span class="target_bid">'
									+'<b>'+v.rtnMulNum+'%' +'</b><br/>'+'回报率'
								+'</span>'
								+'<span class="target_sup">'
									+'<b>'+timeDay+'天'+'</b><br/>'+'回报周期'
								+'</span>'
							+'</div>'
							+'<a class="enter_prj" href="'+webroot+'/PtlTf!prj.action?prjCode='+v.ppCode+'">查 看 详 情</a>'
						+'</a>';
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




$(function(){
    function alertDS(str,eleName){
    $(".common_mask").show();
    $(eleName).show();
    $(eleName+" span").html(str);
    $(".btn-close").on("click",function () {
        $(".common_mask").hide();
        $(eleName).hide();
    });
};


$("#backBtn").on("click",function(){
	 window.location.href=webroot+"/PtlTf!rccIndex.action?eqType=mb";
});
$("#dsCenter").on("click",function(){
    /*alertDS("你还未进行导师认证，只有/i9tou/PtlTf!rccIndex.action?eqType=mb通过导师审核才能竞标项目哦！","#alertJd");*/
	window.location.href=webroot+"/PtlTf!rccIndex.action?eqType=mb";
});
$(".logout__btn").on("click",function(e){
	e.stopPropagation();
	alertDS("退出登录","#alertExit");
	$("#exitBtn").on("click",function(e){
		e.stopPropagation();
    	$.ajax({
    	    type: "POST", //用POST方式传输
    	    dataType: "json", //数据格式:JSON
    	    url: webroot + "/PtlPortal!logout.action", //目标地址
    	    data: { "nosession": true},//session 未登录ajax 请求有效
    	    error: function (XMLHttpRequest, textStatus, errorThrown) {},
    	    success: function (msg){ 
    	    	submitBool = false;
        		if(msg.result=='9')
        		{
        			alert("失败");
        			return;
        		}
        		else
        		{	
        			window.location.href=webroot+"/PtlMobile!index.action";
        		}

        	},
    	    error:function (msg){ 
    			alert(msg);
    	    }
    	});
	});

});
});




