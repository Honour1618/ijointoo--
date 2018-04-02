<!DOCTYPE html>
<html lang="utf-8">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>爱就投会员登录</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/h5/lib/jPanelMenu/css/style.css"/>
   	<link rel="stylesheet" type="text/css" href="${ctx }/h5/lib/swiper/css/swiper.3.1.7.min.css"/>
   	<link rel="stylesheet" type="text/css" href="${ctx }/file/h5/h5Weixin/css/index.css"/>
   	<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/lib/jPanelMenu/jquery.jpanelmenu.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/lib/jPanelMenu/js/script.js"></script>
   	<script type="text/javascript" src="${ctx }/web/js/jquery/jquery.superslide.2.1.1.js"></script>
   	<script type="text/javascript" src="${ctx }/web/js/i_commons.js?20150724"></script>
   	<script type="text/javascript" src="${ctx }/h5/lib/swiper/js/swiper.3.1.7.min.js"></script>
   	<script type="text/javascript" src="${ctx }/file/h5/h5Weixin/js/index.js"></script>
	<script type="text/javascript">
		var webroot = "${ctx}";
	</script>
</head>
<body>
	<header class="main">
		<h1 class="logo"><a href="#" class="ss-list" style="outline: none;">爱就投</a></h1>
		<a href="#menu" class="menu-trigger ss-icon" style="outline: none;">&#xED50;</a>
		<nav>
			<ul>
				<li><a href="${ctx}/PtlMobile!index.action">返回首页</a></li>
				<li><a href="${ctx}/PtlWenjuan!showRiskEval.action">风险评测</a></li>
				<li><a href="${ctx}/PtlWeixin!prjPubList.action">我要投资</a></li>
				<li><a href="${ctx}/PtlWeixin!prjCkList.action">我要融资</a></li>
				<li><a href="${ctx}/PtlWeixin!myPayInfo.action">打款查询</a></li>
				<li><a href="${ctx}/PtlVote!list.action">投后服务</a></li>
				<li><a href="${ctx}/PtlActivity!myAgentRc.action">代理服务</a></li>
				<li><a href="${ctx}/data/common/about.html">关于我们</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="_index_content">
		<div class="my_info_area">
			<div style="height: 20px;"></div>
			<div class="my_info">
				<div class="_user_photo"><img src="${ctx }/${member.userLogo}" style="width:100%;border-radius: 50%;"/></div>
				<div class="_user_name">${member.userName }</div>
				<div class="clear"></div>
				<div class="_user_level">会员等级：${member.usrLevelStr }&nbsp;&nbsp;&nbsp;</div>
				<div class="_user_level">实名认证：${member.authFlg == '0' ? '未进行实名认证' : '' }${member.authFlg == '1' ? '已通过实名认证' : '' }${member.authFlg == '2' ? '实名认证审核中' : '' }${member.authFlg == '9' ? '实名认证失败' : '' }</div>
			</div>
		</div>
		<div class="svc_item">
			<div class="img_tag"><img src="${ctx }/h5/img/memu_rich.jpg"/></div>
			<div class="title_tag">查看财富</div>
			<div class="desc">
				<a href="${ctx }/download/download.html">请下载app查看</a>
			</div>
		</div>
		<div class="svc_item">
			<div class="img_tag"><img src="${ctx }/h5/img/memu_bonus.jpg"/></div>
			<div class="title_tag">查看推荐奖励</div>
			<div class="desc">
				<a href="${ctx }/download/download.html">请下载app查看</a>
			</div>
		</div>
		<div class="svc_item" onclick="location.href='${ctx}/PtlWeixin!myPayInfo.action'">
			<div class="img_tag"><img src="${ctx }/h5/img/menu_pay.jpg"/></div>
			<div class="title_tag">打款查询</div>
			<div class="desc">
				<a href="${ctx}/PtlWeixin!myPayInfo.action">查看需要打款的项目和历史打款信息</a>
			</div>
		</div>
		<div class="svc_item" onclick="location.href='${ctx}/PtlVote!list.action'">
			<div class="img_tag"><img src="${ctx }/h5/img/memu_svc.jpg"/></div>
			<div class="title_tag">查看服务</div>
			<div class="desc">
				<a href="${publishInfo.serviceUrl}">${publishInfo.newContent }</a>
			</div>
		</div>
		<div class="swiper-container">
			<div class="swiper-wrapper" id="projectBlock"></div>
		</div>
		<div style="height: 30px;"></div>
	</div>
</body>
</html>