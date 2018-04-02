<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投个人中心</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/personal.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/personal.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		
		var webroot = "${ctx}";
		var isLogin = "${login}";
	</script>
</head>
    <body>

    	<!-- user上部分 -->
    	<div class="user">
    		<a class="fan" href="${ctx}/PtlMobile!index.action"></a>
			<div class="userCon">
				<div class="userImg">
					<img src="${ctx }/${logo}" >
				</div>
				<h2>${name }<i></i></h2>
				<div class="angel_level"><img src="${ctx }/file/h5/weixin/images/support${userLevel}.png" /></div>
				<%-- <p>会员等级：${userLevelStr }</p> --%>
			</div>
			<ul class="focus_item">
				<li>
					<a href="${ctx }/PtlPersonal!myFin.action?type=1">
						<i>${focusNum }</i><br/>
						关注的项目
					</a>
				</li>
				<li>
					<a href="${ctx }/PtlPersonal!myFin.action?type=2">
						<i>${applyNum }</i><br/>
						预约的项目
					</a>
				</li>
				<li>
					<a href="${ctx }/PtlPersonal!myFin.action?type=0">
						<i>${investNum }</i><br/>
						投资的项目
					</a>
				</li>
			</ul>
    	</div>
		
		<!-- function部分 -->
    	<ul class="function">
    		<li>
    			<a href="${ctx }/PtlPersonal!myWealth.action">
	    			<span>当前财富</span>
	    			<i><strong>${wealthAmt }元</strong></i>
	    		</a>
    		</li>
    		<li>
    			<a href="${ctx }/PtlWenjuan!showRiskEval.action?userId=${userId }">
	    			<span>风险测评</span>
	    			<c:if test="${riskLevel eq null || riskLevel eq ''}">
	    				<i>测试风险承受能力</i>
	    			</c:if>
	    			<c:if test="${riskLevel ne null && riskLevel ne ''}">
	    				<i>${riskLevel }</i>
	    			</c:if>
	    		</a>
    		</li>
    		<li>
    			<a href="${ctx }/PtlPersonal!myAct.action">
	    			<span>我的活动</span>
	    			<i>${actNum }个</i>
	    		</a>
    		</li>
    		<li>
    			<a href="${ctx }/PtlPersonal!myRpt.action">
	    			<span>投后报告</span>
	    			<i>${notReadNum }份未读</i>
	    		</a>
    		</li>
    		<li>
    			<a href="${ctx }/PtlPersonal!myBonus.action">
	    			<span>红包奖励</span>
	    			<i>推荐红包奖励</i>
	    		</a>
    		</li>
    		<li>
    			<a href="${ctx }/PtlActivity!myAgentRc.action">
	    			<span>联合合伙人</span>
	    			<i>联合合伙人推荐</i>
	    		</a>
    		</li>
    	</ul>
    	<a class="extra_info" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">
    		想要更加了解您的投资表现<br/>
			快去下载爱就投APP吧
    	</a>
    </body>
</html>