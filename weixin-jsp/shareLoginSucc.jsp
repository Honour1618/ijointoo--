<!DOCTYPE html>
<html lang="utf-8">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>爱就投公民注册分享</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
 	<style type="text/css">
		*{padding:0;margin:0;list-style:none;font-size:12px;font-family:"Microsoft Yahei";text-decoration: none;border:none;border:0;}
		.show_mask{position:absolute; top:0; left:0;width:100%;height:100%;z-index:9;background:#ffffff;text-align:center;}
		.pop_btn{display:block;margin:0 auto;margin-top:80px;}
		.pop_btn img{width:80%;}
		.pop_txt{color:#f74a3d;font-size:24px;display:block;text-align:center; padding:20px 20px;}
	</style>
   	<script type="text/javascript" src="${ctx }/h5/js/jquery.js"></script>
   	<script	type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  
   	<script	type="text/javascript" src="<s:url value="/js/sha1.js"/> "></script>
	<script type="text/javascript">
	var ua = navigator.userAgent.toLowerCase();
	function isWeiXin(){
	    if(ua.match(/MicroMessenger/i)=="micromessenger"||window.WeixinJSBridge!=undefined) {
	      return true;
	    } else {
	      return false;
	    }
	  }
	if(isWeiXin())
	{
		var dataForWeixin={
				appId:	'${jsapi.appId}',//"wx52222341d8f2e13f",
				imgUrl: "${commUrl}/data/comm/logo.png",
				link:	"${commUrl}/PtlWeixin!shareReg.action?rcUserId=${myUserId}&rc=${sessionScope.arc}",
				title:	'因为爱，所以投',
				desc:	'传播“爱就投”，送达一个机会！',
				fakeid:	""
		};
		var a = "jsapi_ticket=${jsapi.jsapi_ticket}&noncestr=${jsapi.nonceStr}&timestamp=${jsapi.timestamp}&url="+location.href.split('#')[0];
		var signature = hex_sha1(a);
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${jsapi.appId}', // 必填，公众号的唯一标识
		    timestamp:'${jsapi.timestamp}', // 必填，生成签名的时间戳
		    nonceStr: '${jsapi.nonceStr}', // 必填，生成签名的随机串
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
		    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
			//alert("error");
		});
	}
		
	function showWxTip(){
		document.getElementById("shareTip").style.display="block";
	}
	function hideWxTip(){
		document.getElementById("shareTip").style.display="none";
	}
	function load(){
		if(!isWeiXin()){
			document.getElementById("btnShare").style.display="none";
		}
	}
	</script>
</head>
<body  onload="load();">
<div class="page_body">
	<div style="width: 100%;max-width: 640px;margin: 0 auto;background-color: #FEF9E4;font-family: '微软雅黑';font-size: 18px;color: #0054E7;text-align: center;line-height: 25px;">
		<div class="show_mask">
		<span class="pop_txt">恭喜成为爱就投会员，<br /><br />扫码下载APP，享受更优质服务！</span>
		<img alt="" src="${ctx }/file/promotion/mo/images/app_code.jpg"/>
		<a class="pop_btn" target="_blank" href="http://www.ijointoo.com/"><img alt="" src="${ctx }/file/promotion/pc/images/pop_btn.jpg"/></a>
		</div>
	</div>
</div>
</body>
</html>