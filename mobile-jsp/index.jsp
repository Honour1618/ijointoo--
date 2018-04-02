<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投|让资本带着资源投向高成长企业|健康生活第一筹众平台</title>
    <meta name="description" content="爱就投，让资本带着资源，投向真的有梦想的企业，成就每个人的创富梦想！爱就投，让人类商业文明提前进入共产主义！精品项目，爱就投！"/>
	<meta name="keywords" content="爱就投，私募股权融资，众筹，筹众，股权融资，股权投资，原始股，原始股投资，移动交易平台"/>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" href="${ctx}/file/commonCss/dialog_default.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/index.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" asyncdata-requirecontext="_" data-requiremodule="artDialog" src="${ctx}/file/commonJs/artDialog.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/TouchSlide.1.1.js"></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/judge.js"></script>
    <script type="text/javascript" src="${ctx }/file/h5/weixin/js/index.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		
		var webroot = "${ctx}";
		var isLogin = "${login}";
		var userId = "${userId}";
		var selectFlg = "${selectFlg}";
	</script>
</head>
    <body>
    	<div class="indexInfo">
	    	<!-- 导航开始 -->
	    	<nav>
	    		<ul class="subNav">
	    			<li class="current"><a  href="PtlMobile!index.action">首页</a></li>
	    			<li><a href="PtlMobile!activityList.action">活动</a></li>
	    			<li><a href="PtlMobile!inforQry.action">资讯</a></li>
	    		</ul>
	    		<!-- <a href="PtlWeixin!showLogin.action?nextUrl=PtlMobile!index.action" class="used"></a> -->
	    	</nav>
			
			<!-- banner轮播开始 -->
			<div id="focus" class="focus">
				<div class="hd">
					<ul></ul>
				</div>
				<div class="bd">
					<ul>
						<c:forEach var="list" items="${banners}" varStatus="status">
							<li style="width:100%;">
								<a href="${list.marURL}" target="_blank"><img
									src="${ctx }${list.marketingURI}" alt="${list.marketingDesc}"/></a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- banner轮播结束 -->
	
			<!-- 数量展示 -->
			<div  id="demo">
				<ul class="num"  id="rolltxt">
					<li class="num_del">
						<span>项目总数： ${projectSize }<i></i></span>
						<span>会员总数： ${regeditNum }人<i></i></span>
					</li>
					<li class="num_del">
						<span>预约总额： ${appTotAmt }亿<i></i></span>
						<span>融资总额： ${finTotAmt }亿<i></i></span>
					</li>
				</ul>
			</div>
			
			<!-- 爱就投2.0入口 -->
			<div class="tfEnter">
				<img src="${ctx}/file/h5/weixin/images/tgEnter.jpg"/>
				<a href="${ctx}/PtlTf!rccIndex.action?eqType=mb">
					<img class="tfGo" src="${ctx}/file/h5/weixin/images/tfGo.png" />
					<img class="tfGoScen" src="${ctx}/file/h5/weixin/images/tfGoScen.png" />
				</a>
			</div>
			
			<!-- 热门助创 -->
			<div class="hotAgree">
				<div class="hotAgreeTop">
					<h2><i></i>热门助创</h2>
					<a class="easyMon" href="${ctx}/PtlTf!prjList.action?eqType=mb&sort=0&sts=1&pageInfo.pageSize=5&pageInfo.currentPage=1">
						<img src="${ctx}/file/h5/weixin/images/easyMon.png"/>
					</a>
				</div>
				<div class="hotAgreeCon">
					<c:forEach var="prj" items="${rccPList}" varStatus="status">
				    	<a class="bidding_con" href="pay/PtlTf!prj.action?prjCode=${prj.prePrjCode }">
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
									<li class="bidding_tag">${show }</li>
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
			</div>
			
			<!-- 项目展示开始 -->
			<div class="hotAgreeTop hotPrj">
				<h2><i></i>热门项目</h2>
				<a class="easyMon easyMorePrj" href="${ctx}/PtlWeixin!prjPubList.action">
					<img src="${ctx}/file/h5/weixin/images/xia.png"/>
				</a>
			</div>
			<div class="item">
				<c:forEach var="prj" items="${projects}" varStatus="prjStatus">
					<a class="itemCon" href="${ctx}/Mobile.action?appCode=test&method=wxPrj&prjCode=${prj.finCode}" data-num="${prj.finPercent}">
						<c:if test="${prj.sts eq 0}">
							<div class="process_start">
								<!-- <b></b> -->
								<!-- <i></i> -->
								<i>${prj.stsStr}</i>
							</div>
						</c:if>
						<c:if test="${prj.sts eq 1}">
							<div class="process_keeping">
								<!-- <b></b> -->
								<!-- <i></i> -->
								<i>${prj.stsStr}</i>
							</div>
						</c:if>
						<c:if test="${prj.sts eq 2}">
							<div class="process_end">
								<!-- <b></b> -->
								<!-- <i></i> -->
								<i>${prj.stsStr}</i>
							</div>
						</c:if>
						<h2>${prj.simpName}</h2>
						<div class="itemm">
							<div class="img">
								<img alt="" src="${ctx }${prj.finLogoUrl}" />
							</div>
							<div class="itemmr">
								<span><strong>¥${prj.followStartAmtStr}元</strong>起投</span>
								<div class="item_bar">
									<em id="progress_main">
										<i></i>
									</em>
									<strong>${prj.finPercent}%</strong>
								</div>
								<ul class="item_tag">
									<c:if test="${not empty prj.specList }">
										<c:forEach items="${prj.specList }" var="show">
											<li>${show}</li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="itembt">
							<ul class="itemb">
								<li>
									<img src="${ctx }/file/h5/weixin/images/item_icon1.png" />
									<span class="color_r">${prj.finAmtStr}元</span>
								</li>
								<li>
									<img src="${ctx }/file/h5/weixin/images/item_icon2.png" />
									<span>${prj.applyNum}人</span>
								</li>
								<li>
									<img src="${ctx }/file/h5/weixin/images/item_icon3.png" />
									<span><%-- ${prj.leftTimeStr}： --%>${prj.leftTime}</span>
								</li>			
							</ul>
						</div>				
					</a>
				</c:forEach>
			</div>
			<!-- 项目展示结束 -->
			
			<!-- 查看更多 -->
			<!-- <div class="more">
				<a href="PtlWeixin!prjPubList.action" class="button">查看更多</a>
			</div> -->
	
			<!-- 底部信息 -->
			<div class="footer">
				<ul class="procedure">
					<li><a href="javascript:;" id="suggestion">意见反馈</a></li>
					<li><a href="${ctx }/htmlview/platform/mobile/comAgree.jsp" class="normal">评审标准</a></li>
					<li><a href="${ctx }/htmlview/platform/mobile/investAnswer.jsp">投资答疑</a></li>
					<li><a href="${ctx }/htmlview/platform/mobile/about.jsp">关于爱就投</a></li>
				</ul>
				<div class="consult">
					<a class="official_app_load" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">
						官方APP下载
						<img src="${ctx}/file/h5/weixin/images/next.png">
					</a>
					<a class="hot" href="javascript:;">
						<img src="${ctx}/file/h5/weixin/images/service.png">
						客服热线咨询
					</a>
				</div>
				<ul class="hotwire">
					<li><a href="tel:18221956007">小丸子热线</a></li>
					<li><a href="tel:4006391229">官方资讯电话</a></li>
					<li><a href="tel:13917852676">合作洽谈专线</a></li>
					<li class="cancel">取消</li>
				</ul>
				<p>让资本带着资源，投向真的有梦想的高成长企业，成就每个人的创富梦想！
				</p>
			</div>
			<div class=xy></div>
				
	
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
		</div>
		
		<!-- 意见反馈弹出窗 -->
		<div class="about_msg" style="padding-bottom: 50px;display:none;">
			<!-- 顶部开始 -->
			<div id="top_wrap">
				<div class="top">
					意见反馈
					<a class="top_left" href="PtlMobile!index.action"></a>
				</div>
			</div>
			<!-- 顶部结束 -->
			
			<!-- 意见反馈开始 -->
			<div class="repay">
				<textarea rows="4" cols="50" id="content" placeholder="最多500字"></textarea>
				<c:if test="${login ne 1 }">
					<input name="" id="userName" value="" class="txt_input" placeholder="请输入姓名">
					<input name="" id="userMobile" value="" class="txt_input" placeholder="请输入手机号">
				</c:if>
				
				<input type="button" id="btnLogin" class="i_button" value="提交反馈" onclick="sendSysReback();"/>
				<div class="repayTip">
					<p>您宝贵的意见是我们进步的动力</p>
					<img src="${ctx}/file/h5/weixin/images/suggest_logo.png" >
				</div>
			</div>
			<!-- 意见反馈结束 -->
		</div>
		<!-- 意见反馈弹出窗结束 -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?330deb5915739677ca072390406d0122";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
    </body>
    

    
    
</html>