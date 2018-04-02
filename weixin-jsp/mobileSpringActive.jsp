<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="UTF-8">
    <title>春暖花开，爱就投有奖</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="${ctx}/file/h5/weixin/css/mobileSpringActive.css">

</head>
<body>
        <div class="container">
            <div class="header"><img src="${ctx}/images/mob-top_01.png" /></div>
            <div class="content">
                <div class="content-inner">
                    <div class="surprise-box surprise-box-one">
                        <h2>新手尝鲜，万元坐拥原始股份</h2>
                        <p>活动期间上线项目均会开通5个新手万元尝鲜名额，之前没有投资记录的新用户可以最低起投额1万元坐享高增长公司原始股权。原投资门槛至少10万起，名额有限，欲投从速！</p>
                        <a href="http://www.ijointoo.com/web_projects" class="btn btn-cx">马上尝鲜 </a>
                        <div class="line"></div>	
                        <img class="app-active-img app-img1" src="${ctx}/images/wxts.png" alt="">
                        <img class="jxtitle-img" src="${ctx}/images/jx1.png" alt="">
                    </div>
                    <div class="surprise-box surprise-box-two">
                        <h2>投资激励，呼朋唤友赢取好礼</h2>
                        <div class="list-box clearfix">
                            <img src="${ctx}/images/mob-1.png" alt="">
                            <img src="${ctx}/images/mob-2.png" alt="">
                            <img src="${ctx}/images/mob-3.png" alt="">
                            <img src="${ctx}/images/mob-4.png" alt="">
                            <img src="${ctx}/images/mob-5new.png" alt="">
                        </div>
                        <p>
                           特别提醒：
1、	所有返现红包是在本人或推荐的新用户投资成功后，经爱就投工作人员核实，在活动结束后统一返现。
2、	本活动所计算投资额需发生在活动期间，即4月18日——6月18日，以实际收到款项为准。
                        </p>
                        <a href="http://www.ijointoo.com/PtlWeixin!prjPubList.action" class="btn btn-tz">马上投资 </a>
                        <div class="line"></div>
                         <img class="app-active-img app-img2" src="${ctx}/images/wxts.png" alt="">
                         <img class="jxtitle-img" src="${ctx}/images/jx2.png" alt="">
                    </div>
                    <div class="surprise-box surprise-box-three">
                        <h2>快乐抽奖，激光投影激情四溢</h2>
                        <p>活动期间只要有投资行为，无论是参与助创的微天使还是投资1万元以上的投资人，均可参与抽奖活动，奖品为价值6199元全普激光投影手机（二代）一部，由后台随机抽取。</p>
                        <div class="line"></div>
						<img class="jxtitle-img" src="${ctx}/images/jx3.png" alt="">
                    </div>
                    <p class="js">本活动最终解释权归上海爱就投金融信息服务股份有限公司所有</p>
                </div>
            </div>
            <img src="${ctx}/images/mob-flower.png" class="bg-body"/>	
        </div>
</body>
<script type="text/javascript" src="${ctx }/js/sha1.js"/></script>
<script src="${ctx}/file/commonJs/jquery.min.js"></script>
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>

    //wechat share start
    var shareTitle = '${shareTitle}'; //*
    var shareDesc_s = '${shareDesc}';  //*
    var shareDesc_d = '${desc_d}';
    var shareAppId = '${jsapi.appId}';  //*
    var shareTimestamp = '${jsapi.timestamp}';  //*
    var shareNonceStr = '${jsapi.nonceStr}';  //*
    var shareTicket = '${jsapi.jsapi_ticket}';  //*
    var shareImg = '${shareImg}';  //*
    var commUrl = '${commUrl}'; //*
    var prePrjCode = '${prj.prePrjCode}';
    //wechat share end
    	   var isApp = false;
    		/*判断app,显示隐藏*/
    		var appU = navigator.userAgent;
    		if( appU.indexOf('ijointoo') > -1){
    			isApp = true;
    			$(".app-active-img").show();
    			$(".btn").hide();
    			
    		}else{
    			$(".btn").show();
    			$(".app-active-img").hide();
    			isApp = false;
    		};
    
    function pageGo(){
    	var url=window.location.href;
    	var s=url.indexOf("!"); 
    	var t=url.substring(s+1);// t就是?后面的东西了 
    	  
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
    	        };
    	 

    	            //判断浏览器，PC访问直接跳转PC,MOBILE访问跳转MOBILE
    	            if(isBrowser.versions.mobile || isBrowser.versions.ios || isBrowser.versions.android ||
    	                isBrowser.versions.iPhone || isBrowser.versions.iPad){

    	            	if(t == "pcSpringAct.action"){
    	            		window.location.href="${ctx}/PtlWeixin!mobSpringAct.action";
    	            	}else{
    	            		
    	            	}
    	            	
    	            }else{
    	            	if( t == "mobSpringAct.action"){
    	            		window.location.href="${ctx}/PtlPortal!pcSpringAct.action";
    	            	}else{
    	            		
    	            	}
    	            	
    	            }

    	        

    }
 
        
    //wechat share
    function wechatConfig(){
  /*    	var linkUrl=isor();   */
        var dataForWeixin={
            appId:	shareAppId,//"wx52222341d8f2e13f"
            imgUrl: commUrl + "/" + shareImg,
            link: commUrl  + "/PtlWeixin!mobSpringAct.action" ,
            title:shareTitle,
            desc:shareDesc_s
        };
        console.log("shareTitle:"+shareTitle);
        console.log("shareDesc_d:"+shareDesc_s);
        console.log("shareDesc_d:"+dataForWeixin.imgUrl);
        var jsapi_a = "jsapi_ticket="+ shareTicket +"&noncestr="+ shareNonceStr +"&timestamp="+ shareTimestamp +"&url="+location.href.split('#')[0];
        var signature = hex_sha1(jsapi_a);
        wx.config({
            debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
            appId: shareAppId, // 必填，公众号的唯一标识
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
    	wechatConfig();
    	pageGo();
    })
    
    
    
    
   
</script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?58e626be451c5f320e8a30581e18c3d8";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

</html>