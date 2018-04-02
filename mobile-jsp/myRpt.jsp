<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>爱就投-投后报告</title>
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
				投后报告
				<div class="top_left"></div>
			</div>
		</div>
		<!-- 顶部结束 -->
		
		<c:if test="${rptNum ne 0 && investNum ne 0}">
			<div class="myRpt">
				<div class="investNum">
					您投资了<i>${investNum }</i>个项目，有<span>${rptNum }</span>篇投后报告
				</div>
				
				<!-- 项目报告开始 -->
				<div class="focusWrap">
					<!-- 项目开始 -->
					<div class="stockItem">
						<ul class="stockCon invested">
							<c:forEach var="rpt" items="${rptList }" varStatus="rptSts">
								<li>
									<a href="${ctx}/PtlVote!rptView.action?rptNo=${rpt.no}">
										<img src="${rpt.compLogo }" >
										<h2>${rpt.rptTile }</h2>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 项目结束 -->
				</div>
				<!-- 项目报告结束 -->
		
				<!-- 找活动开始 -->
				<div class="watchItem">
					<p>再去看看其他项目吧</p>
					<a href="PtlWeixin!prjPubList.action">看项目</a>
				</div>
				<!-- 找活动结束 -->
			</div>
		</c:if>
		
		<c:if test="${investNum eq 0}">
			<div class="myRptNo">
				<img src="${ctx}/file/h5/weixin/images/aggrieved.png">
				<div class="watchItem">
					<p>哦哦，你还没投资呢<br/>看看爱就投的优质项目</p>
					<a href="PtlWeixin!prjPubList.action">看项目</a>
				</div>
				<p class="loadMore">下载爱就投app会有更多惊喜</p>
			</div>
		</c:if>
		<c:if test="${rptNum eq 0 && investNum ne 0}">
			<div class="myRptNone">
				<img src="${ctx}/file/h5/weixin/images/aggrieved.png">
				<div class="watchItem">
					<p>哦哦，还没有报告哦<br/>要不看看别的项目</p>
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