<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>爱就投-我的项目</title>
        <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
        <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/myFin.css">
        <script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
        <script type="text/javascript" src="${ctx }/file/h5/weixin/js/myFin.js"></script>
        <script type="text/javascript">
        	var webroot="${ctx}";
        	var type="${type}";
        </script>
    </head>
    <body>
    	<!-- 顶部开始 -->
		<div id="top_wrap">
			<div class="top">
				我的项目
				<a class="topLeft" href="${ctx }/PtlPersonal.action"></a>
			</div>
		</div>
		<!-- 顶部结束 -->

		<!-- 小导航开始 -->
		<ol class="smlNav">
			<li id="focusItem">
				<a href="${ctx }/PtlPersonal!myFin.action?type=1">
					关注的项目
				</a>
			</li>
			<li id="congressItem">
				<a href="${ctx }/PtlPersonal!myFin.action?type=2">
					预约的项目
				</a>
			</li>
			<li id="investItem">
				<a href="${ctx }/PtlPersonal!myFin.action?type=0">
					投资的项目
				</a>
			</li>
		</ol>
		<!-- 小导航结束 -->
		
		<c:if test="${finFlag ne 0}">
			<div class="myFin">
				<!-- 关注的项目 -->
				<c:if test="${type eq '1' }">
					<div class="focusWrap">
						<!-- 项目开始 -->
						<div class="stockItem">
							<strong>股权项目</strong>
							<ul class="stockCon">
								<c:forEach var="fin" items="${finList }" varStatus="finSts">
									<li>
										<a href="${ctx }/Mobile.action?appCode=test&method=wxPrj&prjCode=${fin.finCode}">
											<img src="${ctx }${fin.finLogoUrl}" >
											<h2>${fin.finName}</h2>
											<span>融资状态：<b>${fin.finStsStr}</b></span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="relayItem">
							<strong>接力项目</strong>
							<ul class="stockCon">
								<c:forEach var="share" items="${shareList }" varStatus="shareSts">
									<li>
										<a href="${ctx }/PtlRelay.action?appCode=test&method=fdtl&prjShareCode=${share.prjShareCode}">
											<img src="${ctx }${share.finLogoUrl}" >
											<h2>${share.marketTitle}</h2>
											<span>融资状态：<b>${share.prjShareStsStr}</b></span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- 项目结束 -->
					</div>
				</c:if>
				
				<!-- 预约的项目 -->
				<c:if test="${type eq '2' }">
					<div class="firmWrap">
						<!-- 项目开始 -->
						<div class="stockItem">
							<strong>股权项目</strong>
							<ul class="stockCon">
								<c:forEach var="fin" items="${finList }" varStatus="finSts">
									<li>
										<a href="${ctx }/Mobile.action?appCode=test&method=wxPrj&prjCode=${fin.finCode}">
											<img src="${ctx }${fin.finLogoUrl}" >
											<h2>${fin.finName}</h2>
											<span>预约金额：<b>${fin.userInvestAmtStr}元</b></span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="relayItem">
							<strong>接力项目</strong>
							<ul class="stockCon">
								<c:forEach var="share" items="${shareList }" varStatus="shareSts">
									<li>
										<a href="${ctx }/PtlRelay.action?appCode=test&method=fdtl&prjShareCode=${share.prjShareCode}">
											<img src="${ctx }${share.finLogoUrl}" >
											<h2>${share.marketTitle}</h2>
											<span>预约金额：<b>${share.userInvestAmtStr}元</b></span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- 项目结束 -->
					</div>
				</c:if>
		
				<!-- 投资的项目 -->
				<c:if test="${type eq '0' }">
					<div class="investWrap">
						<!-- 项目开始 -->
						<div class="stockItem">
							<strong>股权项目</strong>
							<ul class="stockCon">
								<c:forEach var="fin" items="${finList }" varStatus="finSts">
									<li>
										<a href="${ctx }/Mobile.action?appCode=test&method=wxPrj&prjCode=${fin.finCode}">
											<img src="${ctx }${fin.finLogoUrl}" >
											<h2>${fin.finName}</h2>
											<span>投资金额：<b>${fin.userReallyAmtStr}元</b></span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="relayItem">
							<strong>接力项目</strong>
							<ul class="stockCon">
								<c:forEach var="share" items="${shareList }" varStatus="shareSts">
									<li>
										<a href="${ctx }/PtlRelay.action?appCode=test&method=fdtl&prjShareCode=${share.prjShareCode}">
											<img src="${ctx }${share.finLogoUrl}" >
											<h2>${share.marketTitle}</h2>
											<span>投资金额：<b>${share.userReallyAmtStr}元</b></span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- 项目结束 -->
					</div>
				</c:if>
		
				<!-- 看项目 -->
				<div class="watchItem">
					<p>据说人的一生如果没有十家公司的股权，<br/>
						那他的投资体验一定是不完美的
					</p>
					<a href="PtlWeixin!prjPubList.action">看项目</a>
				</div>
			</div>
		</c:if>
		
		<c:if test="${finFlag eq 0}">
			<div class="myFinNone">
				<img src="${ctx}/file/h5/weixin/images/aggrieved.png">
				<div class="watchItem">
					<p>这么多项目没有您满意的嘛？小爱好伤心</p>
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