/*
 * 项目详情
 * 
 */

var $login=null;
var $loginClose=null;
var videoObj = null;
var myScroll = null;
var loadPage=1; //页码
var loadingStep = 0;//加载状态0默认，1显示加载状态，2执行加载数据，只有当为0时才能再次加载，这是防止过快拉动刷新
var pullDown = $("#pullDown");
var pullUp = $("#pullUp");
var pullDownLabel = $(".pullDownLabel");
var pullUpLabel = $(".pullUpLabel");
var container = $('#list');

var myScroll;

$(function(){
	console.log("cfno："+cfno);
	
	$(".top_back").bind('click', function(event) {
		history.back();
	});
	
	$(".enter_tip i").bind('click', function(){
		$(".enter_tip").hide();
	})
	
	//视频播放
	if( $("#WxMomentVideo").length > 0){
		var winWidth = $(window).width();
		$("#WxMomentVideo").css({
			
			width : winWidth,
			height : winWidth*9/16,
			"max-width":"640px",
			"max-height":"360px"
		});
		videoObj = new WxMoment.Video({
		    //请联系接口人确认视频清晰度已调至高清版本
		    //如果要定制“播放按钮”的样式，请使用 CSS 覆盖 .tvp_overlay_play 和 .tvp_button_play 即可

		    vid: videoUrl, //视频 vid 取自视频地址：http://v.qq.com/page/a/t/t/a0016gys8ct.html
		    pic: webroot+creatorPicUrl, //设置视频默认缩略图
		    oninited: function () {
		        //播放器在视频载入完毕触发
		    	$(".playControl").show();
		    },
		    onplaying: function () {
		        //播放器真正开始播放视频第一帧画面时
		    	$(".playControl").hide();
		    },
		    onpause: function () {
		        //播放器触发暂停时，目前只针对HTML5播放器有效
		    },
		    onresume: function () {
		        //暂停后继续播放时触发
		    	$(".playControl").show();
		    },
		    onallended: function () {
		        //播放器播放完毕时
		        //$(".play_btn").show();
		    	$(".playControl").show();
		    },
		    onfullscreen: function (isfull) {
		        //onfullscreen(isfull) 播放器触发全屏/非全屏时，参数isfull表示当前是否是全屏
		    }
		});
	};
	
	
	
	$(".playControl img").bind("click" , function(){//自定义点击效果
		$(".tvp_overlay_play .tvp_overlay_play_v2,.tvp_button_replay").trigger("click");
	});
	
	/*banner上的白色遮罩*/
	var mainPic=$(".main_pic").height();
	var whiteMask = $(".whiteMask");
	whiteMask.css({
		height:mainPic
	});
	
	/*小导航的点击效果*/ 
	$(".author_story").click("click",function(){//创业故事

	//	$(".author_story").addClass("current");
	//	$(".author_goal,.author_reply").removeClass("current");
		myScroll.scrollToElement(document.querySelector('#storyOne'), 500 , 0 , -55);
	});
	$(".author_goal").click("click",function(){//创业目标
	//	$(".author_goal").addClass("current");
	//	$(".author_story,.author_reply").removeClass("current");
		myScroll.scrollToElement(document.querySelector('#goalSup'),  500 , 0 , -55);
	});
	$(".author_reply").click("click",function(){//承诺回报
	//	$(".author_reply").addClass("current");
	//	$(".author_story,.author_goal").removeClass("current");
		myScroll.scrollToElement(document.querySelector('#rewardSup'),  500 , 0 , -55);
	});
	
	/*打赏不存在时*/
	if(!supportNone){
		$(".half").css('width','43%');
	}
	
	$(".common_mask").bind("click",function(){
		$(".common_mask,.coverSelf").hide();
		$(".reward,.riskTip").hide();
		$(".repay").hide();
		$(".answer").hide();
		$("#share_mask").hide();
		$login.css('display', 'none');
	});
	
	/*风险提示*/
	$(".riskCan").bind("click",function(){
		$(".common_mask,.riskTip").hide();
	});
	$(".riskAgr").bind("click",function(){
		$(".reward").show();
	});
	
	$(".login i").click(function(){
		$login.hide();
		$(".common_mask").hide();
	});

	$login=$('.login');
	Wa_SetImgAutoSize();//图片 16/9
	$(window).resize(function(){//窗口大小
		changeWindowSize();
	});
	
	
	//进度条动态处理
	var progressObj = $("#progress_main");
	if(progressNum >= 100){
		progressNum = 100;
	}
	progressObj.find("i").css({width:progressNum+"%"});
	
	//返回
	$(".prjBack").click(function(){
		history.back();
	});
	//新增分享
	$(".prjShare").click(function(){
		$("#share_mask").fadeIn(500);
	});

	//点击取消，打赏成功页消失
	$(".success_ds_cancel,.success_mask").bind("click",function(){
		$(".success_ds").hide();
		$(".success_mask").hide();
		changeurl();
	});
	
	// 继续助创
	$(".success_ds_share").bind("click", function(){
		$(".common_mask,.riskTip").show();
		$(".success_ds").hide();
		changeurl();
	});
	$(".success_ds_gb").bind("click", function(){
		$(".success_ds,.success_mask").hide();
		changeurl();
	});
	$("#share_mask").bind("click" , function(){
		$(this).fadeOut(500);
		$(".success_mask").hide();
		changeurl();
	});
	
	//已赞弹出提示框
	$("#zaShowMask").bind("click", function(){
		alertShow("你已经点赞了" , 3000);
	});
	
	/*关闭评论和回复*/
	$(".close").bind("click",function(){
		$(".repay,.common_mask,.answer").hide();
	});
	
	$(".pinglun").bind("click",function(){
		window.location.href=webroot+"/PtlTf!commentList.action?eqType=mb&tfPrjInfo.prePrjCode="+prePrjCode;
	});
	
	wechatConfig();//微信分享
	/*判断页面是否存在于app 还是 web浏览器  */
	var isApp = false;
	/*判断app,取消共用头部底部*/
	var appU = navigator.userAgent;

	if( appU.indexOf('ijointoo') > -1){
		isApp = true;
		$('.effect').hide();
		$('.top').hide();
		$(".mainPic,.link_video").css({'margin-top':'0px'});
		$(".Agreement-box").css({'margin-bottom':'0px'});
		$(".content-box").css({'top':'0px','bottom':'0px'});
	}else{
		isApp = false;
	};
	
	loginJump();//项目详情页顶部
	
	$(window).load(function(){
		var h = parseInt($('#attr_small_nav').offset().top);
		var autoH = 0;
		var storyTop = parseInt($("#storyOne").offset().top);
		var goalSupTop = parseInt($("#goalSup").offset().top);
		var rewardSupTop = parseInt($("#rewardSup").offset().top);
		var defTop = 99;
	    $("#pullUp").css("visibility","hidden");

    myScroll = new IScroll("#wrapper", {
/*    	probeType: 3,
*/        scrollbars: true,
        mouseWheel: true,
        click:true,
        interactiveScrollbars: true,
        shrinkScrollbars: 'scale',
        fadeScrollbars: true,
        scrollY:true,
        probeType: 3,
        bindToWrapper:true
    });
    pullUpAction();
    myScroll.on("scroll",function(){
    	//浮动
		autoH = parseInt(this.y);		    
	    var appU = navigator.userAgent;
		if( appU.indexOf('ijointoo') > -1){//app内嵌
			if(autoH <=  -h ){//H5网页				
				$("#attr_small_nav_fixed").css({'top': '0px'}).show();
			}else{
				$("#attr_small_nav_fixed").hide();			
			}
			defTop = 55;
		}else{		
			if(autoH <=  44 -h ){//H5网页					
				$("#attr_small_nav_fixed").show();
			}else{
				$("#attr_small_nav_fixed").hide();				
			}			
		}
		if(this.y >= -goalSupTop + defTop){	
			$(".author_story").addClass("current");
			$(".author_goal,.author_reply").removeClass("current");
		}else if(this.y <= -goalSupTop+ defTop && this.y >= -rewardSupTop+ defTop){
			
			$(".author_goal").addClass("current");
			$(".author_story,.author_reply").removeClass("current");
		}else if(this.y < -rewardSupTop+ defTop){
			
			$(".author_reply").addClass("current");
			$(".author_story,.author_goal").removeClass("current");
		};
       if(loadingStep == 0 && !$("#pullUp").hasClass("refresh")){
    	   if(this.y < (this.maxScrollY - 14)){//上拉加载更多
            	$("#pullUp").addClass("refresh").css("visibility","visible");
                var loadEle='<img src="'+webroot+'/file/tf/projectDes/img/loadingGo.gif"/>'+"正在刷新";
                $(".pullUpLabel").html(loadEle);
                loadingStep = 1;
            }
        }
    });
    myScroll.on("scrollEnd",function(){
        if(loadingStep == 1){ 
            if( $("#pullUp").hasClass("refresh") ){//下拉刷新操作  
            	$("#pullUp").removeClass("refresh").addClass("loading");   
                loadingStep = 2;  
                pullUpAction(); 
            }  
        }  
    });
    
    
	});
	
	
	//判断是否支付
	//var isPay = GetQueryString("isPay");
	/*var locationUri = window.location.href;
	var isPay = locationUri.split("#")[1];
	if(isPay == '1'){
		$(".success_mask,.success_ds").show();
	};*/
	if(cerFlag == 1){
		$(".success_mask,.success_ds").show();
	}
	
	//是否同意背书操作
	var endorse;
	$(".endorser-nor").bind("click",function(e){
		console.log("endorse:"+endorse);
		var isEndor = $(this).hasClass("endorser-y");
		if(isEndor){
			$(this).removeClass("endorser-y");
			endorse = "";
			$(this).attr("data-num",endorse);
		}else{
			$(this).addClass("endorser-y");
			endorse = 1;
			$(this).attr("data-num",endorse);
		}
	});
	
	 // 背书条滚动
	 /*var all_width = document.getElementsByClassName('endorseList')[0].scrollWidth;
	 $('.endorseList').css({
	     'width':all_width +10+ 'px'
	 });
	 console.log(all_width);
	
	 var myscroll=new IScroll("#endorseList-wrap",{
	     scrollX: true,  
	     scrollY: false, 
	     hScrollbar:false,
	     vScrollbar : false,
	     vScroll:false
	 });
	*/
	
});

