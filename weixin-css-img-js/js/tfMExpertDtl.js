/*
 * 爱就投2.0-投资行家详情
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
	
	/*个人履历*/
	$(".person_career").bind("click",function(){
		$(this).addClass("current").siblings("").removeClass("current");
		$(".career_con").show();
		$(".item_all,.discuss,.ping").hide();
	});
	/*成功辅导项目*/
	$(".success_item").bind("click",function(){
		$(this).addClass("current").siblings("").removeClass("current");
		$(".item_all").show();
		$(".career_con,.discuss,.ping").hide();
	});
	
	/*评论*/
	$(".comment").bind('click' , function(){
		$(this).addClass("current").siblings("").removeClass("current");
		$(".discuss").show();
		$(".ping").css("display","inline-block");
		$(".career_con,.item_all").hide();
	});
	
	//综合得分进度
	var sumS = sumScore*100/5;
	var sumPercent = sumS+'%';
	var progressObj = $("#progress_main");
	if(sumS >= 100){
		sumS = 100;
	}
	progressObj.find("i").css({width:sumPercent});
	
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
	 
	 /*关闭评论和回复*/
	$(".close,.common_mask").bind("click",function(){
		$(".repay,.common_mask,.answer").hide();
	});
	 
	 Wa_SetImgAutoSize();
	 wechatConfig();//微信初始化
	 commentListInit();//评论列表初始化
});

//评论
function repay(){
	$(".repay").show();
	$(".common_mask").show();
}

function Wa_SetImgAutoSize(){
	var img=$('.teach_featherImg');
	var windowWidth = $("body").width();
	var imgRealHeight = windowWidth * 360/640;
	img.css({
		height : imgRealHeight,
		width: windowWidth
	});
}

//展开项目内容
function caseCon(){
	var $this = $(this).parent("li").find("pre");
	var isCheck = $this.hasClass("lineTwo");
	if(isCheck){
		$this.toggleClass("lineTwo" , false);
		$this.find("b").html("收起");
	}else{
		$this.toggleClass("lineTwo" , true);
		$this.find("b").html("展开");
	}
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

//网络请求loading
function loadingStart(){
	$(".loadingPic").show();
	$(".common_mask").show();

}
function loadingEnd(){
	$(".loadingPic").hide();
	$(".common_mask").hide();

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
	if( pageNo == undefined )	pageNo = Math.floor($(obj).attr("page-num"));//parseInt丢弃小数部分,保留整数部分
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
					var timeDay = (v.rtnTime-v.crtTime)/1000/60/60/24;
					html +='<a class="business_con"  href="'+webroot+'/pay/PtlTf!prj.action?prjCode='+v.prePrjCode+'&uid='+v.userId+'">'
							+'<div class="business_man support_man">'
							 	+'<img src="'+ webroot + "/"+ v.userLogo +'" class="user_mission"/>'
								+'<span>'+ v.userName +'</span>'
								+'<span class="crtTime">'+ new Date(v.CTime).Format("yyyy-MM-dd") +'</span>'// hh:mm:ss.S
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

//关注/取消关注
var focusNum = 0;
function goodDataAjax(){
	//多次请求，执行一次，中断多次
	if(focusNum>=1)return;
	focusNum++;
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!focusUser.action', //目标地址 
	    data: { "nosession": true,"fType": isFocus==0?1:0, "userId": userId },//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	//console.log(msg);
    		if( msg.result == 0 ){
    			$(".prepare_focus").hide();
    			$(".already_focus").show();
    			window.location.reload();
    			isFocus = msg.focusBean.focusType;
    		}else if( msg.result == 9 ){
    			if(msg.islogin=="0"){
    				//alertShow("请先登录",5000);
        			window.location.href='PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('PtlTf!investMemHome.action?eqType=mb&investMemInfo.userId='+userId);
    			}
    		}
        }
	});
}

/*页面警示框*/
var alertTimer = null;
function alertShow(str , timer){
	//div show
	$(".alertShow").show();
	$(".alertShow span").html(str);
	clearTimeout(alertTimer);
	alertTimer = setTimeout(function(){
		//div hide
		$(".alertShow").hide();
	} , timer);
}

