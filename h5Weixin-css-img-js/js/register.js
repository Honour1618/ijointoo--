/*
 * 
 * 爱就投平台项目众筹
 ***/

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
        url: webroot +"/PtlVCode!applyWithImg.action", //目标地址
        data: { "nosession": true,"tel": phoneVal,"randCode":randCode },//nosession 未登录ajax 请求有效
        error: function (XMLHttpRequest, textStatus, errorThrown) { },
        success: function (msg){
        	if(msg.result == 9)
        	{
		        window.clearInterval(InterValObj);//停止计时器
		        $("#btnSendCode").removeAttr("disabled");//启用按钮
		        $("#btnSendCode").removeClass("sign_btn_gray");
		        $("#btnSendCode").addClass("btn_valid");
		        $("#v_btn_view").html("重新获取");
		        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
        		alert(msg.desc);
        		return ;
        	}
        	else if(msg.result == 4)
        	{
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
function changeImagelabel() {
	document.getElementById("image1").src = webroot +"/genVerifyCode.do?dt="+ Math.random();
}

function autoImg(){
	var win_width = $(window).width();
	if(win_width>640)
		win_width = 640;
	var scale = win_width / 640;
	var top_offset = 390 * scale;
	var img_btn_width = 200 * scale;
	$("#btn_rule").css("top",top_offset + "px");
	$("#btn_rule img").width(img_btn_width);
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
	
	});
	
	autoImg();
});