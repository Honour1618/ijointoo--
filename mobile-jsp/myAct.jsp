<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>爱就投-我的活动</title>
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
				我的活动
				<div class="top_left"></div>
			</div>
		</div>
		<!-- 顶部结束 -->
		
		<c:if test="${actFlag ne 0 }">
			<div class="myAct">
				<!-- 关注的项目 -->
				<div class="focusWrap">
					<!-- 项目开始 -->
					<div class="stockItem">
						<strong>参与的活动</strong>
						<ul class="stockCon">
							<c:forEach var="general" items="${generalList }" varStatus="generalSts">
								<li>
									<a href="${ctx }/PtlSignup!actRegInit.action?activityNo=${general.activityNo}">
										<img src="${ctx }/${general.actLogo }" >
										<h2>${general.actTitle }</h2>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="relayItem">
						<strong>参与的产品众筹</strong>
						<ul class="stockCon">
							<c:forEach var="product" items="${productList }" varStatus="productSts">
								<li>
									<a href="${ctx }/PtlSignup!actRegInit.action?activityNo=${product.activityNo}">
										<img src="${ctx }/${product.actLogo }" >
										<h2>${product.actTitle }</h2>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="relayItem">
						<strong>参与的公益众筹</strong>
						<ul class="stockCon">
							<c:forEach var="pubgive" items="${pubgiveList }" varStatus="pubgiveSts">
								<li>
									<a href="${ctx }/PtlSignup!actRegInit.action?activityNo=${pubgive.activityNo}">
										<img src="${ctx }/${pubgive.actLogo }" >
										<h2>${pubgive.actTitle }</h2>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 项目结束 -->
				</div>
				
				<!-- 找活动 -->
				<div class="watchItem">
					<p>这么好玩的活动，这些怎么够</p>
					<a href="PtlMobile!activityList.action">找活动</a>
				</div>
			</div>
		</c:if>
		
		<c:if test="${actFlag eq 0 }">
			<div class="myActNone">
				<img src="${ctx}/file/h5/weixin/images/aggrieved.png">
				<div class="watchItem">
					<p>什么，这么优质的爱就投活动，你还没参加过<br/><span>还不快去报名</span></p>
					<a href="PtlMobile!activityList.action">找活动</a>
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