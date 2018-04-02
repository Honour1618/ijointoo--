<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>创业者详情</title>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/business_home.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="<s:url value="/js/sha1.js"/> "></script>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/business_home.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		var webroot = '${ctx}';
		var uid = '${memberInfo.userId}';
		var isFocus = '${isFocus}';
		var total = "${pageInfo.total}";
	</script>
</head>
    <body>
		<!-- user上部分 -->
    	<div class="topNav">
    		<a class="fan"></a>
    		创业者详情
    	</div>
    	<!-- user上部分 -->

	    	<div class="teach_user">
	    		<img src="${ctx}/file/h5/weixin/images/tfDetBg.jpg" class="teach_featherImg" />
				<div class="teach_con">
					<div class="userImg">
						<img src="${ctx }/${memberInfo.userLogo}" >
					</div>
					<h2>${memberInfo.userName }</h2>
					<p>关注   ${memberInfo.focusNum }　|　粉丝  ${memberInfo.fansNum }</p>
					<p>${memberInfo.userComp} | ${memberInfo.position}</p>
				</div>
	    	</div>
		
		<!-- 详情描述 -->
		<ul class="mission_con">
			<li>
				<label>会员年限：</label>
				<p>${year }年</p>
			</li>
			<li>
				<label>所属行业：</label>
				<p>${memberInfo.industryStr}</p>
			</li>
		</ul>
		
		<!-- 项目    -->
		<div class="enterprise_nav">
			Ta的项目
		</div>
		<!-- 项目列表 -->
		<div id="businessCon">
			<c:forEach var="list" items="${prjList}" varStatus="status">
		    	<a class="business_con" href="pay/PtlTf!prj.action?prjCode=${list.prePrjCode }&uid=${list.userId }">
		    		<div class="business_man">
						<span class="business_title">${list.prjName }</span>
						<span class="crtTime crtTime${list.prePrjCode }">${list.crtTime}</span>
					</div>
					<p class="prj_det">${list.prjDesc}</p>
					<ul class="business_tag_con">
						<c:forEach items="${list.prjTag }" var="show">
							<li class="business_tag">${show}</li>
						</c:forEach>
					</ul>
					<div class="business_res">项目软肋：${list.rscDesc }</div>
		    	</a>
		    	<script type="text/javascript">
					var idtmp = '${list.prePrjCode}';
					var crtTime = "${list.crtTime}";
					var onlyBidDay= crtTime.substring(0,10);
					var timeBid = 'crtTime'+idtmp;
					$("."+timeBid).html(onlyBidDay);
				</script>
	    	</c:forEach>
    	</div>
    	<c:if test="${pageInfo.total > 3 }">
    		<div class="more_btn" id="load_more_btn" page-num="2" onClick="loadMoreVote(this)">点击查看更多</div>
					<!-- 查询更多评论ajax PtlPrjPool!queryReplyAjax?prePrjCode=投前项目编号&pageNo=页码2开始-->
		</c:if>
		
		<!-- 加载等待 -->
		<div class="common_mask"></div>
	   	<div class="loadingPic"></div>
	   	
		<!-- 页面警告框 -->
		<div class="alertShow">
			<span></span>
		</div>
		
		<!-- 关注 -->
		<div class="point_focus">
			<c:if test="${isFocus ==0}" >
				<div class="prepare_focus" onclick="goodDataAjax()">
					<img src="${ctx}/file/h5/weixin/images/focus_will.png" />
					<span class="za zaRed">关注 </span>
				</div>
			</c:if>
			<c:if test="${isFocus ==1}" >
				<div class="already_focus">
					<img src="${ctx}/file/h5/weixin/images/focused.png" />
					<span class="za" id="zaShowMask">已关注</span>
				</div>
			</c:if>
		</div>
		
    </body>
</html>