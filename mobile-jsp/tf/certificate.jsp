<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投|助创证书</title>
    <meta name="description" content="爱就投，让资本带着资源，投向真的有梦想的企业，成就每个人的创富梦想！爱就投，让人类商业文明提前进入共产主义！精品项目，爱就投！"/>
	<meta name="keywords" content="爱就投，私募股权融资，众筹，筹众，股权融资，股权投资，原始股，原始股投资，移动交易平台"/>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${ctx }/file/tf/certificate/certificate.css">
    <script type="text/javascript" src="${ctx }/js/sha1.js"/></script>
 	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
 	<script src="//wximg.qq.com/wxp/libs/wxmoment/0.0.4/wxmoment.min.js"></script>
 	<script type="text/javascript" src="${ctx }/file/tf/certificate/certificate.js"></script>
	<script type="text/javascript">
		/* wechat share */
		var shareTitle = '${shareTitle}';
		var shareDesc_s = '${shareDesc}';
		var shareAppId = '${jsapi.appId}';
		var shareTimestamp = '${jsapi.timestamp}';
		var shareNonceStr = '${jsapi.nonceStr}';
		var shareTicket = '${jsapi.jsapi_ticket}';
		var shareImg = '${shareImg}';
		var commUrl = '${commUrl}';
		var uid = '${cerBean.userId}';//用户Id
		/* wechat share ~ end */

		var webroot = '${ctx}';
		var uLogo = '${cerBean.userLogo}'; //用户logo
		var uName = '${cerBean.userName}';//用户姓名
		var totalSuptAmt = '${cerBean.totalSuptAmt}'; //筹资总金额
		var num = '${cerBean.suptNum}';//项目数
		var per = '${cerBean.suptPer}'; //百分比
		var levelDesc='${cerBean.suptLevelDesc }'; //评定描述
		var fromType = '${fromType}'; //证书分享
	</script>
</head>
<body>
	<div class="certificate-wrap">
		<div class="certificate">
			<div class="certificate-t">
				<img src="${ctx}/${cerBean.userLogo}">
			</div>
			<div class="certificate-m">
				<h1>${cerBean.userName}</h1>
				<h2>感 谢 你！</h2>
				<p>累计助创了${cerBean.totalSuptAmt}元，${cerBean.suptNum}个壮苗项目。<br>领先平台${cerBean.suptPer}的微天使</p>
			</div>
			<div class="certificate-b"><span>平台认定</span>${cerBean.suptLevelDesc }</div>
		</div>
		<div class="certificate-btn certificate-help">
			<a href="${ctx}/PtlTf!prjList.action?eqType=mb&sort=0&sts=1&pageInfo.pageSize=5&pageInfo.currentPage=1">
				<img src="${ctx}/file/tf/certificate/images/certificate-btn.png">
			</a>
		</div>
		<div class="certificate-btn certificate-share">
			<img src="${ctx}/file/tf/certificate/images/certificate-share.png" >
		</div>
	</div>
	<!-- 分享引导 -->
	<div id="share_mask"><img alt="" src="${ctx}/file/tf/certificate/images/share_arrow.png" width="218"/></div>
</body>
</html>
