<!DOCTYPE html>
<html lang="utf-8">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes" />
    <title>爱就投微信绑定</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
   	<link rel="stylesheet" type="text/css" href="${ctx}/file/h5/h5Weixin/css/weixinbind.css" />
	<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/web/js/bootstrap/3.2.0/js/bootstrap.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
   	<script	type="text/javascript" src="${ctx }/js/md5.js"></script>
   	<script type="text/javascript" src="${ctx }/file/h5/h5Weixin/js/weixinbind.js"></script>
	<script type="text/javascript">
		var webroot = "${ctx}";
		var envFlag = "${envFlag}";
		var bindFlag = "${bindFlag}";
	</script>
</head>
<body>
<div class="page_body">
	
	<!-- 用户登录部分开始 -->
	<div id="userinfo_area">
		<div style="width: 100%;text-align: center;margin-top: 20px;">
			<img src="${ctx }/web/img/logo.png"/>
		</div>
		<div class="userInform mt_20">
			<span>姓名</span>
			<input type="text" class="" name="userName" id="userName" placeholder="请输入姓名" value="${uname}">
		</div>
		<div class="err_msg"></div>
		<div class="xian"></div>
		<div class="userInform1">
			<span>手机</span>
			<input type="tel"  class="" name="userMobile" id="userMobile" placeholder="请输入手机号码" value="${utel}">
		</div>
		<div class="err_msg"></div>
		<input type="submit" class="nextStep" value="下一步" id="btninfoCommit">
	</div>
	<!-- 用户登录部分结束 -->

	<!-- 已经是会员短信验证开始 -->
	<div id="code_area" style="display:none">
		<div class="informationNew">
			您已是爱就投会员
			短信已发送至您手机，请输入验证码绑定微信
		</div>
		<div class="userInform2">
			<span>验证码</span>
			<input type="tel" name="code" placeholder="请输入验证码" id="vcode">
			<input type="button"  class="yanZheng" value="获取验证码" id="btnSendCode" onclick="sendMessage()">
			<input type="button" class="yanZheng" value="60s" id="btnSendCodeTime" style="display: none;"></input>
		</div>
		<div class="err_msg"></div>
		<input type="submit" class="confirm" value="确定" id="btnCodeBind">
	</div>
	<!-- 已经是会员短信验证结束 -->
	
	<!-- 尚未注册短信验证开始 -->
	<div id="reg_area" style="display:none">
		<div class="informationNew">
			您尚未注册爱就投会员
			短信已发送至您手机，请输入验证码注册成为爱就投会员并绑定微信
		</div>
		<div class="userInform2">
			<span>验证码</span>
			<input type="tel" name="code" placeholder="请输入验证码" id="vcode">
			<input type="button"  class="yanZheng" value="获取验证码" id="btnSendCode" onclick="sendMessage()">
			<input type="button" class="yanZheng" value="60s" id="btnSendCodeTime" style="display: none;"></input>
		</div>
		<div class="err_msg"></div>
		<div class="changeBox">
			<input type="checkbox" id="regCheckbox"/>
			<span style="color:#333333;">我同意</span><span style="color:#0066FF;">《爱就投会员服务协议》</span></div>
		<input type="submit" class="confirm" value="确定" id="btnCodeReg" disabled="disabled" style="background-color: #f3f3f3;">
	</div>
	<!-- 尚未注册短信验证结束 -->
	

	<!-- 微信绑定成功开始 -->
	<div id="bindSucc_area" class="mt_20" style="display:none">
	  	<img src="${ctx }/h5/img/ico-ok.png" alt="">
		<p>微信绑定成功</p>
		<a href="${ctx }/PtlWeixin!prjPubList.action"><input type="submit" class="more" value="看看最近有啥项目" ></a>
	</div>
	<!-- 微信绑定成功结束 -->
	
	<div id="weixinTip" class="mt_20"  style="display:none;text-align: center;">
		<div style="width: 100%;text-align: center;margin-top: 20px;">
			<img src="${ctx }/web/img/logo.png"/>
		</div>
		<p style="margin-top: 35px;font-size: 16px;" align="center">请在微信上操作</p>
		<a href="${ctx }/PtlWeixin!prjPubList.action"><input type="submit" class="more" value="看看最近有啥项目" ></a>
	</div>

</div>
</body>
</html>