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
    <link rel="stylesheet" type="text/css" href="${ctx}/file/tf/tfManager/css/swiper.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/file/tf/tfManager/css/tfIndex.css" />

	
</head>
	<!-- 融测测投资经理信息收集 -->
    <body>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
				 <div class="boxOne" id="box1">
        			<img src="${ctx}/file/tf/tfManager/images/sunny-bg.png" alt="太阳和云" class="sun">
        			<img src="${ctx}/file/tf/tfManager/images/moon.png" alt="月亮" class="moon">
        			<img src="${ctx}/file/tf/tfManager/images/dogAndPeople.png" alt="旺财一家人" class="dogAndPeople">
        			<img src="${ctx}/file/tf/tfManager/images/talk-1.png" alt="对话框" class="talk1">
        			<div class="zmPlanBox"    id="planBox">
                	<div class="card-box">
                    	<div class="card-list"></div>
                    	<div class="card-list"></div>
                    	<div class="card-list"></div>
                    	<div class="card-list"></div>
                        <img src="${ctx}/file/tf/tfManager/images/zmplan.png" alt="壮苗计划" class="zmPlan">
                	</div>
        			</div>
        				<img src="${ctx}/file/tf/tfManager/images/laotou.png" alt="创业导师" class="teacher">
    			</div>
			</div>
            <div class="swiper-slide">
			    <div class="boxTwo" id="box2">
        			<img src="${ctx}/file/tf/tfManager/images/cy001.png" alt="壮苗计划">
    			</div>
			</div>
            <div class="swiper-slide">
				<div class="boxThree" id="box3">
        			<img src="${ctx}/file/tf/tfManager/images/bbm.png" alt="我也要帮帮忙">
        			<a href="${ctx}/PtlTf!memCol.action" id="help" class="helpBtn"></a>
    			</div>
			</div>
        </div>
        
        <img src="${ctx}/file/tf/tfManager/images/uping.png" alt="up"  class="pageBtnSty">
    </div>

	</body>
	<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
	<script src="${ctx}/file/tf/tfManager/js/swiper.min.js"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  
    <script type="text/javascript" src="${ctx}/js/sha1.js"></script>
    <script type="text/javascript" src="${ctx}/file/tf/tfManager/js/judgeWeb.js"></script>
    <script type="text/javascript">
	var shareAppId = "${jsapi.appId}";
	var shareTimestamp = "${jsapi.timestamp}";
	var shareNonceStr = "${jsapi.nonceStr}";
	var shareTicket = "${jsapi.jsapi_ticket}";
	var localUrl = window.location.href;   
	var dataForWeixin={
			appId:	shareAppId,//"wx52222341d8f2e13f"
			imgUrl: "${commUrl}/file/tf/tfManager/images/share_pic.jpg",
			link:	localUrl.split("/Ptl")[0] + "/PtlTf!memLead.action<c:if test='${not empty userId}'>?rc=${userId}</c:if>",
			title:	"创业者需要你，大侠！",
			desc:	"商场风云瞬息万变，爱就投“壮苗计划”需要创业导师的一臂之力，帮助创业者开拓商业新格局"
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
		
		
		
	    var swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        paginationClickable: true,
	        direction: 'vertical',
	        onSlideChangeStart: function(swiper){
	            //你的事件
	            console.log(hasClass("swiper-slide"));
	            var ele= document.getElementsByClassName("pageBtnSty")[0];
	            if(hasClass("swiper-slide")){
	                ele.style.display="none";
	            }else{
	                ele.style.display="block";
	            }

	        }
	    });
	    var hasClass=function (className) {
	        //"swiper-slide"
	            var ele= document.getElementsByClassName(className)[2];
	            var str=ele.className;
	            var arr=str.split(" ");
	            for(var i=0;i<arr.length;i++){
	               if(arr[i] === "swiper-slide-active"){
	                    return true;
	                }
	            }
	    }

    
    </script>
</html>






























