<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>进入评审的项目信息</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" /> 
    <link rel="stylesheet" type="text/css" href="${ctx }/h5/css/iscroll.css">
 	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/fakeloader.css"/>
 	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
 	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
 	<link rel="stylesheet" type="text/css" href="${ctx }/file/h5/h5Weixin/css/prjCkList.css"/>
   	<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
   	<script type="text/javascript" src="${ctx }/web/js/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   	<script type="text/javascript" src="${ctx }/web/js/i_commons.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/iscroll.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/fakeloader.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
   	<script type="text/javascript" src="${ctx }/file/h5/h5Weixin/js/prjCkList.js"></script>
	<script type="text/javascript">
		var webroot = "${ctx}";
	</script>
</head>
<body class="page_bgcolor">
	<div class="fakeloader"></div>
	<div id="wrapper">
		<div id="scroller">
			<div id="pullDown" style="display: none;"><span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span></div>
			<div id="thelist"  style="margin-top: -15px;"></div>
		</div>
	</div>
	<div class="txt_center mt_20" id="btn_group" style="padding-bottom: 10px;display: none;position: fixed;z-index:10;bottom: 0px;width: 100%;">
		<input type="button" class="submit_btn" value="我要融资" style="margin-top: 20px;" onclick="location.href='${ctx }/PtlWeixin!showPrjPublish.action'"/>
	</div>
	<div id="pullUp" style="display: none;position: fixed;z-index:100;bottom: 0px;width: 100%;"><span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span></div>
</body>
</html>