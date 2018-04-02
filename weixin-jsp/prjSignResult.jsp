<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="initial-scale=1.0">
	<title>爱就投，让资本带着资源，投向高成长企业</title>
	<link rel="shortcut icon" href="<s:url value="/favicon.ico"/> " type="image/x-icon" /> 
	<%-- <link type="text/css" rel="stylesheet" href="${ctx }/h5/css/mobile.css"/> --%>
	<link type="text/css" rel="stylesheet" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
	<script type="text/javascript" src="${ctx }/web/js/jquery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
	<script type="text/javascript" src="${ctx }/web/js/bootstrap/3.2.0/js/bootstrap.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="${ctx }/js/sha1.js"></script>
	<style type="text/css">
		body{margin:0;padding:0;font-family:"微软雅黑";}
		.top_area{background-color: #F9EFE5;}
		.msg_area{width: 90%; margin-left: auto;margin-right:auto;}
	    .msg_title{padding:30px 0 20px 0;}
	    .msg_title span{font-size: 22px;color:#F93546;margin-left:10px;vertical-align: sub;letter-spacing:1px;}
		.msg_info{width: 100%;line-height: 28px;font-size: 16px;  margin: 0 auto;color: #FC333F;letter-spacing: 1px;}
		.tip_desc{width: 100%;line-height: 28px;  margin: 0 auto;color: #7D7F81;padding-top: 0px;  font-size: 16px;}
		.bottom_style{margin-top: 20px;}
		.amt_style{color:#F93546}
		.remark_area{width: 90%; margin-left: auto;margin-right:auto;letter-spacing: 1px;font-size: 16px;padding-bottom: 30px;}
		.remark_area .header{color: #000;letter-spacing: 1px;padding-bottom: 10px;}
		.remark_area .info{color: #555;letter-spacing: 1px;padding-bottom: 10px;}


		/*新增样式*/
		.headerload{width:100%;border-top: 1px solid #ccc;padding-top:10px;}
		.headerload img{width:100%;}
		.formSuccess{text-align: center;width:100%;padding:20px;font-size:16px;color:red;}
		.amountMoney{width:90%;margin: 0 auto;height:145px;}
		.amountMoney .inamountLeft{float:left;padding:14px;width:48%;background-color: #f6f6f6;}
		.amountMoney .inamountLeft .sumMoney{text-align: center;background-color: #fff;width:100%;padding:24px;}
		.amountMoney .inamountLeft .sumMoney strong{font-size:18px;color:#ff7c6d;border-bottom:1px solid #ff7c6d;padding-bottom:2px;}
		.sumMoney 	p{color:#ff7c6d;font-size:16px;padding-top:2px;}
		.amountMoney .inamountRight{float:right;padding:14px;width:48%;background-color: #f6f6f6;}
		.inamountRight .sumMoney{text-align: center;background-color: #fff;width:100%;padding:24px;}
		.inamountRight .sumMoney strong{font-size:18px;color: #ff7c6d;border-bottom:1px solid #ff7c6d;padding-bottom:2px;}
		.wenzi{width:100%;padding:10px;background-color:#fff;text-align: center;line-height:24px;}
		.wenzi p{padding:10px;font-size:16px;}
		.anniu{width:100%;padding:10px 0px;padding-bottom:10px;text-align: center;}
		.anniu input{width: 80%;outline-style: none;max-width: 388px;}
		.service{padding:20px;font-size:16px;}
		.service p{margin-bottom:5px;} 
		.service p a{text-decoration:none;color: #465563;}
		.service strong a{font-size:14px;text-decoration: none;}
		.reason{width:100%;padding:20px;padding-left: 40px;}
		.reason p{font-size:16px;}
		.reason p b{font-size: 16px;font-weight:normal;}
		.back{width:100%;text-align: center;}
		.back input{width:50%;height:40px;background-color: #32a9fd;border-radius:20px;outline:medium;border:none;font-size:14px;color:#fff;margin-bottom:20px;}

		/*新增样式*/
	</style>
	<script type="text/javascript">
		var dataForWeixin={
				appId:	'${jsapi.appId}',//"wx52222341d8f2e13f",
				imgUrl: "${commUrl}${commLogo}",
				link:	"${commUrl}/Mobile.action?appCode=test&method=wxPrj&prjCode=${prj.finCode}<s:if test='#attr.to != null'>&to=${to}</s:if>&rc=${sessionScope.arc}",
				title:	'${prj.finName}',
				desc:	'${prj.finTitle}',
				fakeid:	""
		};
		var a = "jsapi_ticket=${jsapi.jsapi_ticket}&noncestr=${jsapi.nonceStr}&timestamp=${jsapi.timestamp}&url="+location.href.split('#')[0];
		var signature = hex_sha1(a);
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: "${jsapi.appId}", // 必填，公众号的唯一标识
		    timestamp:"${jsapi.timestamp}", // 必填，生成签名的时间戳
		    nonceStr: "${jsapi.nonceStr}", // 必填，生成签名的随机串
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
			alert("error");
		});
		$(function(){
			if(!isWeiXin()){
				$("#btnShare").hide();
			}else{
				$("#btnShare").click(function(){
					$("#shareTip").show();
				});
				$("#shareTip").click(function(){
					$("#shareTip").hide();
				});
			}
			changeColors("downlink");
		 });
	</script>
</head>
<body>
	<%-- <div class="page_body">
		<div class="top_area">
			<c:if test="${resultFlag == 'fail' || resultFlag == 'sorry'}">
	            <div class="msg_area">
	            	<div class="msg_title">
		            	<img src="${ctx }/h5/img/ico-${resultFlag }.png" style="width:30px"/>
		            	<span>${title }</span>
		            </div>
					<div class="msg_info">${resultTip }</div>
	            </div>
				<div class="bottom_style"><img src="${ctx}/h5/img/border_01.png" width="100%"/></div>
			</c:if>
            <c:if test="${resultFlag == 'success' }">
	            <div class="msg_area">
	            	<div class="msg_title">
		            	<img src="${ctx }/h5/img/ico-${resultFlag }.png" style="width:30px"/>
		            	<span>${title }</span>
		            </div>
					<div class="msg_info">最终的投资金额以实际打款为准。<br/>打款信息服务人员会进行电话通知，请耐心等待哦！</div>
	            </div>
	            <div class="msg_info" style="background-color: #fff;padding: 10px 0 10px 0;color: #444;margin-top: 10px;">
	            	<div class="msg_area">
					本次预约：<span class="amt_style">${applyAmt}</span>
					<br/>
					<s:if test="#attr.totAmt  != null ">
						累计预约：<span class="amt_style">${totAmt}</span>
					</s:if>
					</div>
				</div>
				<div class="txt_center mt_20"><input type="button" class="submit_btn" id="btnShare" value="立即分享" style="background-color: #F83C4A;width: 150px;"/></div>
				<div class="bottom_style"><img src="${ctx}/h5/img/border_01.png" width="100%"/></div>
			</c:if>
		</div>
		<s:if test="#attr.payFlg != null">
			<s:if test="#attr.payFlg == 0"> <!-- 需付款-->
				<div class="tip_desc txt_center remark_area" style="margin-top: 20px;color: #444;padding-bottom: 0;">为了增加入围几率，本项目需要支付一定金额的服务金</div>
				<div class="tip_desc txt_center" style="margin-top: 10px;color: #444;">服务金：<span class="amt_style">￥${payAmt }元</span></div>
				<div class="txt_center mt_20" style="height: 60px;">
					<form id="pform" action='<s:url value="/PtlPay!prjPayCfm.action"/>' method="post">
					<input type=hidden name="prjCode" value="${prj.finCode}"/>
					<input type="submit" class="submit_btn" value="支付服务金" style="background-color: #F83C4A;height: 50px;line-height: 52px;font-size: 24px;letter-spacing: 3px;"/>
					</form>
				</div>
			</s:if>
			<s:if test="#attr.payFlg == 1"> <!-- 付款成功-->
				<div class="tip_desc txt_center" style="margin-top: 20px;color: #444;">您已支付服务金：<span class="amt_style">￥${payAmt }元</span></div>
			</s:if>
			<div class="remark_area">
				<hr/>
				<div class="header">备注：</div>
				<div class="info">1、如果您顺利通过投资人筛选，服务金将在实际打款后返还到您的账户</div>
				<div class="info">2、如果您最终决定放弃参与该项目，服务金将退还</div>
			</div>
		</s:if>
		
		<div class="top_area txt_center">
			<a href="tel:18221956007"><img alt="" src="${ctx }/h5/img/svc_tel.png" class="mt_20" style="width: 80%;max-width: 358px;"></a>
		</div>
		<div class="top_area txt_center" style=";height: 50px;line-height: 50px;">
			<a href="${ctx }/download/download.html" style="color: #998183;" id="downlink">下载客户端，获取更多优质服务</a>
		</div>
		
		<img alt="" src="${ctx}/h5/img/share_tip.png" style="width: 100%;height: 100%;max-width: 640px;position: fixed;bottom: 0;z-index: 1000;display: none;" id="shareTip"/>
	</div> --%>





	
<div class="page_body">

	<c:if test="${resultFlag == 'success' }">
		<!-- 流程头部图片开始 -->
		<div class="headerload">
			<img src="${ctx}/h5/img/sign_sts1.png" alt="">
		</div>
		<!-- 流程头部图片结束-->
		<s:if test='#attr.fdb.investSts =="A" '>
			<p class="formSuccess">您的预约申请已提交</p>
		</s:if>
		<s:else>
			<p class="formSuccess">恭喜您预约成功</p>
		</s:else>
		<div class="amountMoney">
			<div class="inamountLeft">
				<div class="sumMoney">
					<strong>￥${applyAmt}元</strong>
					<p>本次预约</p>
				</div>
			</div>
			<div class="inamountRight">
				<div class="sumMoney">
						<strong>￥${not empty totAmt ? totAmt : applyAmt}元</strong>
						<p>累计预约</p>
				</div>
			</div>
		</div>

		<div class="wenzi">
			<s:if test="#attr.prj.FeeFlg">
				预期投资打款金额：￥ ${fdb.totAmt} + ${fdb.feeAmt} = ${fdb.totAmt+fdb.feeAmt} 元
			</s:if>
			<s:else>
				预期投资打款金额：￥${not empty totAmt ? totAmt : applyAmt} 元
			</s:else>
			
			<p>审核通过后，我们的服务人员会电话通知您打款信息，请你耐心等待！</p>
		</div>
		
		
		<s:if test="#attr.payFlg != null">
			<s:if test="#attr.payFlg == 0"> <!-- 需付款-->
				<div class="tip_desc txt_center remark_area" style="margin-top: 20px;color: #444;padding-bottom: 0;">为了增加入围几率，本项目需要支付一定金额的服务金</div>
				<div class="tip_desc txt_center" style="margin-top: 10px;color: #444;">服务金：<span class="amt_style">￥${payAmt }元</span></div>
				<div class="txt_center mt_20" style="height: 60px;">
					<form id="pform" action='<s:url value="/pay/PtlPay!prjPayCfm.action"/>' method="post">
						<input type=hidden name="uid" value="${fdb.userId}"/>
						<input type=hidden name="prjCode" value="${prj.finCode}"/>
						<input type="submit" class="submit_btn" value="支付服务金" style="background-color: #F83C4A;height: 50px;line-height: 52px;font-size: 24px;letter-spacing: 3px;"/>
					</form>
				</div>
			</s:if>
			<s:if test="#attr.payFlg == 1"> <!-- 付款成功-->
				<div class="tip_desc txt_center" style="margin-top: 20px;color: #444;">您已支付服务金：<span class="amt_style">￥${payAmt }元</span></div>
			</s:if>
			<div class="remark_area">
				<hr/>
				<div class="header">备注：</div>
				<div class="info">1、如果您顺利通过投资人筛选，服务金将在实际打款后返还到您的账户</div>
				<div class="info">2、如果您最终决定放弃参与该项目，服务金将退还</div>
			</div>
		</s:if>
		
		<div class="anniu">
			<input type="image" src="${ctx}/h5/img/anniusuccess.png" id="btnShare">
		</div>
		<div class="service">
			<p>服务电话：<a href="tel:18221956007">18221956007</a></p>
			<a href="${ctx }/download/download.html">下载客户端，获得更多优质服务</a>
		</div>
	<!-- 预约成功页面结束-->
	</c:if>

	<!-- 预约失败页面开始 -->
	
	<c:if test="${resultFlag == 'fail' || resultFlag == 'sorry'}">

		<div class="fail" style="">
			<div class="headerload">
				<img src="${ctx}/h5/img/sign_sts2.png" alt="">
			</div>
			<!-- 流程头部图片结束-->
			<p class="formSuccess">预约失败</p>
			<div class="reason">
				<p>
					失败原因：<b>${resultTip }</b>
				</p>
			</div>
			<div class="back">
				<input type="button" value="返回项目" onclick="location.href='${ctx}/Mobile.action?appCode=test&method=wxPrj&prjCode=${finCode }'">
			</div>
			<div class="service">
				<br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br>
				<p>服务电话：<a href="tel:18221956007">18221956007</a></p>
				<a href="${ctx }/download/download.html">下载客户端，获得更多优质服务</a>
			</div>
		</div>
	</c:if>
	
	<img alt="" src="${ctx}/h5/img/share_tip.png" style="width: 100%;height: 100%;max-width: 640px;position: fixed;bottom: 0;z-index: 1000;display: none;" id="shareTip"/>

</div>
	

	

</body>
</html>