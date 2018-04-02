<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<c:set var="currentPage" value="publishMain"/>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>我的打款明细</title>
	<link rel="shortcut icon" href="<s:url value="/favicon.ico"/>" type="image/x-icon" /> 
 	<link href='<s:url value="/h5/css/i9tou_style.css"/> ' rel="stylesheet">
 	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
	<link href='<s:url value="/h5/css/fakeloader.css"/> ' rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${ctx }/file/h5/h5Weixin/css/myPayInfo.css"/>
   	<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
</head>
<body style="padding-bottom:50px;" class="page_bgcolor" >
    <div class="container">
        <div class="my_title_bar">
        	<div>我的打款信息</div>
        	<div class="msg_count">${fn:length(prjs)}</div>
        	<div class="clear"></div>
        </div>
        <br/>
        <br/>
            <div class="upper"></div>
            <div class="content">
				我的投资认证等级：<font color=red>${risk.riskLevel}</font>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<s:url value='PtlWenjuan!showRiskEval.action'/>?backurl=PtlWeixin!myPayInfo.action">重新测评</a>
				<br/>
				${risk.remark}
            </div>
            <div class="lower"></div>
        <div class="clear"></div>
        <s:if test="#attr.prjs != null">
    	<c:forEach items="${prjs}" var="prj">
			<div class="pay_prj_title">${prj.simpName}联投项目<span>[申请投资:<font style="color:#ff1;font-weight: bold;"><fmt:formatNumber value="${prj.investAmt}" type="currency" pattern="￥#,##0"/></font>元]</span></div>	
			<s:if test="#attr.prj.notifies != null">
				<c:forEach items="${prj.notifies}" var="notify">
					<table class="deposit_table" border="1" style="border-color: #ccc;">
						<tr>
							<td class="td_title" colspan="2" style="text-align: left;text-indent: 5px;">${notify.remark}打款账户	<s:if test="#attr.notify.endFlg == true">[打款已结束]</s:if>
							</td>
						</tr>
						<tr>
							<td class="td_left">打款公司</td>
							<td class="td_right">${notify.limitCompName}</td>
						</tr>
						<tr>
							<td class="td_left">打款帐号</td>
							<td class="td_right">${notify.compAcctNo}</td>
						</tr>
						<tr>
							<td class="td_left">打款银行</td>
							<td class="td_right">${notify.compBankName}</td>
						</tr>
						<tr>
							<td class="td_left">打款时间</td>
							<td class="td_right">
								<fmt:formatDate value="${notify.startTime}" type="date" /> —
								<fmt:formatDate value="${notify.endTime}" type="date" />
							</td>
						</tr>
						<tr>
							<td class="td_title" colspan="2">打款时在备注/留言板,注明:<font color="#ff6633">投资款</font></td>
						</tr>
						<tr>
							<td class="td_title" colspan="2">您在<fmt:formatDate value="${notify.backEndTime}" />内未收到退款，恭喜您已成功投资！</td>
						</tr>
					</table>
		 		</c:forEach>
		 	</s:if>
		 	<s:else>
		 	   <p>打款还未开始，尽情期待！</p>
		 	</s:else>
	    </c:forEach>
    	</s:if>
    	<s:else>
    	 您当前还未申请项目投资！<br/>
    	 点击<a href="<s:url value="/mobile"/>"> 查看项目</a> 是否有合适的项目适合您
    	</s:else>
	</div>
	
	
    <div class="container" style="margin-top: 20px;">
    	 <div class="my_title_bar">
        	<div>历史打款信息</div>
        	<div class="msg_count">${fn:length(historyPayLists)}</div>
        	<div class="clear"></div>
        </div>
        <div class="clear"></div>
    	<c:forEach items="${historyPayLists }" var="financingDtl">
			<table class="deposit_table" border="1" style="border-color: #ccc;">
				<tr>
					<th class="td_title" colspan="2">${financingDtl.simpName }</th>
				</tr>
				<tr>
					<td class="td_left">实投金额：</td>
					<td class="td_right">${financingDtl.reallyAmt}</td>
				</tr>
				<tr>
					<td class="td_left">投资时间：</td>
					<td class="td_right"><fmt:formatDate value="${financingDtl.investTime}" type="both" /></td>
				</tr>
			</table>
    	</c:forEach>
    	<c:if test="${empty historyPayLists}">
    		<div class="empty_tip">暂时没有历史打款信息</div>
    	</c:if>
	</div>
 </body>
</html>