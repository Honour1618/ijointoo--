<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>爱就投-当前财富</title>
        <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
        <link rel="stylesheet" href="${ctx}/file/h5/weixin/css/myWealth.css">
        <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
        <script type="text/javascript" src="${ctx }/file/h5/weixin/js/backClose.js"></script>
        <script type="text/javascript">
        	var type="${type}";
        	var finFlag="${fniFlag}";
        	var actFlag="${actFlag}";
        </script>
    </head>
    <body>
    	<c:if test="${wealthAmt ne null && wealthAmt ne ''}">
	    	<div class="myWealth">
				<!-- 资产详情开始 -->
				<div class="wealth_wrap">
					<!-- 顶部开始 -->
					<div id="top_wrap">
						<div class="top">
							当前财富
							<div class="top_left"></div>
						</div>
					</div>
					<!-- 顶部结束 -->
					<div class="asset">
						<p>您的资产总值</p>
						<span>${wealthAmt }元</span>
					</div>
				</div>
				<div class="asset_det">
					<p>
						<span>您的浮盈</span>
						<strong>${growTotAmt }元</strong>
					</p>
					<p>
						<span>您的本金</span>
						<strong>${reallyTotAmt }元</strong>
					</p>
				</div>
				<!-- 资产详情结束 -->
		
				<!-- 看项目 -->
				<div class="watchItem">
					<p>据说人的一生如果没有十家公司的股权，<br/>
						那他的投资体验一定是不完美的
					</p>
					<a href="PtlWeixin!prjPubList.action">看项目</a>
					<p>
						<a class="loadApp" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">下载爱就投APP</a><br/>
						查看详尽的财富分析
					</p>
				</div>
			</div>
		</c:if>
		
		<c:if test="${wealthAmt eq null || wealthAmt eq ''}">
			<div class="myWealthNone">
				<!-- 顶部开始 -->
				<div id="top_wrap">
					<div class="top">
						当前财富
						<div class="top_left"></div>
					</div>
				</div>
				<!-- 顶部结束 -->
				<img src="${ctx}/file/h5/weixin/images/aggrieved.png">
				<div class="watchItem">
					<p>还没有在爱就投投资啊，小爱不能满足您吗</p>
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