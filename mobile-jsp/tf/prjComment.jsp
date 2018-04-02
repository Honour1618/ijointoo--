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
    <link rel="stylesheet" type="text/css" href="${ctx }/file/tf/prjComment/css/prjComment.css">
</head>
	<!-- 融测测项目详情 -->
    <body >
	<div class="pl-box">
		<div class="pl-box-top">
			<img src="${ctx}/file/tf/projectDes/img/prjBack.png" class="plBack">
		</div>
    	<div class="discuss">
    		<p class="sum">评论 <span id="comment_total">(${ftotal})</span></p>
    		<div id="conculme"></div>
		<div class="more_btn" id="load_more_btn" page-num="2" onClick="loadMoreVote(this)">点击查看更多评论</div>
				<!-- 查询更多评论ajax PtlPrjPool!queryReplyAjax?prePrjCode=投前项目编号&pageNo=页码2开始-->
		<div class="loadingPic"></div>
   	</div>
    <div class="repay clearfix">	
		<input class="desc" id="desc_comment" placeholder="写评论" />
			<div class="rwdBtn">
			<input type="button" class="reward_btn" value="发送" onclick="javascript:proVoteData()"/>
		</div> 
		<%-- <img src="${ctx}/file/tf/projectDes/img/close.png" class="close" /> --%>
	</div>
	<div class="answer">
		<!-- <p>回复</p> -->
		<input class="desc" id="desc_reply" placeholder="说点什么吧~" />
		<div class="rwdBtn">
			<input type="button" class="reward_btn" value="提交" id="reply_submit"/>
		</div>
		<%-- <img src="${ctx}/file/tf/projectDes/img/close.png" class="close" /> --%>
	</div>
	<div class="login">
		<i class="close"></i>
		<div class="login_info">
			<img src="${ctx }/file/finshare/mo/image/logo.png" >
			<p>·只有注册会员才能操作哦</p>
		</div>
		<!-- <a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">
			下载APP
		</a> -->
		<a class="button" id="login_btn" onclick="loginFun(this)" data-type="0">
			立即登录注册
		</a>
	</div>
	<div class="common_mask"></div>
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script language="javascript">
		//声明动态全局变量 JS调用 
		var webroot = "${ctx}";
		var isLogin = "${login}";//判断是否登陆
		var irank = "${irank}";//总排名
		var indRank = "${indRank}";//行业排名
		var prjCode='${tfPrjInfo.prePrjCode }';
	</script>
	    <script type="text/javascript" src="${ctx }/file/tf/prjComment/js/prjComment.js?rd=1"></script>
 <c:if test="${ not empty iframe}">
    </body>
</html>
</c:if>