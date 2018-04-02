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
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/base.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/h5/weixin/css/tfTeacherStatus.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="<s:url value="/js/sha1.js"/> "></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
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
    <body>
    <div class="page__status">
    	  	    <!--头部-->
    <header class="clearfix">
        <button class="back__btn"><img src="${ctx}/file/h5/weixin/images/back-btn.png" alt="返回"></button>
        <div class="header--title">创业导师中心</div>
        <button class="logout__btn"><img src="${ctx}/file/h5/weixin/images/logout.png" alt="退出"></button>
    </header>
    <container>
        <div class="status__Box">
            <!--认证失败-->
            <div id="rzFail--status" class="status__box">
                <img src="${ctx}/file/h5/weixin/images/niuBg.png" alt="小牛">
                <p>很抱歉，你的导师认证没有通过审核，请按要求修改认证信息再次提交吧！</p>
                <button class="btn btn--status">重新认证</button>
            </div>
            <!--完善信息-->
            <div id="wsMessage--status" class="status__box">
                <img src="${ctx}/file/h5/weixin/images/niuBg.png" alt="小牛">
                <p>认证正在审核中，目前你提交的信息较少补充信息能提交通过概率哦！</p>
                <button class="btn btn--status">完善信息</button>
            </div>
            <!--未认证-->
            <div id="noRz--status" class="status__box">
                <img src="${ctx}/file/h5/weixin/images/niuBg.png" alt="小牛">
                <p>你还没有认证成为创业导师，现在就去认证吧！</p>
                <button class="btn btn--status">身份认证</button>
            </div>
            <!--重新认证-->
            <div id="reRz--status" class="status__box">
                <img src="${ctx}/file/h5/weixin/images/niuBg.png" alt="小牛">
                <p>亲，你的认证申请正在审核中，如果觉得信息需要丰富，可以点下方按钮进行操作！</p>
                <button class="btn btn--status">重新认证</button>
            </div>
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
    <div class="alertDS">
        <span></span>
        <div class="btn__box clearfix">
            <input type="button" class="btn fl btn--warning" value="查看进度">
            <input type="button" class="btn fr btn--active btn-close" value="取消">
        </div>
    </div>
    </div>	
  
    </body>
    <script type="text/javascript" src="${ctx}/file/h5/weixin/js/tfTeacherStatus.js"></script>
</html>