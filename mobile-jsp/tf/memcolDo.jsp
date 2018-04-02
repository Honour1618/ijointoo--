<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投|优选投资经理|让专业发挥价值</title>
    <meta name="description" content="爱就投，让资本带着资源，投向真的有梦想的企业，成就每个人的创富梦想！爱就投，让人类商业文明提前进入共产主义！精品项目，爱就投！"/>
	<meta name="keywords" content="爱就投，私募股权融资，众筹，筹众，股权融资，股权投资，原始股，原始股投资，移动交易平台"/>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${ctx}/file/tf/tfManager/css/tfSubSuccess.css" />
</head>
	<!-- 融测测投资经理成功提交 -->
    <body>
		<div class="success-box">
            <img src="${ctx}/file/tf/tfManager/images/success-message_03.png" alt="提示信息">
            <button id="subApply" class="sub-apply"></button>
        </div>
    <!-- 分享引导 -->
	<div id="share_mask"><img alt="" src="${ctx}/file/tf/tfManager/images/share_arrow.png" width="218"/></div>
	
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  
    <script type="text/javascript" src="${ctx}/js/sha1.js"></script>
    <script type="text/javascript" src="${ctx}/file/tf/tfManager/js/judgeWeb.js"></script>
    <script type="text/javascript">
    	var userId = "${uid}";
	  	//wechat share start
		var shareAppId = "${jsapi.appId}";
		var shareTimestamp = "${jsapi.timestamp}";
		var shareNonceStr = "${jsapi.nonceStr}";
		var shareTicket = "${jsapi.jsapi_ticket}";
		//wechat share end
    
    	$(".main").bind("click",function(){
    		$("#share_mask").show();
    	});
    	$("#share_mask").bind("click",function(){
    		$("#share_mask").hide();
    	});
    
    	function wechatConfig(){
			var localUrl = window.location.href;
		
			var dataForWeixin={
				appId: shareAppId,//"wx52222341d8f2e13f"
				imgUrl: "${commUrl}/file/tf/tfManager/images/share_pic.jpg",
				link: localUrl.split("/Ptl")[0] + "/PtlTf!memLead.action",
				title: "创业者需要你，大侠！",
				desc: "商场风云瞬息万变，爱就投“壮苗计划”需要创业导师的一臂之力，帮助创业者开拓商业新格局"
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
    	
		$(function(){
	    	//进页面判断有没有登录
	    	console.log("uid:"+userId);
	    	if(userId==""){
	    		window.location.href="${ctx}"+'/PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('PtlTf!perfectInfo.action');
	    	}
			$("#subApply").on("click",function(){
				window.location.href="${ctx}/PtlTf!perfectInfo.action";
			});
			
		});
		
    </script>
    
    
	</body>
</html>






























