<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>创业导师详情</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfMExpertDtl.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="<s:url value="/js/sha1.js"/> "></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script> 
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfMExpertDtl.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		var webroot = '${ctx}';
		var sumScore = '${investMemInfo.sumScore }';
		var userId = '${investMemInfo.userId}';
		//wechat share start
		var shareAppId = '${jsapi.appId}';
		var commUrl = '${commUrl}';
		var shareTitle = '${shareTitle}';
		var shareImg = '${shareImg}';
		var shareDesc = '${shareDesc}' ;
		var shareTicket = '${jsapi.jsapi_ticket}';
		var shareNonceStr = '${jsapi.nonceStr}';
		var shareTimestamp = '${jsapi.timestamp}';
		var isFocus = '${isFocus}';
	</script>
</head>
    <body>
		<!-- user上部分 -->
    	<div class="topNav">
    		<a class="fan" href="${ctx}/PtlTf!investorList.action?eqType=mb&sort=0&pageInfo.currentPage=1&pageInfo.pageSize=5"></a>
    		导师详情
    		<img src="${ctx}/file/tf/projectDes/img/prjShare.png"  class="prjShare"/>
    	</div>
    	<!-- user上部分 -->
    	<c:if test="${not empty investMemInfo.photo}">
    		<div class="teach_user">
    			<img src="${ctx }/${investMemInfo.photo}" class="teach_featherImg" />
				<div class="teach_con">
					<h2>${investMemInfo.userName}<img class="level" src="${ctx}/file/h5/weixin/images/level${investMemInfo.recommLevel}.png" /></h2>
					<p>${investMemInfo.compName} | ${investMemInfo.position} </p>
				</div>
	    	</div>
    	</c:if>
    	<c:if test="${empty investMemInfo.photo}">
	    	<div class="teach_user">
	    		<img src="${ctx}/file/h5/weixin/images/tfUserBg.jpg" class="teach_featherImg" />
				<div class="teach_con">
					<div class="userImg">
						<img src="${ctx }/${investMemInfo.userLogo}" >
					</div>
					<h2>${investMemInfo.userName }<img class="level" src="${ctx}/file/h5/weixin/images/level${investMemInfo.recommLevel}.png" /></h2>
					<p>${investMemInfo.compName} | ${investMemInfo.position}</p>
				</div>
	    	</div>
    	</c:if>
		
		<!-- 详情描述 -->
		<ul class="mission_con">
			<c:if test="${not empty investMemInfo.areaRang }">
				<li>
					<label>所在区域：</label>
					<p>${investMemInfo.areaRang }</p>
				</li>
			</c:if>
			<c:if test="${not empty investMemInfo.invstStagesStr }">
				<li>
					<label>投资阶段：</label>
					<p>${investMemInfo.invstStagesStr }</p>
				</li>
			</c:if>
			<c:if test="${not empty investMemInfo.userRangStr }">
				<li>
					<label>关注领域：</label>
					<p>${investMemInfo.userRangStr}</p>
				</li>
			</c:if>
			<c:if test="${not empty investMemInfo.investIdea }">
				<li>
					<label>投资理念：</label>
					<p>${investMemInfo.investIdea}</p>
				</li>
			</c:if>
		</ul>
		
		<div class="totalScore">
			<span>综合评分</span>
			<em id="progress_main" class="bar" >
				<i></i>
			</em>
			<b>${investMemInfo.sumScore }</b>
		</div>
		
		<!-- 创业导师小导航 -->
		<ul class="enterprise_nav">
			<li class="person_career current">个人履历</li>
			<li class="success_item">成功辅导项目</li>
			<li class="comment">评论</li>
		</ul>
		<!-- 个人履历 -->
		<div class="career_con">
			<div class="career_experience">
				<img src="${ctx}/file/h5/weixin/images/choose.png" class="ico_img" /> 履历
				<pre>${investMemInfo.userDesc}</pre>
			</div>
			<div class="career_item">
				<img src="${ctx}/file/h5/weixin/images/choose.png" class="ico_img ml12" /> 投资案例
				<ul class="case">
					<c:forEach var="memFeature" items="${memFeatures}">
						<li>
							<img src="${ctx}/${memFeature.featureImgUrl }" />
							<h3>${memFeature.featureTitle }</h3>
							<pre class="lineTwo">${memFeature.featureDesc }</pre>
							<b>展开</b>
						</li>
					</c:forEach>
				</ul>
				<div class="more_btn" id="load_more_item" page-num="${caseTotalNum}" onClick="loadMoreItem(this);">查看更多</div>
			</div>
		</div>
		<!-- 成功辅导项目 -->
		<c:if test="${not empty rspBids }">
			<div class="item_all">
				<div id="item_con">
					<c:forEach var="rspBid" items="${rspBids }">
						<div class="item_con">
							<a class="business_con" href="${ctx}/pay/PtlTf!prj.action?prjCode=${rspBid.prePrjCode }&uid=${rspBid.userId }">
					    		<div class="business_man">
									<img src="${ctx}/${rspBid.userLogo}" class="user_mission"/>
									<span>${rspBid.relUserName }</span>
									<span class="crtTime crtTime${rspBid.prePrjCode }">${rspBid.CTime }</span>
								</div>
								<p class="business_title">${rspBid.prjName }</p>
								<pre>${rspBid.prjDesc }</pre>
								<i class="scoreNum">${rspBid.IScore}分</i>
					    	</a>
						</div>
						<script type="text/javascript">
							/* var idtmp = '${rspBid.prePrjCode}';
							var crtTime = "${rspBid.CTime}";
							var onlyBidDay=new Date(crtTime).Format("yyyy-MM-dd");
							var timeBid = 'crtTime'+idtmp;
							$("."+timeBid).html(onlyBidDay); */
							var crtTime = "${rspBid.CTime}";
							var idtmp = '${rspBid.prePrjCode}';
							var timeBid = 'crtTime'+idtmp;
							var onlyTime = crtTime.substring(0,10);
							$("."+timeBid).html(onlyTime);
						</script>
					</c:forEach>
				</div>
				<div class="more_btn" id="load_success_item" page-num="${rspBidPrjsNum}" onClick="loadMoreSuccess(this)">查看更多</div>
			</div>
		</c:if>
		<div class="common_mask"></div>
	   	<div class="loadingPic"></div>
	   	
	   	<!-- 分享引导 -->
		<div id="share_mask"><img alt="" src="${ctx}/file/tf/fintest/img/share_arrow.png" width="218"/></div>
		
		<!-- 页面警告框 -->
		<div class="alertShow">
			<span></span>
		</div>
		
		<!-- 关注 -->
		<div class="point_focus">
			<c:if test="${isFocus ==1}" >
				<div class="prepare_focus" onclick="goodDataAjax()">
					<img src="${ctx}/file/h5/weixin/images/focus_will.png" />
					<span class="za zaRed">关注 </span>
				</div>
			</c:if>
			<c:if test="${isFocus ==0}" >
				<div class="already_focus">
					<img src="${ctx}/file/h5/weixin/images/focused.png" />
					<span class="za" id="zaShowMask">已关注</span>
				</div>
			</c:if>
			<div class="ping">
				<img src="${ctx}/file/h5/weixin/images/pinglun.png" />
				<span class="pinglun" onclick="repay()">评论</span>
			</div>
		</div>
		
		<!-- 评论 -->
		<div class="repay">
			<p>评论</p>
			<textarea class="desc" id="desc_comment" placeholder="说点什么吧~"></textarea>
			<div class="rwdBtn">
				<input type="button" class="reward_btn" id="reward_btn" value="提交" onclick="javascript:proVoteData()"/>
			</div>
			<img src="${ctx}/file/tf/projectDes/img/close.png" class="close" />
		</div>
		<!-- 评论 -->
		
		<!-- 回复-->
		<div class="answer">
			<p>回复</p>
			<textarea class="desc" id="desc_reply" placeholder="说点什么吧~"></textarea>
			<div class="rwdBtn">
				<input type="button" class="reward_btn" value="提交" id="reply_submit"/>
			</div>
			<img src="${ctx}/file/tf/projectDes/img/close.png" class="close" />
		</div>
		
		<!-- 项目评论 -->
		<div class="discuss">
    		<p class="sum">评论 <span id="comment_total">(${total })</span></p>
    		<div id="conculme">
		    	
			</div>
			<div class="more_btn" id="load_more_btn" page-num="2" onClick="loadMoreVote(this)">点击查看更多评论</div>
					<!-- 查询更多评论ajax PtlPrjPool!queryReplyAjax?prePrjCode=投前项目编号&pageNo=页码2开始-->
			<div class="loadingPic"></div>
    	</div>
    </body>
</html>