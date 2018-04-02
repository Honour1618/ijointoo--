<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>项目路演邀请</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" /> 
 	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/fakeloader.css"/>
 	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
 	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="${ctx }/js/jquery-1.10.2.min.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/fakeloader.js"></script>

</head>
<body style="background-color: rgb(245, 245, 245);">
<!-- <div class="page_title">项目路演邀请</div> -->
<div class="page_main">
	<c:forEach items="${prjRoadShowList }" var="prjRoadShow">
	<a href="${ctx }/PtlSignup!actRegInit.action?activityNo=${prjRoadShow.activityNo}">
	<div class="project_panel">
		<div class="roadShow_logo_box">
			<img src="${ctx }/${prjRoadShow.financingInfo.compLogo }" class="project_img"/>
		</div>
		<div class="roadShow_info">
			<div class="project_pub_title" align="center">${prjRoadShow.financingInfo.simpName }项目路演通知</div>
			<div class="roadShowTime" style="padding-left: 30px;text-align: left;">路演时间：${prjRoadShow.roadTime }</div>
			<div class="roadShowTime" style="padding-left: 30px;text-align: left;">路演地点：${prjRoadShow.activityAddr }</div>
		</div>
	</div>
	</a>
	</c:forEach>
</div>
</html>