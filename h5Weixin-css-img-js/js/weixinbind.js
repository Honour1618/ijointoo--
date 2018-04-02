/*
 * 
 * 爱就投微信绑定
 ***/

var rd1="";
var InterValObj; //timer变量，控制时间
var count = 90; //间隔函数，1秒执行
var curCount;//当前剩余秒数
var code = ""; //验证码
var codeLength = 6;//验证码长度
function sendMessage() {

    curCount = count;
    var dealType; //验证方式
	var phone=$("#userMobile").val();//手机号
	if(phone == null ){
		alert("请先输入手机号码");
		return;
	}else if(!/^\d{11,11}$/.test(phone)){
		alert("手机号码11位，请重新输入");
		$("#phone").focus();
		return;
	}

	$.ajax({
            type: "POST", //用POST方式传输
            dataType: "json", //数据格式:JSON
            url: webroot + '/PtlVCode!applyR.action', //目标地址
            data: { "nosession": true,"tel": phone ,"rd":genR(phone) },//nosession 未登录ajax 请求有效
            error: function (XMLHttpRequest, textStatus, errorThrown) { 
            	
            	console.log(XMLHttpRequest);
            },
            success: function (msg){          	
            	//设置button效果，开始计时
                $("#btnSendCode").hide();
                $("#btnSendCodeTime").show().val(curCount + "秒");
                InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
            }
    });
}
//timer处理函数 
function SetRemainTime() {
    if (curCount == 0) {                
        window.clearInterval(InterValObj);//停止计时器
	    $("#btnSendCodeTime").hide();
        $("#btnSendCode").show().val("点击重新获取");
        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
    }
    else {
        curCount--;
        $("#btnSendCodeTime").val( curCount + "秒");
    }
}    

$(function(){
	var userName,userMobile;
	$("#btninfoCommit").click(function(){
		var isContinue = true;
		userName = $("#userName").val();
		if(userName.trim().length<1){
			$("#userName").parent().next().html("请输入姓名").show();
			isContinue = false;
		}
		userMobile = $("#userMobile").val();
		if(userMobile.trim().length<1){
			$("#userMobile").parent().next().html("请输入手机号码").show();
			isContinue = false;
		}else{
			if(!isMobile(userMobile)){
				$("#userMobile").parent().next().html("手机号码格式不正确").show();
				isContinue = false;
			}
		}
		if(isContinue){
			//向后台发送处理数据
		    $.ajax({
		            type: "POST", 
		            dataType: "json", 
		            url: webroot+'/PtlWeixin!weixinbinddo.action',
		            data: { "nosession": true,"userName": userName ,"userMobile":userMobile, "step":1},
		            success: function (data){
		            	if(data.result=="0"){
		            		//已注册 需绑定微信 
		           
		            		$("#userinfo_area").hide();
		    				$("#code_area").show();
		    				$("#reg_area").remove();
		    				sendMessage();
		    				$("#vcode").focus();
		            	}else if(data.result=="1"){
		            		//未注册，注册并绑定微信
		            		$("#userinfo_area").hide();
		    				$("#reg_area").show();
		    				$("#code_area").remove();
		    				sendMessage();
		    				$("#vcode").focus();
		            	}
		            }
		    });
		}
	});
	$("#btnCodeBind").click(function(){
		var isContinue = true;
		var vcode = $("#vcode").val();
		if(vcode=="" || vcode.length<1){
			$("#vcode").parent().next().html("请输入验证码").show();
			isContinue = false;
		}
		if(isContinue){
			//向后台发送处理数据
		    $.ajax({
		            type: "POST", //用POST方式传输
		            async: false,
		            dataType: "json", //数据格式:JSON
		            url: webroot +'/PtlWeixin!weixinbinddo.action', //目标地址
		            data: { "nosession": true,"userName": userName ,"userMobile":userMobile,"vcode":vcode,  "step":2},//nosession 未登录ajax 请求有效
		            success: function (data){
		            	if(data.result=="0"){
		            		//已注册
		    				$("#code_area").hide();
		    				$("#bindSucc_area").show();
		            	}else if(data.result=="9"){
		            		$("#vcode").parent().next().html("验证码不正确").show();
		            	}else{
		            		showMsg("系统异常！");
		            	}
		            }
		    });
		}
	});
	$("#btnCodeReg").click(function(){
		var isContinue = true;
		var vcode = $("#vcode").val();
		if(vcode=="" || vcode.length<1){
			$("#vcode").parent().next().html("请输入验证码").show();
			isContinue = false;
		}
		if(isContinue){
			//向后台发送处理数据
		    $.ajax({
		            type: "POST", //用POST方式传输
		            dataType: "json", //数据格式:JSON
		            url: webroot +'/PtlWeixin!weixinbinddo.action', //目标地址
		            data: { "nosession": true,"userName": userName ,"userMobile":userMobile,"vcode":vcode, "step":3},//nosession 未登录ajax 请求有效
		            success: function (data){
		            	if(data.result=="0"){
		            		//已注册
		    				$("#reg_area").hide();
		    				$("#bindSucc_area").show();
		            	}else if(data.result=="9"){
		            		$("#vcode").parent().next().html("验证码不正确").show();
		            	}else{
		            		showMsg("系统异常！");
		            	}
		            }
		    });
		}
	});
	$("#userName,#userMobile,#vcode").focus(function(){
		$(this).parent().next().hide();
	});
	$("#regCheckbox").change(function(){
		var status = $(this).get(0).checked;
		if(status)
			$("#btnCodeReg").removeAttr("disabled").attr("style","background-color: #ff7200;border: 1px solid #e34109;color:#fff");
		else
			$("#btnCodeReg").attr({"disabled":"disabled","style":"background-color: #f3f3f3;"});
			
	});
	//提醒在微信上操作
	/*<c:if test="${not empty envFlag}">*/
	if(envFlag == "false"){
		$("#userinfo_area,#code_area,#reg_area,#bindSucc_area").hide();
		 $("#weixinTip").show(); 
	};
		 
	/*</c:if>*/
	//已经绑定 
	/*<c:if test="${empty envFlag && not empty bindFlag}">*/
	
	if(bindFlag == "true"){
		$("#userinfo_area,#code_area,#reg_area").hide();
		 $("#bindSucc_area").show();
	};
	/*</c:if>*/
});