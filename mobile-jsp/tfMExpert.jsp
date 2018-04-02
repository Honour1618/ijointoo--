<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>创业导师中心</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/base.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfMBusiness.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfTeacherStatus.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="<s:url value="/js/sha1.js"/> "></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfMExpert.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		var webroot = "${ctx}";
		var isLogin = "${login}";
		var userId = "${investMemInfo.userId}";
		//wechat share start
		var shareAppId = "${jsapi.appId}";
		var commUrl = "${commUrl}";
		var shareTitle = "${shareTitle}";
		var shareImg = "${shareImg}";
		var shareDesc = '${shareDesc}';
		var shareTicket = "${jsapi.jsapi_ticket}";
		var shareNonceStr = "${jsapi.nonceStr}";
		var shareTimestamp = "${jsapi.timestamp}";
	</script>
</head>
    <body class="body_bg_white">
    	<c:if test="${investSts != 1}">
			  <div class="page__status">
    	  	    <!--头部-->
    <header class="clearfix">
        <button class="back__btn" id="backBtn"><img src="${ctx}/file/h5/weixin/images/back-btn.png" alt="返回"></button>
        <div class="header--title">创业导师中心</div>
        <button class="logout__btn"><img src="${ctx}/file/h5/weixin/images/logout.png" alt="退出"></button>
    </header>
    <container>
        <div class="status__Box">
            <!--认证失败-->
            <c:if test="${investSts eq '9'}">
            <div id="rzFail--status" class="status__box">
                <img src="${ctx}/file/h5/weixin/images/niuBg.png" alt="小牛">
                <p>很抱歉，你的导师认证没有通过审核，请按要求修改认证信息再次提交吧！</p>
                <button class="btn btn--status btn__go">重新认证</button>
            </div>
            </c:if>
            <!--完善信息-->
            <c:if test="${investSts eq '4' }">
            <div id="wsMessage--status" class="status__box">
                <img src="${ctx}/file/h5/weixin/images/niuBg.png" alt="小牛">
                <p>认证正在审核中，目前你提交的信息较少补充信息能提高通过概率哦！</p>
                <button class="btn btn--status btn__go">完善信息</button>
            </div>
            </c:if>
            <!--未认证-->
            <c:if test="${investSts eq '0'}">
            <div id="noRz--status" class="status__box">
                <img src="${ctx}/file/h5/weixin/images/niuBg.png" alt="小牛">
                <p>你还没有认证成为创业导师，现在就去认证吧！</p>
                <button class="btn btn--status btn__go">身份认证</button>
            </div>
            </c:if>
            <!--重新认证-->
            <c:if test="${investSts eq '2' }">
            <div id="reRz--status" class="status__box">
                <img src="${ctx}/file/h5/weixin/images/niuBg.png" alt="小牛">
                <p>亲，你的认证申请正在审核中，如果觉得信息需要丰富，可以点下方按钮进行操作！</p>
                <button class="btn btn--status btn__go">重新认证</button>
            </div>
            </c:if>
        </div>
    </container>
    <footer>
        <div class="toggleUser__box">
            <span class="toggleUser--toggle">切换身份</span>
            <span class="toggleUser--ds toggleUser--next fr" id="dsCenter"><img src="${ctx}/file/h5/weixin/images/nextBtn_03.png" alt="next"></span>
            <span class="toggleUser--ds fr toggleUser__ds">我是创业导师</span>
        </div>
    </footer>
    <!--弹窗-->
    <div class="common_mask"></div>
    <!-- 查看进度 -->
    <div class="alertDS" id="alertJd">
        <span></span>
        <div class="btn__box clearfix">
            <input type="button" class="btn fl btn--warning" value="查看进度">
            <input type="button" class="btn fr btn--active btn-close" value="取消">
        </div>
    </div>
    			<!-- 固定条 -->
			<div class="fixed_bar">
				<div class="fixed_logo"></div>
				<div class="fixed_con">
					<p>爱就投</p>
					<span>因为爱，所以投</span>
				</div>
				<div class="load">
					<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">立即下载</a>
					<i></i>
				</div>
			</div>
			<!-- 固定条结束 -->
    <!-- 导师认证 -->
        <div class="alertDS" id="alertRz">
        <span></span>
        <div class="btn__box clearfix">
            <input type="button" class="btn fl btn--warning" value="导师认证">
            <input type="button" class="btn fr btn--active btn-close" value="取消">
        </div>
    </div>
    <!-- 退出 -->
         <div class="alertDS alert__exit" id="alertExit">
        <span></span>
        <div class="btn__box clearfix">
            <input type="button" class="btn fl btn--active" id="exitBtn" value="退出">
            <input type="button" class="btn fr btn--warning btn-close" value="取消">
        </div>
    </div>
    </div>	
  
			
		</c:if>
		<c:if test="${investSts == 1}">
	    	<div class="creat_center">
		    	<!-- user上部分 -->
		    	<div class="topNav">
		    		<a class="fan" href="${ctx}/PtlTf!rccIndex.action?eqType=mb"></a>
		    		创业导师中心
		    		<img src="${ctx}/file/tf/projectDes/img/prjShare.png"  class="prjShare"/>
		    	</div>
		    	<!-- 导师信息 -->
		    	<c:if test="${not empty investMemInfo.photo}">
		    		<div class="teach_user">
		    			<img src="${ctx }/${investMemInfo.userLogo}" class="teach_featherImg" />
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
							<h2>${investMemInfo.userName}<img class="level" src="${ctx}/file/h5/weixin/images/level${investMemInfo.recommLevel}.png" /></h2>
							<p>${investMemInfo.compName} | ${investMemInfo.position} </p>
						</div>
			    	</div>
		    	</c:if>
		    	<!-- 任务与竞标 -->
		    	<div class="expert creat_nav">
		    		<div class="expertTask">
		    			<b>${taskTotal }</b>
		    			<span>我的任务</span>
		    		</div>
		    		<div class="expertBid">
		    			<b>${bidTotal }</b>
		    			<span>我的竞标</span>
		    		</div>
		    	</div>
		    	<ul class="creat_detail">
		    		<li class="basic_info">
		    			基本信息
		    			<img src="${ctx}/file/h5/weixin/images/xia.png" />
		    		</li>
		    		<li class="person_info">
		    			个人履历
		    			<img src="${ctx}/file/h5/weixin/images/xia.png" />
		    		</li>
		    		<li class="assist_info">
		    			辅导项目
		    			<img src="${ctx}/file/h5/weixin/images/xia.png" />
		    		</li>
		    	</ul>
	    	</div>
	    	<!-- 基本信息 -->
	    	<div class="basic_info_con">
	    		<div class="topNav">
		    		<a class="fan back"></a>
		    		基本信息
		    	</div>
		    	<ul>
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
	    	</div>

	    	<!-- 个人履历 -->
	    	<div class="person_info_con">
	    		<div class="topNav">
		    		<a class="fan back"></a>
		    		个人履历
		    	</div>
		    	<c:if test="${empty investMemInfo.userDesc && empty memFeatures}">
		    		<div class="noneTask">
						<img src="${ctx}/file/h5/weixin/images/cowLogo.png" />
						<p>你当前没有成功辅导的项目<br/>请在App中参与项目</p>
						<a class="extra_info" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">下载APP</a>
					</div>
				</c:if>
		    	<c:if test="${not empty investMemInfo.userDesc }">
					<div class="career_experience">
						<img src="${ctx}/file/h5/weixin/images/choose.png" class="ico_img" /> 履历
						<pre>${investMemInfo.userDesc}</pre>
					</div>
				</c:if>
				<c:if test="${not empty memFeatures}">
					<div class="career_item">
						<img src="${ctx}/file/h5/weixin/images/choose.png" class="ico_img ml12" /> 投资案例
						<ul class="case">
							<c:forEach var="memFeature" items="${memFeatures}">
								<li>
									<img src="${ctx}/${memFeature.featureImgUrl}" />
									<h3>${memFeature.featureTitle }</h3>
									<pre class="lineTwo">${memFeature.featureDesc }</pre>
									<b>展开</b>
								</li>
							</c:forEach>
						</ul>
						<div class="more_btn" id="load_more_item" page-num="${caseTotalNum}" onClick="loadMoreItem(this)">查看更多</div>
					</div>
				</c:if>
		   	</div>
		   	
	    	<!-- 辅导项目 -->
	    	<div class="assist_info_con">
	    		<div class="topNav">
		    		<a class="fan back"></a>
		    		辅导项目
		    	</div>
		    	<c:if test="${empty rspBids}">
		    		<div class="noneTask">
						<img src="${ctx}/file/h5/weixin/images/cowLogo.png" />
						<p>你当前没有成功辅导的项目<br/>请在App中参与项目</p>
						<a class="extra_info" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">下载APP</a>
					</div>
				</c:if>
				<c:if test="${not empty rspBids}">
			    	<div class="item_all">
						<div id="item_con">
					    	<c:forEach var="rspBid" items="${rspBids }">
								<a class="assit_con" href="pay/PtlTf!prj.action?prjCode=${rspBid.prePrjCode }&uid=${rspBid.userId }">
						    		<div class="assit_man">
										<img src="${ctx}/${rspBid.userLogo }" class="assit_pic"/>
										<span>${rspBid.relUserName }</span>
										<span class="crtTime crtTime${rspBid.prePrjCode }">${rspBid.CTime }</span>
									</div>
									<p class="assit_title">${rspBid.prjName }</p>
									<pre>${rspBid.prjDesc }</pre>
						    	</a>
						    	<script type="text/javascript">
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
	    	</div>
		    	
			<!-- 任务内容 -->
			<div class="expertTaskCon">
				<div class="topNav">
		    		<a class="fan back"></a>
		    		我的任务
		    	</div>
				<div class="taskShow">
			    	<!-- 没有任务时 -->
			    	<c:if test="${empty taskList}">
						<div class="noneTask">
							<img src="${ctx}/file/h5/weixin/images/cowLogo.png" />
							<p>你当前没有任务<br/>请在App中参与竞标，获取任务</p>
							<a class="extra_info" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">下载APP</a>
						</div>
					</c:if>
			    	
			    	<!-- 我的任务 -->
			    	<c:if test="${not empty taskList}">
			    		<div id="moreTask">
							<c:forEach var="list" items="${taskList}" varStatus="status">
						    	<a class="expert_con" href="PtlTf!taskDetail.action?eqType=mb&tfPrjInfo.prePrjCode=${list.prjBean.prePrjCode}&sts=${(list.rspBidBean.rspSts==35||list.rspBidBean.rspSts==36)?0:1}">
						    		<div class="business_man">
										<img src="${ctx}/${list.investMemBean.userLogo}" class="user_mission"/>
										<span>${list.investMemBean.userName }</span>
										<span class="crtTime crtTime${list.prjBean.prePrjCode}">${list.prjBean.crtTime}</span>
									</div>
									<p class="business_title">${list.prjBean.prjName}</p>
									<div class="expert_res">
										<span class="target_mon">任务佣金：<b>${list.prjBean.targAmtStr}元</b></span>
										<span class="time_exp">结束时间：
											<c:if test="${list.rspBidBean.rspSts != 32 && list.rspBidBean.rspSts != 38 && list.rspBidBean.rspSts != 39 && list.rspBidBean.rspSts != 32}">
												 <div class="target_time target_time${list.prjBean.prePrjCode}">
												 	<!-- 计时器 -->
												 	<div class="calculagraph gq_status" id="calculagraph${list.prjBean.prePrjCode}">
												 		<span class="day">00</span><span class="lang">天</span>
												 		<span class="hour">00</span><span class="lang">小时</span>
												 		<span class="minute">00</span><span class="lang">分</span>
												 		<span class="second">00</span><span class="lang">秒</span>
												 	</div>
												 </div>
											 </c:if>
											 <c:if test="${list.rspBidBean.rspSts == 32 || list.rspBidBean.rspSts == 38 || list.rspBidBean.rspSts == 39 || list.rspBidBean.rspSts == 32}">
											 	<div class="target_time target_time${list.prjBean.prePrjCode}"></div>
										 	 </c:if>
										</span>
									</div>
						    	</a>
						    	<script type="text/javascript">
									var expRspTime = "${list.rspBidBean.expRspTime}";
									var idtmp = '${list.prjBean.prePrjCode}';
									var exid = 'calculagraph'+idtmp;
									countDown(expRspTime,'#'+exid);
									//alert(expRspTime);
									var crtTime = "${list.prjBean.crtTime}";
									var onlyDay= crtTime.substring(0,10);
									var timeBm = 'crtTime'+idtmp
									$("."+timeBm).html(onlyDay);
									
									//实际交稿时间
									var rspTime = "${list.rspBidBean.rspTime}";
									/* var date = new Date(rspTime.replace(/-/g , "/"));
									var jsMidYear = date.getFullYear();
									var jsMidMonth = date.getMonth()+1;
									var jsMidDay = date.getDate(); */
									var jsMidYear = rspTime.substring(0,4);
									var jsMidMonth = rspTime.substring(5,7);
									var jsMidDay = rspTime.substring(8,10);
									
									//倒计时结束时间
									var jsTime = 'target_time'+idtmp;
									/* var dt = new Date(expRspTime.replace(/-/g, "/"));
									var jsYear = dt.getFullYear();
									var jsMonth = dt.getMonth()+1;
									var jsDay = dt.getDate();
									var timeShow = new Date(); */
									var timeShow = "${sysNowDate}";
									var jsYear = expRspTime.substring(0,4);
									var jsMonth = expRspTime.substring(5,7);
									var jsDay = expRspTime.substring(8,10);
									if(expRspTime > rspTime){
										$("."+jsTime).html('<div class="calculagraph">'
												+'<span class="day">'+jsMidYear+'</span><span class="lang">年</span>'
									 			+'<span class="hour">'+jsMidMonth+'</span><span class="lang">月</span>'
									 			+'<span class="minute">'+jsMidDay+'</span><span class="lang">日</span>'
									 		+'</div>');
									}else if(timeShow > expRspTime){
										$("."+jsTime).html('<div class="calculagraph">'
												+'<span class="day">'+jsYear+'</span><span class="lang">年</span>'
									 			+'<span class="hour">'+jsMonth+'</span><span class="lang">月</span>'
									 			+'<span class="minute">'+jsDay+'</span><span class="lang">日</span>'
									 		+'</div>');
										$(".gq_status").html("已过期");
									}
									
								</script>
				    		</c:forEach>
			    		</div>
			    		<div class="more_btn" id="load_more_task" page-num="${pageInfo.total}" onClick="loadMoreTask(this)">查看更多</div>
			    	</c:if>
		    	</div>
			</div>
			<!-- 竞标任务 -->
			<div class="expertBidCon">
				<div class="topNav">
		    		<a class="fan back"></a>
		    		我的竞标
		    	</div>
				<div class="bidShow">
			    	<!-- 没有竞标时 -->
			    	<c:if test="${empty bidList}">
				    	<div class="noneBid mt100">
							<img src="${ctx}/file/h5/weixin/images/cowLogo.png" />
							<p>你还没有认证为爱就投投资行家<br/>现在就去app认证吧！</p>
							<a class="extra_info" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">下载APP</a>
						</div>
					</c:if>
			    	
			    	<!-- 我的竞标 -->
			    	<c:if test="${not empty bidList}">
			    		<div id="moreBid">
							<c:forEach var="list" items="${bidList}" varStatus="status">
						    	<a class="expert_bid" href="${ctx }/pay/PtlTf!prj.action?eqType=mb&prjCode=${list.prjBean.prePrjCode}&uid=${investMem.userId}">
						    		<div class="business_man">
										<img src="${ctx}/${list.investMemBean.userLogo}" class="user_mission"/>
										<span>${list.investMemBean.userName }</span>
										<span class="crtTime crtTime${list.prjBean.prePrjCode}">${list.prjBean.crtTime}</span>
									</div>
									<p class="business_title">${list.prjBean.prjName}</p>
									<ul class="business_tag_con expert_bid_tag">
										<c:forEach items="${list.prjBean.prjTag }" var="show">
											<li class="business_tag">${show}</li>
										</c:forEach>
									</ul>
									<div class="expert_res expert_bid_res">
										<span class="target_mon">任务佣金：<b>${list.bidDtlBean.csAmtStr}元</b></span>
										<span class="target_bid">竞标：<b>${list.prjBean.bidNum}人</b></span>
										<span class="target_sup">助创：<b>${list.objFocusBean.paramInt1}人</b></span>
									</div>
						    	</a>
						    	<script type="text/javascript">
									var idtmp = '${list.prjBean.prePrjCode}';
									var crtTime = "${list.prjBean.crtTime}";
									var onlyBidDay=crtTime.substring(0,10);
									var timeBid = 'crtTime'+idtmp
									$("."+timeBid).html(onlyBidDay);
								</script>
					   		</c:forEach>
				   		</div>
					   	<div class="more_btn" id="load_more_btn" page-num="${pageInfo.total}" onClick="loadMoreBid(this)">查看更多</div>
				   	</c:if>
			   	</div>
			</div>
			<div class="common_mask"></div>
		   	<div class="loadingPic"></div>
		   	<!-- 分享引导 -->
			<div id="share_mask"><img alt="" src="${ctx}/file/tf/fintest/img/share_arrow.png" width="218"/></div>
	   	</c:if>
    </body>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfTeacherStatus.js"></script>
</html>