//评论列表初始化
function commentListInit(){
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!queryForumAjax.action', //目标地址 
	    data: { "nosession": true,"userId":userId , "pageInfo.currentPage":1,"pageInfo.pageSize":8},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){

	    	//console.log(msg);
			var msgData = msg.lists;	
			var html = "";
			$.each(msgData , function(k , v){
				html +='<div class="content">'
					+'<ul class="rate_list">'
						+'<li class="rate_list_li" >'
							+'<div class="face_div">'
								+'<img class="face_img" src="'+ webroot + "/"+ v.userLogo +'" />'
							+'</div>'
							+'<dl>'
								+'<dt>'
									+'<div class="name">'+v.userName+'</div>'
									+'<div class="star_bg"  onclick="replyShow(this , \''+v.curNo+'\')">'+"回复"+'</div>'
								+'</dt>'
								+'<dd class="timer">'+v.reqTimeStrWeb+'</dd>'
							+'</dl>'
							+'<div class="rate_desc">'+changeFaceObj(v.reqcontent)+'</div>'
						+'</li>'
					+'</ul>';
				
				html += '<ol class="reply_list_ol">';
				
				$.each(v.subs , function(ex , el){
					html +='<li>'
						+'<span class="name">'+ el.userMaskName +'：</span>'
						+'<span class="text">'+ changeFaceObj(el.reqcontent) +'</span>'
						+'<span class="timer">'+ el.reqTimeStrWeb +'</span>'
					+'</li>';
				});	
				html += '</ol></div>';
			});
	    	$("#conculme").html(html);
	    	$("#comment_total").html(msg.total);
        }
	});
	
}

//加载更多评论列表页
function loadMoreVote(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	
	//加载更多ajax 
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!queryForumAjax.action', //目标地址 
	    data: { "nosession": true,"userId":userId,"pageInfo.currentPage":pageNo,"pageInfo.pageSize":8},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	//console.log(msg);
	    	var msgData = msg.lists;
	    	var pageSum = msg.total/8;
	    	if(pageSum<pageNo){
	    		$("#load_more_btn").html("没有更多数据啦！");
	    		pageNo == pageSum;
	    	}
			if(msg.result=='0')
			{
				var html = "";
				$(obj).attr("page-num" , pageNo+1);
				$.each(msgData , function(k , v){
					html +='<div class="content">'
						+'<ul class="rate_list">'
							+'<li class="rate_list_li" >'
								+'<div class="face_div">'
									+'<img class="face_img" src="'+ webroot + "/"+ v.userLogo +'" />'
								+'</div>'
								+'<dl>'
									+'<dt>'
										+'<div class="name">'+v.userName+'</div>'
										+'<div class="star_bg"  onclick="replyShow(this , \''+v.curNo+'\')">'+"回复"+'</div>'
									+'</dt>'
									+'<dd class="timer">'+v.reqTimeStrWeb+'</dd>'
								+'</dl>'
								+'<div class="rate_desc">'+v.reqcontent+'</div>'
							+'</li>'
						+'</ul>';
					
					html += '<ol class="reply_list_ol">';
					
					$.each(v.subs , function(ex , el){
						html +='<li>'
							+'<span class="name">'+ el.userMaskName +'：</span>'
							+'<span class="text">'+ changeFaceObj(el.reqcontent) +'</span>'
							+'<span class="timer">'+ el.reqTimeStrWeb +'</span>'
						+'</li>';
					});	
					html += '</ol></div>';
				});	
				
				if( pageNo == 1 ){
					$("#conculme").html(html);
				}
				else{
					$("#conculme").append(html);
				}
				loadingMore();
				$("#comment_total").html( msg.total );
    		}else{
    			$("#load_more_btn").html("无更多数据！");
    		}
        }
	});
}

//表情转义函数
function changeFaceObj(str){
	reg = new RegExp('\\[:emoji_(.+?)\\:]',"g");
	str = str.replace(reg,"<img data-key='$1' class='face_ico' src='"+ webroot +"/file/face/emoji/emoji_$1.png'/>");
	return str;
}

