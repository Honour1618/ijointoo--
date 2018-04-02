/*
 * 爱就投2.0-投资行家详情
 * 
 * */
$(function(){
	$(".fan").bind("click" , function(){
		history.back();
	});
	 
	 Wa_SetImgAutoSize();//定制图片比例
	 
	 if(total <= 3){
		 $("#businessCon").css({"margin-bottom":"49px"})
	 };
	 
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

//关注/取消关注
function goodDataAjax(){
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!focusUser.action', //目标地址 
	    data: { "nosession": true,"fType": isFocus, "userId": uid },//nosession 未登录ajax 请求有效
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
    		}else if(msg.result == 9){
    			if(msg.islogin==0){
    				alertShow("请先登录",2000);
        			window.location.href='PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('PtlTf!userDetail.action?pageInfo.currentPage=1&pageInfo.pageSize=3&uid='+uid);

    			}else{
    				alertShow(msg.desc,2000);
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

/*//评论列表初始化
function commentListInit(){
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!userPrjAjax.action', //目标地址 
	    data: { "nosession": true,"uid":uid , "pageInfo.currentPage":1,"pageInfo.pageSize":3},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	//console.log(msg);
			var msgData = msg.prjList;	
			var html = "";
			$.each(msgData , function(k , v){
				var tags=v.prjTag;
				var tag=tags.split(',');
				html +='<a class="business_con" href="PtlTf!prj.action?prjCode='+ v.prePrjCode +'&uid='+ v.userId +'"  >'
					+'<div class="business_man">'
						+'<span class="business_title">'+ v.prjName +'</span>'
						+'<span class="crtTime">'+ new Date(v.crtTime.time).Format("yyyy-MM-dd") +'</span>'
					+'</div>'
					+'<p class="prj_det">'+ v.prjDesc +'</p>'
					+'<ul class="business_tag_con">'
						for(var i=0; i< tag.length; i ++ ){
			    		   html+= '<li class="business_tag">'+tag[i]+'</li>';
			    		}
					html+='</ul>'
					+'<div class="business_res">'+'缺乏资源：'+ v.rscDesc +'</div>'
				+'</a>';
			});
	    	$("#businessCon").html(html);
        }
	});
	
}*/

//加载更多评论列表页
function loadMoreVote(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));

	//加载更多ajax 
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!userPrjAjax.action', //目标地址 
	    data: { "nosession": true,"uid":uid,"pageInfo.currentPage":pageNo,"pageInfo.pageSize":3},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.prjList;
	    	var pageSum = msg.pageInfo.total/3;
	    	if(pageSum<pageNo){
	    		$("#load_more_btn").html("没有更多数据啦！");
	    		$(".more_btn").hide();
	    		$("#businessCon").css("margin-bottom","49px");
	    		pageNo == pageSum;
	    	}
			if(msg.result=='0')
			{
				var html = "";
				$(obj).attr("page-num" , pageNo+1);
				$.each(msgData , function(k , v){
					var tags=v.prjTag;
					var tag=tags.split(',');
					html +='<a class="business_con" href="PtlTf!prj.action?prjCode='+ v.prePrjCode +'&uid='+ v.userId +'"  >'
						+'<div class="business_man">'
							+'<span class="business_title">'+ v.prjName +'</span>'
							+'<span class="crtTime">'+ new Date(v.crtTime.time).Format("yyyy-MM-dd") +'</span>'
						+'</div>'
						+'<p class="prj_det">'+ v.prjDesc +'</p>'
						+'<ul class="business_tag_con">'
							for(var i=0; i< tag.length; i ++ ){
				    		   html+= '<li class="business_tag">'+tag[i]+'</li>';
				    		}
						html+='</ul>'
						+'<div class="business_res">'+'缺乏资源：'+ v.rscDesc +'</div>'
					+'</a>';
				});	
				
				if( pageNo == 1 ){
					$("#businessCon").html(html);
				}
				else{
					$("#businessCon").append(html);
				}
				loadingMore();
    		}else{
    			$("#load_more_btn").html("无更多数据！");
    			$(".more_btn").hide();
    			$("#businessCon").css("margin-bottom","49px");
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










