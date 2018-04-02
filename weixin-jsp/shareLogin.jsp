<!DOCTYPE html>
<html lang="utf-8">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>爱就投公民注册</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="${ctx }/h5/js/jquery.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#btnSave").click(function(){
				var mobile = $("#mobile").val();
				if(mobile==null || mobile.length==0){
					alert("请输入手机号码！");
					return false;
				}
				if(!isMobile(mobile)){
					alert("不是正确的手机号码！");
					return false;
				}
			});
		});
	</script>
</head>
<body class="reg_bg">
<div class="page_body reg_bg">
	<%-- <img alt="" src="${ctx}/h5/img/reg_bg.png" style="width: 100%;height: 100%;"/> --%>
	<div><img src="${ctx}/h5/img/reg_02.png" width="100%"/></div>
	<div class="container" style="width: 100%;max-width: 640px;/* position: absolute;top: 0; */">
		<div class="register">
			<form id="pform" action='<s:url value="/PtlWeixin!shareLogindo.action"/>' method="post">
				<div class="row mt_10">
					<div class="input-group">
						<span class="input-group-addon if_title_b">手机号</span>
						<input class="form-control input-large" type="tel"  placeholder="公民手机号" name="mobile" id="mobile" value="${member.userMobile}" required="required"/>
					</div>
				</div>
				<s:if test="#attr.err_msg != null">
					<div id ="errTip" class="alert alert-danger with-icon mt_10">
			            <i class="icon-frown"></i>
			            <div class="content"><strong></strong>${err_msg}</div>
			        </div>
				</s:if>
				<div class="row mt_20">
					<input type="image" src="${ctx}/h5/img/btn_share_login.png" style="width: 80%;max-width: 300px;" id="btnSave"/>
				</div>
				<div class="form-group mt_20">
					<span style="font-family: 微软雅黑;color: #eb4141;">还没有账号？</span><a class="" style="color:#2364D2;font-family: 微软雅黑;" href="PtlWeixin!shareReg.action">立即注册</a>
				</div>	
			</form>
		</div>
	</div>
</div>
</body>
</html>