//项目评论提交
function proVoteData(){
	var rmkDesc = $("#desc_comment").val();
	if( rmkDesc == "" ){
		alertShow("请填写评论内容..." , 2000);
		return false;
	}
	
	loadingStart();
	$(".common_mask").css("z-index","3").unbind();
	//$("#reward_btn").attr("disabled",true); 
	//发表评论 ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!submitForumAjax.action', //目标地址 
	    data: { "nosession": true,"userId":userId , "content": rmkDesc },//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	//curNo
	    	var msgData = msg.entity;
	    	if(msg.result=='0')
			{
	    		loadingEnd();
	    		$(".common_mask").css("z-index","2").bind('click');
				var html ='<div class="content">'
								+'<ul class="rate_list">'
									+'<li class="rate_list_li" >'
										+'<div class="face_div">'
											+'<img class="face_img" src="'+webroot+'/'+msgData.userLogo+'" />'
										+'</div>'
										+'<dl>'
											+'<dt>'
												+'<div class="name">'+msgData.userName+'</div>'
												+'<div class="star_bg"  onclick="replyShow(this , \''+msgData.curNo+'\')">'+"回复"+'</div>'
											+'</dt>'
											+'<dd class="timer">'+msgData.reqTimeStrWeb+'</dd>'
										+'</dl>'
										+'<div class="rate_desc">'+changeFaceObj(msgData.reqcontent)+'</div>'
									+'</li>'
								+'</ul>'
								+'<ol class="reply_list_ol">'
								+'</ol>'
						+'</div>';
				$("#conculme").prepend(html);
				$("#desc_comment").val("");
				$(".repay").hide();
				$(".common_mask").hide();
				var nowTotal = parseInt($("#comment_total").html());
				$("#comment_total").html(nowTotal+1);
				scrollT();
				
	    	}else if(msg.result == '1'){
	    		window.location.href='PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('PtlTf!investMemHome.action?eqType=mb&investMemInfo.userId='+ userId);
	    	}
    		else{
    			//alertShow(msg.desc,2000);
    			alert(msg.desc);
    			$(".repay,.common_mask").hide();
    			$("#desc_comment").val("");
    			loadingEnd();
    			$(".common_mask").css("z-index","2").bind('click');
    		}
	    	//$("#reward_btn").attr("disabled",false); 
        }
	});
}

//回复弹窗
function replyShow(obj , curNo){
	$(".answer").show();
	$(".common_mask").show();
	$("#reply_submit").unbind();
	$("#reply_submit").bind("click" , function(){
		var content = $("#desc_reply").val();
		if( content == "" ){
			alertShow("输入内容不能为空",2000);
			return false;
		}
		replyAjaxData(obj , curNo , content);
	});
}

//回复ajax
function replyAjaxData(obj , curNo , content){
	loadingStart();
	$(".common_mask").css("z-index","3").unbind();
	//$("#reply_submit").attr("disabled",true); 	
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!submitForumAjax.action', //目标地址 
	    data: { "nosession": true, "content": content , "curNo":curNo},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	
	    	console.log(msg);
			if(msg.result=='0')
			{
				loadingEnd();
	    		$(".common_mask").css("z-index","2").bind('click');
				var html ='<li>'
						+'<a class="name nameUser">'+ msg.entity.userMaskName +'：</a>'
						+'<span class="text">'+ changeFaceObj(msg.entity.reqcontent) +'</span>'
						+'<span class="timer">'+ msg.entity.reqTimeStrWeb+'</span>'
					+'</li>';
				$(obj).parent().parent().parent().parent().parent().find("ol").append(html);
				$("#desc_reply").val("");
				$(".answer").hide();
				$(".common_mask").hide();
	    	}else if(msg.result == '1'){
	    		window.location.href='PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('PtlTf!investMemHome.action?eqType=mb&investMemInfo.userId='+ userId);
	    	}
    		else{
    			//alertShow(msg.desc,2000);
    			alert(msg.desc);
    			$(".answer,.common_mask").hide();
    			$("#desc_reply").val("");
    			loadingEnd();
    			$(".common_mask").css("z-index","2").bind('click');
    		}
			//$("#reply_submit").attr("disabled",false); 	

        }
	});
}

//点击评论回到制定位置
function scrollT(){
	var x=$(".sum").offset().top;
	$("html,body").stop().animate({scrollTop:x} , 500);
}








