<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投壮苗计划-投资行家-任务详情</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfMission.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfMission.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		
		var webroot = "${ctx}";
		var isLogin = "${login}";
		var expRspTime = "${rspbidinfo.expRspTime }";
		
	</script>
</head>
    <body>
    	<!-- user上部分 -->
    	<div class="topNav">
    		<span class="fan" onclick="back();"></span>
    		任务详情
    	</div>
		<div class="missionDtl">
	   		<h2 class="mission_title">${prjinfo.prjName}</h2>
	   		<ul class="mission_con">
	   			<li>
					<label>任务佣金</label>
					<strong>${prjinfo.targAmt }元</strong>
				</li>
				<li>
					<label>结束时间</label>
					<strong>${rspbidinfo.expRspTime }</strong>
				</li>
				<li>
					<label>距离结束</label>
					<!-- 计时器 -->
				 	<div class="calculagraph" id="calculagraph">
				 		<span class="day">00</span><span class="lang">天</span>
				 		<span class="hour">00</span><span class="lang">小时</span>
				 		<span class="minute">00</span><span class="lang">分</span>
				 		<span class="second">00</span><span class="lang">秒</span>
				 	</div>
				</li>
				<li>
					<label>创始人简介</label>
					<p>${prjinfo.createDesc }</p>
				</li>
				<li>
					<label>创始团队简介</label>
					<p>${prjinfo.teamDesc }</p>
				</li>
				<li>
					<label>项目简介</label>
					<p>${prjinfo.prjDesc }</p>
				</li>
				<li>
					<label>任务详情</label>
					<p>${bidinfo.bidDesc }</p>
				</li>
	   		</ul>
	   		<div class="button_mission">
	    		<a class="submit_mission" onclick="submitMission()">提 交 任 务</a>
				<a href="PtlTf!bpHisList.action?eqType=mb&tfPrjInfo.prePrjCode=${prjinfo.prePrjCode }&rspid=${rspbidinfo.objId}&sts=${sts}&pageInfo.currentPage=1&pageInfo.pageSize=3" class="fixed_history">历 史 修 改</a>
	    	</div>
    	</div>
    	<!-- 任务提交引导框 -->
    	<div class="load_app">
    		<p>请前往爱就投app，进行任务提交</p>
    		<a class="load_addr" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">下载APP</a>
    	</div>
    	<div class="common_mask" onclick="commonMask()"></div>
    </body>
</html>