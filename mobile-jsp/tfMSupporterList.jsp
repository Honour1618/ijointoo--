<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱助创-项目列表</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfMSupporterList.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfMSupporterList.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		
		var webroot = "${ctx}";
		var isLogin = "${login}";
		var sts = "${sts}";
		var industry = "${tfPrjInfo.industry}";
		var sort = "${sort}";
	</script>
</head>
    <body>
		<!-- user上部分 -->
    	<div class="topNav">
    		<a class="fan" href="${ctx}/PtlTf!rccIndex.action?eqType=mb"></a>
    		项目列表
    		<p class="choose" onclick="choose();">筛选</p>
    	</div>
    	
    	<div class="prjShow">
    		<!-- 列表状态 -->
	    	<div class="support_status">
	    		<div class="support_start">
	    			<a href="${ctx}/PtlTf!prjList.action?eqType=mb&sts=1&pageInfo.pageSize=5&pageInfo.currentPage=1&tfPrjInfo.industry=${tfPrjInfo.industry}&sort=${sort}" class="<c:if test="${sts == '1' }"> supportCur </c:if>">寻求助创</a>
	    		</div>
	    		<div class="support_ing">
	    			<a href="${ctx}/PtlTf!prjList.action?eqType=mb&sts=2&pageInfo.pageSize=5&pageInfo.currentPage=1&tfPrjInfo.industry=${tfPrjInfo.industry}&sort=${sort}" class="<c:if test="${sts == '2' }"> supportCur </c:if>">竞标中</a>
	    		</div>
	    		<div class="support_all">
	    			<a href="${ctx}/PtlTf!prjList.action?eqType=mb&sts=0&pageInfo.pageSize=5&pageInfo.currentPage=1&tfPrjInfo.industry=${tfPrjInfo.industry}&sort=${sort}" class="<c:if test="${sts == '0' }"> supportCur </c:if>">所有项目</a>
	    		</div>
	    	</div>
	    	
	    	<!-- 列表内容 -->
	    	<div id="prjShow" class="showPrjStatus">
		    	<c:forEach var="prj" items="${prjList}" varStatus="status">
			    	<a class="bidding_con" href="${ctx }/pay/PtlTf!prj.action?eqType=mb&prjCode=${prj.prePrjCode }&uid=${sessionScope.voteuid}">
						<div class="business_man">
							<img src="${ctx}/${prj.userLogo}" class="user_mission"/>
							<span>${prj.userName }</span>
							<span class="crtTime crtTime${prj.prePrjCode }">${prj.crtTime }</span>
						</div>
						<p class="target_title">${prj.prjName }</p>
						<p class="target_tag">${prj.industryStr} | ${prj.finStageStr}</p>
						<p class="target_info">${prj.prjDesc }</p>
						<ul class="bidding_tag_con">
							<c:forEach var="show" items="${prj.prjTag }">
								<c:if test="${not empty show }">
									<li class="bidding_tag">${show }</li>
								</c:if>
							</c:forEach>
						</ul>
						<c:if test="${prj.prjStep == 2 || prj.prjStep == 4 }">
							<i class="bidding_score gray_bg">${prj.flowStsStr}</i>
						</c:if>
						<c:if test="${prj.prjStep != 2 && prj.prjStep != 4 }">
							<i class="bidding_score pink_bg">${prj.flowStsStr}</i>
						</c:if>
						<div class="bidding_follow">
							<ul>
								<li class="targetMon">
									<img src="${ctx}/file/h5/weixin/images/bidding_realAmt.png" />
									<span>筹资：${prj.targAmtStr }元</span>
								</li>
								<li class="realMon">
									<img src="${ctx}/file/h5/weixin/images/bidding_targAmt.png" />
									<span>已筹：${prj.realAmtStr }元</span>
								</li>
								<li class="agreeNum">
									<img src="${ctx}/file/h5/weixin/images/bidding_paramInt1.png" />
									<span>助创：${prj.giveNum}人</span>
								</li>
							</ul>
						</div>
					 </a>
					 <script type="text/javascript">
						var idtmp = '${prj.prePrjCode}';
						var crtTime = "${prj.crtTime}";
						var onlyBidDay= crtTime.substring(0,10);
						var timeBid = 'crtTime'+idtmp;
						$("."+timeBid).html(onlyBidDay);
					</script>
				 </c:forEach>
			 </div>
			 <div class="more_btn" id="load_more_btn" page-num="${pageInfo.total}" onClick="loadMoreSup(this)">查看更多</div>
		</div>
		<div class="common_mask"></div>
	   	<div class="loadingPic"></div>
	   	
	   	<!-- 筛选 -->
		<div class="classify">
			<div class="classifyCon">
				<p class="classifyOne classifyCur">所属行业</p>
				<p class="classifyTwo">排序</p>
			</div>
			<ul class="one">
				<li><a class="choose0" href="${ctx}/PtlTf!prjList.action?eqType=mb&sts=1&pageInfo.pageSize=5&pageInfo.currentPage=1&tfPrjInfo.industry=">所有行业</a></li>
				<c:forEach var="industry" items="${indList }" varStatus="status">
					<li><a class="choose${industry.fieldVal}" href="${ctx}/PtlTf!prjList.action?eqType=mb&sts=1&pageInfo.pageSize=5&pageInfo.currentPage=1&tfPrjInfo.industry=${industry.fieldVal}">${industry.fieldValChNm }</a></li>
					<script>
						var fieldVal = "${industry.fieldVal}";
						var chooseCom = "choose"+fieldVal;
						var line = "${ctx}/PtlTf!prjList.action?eqType=mb&pageInfo.pageSize=5&pageInfo.currentPage=1&tfPrjInfo.industry=${industry.fieldVal}";
						var lineCom = line + "&sts=${sts}"+"&sort=${sort}";
						$("."+chooseCom).attr("href",lineCom);
					</script>
				</c:forEach>
			</ul>
			<ul class="two">
				<c:forEach var="prjS" items="${prjSList }" varStatus="status">
					<li><a class="two${prjS.fieldVal}" href="${ctx}/PtlTf!prjList.action?eqType=mb&sort=${prjS.fieldVal}&pageInfo.pageSize=5&pageInfo.currentPage=1">${prjS.fieldValChNm }</a></li>
					<script>
						var fieldVal = "${prjS.fieldVal}";
						var chooseCom = "two"+fieldVal;
						var line = "${ctx}/PtlTf!prjList.action?sort=${prjS.fieldVal}&pageInfo.pageSize=5&pageInfo.currentPage=1";
						var lineCom = line + "&sts=${sts}"+"&tfPrjInfo.industry=${tfPrjInfo.industry}";
						$("."+chooseCom).attr("href",lineCom);
					</script>
				</c:forEach>
			</ul>
		</div>
		<div id="share_mask"></div>
    </body>
</html>