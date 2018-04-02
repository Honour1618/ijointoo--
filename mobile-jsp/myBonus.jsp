<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>爱就投-红包奖励</title>
        <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
        <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/myFin.css">
        <script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
        <script type="text/javascript" src="${ctx }/file/h5/weixin/js/backClose.js"></script>
        <script type="text/javascript">
        	var webroot="${ctx}";
        </script>
    </head>
    <body>
    	<!-- 顶部开始 -->
		<div id="top_wrap">
			<div class="top">
				红包奖励
				<div class="top_left"></div>
			</div>
		</div>
		<!-- 顶部结束 -->
		
		<c:if test="${notCashNum ne 0}">
			<div class="myBonus">
				<!-- 关注的红包 -->
				<a class="user_asset" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">
					<p>您有<span>${notCashNum }</span>个红包<br/>未领取</p>
				</a>
				
				<!-- 看项目 -->
				<div class="watchItem">
					<p>投资更多，获得更多红包，再去捞一票</p>
					<a href="PtlWeixin!prjPubList.action">看项目</a>
				</div>
			</div>
		</c:if>
		
		<c:if test="${notCashNum eq 0}">
			<div class="myBonusNone">
				<img src="${ctx}/file/h5/weixin/images/happy.png" height="109" width="162" alt="">
				<div class="watchItem">
					<p>你的红包都已经领取了哦<br/>
					快去预约项目或者推荐好友注册吧</p>
					<a href="PtlWeixin!prjPubList.action">看项目</a>
				</div>
				<p class="loadMore">下载爱就投app会有更多惊喜</p>
			</div>
		</c:if>

		<!-- 固定条 -->
		<div class="fixed_bar">
			<div class="fixed_logo"></div>
			<div class="fixed_con">
				<p>爱就投</p>
				<span>因为爱，所以投</span>
			</div>
			<div class="load">
				<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">立即下载</a>
				<i></i>
			</div>
		</div>

    </body>
</html>