//局部改变url参数
function changeurl(){
	//var currenturl = changeUrlArg(window.location.href, 'isPay', 0);
	//window.location.href = currenturl ;
	
	window.location.hash = 0;
}

//补仓弹出层退出
function coverCancel(){
	$(".coverSelf,.common_mask").hide();
}

//已支付的弹出提示框   2017-02-09改为继续支付
function supportSuccess(){
	if(!isWeiXin())
	{
		//$(".supportId").html("请在微信中助创").attr("onclick" , "");//打赏只能用微信
		alertShow("请在微信中助创" , 3000);
		return;
	}
	alertShow("你已经支付成功了" , 3000);
}

//ios 直接打开
//android 用图片view
function view(obj,iu,au){
	var ua = navigator.userAgent.toLowerCase();
	if(/android/i.test(ua)){
		obj.href = webroot + '/PtlPublish!prjdocShow.action?pageNo='+au;
	}else {
		obj.href = webroot + '/'+iu;
	}
	return false ;
}

/* 判断登陆弹出 */
function isLoginShow(type){
	
	if(isLogin == "1"){
		
		if( type == "ds"){//打赏
			if(!isWeiXin())
			{
				//$(".supportId").html("请在微信中助创").attr("onclick" , "");//打赏只能用微信
				alertShow("请在微信中助创" , 3000);
				return;
			}
			$(".common_mask,.riskTip").show();
			//$(".reward").show();
			//$(".supportId").removeClass("bonuRed");
			
		}else if( type == "pl"){                        //评论
			window.location.href=webroot+"/PtlTf!commentList.action?eqType=mb&tfPrjInfo.prePrjCode="+prjCode;
/*			$(".repay").show();
			$(".common_mask").show();*/
			
		}else if( type == "dz"){
		
			/*点赞判断登录否*/
			if(goodFlg == 1){
				
			}else if(goodFlg == 0){
			
				goodDataAjax();
			}
			
		}else if( type == "bc"){                     //补仓
			if(!isWeiXin())
			{
				alertShow("请在微信中助创" , 3000);
				return;
			}
			$(".common_mask,.coverSelf").show();
		}
	}else{
		
		$login.show();
		$(".common_mask").show();
	}
	
}

