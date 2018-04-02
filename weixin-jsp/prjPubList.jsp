<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>最新项目信息</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" /> 
    <link rel="stylesheet" type="text/css" href="${ctx }/h5/css/iscroll.css">
 	<link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/prjPubList.css"/>
   	<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
   	<script type="text/javascript" src="${ctx }/web/js/i_commons.js?20150724"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/iscroll.js"></script>
	<script type="text/javascript" src="${ctx }/file/h5/weixin/js/prjPubList.js"></script>
	<script language="javascript">
		var myScroll;
		var webroot = "${ctx}";
	</script>
</head>

<body class="page_bgcolor">
<div class="page_body">

	<!-- 顶部开始 -->
	<div id="top_wrap">
		<div class="top">
			项目列表
			<div class="top_left"></div>
			<div class="top_right"></div>
		</div>
	</div>
	
</div>
<!-- 顶部结束 -->
	<div id="wrapper">
		<div id="scroller">
			<!-- 下拉刷新 -->
			<div id="pullDown"><span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span></div>
			<div id="thelist" ></div>
			
		</div>
	</div>
	<!-- 上拉加载 -->
	<div id="pullUp" style="position:fixed;z-index: 100;bottom: 0px;width: 100%;max-width: 640px;"><span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span></div>
</body>
</html>