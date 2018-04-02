/*
 * 项目评论页
*
*/
	var $login=null;
	var $loginClose=null;
$(function(){
	$(".close").bind('click',function(){
		$(".answer").hide();
		$(".common_mask").hide();
		$(".login").hide();
	});
	$(".top_back").bind('click', function(event) {
		history.back();
	});
	
	/*回复弹出*/
	$(".star_bg").bind('click',function(event){
		$(".answer").show();
		$(".common_mask").show();
	});
	commentListInit();
	
	$(".common_mask").bind("click" , function(){
		$(".answer,.common_mask").hide();
	});
	
	$(".plBack").click(function(){
		console.log("...");
		history.back();
	});
	
	cancelBack();//判断设备，在PC上时返回按钮取消
	
	var u = navigator.userAgent, app = navigator.appVersion;
	var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
	if (isiOS) {
		//解决第三方软键盘唤起时底部input输入框被遮挡问题
	    var bfscrolltop = document.body.scrollTop;//获取软键盘唤起前浏览器滚动部分的高度
	    $(".desc").focus(function(){//在这里‘input.inputframe’是我的底部输入栏的输入框，当它获取焦点时触发事件
	        interval = setInterval(function(){//设置一个计时器，时间设置与软键盘弹出所需时间相近
	        document.body.scrollTop = document.body.scrollHeight;//获取焦点后将浏览器内所有内容高度赋给浏览器滚动部分高度
	        },100)
	    }).blur(function(){//设定输入框失去焦点时的事件
	        clearInterval(interval);//清除计时器
	        document.body.scrollTop = bfscrolltop;将软键盘唤起前的浏览器滚动部分高度重新赋给改变后的高度
	    });
	}
});


//评论列表初始化
function commentListInit(){
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlCommon!queryForumAjax.action', //目标地址 
	    data: { "nosession": true,"prePrjCode":prjCode , "pageNo" : 1},//nosession 未登录ajax 请求有效
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
        }
	});
	
}

var alertTimer = null;
function loadingMore(){
	$(".loadingPic").show();
	$(".common_mask").show();
	alertTimer = setTimeout(function(){
		$(".loadingPic").hide();
		$(".common_mask").hide();
	} , 300);
	
}

//加载更多列表页
function loadMoreVote(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	
	//加载更多ajax 
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlPrjPool!queryForumAjax.action', //目标地址 
	    data: { "nosession": true,"prePrjCode":prjCode,"pageNo":pageNo},//nosession 未登录ajax 请求有效
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
	$("#reward_btn").attr("disabled",true); 
	//发表评论 ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlCommon!submitForumAjax.action', //目标地址 
	    data: { "nosession": true,"prePrjCode":prjCode , "content": rmkDesc },//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	//console.log(msg);
	    	//curNo
	    	var msgData = msg.entity; 
	    	if(msg.result=='0')
			{
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
				$(".common_mask").hide();
				var nowTotal = parseInt($("#comment_total").html());
				$("#comment_total").html(nowTotal+1);
				scrollT();
	    	}
    		else{
    			alertShow(msg.desc,2000);
    		}
	    	$("#reward_btn").attr("disabled",false); 
        }
	});
}

//点击评论回到制定位置
function scrollT(){
	var x=$(".sum").offset().top;
	$("html,body").stop().animate({scrollTop:x} , 500);
}

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

/*登录接口选择*/
function loginFun(obj){
	
	window.location.href='PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('pay/PtlTf!prj.action?prjCode='+ prjCode);

}


//回复弹窗
function replyShow(obj , curNo){
	console.log(isLogin);
	if(isLogin == "1"){
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
	}else{
		$(".common_mask").show();
		$(".login").show();

	}
	
}

//回复ajax
function replyAjaxData(obj , curNo , content){
	
	$("#reply_submit").attr("disabled",true); 	
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlCommon!submitForumAjax.action', //目标地址 
	    data: { "nosession": true,"prePrjCode":prjCode, "content": content , "curNo":curNo},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	
	    	console.log(msg);
			if(msg.result=='0')
			{
				var html ='<li>'
						+'<a class="name nameUser">'+ msg.entity.userMaskName +'：</a>'
						+'<span class="text">'+ changeFaceObj(msg.entity.reqcontent) +'</span>'
						+'<span class="timer">'+ msg.entity.reqTimeStrWeb+'</span>'
					+'</li>';
				$(obj).parent().parent().parent().parent().parent().find("ol").append(html);
				$("#desc_reply").val("");
				$(".answer").hide();
				$(".common_mask").hide();
	    	}
    		else{
    			alertShow(msg.desc,2000);
    			/*alert(msg.desc);*/
    		}
			$("#reply_submit").attr("disabled",false); 	

        }
	});
}

function cancelBack(){
	//设备版本判断
	//判断浏览器是PC还是mobile
	var isBrowser={  
		versions:function(){   
		 var u = navigator.userAgent, app = navigator.appVersion;   
		 return {//移动终端浏览器版本信息   
		   trident: u.indexOf('Trident') > -1, //IE内核  
		   presto: u.indexOf('Presto') > -1, //opera内核  
		   webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核  
		   gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核  
		   mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端  
		   ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端  
		   android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器  
		   iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器  
		   iPad: u.indexOf('iPad') > -1, //是否iPad    
		   webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部  
		  };  
		  }(),  
		  language:(navigator.browserLanguage || navigator.language).toLowerCase()  
	}   
	//判断浏览器，PC访问直接跳转PC,MOBILE访问跳转MOBILE
	if(isBrowser.versions.mobile || isBrowser.versions.ios || isBrowser.versions.android ||   
			isBrowser.versions.iPhone || isBrowser.versions.iPad){
		
		}else{
			$(".plBack").hide();
	}
	/*设备版本判断*/
};







