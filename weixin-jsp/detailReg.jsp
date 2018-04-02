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
   	<script type="text/javascript" src="${ctx }/h5/js/jquery.js"></script>
   	<script src="${ctx }/web/js/bootstrap/3.2.0/js/bootstrap.js"></script>
   	<script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
   	<style type="text/css">
	   	.modal-dialog{margin-top:100px;}
	   	.item_list{margin-top: 20px;}
		.item_static{width: 130px;border:1px solid #36B3ED ;border-radius: 3px;color:#36B3ED;background-color: #fff;text-align: center;float: left;margin: 10px;cursor: pointer; height: 35px; line-height: 35px; font-family: '微软雅黑'; border-radius: 3px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		.item_selected{color:#fff;background-color: #36B3ED;width: 130px;border:1px solid #36B3ED ;border-radius: 3px;text-align: center;float: left;margin: 10px;cursor: pointer; height: 35px; line-height: 35px; font-family: '微软雅黑'; border-radius: 3px;}
		.list_item{padding-left: 0%;margin: 0px 0 10px 0;text-align: left;font-size: 16px;margin-top: 20px;font-family: '微软雅黑';}
		.list_item1{padding-left: 0%;margin: 0px 0 10px 0;text-align: left;font-size: 16px;margin-top: 20px;font-family: '微软雅黑';}
		.input_item_box{border: 1px solid #f3f3f3;width: 95%;border-bottom: none;cursor: pointer;height: 35px;line-height: 35px;}
		.item_bg{background-color: #f5f5f5;}
		.require{width: 18px;height:18px;margin-top: 0px;}
		.label{padding-left: 5px;color: #444;font-weight: normal;font-size: 14px;}
		input[type=radio],label{vertical-align: middle;}
   	</style>
	<script type="text/javascript">
		var rd1=new Date().getFullYear();
		var InterValObj; //timer变量，控制时间
		var count = 90; //间隔函数，1秒执行
		var curCount;//当前剩余秒数
		var code = ""; //验证码
		var codeLength = 6;//验证码长度
		function sendMessage() {
			var phone = document.getElementById("mobile");  
			var phoneVal = $("#mobile").val();
		    var dealType; //验证方式
		 	curCount = count;
			if(phoneVal == null || phoneVal.length==0){
				alert("请输入手机号");  
				$("#mobile").focus();
				return;
			}else if(!isMobile(phoneVal)){
				alert("不是正确的手机号码，请重新输入");
				$("#mobile").focus();
				return;
			}
            var randCode = $("#randCode").val();
            if(randCode=="" || randCode.length <4){
            	alert("请正确输入图形验证码！");
            	$("#randCode").focus();
            	return false;
            }
            
	    	//设置button效果，开始计时
	        $("#btnSendCode").attr("disabled", "true");
	        $("#btnSendCode").removeClass("btn_valid");
	        $("#btnSendCode").addClass("sign_btn_gray");
	        $("#v_btn_view").html(curCount + "秒");
	        $("#errTip").hide();
	        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
			//向后台发送处理数据
	        $.ajax({
	            type: "POST", //用POST方式传输
	            dataType: "json", //数据格式:JSON
	            url: '<s:url value="/PtlVCode!applyWithImg.action"/>', //目标地址
	            data: { "nosession": true,"tel": phoneVal,"randCode":randCode },//nosession 未登录ajax 请求有效
	            error: function (XMLHttpRequest, textStatus, errorThrown) { },
	            success: function (msg){
	            	if(msg.result == 9){
	    		        window.clearInterval(InterValObj);//停止计时器
	    		        $("#btnSendCode").removeAttr("disabled");//启用按钮
	    		        $("#btnSendCode").removeClass("sign_btn_gray");
	    		        $("#btnSendCode").addClass("btn_valid");
	    		        $("#v_btn_view").html("重新获取");
	    		        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
	            		alert(msg.desc);
	            		return ;
	            	}else if(msg.result == 4){
	            		alert(msg.desc);
	    		        window.clearInterval(InterValObj);//停止计时器
	    		        $("#v_btn_view").html("稍候重试");
	            		return ;
	            	}
	            }
	        });
		}
		
		//timer处理函数
		function SetRemainTime() {
		    if (curCount == 0) {                
		        window.clearInterval(InterValObj);//停止计时器
		        $("#btnSendCode").removeAttr("disabled");//启用按钮
		        $("#btnSendCode").removeClass("sign_btn_gray");
		        $("#btnSendCode").addClass("btn_valid");
		       $("#v_btn_view").html("重新获取");
		        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
		    }
		    else {
		        curCount--;
		        $("#v_btn_view").html( curCount + "秒");
		    }
		}
		
		function validate(){
			m = document.getElementById("mobile");  
			m.setCustomValidity("两次密码必须输入一致！");  
			return false ;
		}

		$(function(){
			$(".item_list div").click(function(){
				var s_class = $(this).attr("class");
				if(s_class=="item_static"){
					$(this).addClass("item_selected").removeClass("item_static");
				}else{
					$(this).addClass("item_static").removeClass("item_selected");
				}
				
			});
			$("#btnSelect").click(function(){	
				var s_items_txt = "",s_items_val = "";
				$(".item_list .item_selected").each(function(){
					s_items_txt+=$(this).text()+'，';
					s_items_val+=$(this).attr("id")+',';
				});
				
				if(s_items_txt.length>0){
					s_items_txt = s_items_txt.substring(0, s_items_txt.length-1);
				}
				if(s_items_val.length>0){
					s_items_val = s_items_val.substring(0, s_items_val.length-1);
				}
				$("#userRangTxt").val(s_items_txt);
				$("#userRang").val(s_items_val);
			});
			$("form").submit(function(e){
				if($("#userRang").val()==''){
					alert("请选择关注行业");
					return false;
				}
				//if($("#expRng").val()==''){
				//	alert("请选择期望回报");
				//	return false;
				//}
				if($("#leastRng").val()==''){
					alert("请选择最低出资额");
					return false;
				}
			});
		});
		function changeImagelabel() {
			document.getElementById("image1").src = "${ctx}/genVerifyCode.do?dt="+ Math.random();
		}
	</script>
</head>
<body>
<div class="page_body reg_bg">
	<div style="position: relative;">
		<img src="${ctx}/h5/img/reg_02.png" width="100%"/>
		<div class="row mt_10 txt_center" style="position: absolute;bottom: 50px;width: 100%;text-align: right;">
			<label class="v_align" style="margin-top: 10px;font-weight: normal;font-family: 微软雅黑;padding-left: 5px;"><a href="${ctx }/data/common/about.html" style="color: #2364D2;">《关于爱就投》</a></label>
		</div>
	</div>
	<div class="container" style="width: 100%;max-width: 640px;/* position: absolute;top: 0; */">
		<div class="register">
			<form id="pform" action='<s:url value="/PtlWeixin!detailRegdo.action"/>' method="post">
				<s:if test="#attr.err_msg != null">
					<div id ="errTip" class="alert alert-danger with-icon">
			            <i class="icon-frown"></i>
			            <div class="content"><strong></strong>${err_msg}</div>
			        </div>
				</s:if>
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
				<c:if test="${empty inviteFlg }">
				<div class="row mt_10">
					<div class="input-group" >
						<span class="input-group-addon if_title_b">图形码</span>
						<input name="randCode" class="form-control" type="tel" placeholder="图片验证码"  id="randCode" required="required"/>
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
				</c:if>
				<c:if test="${not empty inviteFlg }">
				<div class="row mt_10">
					<div class="input-group">
						<span class="input-group-addon if_title_b">邀请码</span>
						<input class="form-control input-large" name="validateCode" value="${validateCode}" type="tel" placeholder="系统邀请码" required="required"/>
					</div>
				</div>
				</c:if>
				
				<!-- 
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
				<div class="row mt_10">
					<div class="input-group">
						<span class="input-group-addon if_title_b">期望汇报</span>
						<select  class="form-control" id="expRng" name="member.expRng">
							<option value="">--请选择--</option>
							<c:forEach items="${expRngList}" var="list">
								<option value="${list.value}">${list.key}</option>
							</c:forEach>
						</select>
					</div>
				</div> 
				<div class="row mt_10">
					<div class="input-group">
						<span class="input-group-addon if_title_b">单项目出资额</span>
						<select  class="form-control" id="leastRng" name="member.leastRng">
							<option value="">--请选择--</option>
							<c:forEach items="${leastRngList}" var="list">
								<option value="${list.value}">${list.key}</option>
							</c:forEach>
						</select>
					</div>
				</div>
	-->

				
				<div class="row mt_10 txt_center">
					<label class="v_align" style="margin-top: 10px;font-weight: normal;font-family: 微软雅黑;padding-left: 5px;">注册即同意<a href="${ctx }/data/comm/i9tou.html" style="color: #2364D2;">《爱就投会员服务协议》</a></label>
				</div>
				<div class="row mt_10" style="font-family: 微软雅黑;padding-bottom: 30px;">
					<input type="image" src="${ctx}/h5/img/btn_reg.png" style="width:80%;max-width: 300px;"/>
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