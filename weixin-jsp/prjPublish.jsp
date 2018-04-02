<!DOCTYPE html>
<html lang="utf-8">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>爱就投平台项目众筹</title>
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" />
   	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/i9tou_style.css"/>
   	<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
   	<script type="text/javascript" src="${ctx }/file/h5/h5Weixin/js/prjPublish.js"></script>
   	<script>
   		var webroot = "${ctx}";
   	</script>
</head>
<body style="padding-bottom:50px;" class="i_background_q" >
	<div class="panel">
		<div class="panel-body">
			<div class="alert alert-warning alert-dismissable" id="msg_panel">
				<button class="close" aria-hidden="true" data-dismiss="alert" type="button" onclick="hideMsg();">×</button>
				<strong>提示：</strong>您可在此发布您需要众筹的项目信息，发布信息后，爱就投服务人员会对您的项目进行审核，并跟您联系。感谢您的支持！
			</div>
			<form id="commentForm" enctype="multipart/form-data" class="form-horizontal" action='<s:url value="PtlWeixin!prjPublish.action"/>' method="post" onsubmit="return validate();">
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">项目名称</label>
					<div class="col-xs-9  col-sm-10 required">
						<input class="form-control" name="projectPool.prjName"  placeholder="如海淘网增资扩股" required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">项目描述</label>
					<div class="col-xs-9  col-sm-10 required">
						<textarea rows="6" class="form-control" name="projectPool.prjDesc"   placeholder="描述企业估值，融资金额和融资目的等信息" required="required"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">商业计划书</label>
					<div class="col-xs-9  col-sm-10 file-wrapper">
						<input type="file" tabindex="-1" onChange="showInfo(this)" class="fileControl" name="attach">请选择PPT、PPTX、PDF文件;文件大小不要超过20M<br>
							<a target="_blank" href="<s:url value="/data/comm/ijointoo_bus_template.pptx"/>" >点击下载爱就投商业计划书模板</a>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">计划融资额</label>
					<div class="col-xs-9  col-sm-10 required">
						<input class="form-control" type="number" name="projectPool.finAmt" required="required" placeholder="计划融资金额"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">融资用途</label>
					<div class="col-xs-9  col-sm-10 required">
						<input class="form-control" type="text" name="projectPool.finUse" required="required" placeholder="请说明融资用途"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">姓名</label>
					<div class="col-xs-9  col-sm-10 required">
						<input class="form-control" name="projectPool.ruserName" placeholder="请输入您的姓名"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">手机号码</label>
					<div class="col-xs-9  col-sm-10 required">
						<input type="tel" class="form-control" name="projectPool.ruserMobile" id="rUserMobile" placeholder="请输入您的手机号"/>
						<span class="text-danger hide" for="rUserMobile" id="rUserMobileLabel"><strong>请填写正确的手机号码</strong></span>
					</div>
				</div>	
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">联系人</label>
					<div class="col-xs-9  col-sm-10 ">
						<input class="form-control" name="projectPool.cntName" placeholder="不输入就是您的姓名"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">联系电话</label>
					<div class="col-xs-9  col-sm-10 ">
						<input type="tel" class="form-control" name="projectPool.cntMobile" id="userMobile"  placeholder="不输入就是您填写的手机号" />
						<span class="text-danger hide" for="userMobile" id="userMobileLabel"><strong>请填写正确的手机号码</strong></span>
					</div>
				</div>
				 <div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">联系人职位</label>
					<div class="col-xs-9  col-sm-10 ">
						<select id="position" class="form-control" name="projectPool.position">
							<c:forEach var="list" items="${positionList}">
									<option value="${list.value}">${list.key}</option>
							</c:forEach>
						</select>
					</div>
				</div> 
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">公司名称</label>
					<div class="col-xs-9  col-sm-10 required">
						<input class="form-control" name="projectPool.compName" required="required" placeholder="工商注册的企业名称"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">工商执照注册号</label>
					<div class="col-xs-9  col-sm-10 required">
						<input class="form-control" name="projectPool.blNo" required="required" placeholder="工商执照注册号"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">OTC代码</label>
					<div class="col-xs-9  col-sm-10 ">
						<input class="form-control" name="projectPool.otcCode" value="${otcCode}" placeholder="有了OTC代码，审核更快捷"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">公司网站</label>
					<div class="col-xs-9  col-sm-10">
						<input class="form-control" name="projectPool.compUrl" placeholder="公司的官网地址"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">项目所属行业</label>
					<div class="col-xs-9  col-sm-10">
						<select class="form-control" id="compRng" name="projectPool.prjRang" style="height: 32px;">	
						<c:forEach var="list" items="${compRngList}"><option value='${list.value}'>${list.key}</option></c:forEach></select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-sm-2 control-label" for="from">行业描述</label>
					<div class="col-xs-9  col-sm-10">
						<input class="form-control" name="projectPool.compRangDesc" placeholder="对行业领域的补充说明"/>
					</div>
				</div>
				<!-- <div class="form-group " id="p_up">
					<label class="col-xs-3 col-sm-2 control-label" for="from">公司Logo</label>
					<div class="col-xs-9 col-sm-10  file-wrapper" style="margin-top: 5px;">
						<input type="file" tabindex="-1" class="fileControl" name="attach">
					</div>
				</div> -->
				<div class="form-group " id="p_up">
					<label class="col-xs-3 col-sm-2 control-label" for="from">会员协议</label>
					<div class="col-xs-9 col-sm-10  file-wrapper" style="margin-top: 5px;">
						<div style='float:left; width:22px; height:22px;background-image:url(<s:url value="/mobile/checkOff.JPG"/>);' onclick="myCheckbox('tipid',this);">&nbsp;</div> 
						<input type="checkbox" name="tipBox"  id="tipid" style="display:none;"/>
						<span style="line-height: 25px;">同意成为会员并遵循<a  style="text-decoration:underline; color:blue"  href="${ctx }/data/comm/i9tou.html" style="color: #444;">《爱就投会员服务协议》</a></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-3  col-sm-2"></div>
					<div class="col-xs-9 col-sm-10 ">
						<span> 
							<input type="submit" data-loading="稍候..." value="提交项目" class="btn btn-primary if_menu_w" disabled="disabled"
							style="background: none repeat scroll 0 0 #ff6633; border: none;" id="submit">
						</span>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>