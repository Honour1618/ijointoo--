<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投众创生态系统---壮苗计划</title>
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

    	<!-- user上部分 -->
    	<div class="topNav">
    		<a class="fan" href="${ctx}/PtlMobile!index.action"></a>
    		壮苗计划
    	</div>
    	
    	<!-- 我要融资 -->
    	<div class="managerEnter">
    		<a href="${ctx}/PtlTf!startupHome.action?eqType=mb&pageInfo.currentPage=1&pageInfo.pageSize=5">
    			<img src="${ctx}/file/h5/weixin/images/managerEnter.png" />
    		</a>
    		<c:if test="${flowSts == 't1' }">
    			<div class="managerList" onclick="failApp();">分享你的项目</div>
    		</c:if>
    		<div id="failApp" class="tipShow">
    			<p>请在app内提交项目信息</p>
    			<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou" class="btn">下载APP</a>
    		</div>
    		<c:if test="${flowSts == 't2' }">
    			<div class="managerList" onclick="auditTipShow();">分享你的项目</div>
    		</c:if>
    		<div id="auditTipShow" class="tipShow">
    			<p>你的项目正在审核中，请耐心等待</p>
    			<button class="btn" id="btn">确定</button>
    		</div>
    		<c:if test="${flowSts == 't3' }">
    			<a href="${ctx}/PtlTest!fin.action#main" class="managerList">分享你的项目</a>
    		</c:if>
    		<c:if test="${flowSts == 't4' }">
    			<a href="${ctx}/pay/PtlTf!prj.action?prjCode=${prjCode}" class="managerList">分享你的项目</a>
    		</c:if>
    	</div>
    	<div class="common_mask"></div>
    	
    	<!-- 我是行家 -->
    	<div class="expertEnter">
    		<a href="${ctx}/PtlTf!investMemHome.action?eqType=mb&investMemInfo.userId=${userId}&pageInfo.currentPage=1&pageInfo.pageSize=5">
    			<img src="${ctx}/file/h5/weixin/images/expertEnter.png" />
    		</a>
   			<a href="${ctx}/PtlTf!investorList.action?eqType=mb&sort=2&pageInfo.currentPage=1&pageInfo.pageSize=5" class="expertList">了解更多导师</a>
    	</div>
    	
    	<!-- 爱助创 -->
    	<div class="supportEnter">
    		<a href="${ctx}/PtlTf!investorHome.action?eqType=mb&pageInfo.currentPage=1&pageInfo.pageSize=5">
    			<img src="${ctx}/file/h5/weixin/images/supportEnter.png" />
    		</a>
   			<a href="${ctx}/PtlTf!prjList.action?eqType=mb&sort=0&sts=1&pageInfo.pageSize=5&pageInfo.currentPage=1" class="supportList">助创更多项目</a>
    	</div>
    	
    	<!-- 壮苗计划说明 -->
    	<a class="plan_explain" href="${ctx}/htmlview/platform/mobile/direction_mo.jsp">
    		壮苗计划说明
    	</a>
    </body>
</html>