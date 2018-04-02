<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投|让资本带着资源投向高成长企业|健康生活第一筹众平台</title>
    <meta name="description" content="爱就投，让资本带着资源，投向真的有梦想的企业，成就每个人的创富梦想！爱就投，让人类商业文明提前进入共产主义！精品项目，爱就投！"/>
	<meta name="keywords" content="爱就投，私募股权融资，众筹，筹众，股权融资，股权投资，原始股，原始股投资，移动交易平台"/>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link type="text/css"  rel="stylesheet"  href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/infoData.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/judge.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		
		var webroot = "${ctx}";
		var isLogin = "${login}";
		var selectFlg = "${selectFlg}";
		var webUrl = "${webUrl}";
	</script>
</head>
    <body>
    	<!-- 导航开始 -->
    	<nav>
    		<ul class="subNav">
    			<li><a  href="PtlMobile!index.action">首页</a></li>
    			<li><a href="PtlMobile!activityList.action">活动</a></li>
    			<li class="current"><a href="PtlMobile!inforQry.action?type=4">资讯</a></li>
    		</ul>
    		<!-- <a href="PtlPersonal.action" class="used"></a> -->
    	</nav>
    	<div class=info_wrap>
	    	<div class="top">
				<ul id="title" class="litNav" style="margin-bottom: 0px;">
					<li id="1"><a href="PtlMobile!inforQry.action?type=4">创投热点</a></li>
					<li id="2"><a href="PtlMobile!inforQry.action?type=3">深度干货</a></li>
					<li id="3"><a href="PtlMobile!inforQry.action?type=1">项目资讯</a></li>
					<li id="4"><a href="PtlMobile!inforQry.action?type=5">平台资讯</a></li> 
					<li id="5"><a href="PtlMobile!inforQry.action?type=0">小爱说</a></li>
				</ul>
			</div>
			<div id="wrapper">
				<div id="scroller">
					<!-- 下拉刷新 -->
					<div id="pullDown">
						<span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
					</div>
					<!-- 创投热点开始 -->
					<div class="infoConWrap01" id="thelist">
						<c:forEach var="zx" items="${titles }" varStatus="zxSts">
							<a class="infoCon" href="${zx.webUrl}" target="_blank">
								<div class="text_info">
									<h2>${zx.title }</h2>
									<p>${zx.summary }</p>
								</div>
								<div class="img_info">
									<img src="${ctx }${zx.smallLogoUrl}">
									<span>${zx.putonTimeStr}</span>
								</div>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		   
	  <!-- 上拉加载 -->
	  <div id="pullUp"  style="position:fixed;z-index: 100;bottom: 45px;width: 100%;max-width: 640px;display: none;">
		  <span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
	  </div>
	  
	  

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
    <script type="text/javascript" src="${ctx}/web/js/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx }/h5/js/iscroll.js"></script>
    <script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/infoData.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		
		var webroot = "${ctx}";
		var isLogin = "${login}";
		var typeNum = "${type}";
	</script>
</html>