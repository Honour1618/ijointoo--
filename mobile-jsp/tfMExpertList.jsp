<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>创业导师项目列表</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfMSupporterList.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfMExpertList.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		
		var webroot = "${ctx}";
		var isLogin = "${login}";
		var sort = "${sort}";
		var industry = "${investMemInfo.userRang}";
		var proRole = "${investMemInfo.proRole}";
	</script>
</head>
    <body>
		<!-- user上部分 -->
    	<div class="topNav">
    		<a class="fan" href="${ctx}/PtlTf!rccIndex.action?eqType=mb"></a>
    		创业导师列表
    		<p class="choose" onclick="choose();">筛选</p>
    	</div>
    	
    	<div class="prjShow mt54">
	    	<!-- 列表内容 -->
	    	<c:forEach var="investor" items="${investorList}" varStatus="status">
				<a class="bidding_con invest_list_con" href="${ctx}/PtlTf!investMemHome.action?eqType=mb&investMemInfo.userId=${investor.userId}">
					<div class="business_man invester">
						<img src="${ctx}/${investor.userLogo}" class="user_mission"/>
						<div class="invester_r">
							<span>${investor.userName }</span>
							<img class="level" src="${ctx}/file/h5/weixin/images/level${investor.recommLevel}.png" />
							<p>${investor.proRoleStr}</p>
						</div>
					</div>
					<p class="target_title invest_title">企业名称：<span>${investor.compName }</span></p>
					<p class="target_tag invest_tag">关注领域：<span>${investor.userRangStr }</span></p>
					<div class="bidding_follow invest_follow">
						<ul>
							<li>
								<img src="${ctx}/file/h5/weixin/images/investOne.png" />
								<span>综合排名：<b>${investor.sumRank }</b></span>
							</li>
							<li>
								<img src="${ctx}/file/h5/weixin/images/investTwo.png" />
								<span>成功项目：<b>${investor.succNum}</b></span>
							</li>
							<li class="ping">
								<img src="${ctx}/file/h5/weixin/images/investThree.png" />
								<span>好评率：<b>${investor.posPercent }%</b></span>
							</li>
						</ul>
					</div>
				 </a>
			 </c:forEach>
		</div>
		<div class="common_mask"></div>
	   	<div class="more_btn" id="load_more_btn" page-num="${pageInfo.total}" onClick="loadMoreInvo(this);">查看更多</div>
	   	<div class="loadingPic"></div>
		  
		<!-- 筛选 -->	
		<div class="classify">
			<div class="classifyCon">
				<p class="classifyOne classifyCur">所属行业</p>
				<p class="classifyTwo">排序</p>
				<p class="classifyThree">平台职业</p>
			</div>
			<ul class="one">
				<li><a class="choose0" href="${ctx}/PtlTf!investorList.action?eqType=mb&pageInfo.currentPage=1&pageInfo.pageSize=5&investMemInfo.userRang=">所有行业</a></li>
				<c:forEach var="industry" items="${indList }" varStatus="status">
					<li><a class="one${industry.fieldVal}" href="${ctx}/PtlTf!investorList.action?eqType=mb&pageInfo.currentPage=1&pageInfo.pageSize=5&investMemInfo.userRang=${industry.fieldVal}">${industry.fieldValChNm }</a></li>
					<script>
						var fieldVal = "${prjS.fieldVal}";
						var chooseCom = "one"+fieldVal;
						var line = "${ctx}/PtlTf!investorList.action?eqType=mb&pageInfo.currentPage=1&pageInfo.pageSize=5&investMemInfo.userRang=${industry.fieldVal}";
						var lineCom = line + "&sort=${sort}"+"&investMemInfo.proRole=${investMemInfo.proRole}";
						$("."+chooseCom).attr("href",lineCom);
					</script>
				</c:forEach>
			</ul>
			<ul class="two">
				<c:forEach var="rank" items="${invSList }" varStatus="status">
					<li><a class="two${rank.fieldVal}" href="${ctx}/PtlTf!investorList.action?eqType=mb&pageInfo.currentPage=1&pageInfo.pageSize=5&sort=${rank.fieldVal}">${rank.fieldValChNm }</a></li>
					<script>
						var fieldVal = "${rank.fieldVal}";
						var chooseCom = "two"+fieldVal;
						var line = "${ctx}/PtlTf!investorList.action?eqType=mb&pageInfo.currentPage=1&pageInfo.pageSize=5&sort=${rank.fieldVal}";
						var lineCom = line + "&investMemInfo.userRang=${investMemInfo.userRang}"+"&investMemInfo.proRole=${investMemInfo.proRole}";
						$("."+chooseCom).attr("href",lineCom);
					</script>
				</c:forEach>
			</ul>
			<ul class="three">
				<c:forEach var="proR" items="${proRList }" varStatus="status">
					<li><a class="three${proR.fieldVal}" href="${ctx}/PtlTf!investorList.action?eqType=mb&pageInfo.currentPage=1&pageInfo.pageSize=5&investMemInfo.proRole=${proR.fieldVal}">${proR.fieldValChNm }</a></li>
					<script>
						var fieldVal = "${proR.fieldVal}";
						var chooseCom = "three"+fieldVal;
						var line = "${ctx}/PtlTf!investorList.action?eqType=mb&pageInfo.currentPage=1&pageInfo.pageSize=5&investMemInfo.proRole=${proR.fieldVal}";
						var lineCom = line + "&investMemInfo.userRang=${investMemInfo.userRang}"+"&sort=${sort}";
						$("."+chooseCom).attr("href",lineCom);
					</script>
				</c:forEach>
			</ul>
		</div>
		<div id="share_mask"></div>
    </body>
</html>