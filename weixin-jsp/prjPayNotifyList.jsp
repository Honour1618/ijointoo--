<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>项目打款列表</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" /> 
 	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/fakeloader.css"/>
 	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
 	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="${ctx }/js/jquery-1.10.2.min.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/fakeloader.js"></script>

</head>
<body style="background-color: rgb(245, 245, 245);">
<!-- <div class="page_title">项目打款列表</div> -->
<div class="page_main">
	<c:forEach items="${prjPayNotifyList }" var="payNotify">
	<a href="${ctx }/PtlSignup!payNotifyInit.action?prjCode=${payNotify.prjCode}">
	<div class="project_panel">
		<div class="roadShow_logo_box">
			<img src="${ctx }/${payNotify.financingInfo.compLogo }" class="project_img"/>
		</div>
		<div class="roadShow_info">
			<div class="project_pub_title" align="center">${payNotify.financingInfo.simpName }项目打款查询</div>
			<div class="roadShowTime">开始时间：${payNotify.startTime }</div>
			<div class="roadShowTime">结束时间：${payNotify.endTime }</div>
		</div>
	</div>
	</a>
	</c:forEach>
</div>
</html>