function goodDataAjax(){
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlCommon!submitGoodAjax.action', //目标地址 
	    data: { "nosession": true,"prePrjCode":prjCode , "goodType": 1 },//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	//console.log(msg);
    		if( msg.result == 0 ){
    			$(".za").removeClass('zaRed');
    			var zaPlus=$(".za i").html();
    			zaPlus=parseInt(zaPlus)+1;
    			$(".za i").html(zaPlus);
    		}else{
    			//$(".za").addClass('zaRed');
    			alertShow(msg.desc,2000);
    		}
        }
	});
}

/*登录接口选择*/
function loginFun(obj){
	window.location.href='PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('pay/PtlTf!prj.action?prjCode='+ prjCode);
}

//点击评论回到制定位置
function scrollT(){
	var x=$(".sum").offset().top;
	$("html,body").stop().animate({scrollTop:x} , 500);
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
				$(".repay").hide();
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

//回复弹窗
function replyShow(obj , curNo){
	
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
		$login.show();
		$(".common_mask").show();
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
	
};

function Wa_SetImgAutoSize(){//比例图片
	
	var img=$('.main_pic,.link_video');
	var windowWidth = $("body").width();
	var imgRealHeight = windowWidth * 360/640;
	img.css({
		height : imgRealHeight,
		width: windowWidth
	});
};

function changeWindowSize(){//窗口内容适应改变
	Wa_SetImgAutoSize();
	$(".top,.small_nav,.content-box,.effect").css({"width":"100%"});
	var winWidth = $(window).width();
	$("#WxMomentVideo").css({
		
		width : winWidth,
		height : winWidth*9/16
	});
};

//表情转义函数
function changeFaceObj(str){
	reg = new RegExp('\\[:emoji_(.+?)\\:]',"g");
	str = str.replace(reg,"<img data-key='$1' class='face_ico' src='"+ webroot +"/file/face/emoji/emoji_$1.png'/>");
	return str;
}

//wechat share
function wechatConfig(){
	var dataForWeixin={
		appId:	shareAppId,//"wx52222341d8f2e13f"
		imgUrl: commUrl + "/" + shareImg,
		link: commUrl + "/pay/PtlTf!prj.action?prjCode=" + prePrjCode,
		title:	shareTitle,
		desc:	shareDesc_s
	};
	
	var jsapi_a = "jsapi_ticket="+ shareTicket +"&noncestr="+ shareNonceStr +"&timestamp="+ shareTimestamp +"&url="+location.href.split('#')[0];
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

function pingFun(){//评论展示
	$(".discuss-box").show();
}

function amtclick(obj,amt){
	/** 初始化所有按钮为   未选中状态  */
	$('#amt_item_list input').removeClass('amt_item_selected').addClass('amt_item_static');
	$('#amt_cover_list input').removeClass('amt_item_selected').addClass('amt_item_static');
	/** 初始化补仓金额的提示信息   未出现状态 */
	$('#amt_cover_list p').hide();
	/** 当前点击按钮选中  */
	$('#'+obj.id).addClass('amt_item_selected');
	$('#investAmt').val(amt);
	$('#coverAmt').val(amt);
	/** 当前补仓金额的提示信息展示 */
	$('.'+amt).show();
}

/**打赏助创 */
function support(bcAmt)
{
	var desc = '';
	var samt = 0;
	if( bcAmt != '' &&  bcAmt != null){
		bcAmt = $('#coverAmt').val();//补仓金额
		samt = bcAmt;//补仓金额
		if(samt > 0){
			if(!confirm("你此次补仓的金额是 ："+samt +"元。")){   /*\n按'确定'提交申请,按'取消'修改金额"*/
				$("#coverAmt").focus();
				return;
			}
		}else{
			/* alertShow("请选择补仓金额" , 2000);
			return ; */
			var samt = fillAmt2;
		}
		desc = "";
	}else{
		samt = $("#investAmt").val();//打赏金额
		if(samt > 0){
			if(!confirm("你此次打赏的金额是 ："+samt +"元。")){
				$("#investAmt").focus();
				return;
			}
		}else{
			alertShow("请选择打赏金额" , 2000);
			return ;
		}
		desc = $("#desc_ds").val();
	}
	var futureSup = $("#future_support").find("option:selected").text();
	var endorse = $(".endorser-nor").attr("data-num");
    $.ajax({
        type: "POST", //用POST方式传输
        dataType: "json", //数据格式:JSON
        url: webroot + '/PtlTf!applyAjax.action', //目标地址
        data: { "nosession": true,"amt": samt,"prjCode":prjCode ,"desc":desc,"cfno":chouId,"iw":futureSup,"endorse":endorse},//nosession 未登录ajax 请求有效
        error: function (XMLHttpRequest, textStatus, errorThrown) { 
        	flag =  false ;
           	$("#sure").removeAttr("disabled");
        	$("#sure").val("申请报名");
          
        },
        success: function (data){
        	if(data.result == '0'){
               	//打赏成功，用作微信支付
        		wxPayRequest(data.orderNo);
               	
         	}else {
         		//打赏失败，提示失败信息
        		alertShow(data.desc , 2000);
        		$(".common_mask").hide();
    			$(".reward").hide();
        	}
    	}
	});
}

/**微信支付调用入口 **/
function wxPayRequest(orderNo){
	var testFlg = istest;
	if(!isWeiXin() || testFlg.length > 0 ){
		window.location.href="PtlPay!confirmOrder.action?orderNo="+orderNo;
		return ;
	}
	var remark = $("#remark").val();
	$.ajax({
		type : "POST", //用POST方式传输
		dataType : "json", //数据格式:JSON
		url : webroot +'/PtlPay!ajaxWeixin.action', //目标地址
		data : {nosession : true, orderNo:orderNo},
		success : function(data) {
			if (data.result == '0') {
				if(isWeiXin())
				{
					$(".reward").hide();
					$(".common_mask").hide();
					WeixinJSBridge.invoke(
					"getBrandWCPayRequest",{
		  		 		"appId" : data.appId,
		  		 		"timeStamp" : data.timeStamp,
		  		 		"nonceStr" : data.nonceStr,
		  		 		"package" : data.packageValue,
		  		 		"signType" : "MD5",// 注意：新版支付接口使用 MD5 加密 
		  		 		"paySign" : data.paySign
		   		 	},function(res){
						//alert(res.err_code +" ："+ res.err_desc +";"+ res.err_msg);
						var msg = res.err_msg;
						if(msg.match("get_brand_wcpay_request:ok")){
								//支付成功 
								window.location.href=window.location.href+"&cerFlag=1&id="+10000*Math.random()+"#1";
								return ;
						}else if(msg.match("get_brand_wcpay_request:cancel")){
							$(".supportId").html("重新支付");
							$(".supportId").removeAttr("disabled");
						}else{
							//支付失败
							alert("微信打赏失败");
						}
					});
				}
			}else{
				alert(data.desc);
				$("#btnPay").val("立即支付");
				$("#btnPay").removeAttr("disabled");
				
			}
		}
	});
	 
}

function loginJump(){
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
			$(".top").html('');
	}
	/*设备版本判断*/
};

//获取参数
/*function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}

//替换url参数
function changeUrlArg(url, arg, val){
    var pattern = arg+'=([^&]*)';
    var replaceText = arg+'='+val;
    return url.match(pattern) ? url.replace(eval('/('+ arg+'=)([^&]*)/gi'), replaceText) : (url.match('[\?]') ? url+'&'+replaceText : url+'?'+replaceText);
}*/


/*无限滚动*/
function pullUpAction() {

    $.ajax({
        type: "POST", //用POST方式传输
        dataType: "json", //数据格式:JSON
        url: webroot + '/PtlTf!choudtlsAjax.action', //目标地址
        data: {
            "nosession": true,
            "cfno": cfno,
            "pageInfo.currentPage": loadPage,
            "pageInfo.pageSize": "15"
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(errorThrown);
        },
        success: function (msg) {
            if (msg.result == 0) {
            	console.log("loadPage1:"+loadPage);
        		if(loadPage==1){
                	if(msg.lists.length>0){
                        setTimeout(function () {
                            var li="";
                            for (var i = 0; i < msg.lists.length; i++) {
                                li += '<li>';
                                li += '<div>' + msg.lists[i].maskUserName + '</div>';
                                li += '<div>' + msg.lists[i].payTime + '</div>';
                                li += '<div>' + msg.lists[i].suptAmt +'元'+ '</div>';
                                li += '</li>';
                            }
                            $(".list--title--num").text(msg.pageInfo.total);
                            $("#list").append(li);
                            $("#pullUp").removeClass("refresh").css("visibility","hidden");
                            myScroll.refresh();
                            loadingStep = 0;
                        }, 1000);
                	}else{
                		$(".pullUpLabel").text("已经是底线了！");
                		$("#list").hide();
                        pullUp.attr('class', '');
                        loadingStep = 0;
                		
                	}
        		}else{
                	if(msg.lists.length>0){
                        setTimeout(function () {
                            var li="";
                            for (var i = 0; i < msg.lists.length; i++) {
                                li += '<li>';
                                li += '<div>' + msg.lists[i].maskUserName + '</div>';
                                li += '<div>' + msg.lists[i].payTime + '</div>';
                                li += '<div>' + msg.lists[i].suptAmt +'元'+ '</div>';
                                li += '</li>';
                            }
                            $(".list--title--num").text(msg.pageInfo.total);
                            $("#list").append(li);
                            $("#pullUp").removeClass("refresh").css("visibility","hidden");
                            myScroll.refresh();
                            loadingStep = 0;
                        }, 1000);
                	}else{
                		$(".pullUpLabel").text("已经是底线了！");
                        pullUp.attr('class', '');
                        loadingStep = 0;
                		
                	}
        		}
        	    loadPage++;
            } else {
                //alert("error");
            }
        }
    });


    document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
}


