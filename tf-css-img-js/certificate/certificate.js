/*  助创证书  */

$(function(){
	
	/*var hashUrl = window.location.hash;
	console.log(typeof hashUrl);
	// hashUrl为#1时，通过分享进入的
	if(hashUrl == "#1"){
		$(".certificate-share").css({"display": "none"});
		$(".certificate-help").css({"display": "block"});
	}else{
		$(".certificate-share").css({"display": "block"});
		$(".certificate-help").css({"display": "none"});
	};*/
	if(fromType == "share"){
		console.log(fromType + "1");
		$(".certificate-share").css({"display": "none"});
		$(".certificate-help").css({"display": "block"});
	}else{
		console.log(fromType + "2");
		$(".certificate-share").css({"display": "block"});
		$(".certificate-help").css({"display": "none"});
	}
	
	// 点击分享
	$(".certificate-share").bind("click",function(){
		$("#share_mask").show();
		window.location.hash = 1;
		console.log(window.location.href);
	});
	
	//分享遮罩关闭
	$("#share_mask").bind("click",function(){
		$("#share_mask").hide();
		window.location.hash = 0;
	});
	
	wechatConfig();//微信分享
});

// rem 移动布局
(function (doc, win) {
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
        recalc = function () {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
            if(clientWidth>=640){
                docEl.style.fontSize = '100px';
            }else{
                docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
            }
        };

    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
})(document, window);

//wechat share
function wechatConfig(){
	var dataForWeixin={
		appId:	shareAppId,//"wx52222341d8f2e13f"
		imgUrl: commUrl + "/" + shareImg,
		link: commUrl + "/PtlTf!makeCer.action?uid=" + uid +"&fromType=share",
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