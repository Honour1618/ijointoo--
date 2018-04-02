<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投壮苗计划-投资行家-历史修改</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfMHisAmend.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfMHisAmend.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		
		var webroot = "${ctx}";
		var isLogin = "${login}";
		var prePrjCode = "${tfPrjInfo.prePrjCode}";
		var sts = "${sts}";
		var rspid = "${rspid}";
	</script>
</head>
    <body>
    	<!-- user上部分 -->
    	<div class="topNav">
    		<span class="fan" onclick="back();"></span>
    		历史修改
    	</div>
    	
		<div class="missionDtl">
			<c:forEach var="list" items="${his}" varStatus="status">
		   		<ul class="mission_con">
		   			<li>
						<label>修改时间：</label>
						<strong> ${list.crtTime}</strong>
					</li>
					<li>
						<label>修改纪要：</label>
						<strong>${list.submitDesc}</strong>
					</li>
					<li class="modifyBP">
						<label>修改附件：</label>
						<c:if test="${not empty list.bpUrl }">
							<a href="${ctx }/${list.bpUrl}" target="_blank">
								<img class="imgBP" src="${ctx}/file/h5/weixin/images/modifyBP.png" />
							</a>
						</c:if>
					</li>
					<li class="modifyPic">
						<label>修改图片：</label>
						<c:if test="${not empty list.rspImgUri }">
							<img class="modifyImg" src="${ctx}/${list.rspImgUri}"/>
						</c:if>
					</li>
		   		</ul>
		   	</c:forEach>
    	</div>
    	<div class="common_mask"></div>
	   	<div class="loadingPic"></div>
    	<div class="more_btn" id="load_more_btn" page-num="${pageInfo.total}" onClick="loadMoreAmend(this)">查看更多</div>
    </body>
</html>