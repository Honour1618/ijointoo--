<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱助创投资人</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfMBusiness.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfMSupporter.js"></script>
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
        <div class="header--title">爱助创</div>
        <button class="logout__btn"><img src="${ctx}/file/h5/weixin/images/logout.png" alt="退出"></button>
    </header>
    	<!-- user上部分 -->
<%--     	<div class="topNav">
    		<a class="fan" href="${ctx}/PtlTf!rccIndex.action?eqType=mb"></a>
    		爱助创
    	</div> --%>
    	<!-- 没有助创时 -->
    	<c:if test="${hasSupt == 0}">
			<div class="noneTask">
				<img src="${ctx}/file/h5/weixin/images/cowLogo.png" />
				<p>目前还没有助创的项目<br/>快去助创吧！</p>
				<a class="extra_info" href="${ctx}/PtlTf!prjList.action?eqType=mb&sort=0&sts=0&pageInfo.pageSize=5&pageInfo.currentPage=1">去助创</a>
			</div>
		</c:if>
    	
    	<c:if test="${hasSupt == 1}">
	    	<!-- 有项目时 -->
	    	<div class="user support">
				<div class="userCon">
					<div class="userImg">
						<img src="${ctx }/${userLogo}" >
					</div>
					<h2>${userName }</h2>
					<p class="success_mon">成功获益</p>
					<p class="success_data">${benefit }元</p>
					<ul class="success_back">
						<li>累计助创：${suptAmtSum}元</li>
						<li>累计回馈：${rtnAmtSum}元</li>
						<li>助创项目：${suptPrjSum}个</li>
						<li>回馈项目：${rtnPrjSum}个</li>
					</ul>
				</div>
	    	</div>
	    	
	    	<div class="expert">
	    		<div class="expertTask expertCur">
	    			<span>成功助创</span>
	    		</div>
	    		<div class="expertBid">
	    			<span>成功回馈</span>
	    		</div>
	    	</div>
	    	
	    	<div class="agreeShow">
		    	<!-- 我的任务 -->
		    	<c:if test="${not empty suptList}">
			    	<div class="status_agree_con">
		   				<div id="status_agree_con">
					    	<c:forEach var="supt" items="${suptList}" varStatus="status">
						    	<a class="expert_con" href="${ctx}/pay/PtlTf!prj.action?eqType=mb&prjCode=${supt.ppCode}">
						    		<div class="business_man support_man">
										<img src="${ctx}/${supt.userLogo}" class="user_mission"/>
										<span>${supt.userName }</span>
										<span class="crtTime crtTime${supt.ppCode}"><%-- ${supt.crtTime} --%></span>
									</div>
									<p class="business_title">${supt.prjName}</p>
									<div class="expert_res support_res">
										<span class="target_mon"><b>${supt.suptAmt}元</b><br/>打赏金额</span>
										<span class="time_exp"><b>${supt.rtnMulNum}%</b><br/>回报率</span>
									</div>
						    	</a>
						    	<script type="text/javascript">
									var idtmp = '${supt.ppCode}';
									var crtTime = "${supt.crtTime}";
									var onlyBidDay= crtTime.substring(0,10);
									var timeBid = 'crtTime'+idtmp;
									$("."+timeBid).html(onlyBidDay);
								</script>
					    	</c:forEach>
				    	</div>
				    	<div class="more_btn" id="load_more_agree" page-num="${pageInfo.total}" onClick="loadMoreAgreeVote(this)">查看更多</div>
		    		</div>
	    		</c:if>
	    	</div>
	    	
	    	<div class="backShow">
	    	<!-- 没有竞标时 -->
		    	<c:if test="${empty rtnList}">
			    	<div class="noneBid">
						<img src="${ctx}/file/h5/weixin/images/cowLogo.png" />
						<p>你目前没有成功回馈的项目<br/>继续加油哦！</p>
						<a class="extra_info" href="${ctx}/PtlTf!prjList.action?eqType=mb&sort=0&sts=0&pageInfo.pageSize=5&pageInfo.currentPage=1">助创更多项目</a>
					</div>
				</c:if>
		    	
		    	<!-- 我的竞标 -->
		    	<c:if test="${not empty rtnList}">
				    	<div class="status_back_con">
			   				<div id="status_back_con">
						    	<c:forEach var="rnt" items="${rtnList}" varStatus="status">
							    	<a class="expert_bid" href="${ctx}/pay/PtlTf!prj.action?eqType=mb&prjCode=${rnt.ppCode}">
							    		<div class="business_man support_man">
											<img src="${ctx}/${rnt.userLogo}" class="user_mission"/>
											<span>${rnt.userName }</span>
											<span class="crtTime crtRntTime${rnt.ppCode}"><%-- ${rnt.prjName} --%></span>
										</div>
										<p class="business_title">${rnt.prjName}</p>
										<div class="expert_res expert_bid_res support_res">
											<span class="target_mon"><b>${rnt.suptAmt}元</b><br/>回报金额</span>
											<span class="target_bid"><b>${rnt.rtnMulNum}%</b><br/>回报率</span>
											<span class="target_sup"><b>${rnt.rtnTime}天</b><br/>回报周期</span>
										</div>
							    	</a>
							    	<script type="text/javascript">
										var idtmp = '${rnt.ppCode}';
										var crtTime = "${rnt.crtTime}";
										var onlyBidDay= crtTime.substring(0,10);
										var timeBid = 'crtRntTime'+idtmp;
										$("."+timeBid).html(onlyBidDay);
										
										var rtnTime = "${rnt.rtnTime}";
										var crtTime = "${rnt.crtTime}";
										var rtnTimeS = (new Date(rtnTime.replace(/-/g, "/"))).getTime();
										var crtTimeS = (new Date(crtTime.replace(/-/g, "/"))).getTime();
										var diffs = Math.floor((rtnTimeS-crtTimeS)/(24*3600*1000));
										$(".target_sup b").html(diffs+'天')
									</script>
							   	</c:forEach>
				   			</div>
				   		<div class="more_btn" id="load_more_back" page-num="${pageInfo.total}" onClick="loadMoreBackVote(this)">查看更多</div>
			   		</div>
			   	</c:if>
		   	</div>
	   	</c:if>
	   	<div class="common_mask"></div>
	   	<div class="loadingPic"></div>
	   		   	    <footer>
        <div class="toggleUser__box">
            <span class="toggleUser--toggle">切换身份</span>
            <span class="toggleUser--ds toggleUser--next fr" id="dsCenter"><img src="${ctx}/file/h5/weixin/images/nextBtn_03.png" alt="next"></span>
            <span class="toggleUser--ds fr toggleUser__ds">我是微天使</span>
        </div>
    </footer>
	   	
  	    <div class="alertDS alert__exit" id="alertExit">
        <span></span>
        <div class="btn__box clearfix">
            <input type="button" class="btn fl btn--active" value="退出" id="exitBtn">
            <input type="button" class="btn fr btn--warning  btn-close" value="取消">
        </div>
    	</div>
    	

    </body>
</html>