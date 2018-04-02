<!DOCTYPE html>
<html lang="utf-8">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>爱就投公民注册</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/file/h5/h5Weixin/css/register.css" />
	<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
   	<script src="${ctx }/web/js/bootstrap/3.2.0/js/bootstrap.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/jquery.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
   	<script type="text/javascript" src="${ctx }/file/h5/h5Weixin/js/register.js"></script>
	<script type="text/javascript">
		var webroot = "${ctx}";
	</script>
</head>
<body>
<div class="page_body reg_bg">
	<%-- <img alt="" src="${ctx}/h5/img/reg_bg.png" style="width: 100%;height: 100%;"/> --%>
	<div><img src="${ctx}/h5/img/reg_02.png" width="100%"/></div>
	<div class="container" style="width: 100%;max-width: 640px;/* position: absolute;top: 0; */">
		<div class="register">
			<form id="pform" action='<s:url value="/PtlWeixin!registerMember.action"/>' method="post">
			<input type="hidden" name="backurl" value="${backurl }"/>
				<div class="row">
					<div class="input-group">
						<span class="input-group-addon if_title_b">姓&nbsp;&nbsp;&nbsp;名</span>
						<input class="form-control input-large" type="text"  placeholder="公民姓名" name="member.userName"  value="${member.userName}" required="required"/>
					</div>
				</div>
				<div class="row mt_10">
					<div class="input-group">
						<span class="input-group-addon if_title_b">手机号</span>
						<input class="form-control input-large" type="tel"  placeholder="公民手机号" name="member.userMobile" id="mobile" value="${member.userMobile}" required="required"/>
					</div>
				</div>
				<div class="row mt_10">
					<div class="input-group" >
						<span class="input-group-addon if_title_b">图形码</span>
						<input name="randCode" class="form-control" type="text" placeholder="图片验证码"  id="randCode"/>
						<span class="input-group-btn ">
							<a href="javascript:changeImagelabel();" title="换一张" class="check_img">
								<img id="image1" src="<s:url value='/genVerifyCode.do'/>" style="border-width: 0px;width: 80px;padding-left: 5px;" />
							</a>
						</span>
					</div>
				</div>
				<div class="row mt_10">
					<div class="input-group">
						<span class="input-group-addon if_title_b">验证码</span>
						<input class="form-control input-large" name="validateCode" type="tel" placeholder="短信验证码" required="required"/>
						<span class="input-group-btn ">
							<button class="btn btn-warning btn-large" style=" background: none repeat scroll 0 0 #eb4141;width:100px" name="btnSendCode" id="btnSendCode"  type="button" onclick="sendMessage()" ><span id="v_btn_view" >点击获取</span></button>
						</span>
					</div>
				</div>
				<c:if test="${empty rcUserId }">
					<div class="row mt_10">
						<div class="input-group">
							<span class="input-group-addon if_title_b">推荐人</span>
							<input class="form-control input-large" type="tel"  placeholder="填写推荐人手机号,Ta有奖励（非必填）" name="member.recommUserId" value="${member.recommUserId}" />
						</div>
					</div>
				</c:if>
				<c:if test="${not empty rcUserId }">
					<input class="form-control input-large" type="hidden"  placeholder="填写推荐人手机号,Ta有奖励（非必填）" name="rcUserId" value="${rcUserId}" />
				</c:if>
                <div class="row mt_10">
					<div class="input-group">
						<span class="input-group-addon if_title_b">关注行业</span>
						<input class="form-control input-large" id="userRangTxt" type="text" placeholder="--请选择--" readonly="readonly"  data-toggle="modal" data-target="#myModal" style="background-color: #fff;"/>
					</div>
				</div>
				<div class="row mt_10" style="display: none;">
					<div class="input-group">
						<span class="input-group-addon if_title_b">关注行业序号</span>
						<input class="form-control input-large" type="text" id="userRang" placeholder="" name="member.userRang"/>
					</div>
				</div>
				<div class="row mt_10 txt_center">
					<label class="v_align" style="margin-top: 10px;font-weight: normal;font-family: 微软雅黑;padding-left: 5px;">注册即同意<a href="${ctx }/data/comm/i9tou.html" style="color: #2364D2;">《爱就投会员服务协议》</a></label>
					<!-- <div class="input-group">
						<input  type="checkbox"  name="member.recommUserId" value="" style="width: 15px;height: 15px;" class="v_align"/>
					</div> -->
				</div>
				<s:if test="#attr.err_msg != null">
					<div id ="errTip" class="alert alert-danger with-icon">
			            <i class="icon-frown"></i>
			            <div class="content"><strong></strong>${err_msg}</div>
			        </div>
				</s:if>
				<div class="row mt_10">
					<input type="image" src="${ctx}/h5/img/btn_reg.png" style="width:80%;max-width: 300px;"/>
				</div>
				<div class="row mt_10">
					<div align="center" style="font-family: 微软雅黑;">
						已注册账号？<a href="${ctx }/PtlWeixin!showLogin.action" style="color: #2364D2;">请登录</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <div class="item_list">    
	        	<c:forEach items="${compRngList }" var="list">
			          <div id="${list.value }" class="item_static">${list.key }</div>
	        	</c:forEach>
	        </div>  
	        <div class="submit txt_center">
	             <button type="button" id="btnSelect" class="submit_btn" style="margin-top:30px;" class="close" 
	               data-dismiss="modal" aria-hidden="true">确 定
	            </button>
	        </div>
      </div>
	</div>
   </div>
</div>
</body>
</html>