<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投壮苗计划-创业者</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfMBusiness.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfMBusiness.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		
		var webroot = "${ctx}";
		var isLogin = "${login}";
	</script>
</head>
    <body>
		    	  	    <!--头部-->
    <header class="clearfix">
        <button class="back__btn" id="backBtn"><img src="${ctx}/file/h5/weixin/images/back-btn.png" alt="返回"></button>
        <div class="header--title">我要融资</div>
        <button class="logout__btn"><img src="${ctx}/file/h5/weixin/images/logout.png" alt="退出"></button>
    </header>
    	<!-- user上部分 -->
<%--     	<div class="topNav">
    		<a class="fan" href="${ctx}/PtlTf!rccIndex.action?eqType=mb"></a>
    		我要融资
    	</div>
    	 --%>
    	<!-- 没有项目时 -->
    	<c:if test="${empty prjList}">
			<div class="nonePrj">
				<img src="${ctx}/file/h5/weixin/images/cowLogo.png" />
				<p>你还没有发布过项目<br/>去爱就投APP，发布项目吧</p>
				<a class="extra_info" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">下载APP</a>
			</div>
		</c:if>
    	
    	<!-- 有项目时 -->
    	<c:if test="${not empty prjList}">
	    	<div class="user">
				<div class="userCon">
					<div class="userImg">
						<img src="${ctx }/${investMem.userLogo}" >
					</div>
					<h2>${investMem.userName}<i></i></h2>
					<p>${investMem.userComp}</p>
				</div>
	    	</div>
	    	
	    	<div id="businessCon">
		    	<c:forEach var="list" items="${prjList}" varStatus="status">
			    	<a class="business_con" href="pay/PtlTf!prj.action?prjCode=${list.prePrjCode }&uid=${list.userId }">
			    		<div class="business_man">
							<img src="${ctx}/${list.userLogo}" class="user_mission"/>
							<%-- <span>${list.prjName }</span> --%>
							<span class="crtTime crtTime${list.prePrjCode }">${list.crtTime}</span>
						</div>
						<p class="business_title">${list.prjName }</p>
						<ul class="business_tag_con">
							<c:forEach items="${list.prjTag }" var="show">
								<li class="business_tag">${show}</li>
							</c:forEach>
						</ul>
						<div class="business_res">项目软肋：${list.rscDesc }</div>
						<c:if test="${list.prjStep == 2 || list.prjStep == 4}">
							<i class="business_status gray_bg">${list.flowStsStr}</i>
						</c:if>
						<c:if test="${list.prjStep != 2 && list.prjStep != 4}">
							<i class="business_status pink_bg">${list.flowStsStr}</i>
						</c:if>
			    	</a>
			    	<script type="text/javascript">
						var idtmp = '${list.prePrjCode}';
						var crtTime = "${list.crtTime}";
						var onlyBidDay= crtTime.substring(0,10);
						var timeBid = 'crtTime'+idtmp;
						$("."+timeBid).html(onlyBidDay);
					</script>
		    	</c:forEach>
	    	</div>
			<div class="common_mask"></div>
		   	<div class="more_btn" id="load_more_btn" page-num="${total}" onClick="loadMoreTask(this)">查看更多</div>
		   	<div class="loadingPic"></div>
	   	</c:if>
	   	    <footer>
        <div class="toggleUser__box">
            <span class="toggleUser--toggle">切换身份</span>
            <span class="toggleUser--ds toggleUser--next fr" id="dsCenter"><img src="${ctx}/file/h5/weixin/images/nextBtn_03.png" alt="next"></span>
            <span class="toggleUser--ds fr toggleUser__ds">我是创业者</span>
        </div>
    </footer>
    
	   			<div class="common_mask"></div>
  	    <div class="alertDS alert__exit" id="alertExit">
        <span></span>
        <div class="btn__box clearfix">
            <input type="button" class="btn fl btn--active" value="退出" id="exitBtn">
            <input type="button" class="btn fr btn--warning  btn-close" value="取消">
        </div>
    	</div>
    	

    </body>
</html>