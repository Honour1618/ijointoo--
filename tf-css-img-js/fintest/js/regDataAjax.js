/*
landing page for reg ajax
2016-06-20
*/


/**
 * 验证手机号
 * @param s
 * @returns {Boolean}
 */
function isMobile(s){
	//电信号段:133/153/180/181/189/177；
	//联通号段:130/131/132/155/156/185/186/145/176/175/166；
	//移动号段：134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
	var patrn= /^(13[0-9]|14[579]|15[0-9]|16[6]|17[135678]|18[0123456789])\d{8}$/ ;
	if (!patrn.test(s))
		return false;
	return true;
}


/**
 * 验证真实姓名
 * @param s
 * @returns {Boolean}
 */
function isChName(val)
{
	reg = /^[\u4E00-\u9FA5]{2,20}$/;	
	if(!reg.test(val)){
		return false;
	}
	else
		return true ;
}


//焦点事件处理
function checkInput(){

	$(".form_main select , .form_main textarea").focus(function(){
		$(this).addClass("press");
	});
}

//动态切换验证码
function changeImagelabel() {
	$(".yzm_img").attr("src" , "/genVerifyCode.do?dt="+ Math.random());
}


var InterValObj; //timer变量，控制时间
var count = 90; //间隔函数，1秒执行
var curCount;//当前剩余秒数
var code = ""; //验证码

function sendMessage() {
	var phoneVal = $("#reg_mobile").val();
 	curCount = count;
	if(phoneVal == null || phoneVal.length==0){
		$("#reg_mobile_tips").show();
		$("#reg_mobile").focus();
		return;
	}else if(!isMobile(phoneVal)){
		$("#reg_mobile_tips").show();
		$("#reg_mobile").focus();
		return;
	}
	/*
	var randCode = $("#randCode").val();
    if(randCode=="" || randCode.length <4 || randCode=="图形验证码" ){
    	$("#reg_randcode_tips").show();
    	$("#randCode").focus();
    	return false;
    }*/
    
	//设置button效果，开始计时
    $("#btnSendCode").attr("disabled", "true");
    $("#btnSendCode").removeClass("btn_valid");
    $("#btnSendCode").addClass("sign_btn_gray");
    $("#v_btn_view").html(curCount + "秒");
    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
	//向后台发送处理数据
    $.ajax({
        type: "POST", //用POST方式传输
        dataType: "json", //数据格式:JSON
        url: 'PtlVCode!applyWith.action', //目标地址
        data: { "nosession": true,"tel": phoneVal , "rd" : new Date().getFullYear() },//nosession 未登录ajax 请求有效
        error: function (XMLHttpRequest, textStatus, errorThrown) { },
        success: function (msg){
   
        	if(msg.result == 9)
        	{	
		        window.clearInterval(InterValObj);//停止计时器
		        $("#btnSendCode").removeAttr("disabled");//启用按钮
		        $("#v_btn_view").html("重新获取");
		        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
        		alert(msg.desc);
        		return ;
        	}else if(msg.result == 4)
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

//注册成功后，弹出层信息
function regSuccessPop(msg){
	$(".pop_txt").html('');
	$(".show_mask").show();
	$(".pop_txt").html(msg);
}

//获取url参数
function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
} 

//分享引导
function shareFriend(){
	$("#share_mask").fadeIn(500);
	$("#share_mask").bind("click" , function(){
		
		$(this).fadeOut(500);
	});
	
}


//问答页面的icon风

/**
 * 是否是中文名
 * @param val
 * @returns
 */
function isChName(val){
	var reg = /^[\u4E00-\u9FA5]{2,20}$/;	
	if(!reg.test(val))
		return false;
	else
		return true ;
}



//临时存储用户所属行业、所属阶段、项目简称
function recordInfoFunction(){
	$(".error_tips").hide();
	var compName = $("#reg_comname").val();
	if(compName == "" || compName.length < 3 )
	{
		$("#reg_comname_tips").show();
		$("#reg_comname").focus();
		return false;
	}
	var selectJdVal = $("#reg_jd_select").val();//所属阶段
	if(selectJdVal == "0")
	{
		$("#reg_select_jd_tips").show();
		$("#reg_jd_select").focus();
		return false;
	}
	var selectVal = $("#reg_select").val();//所属行业
	if(selectVal == "0")
	{
		$("#reg_select_tips").show();
		$("#reg_select").focus();
		return false;
	}
	
	//$.afui.loadDiv("#TF_INDEX_0" ,false , false);
	$(".start_quiz").attr("href","#TF_INDEX_0");
	$("#TF_INDEX_0").find(".qa_li").addClass("animate_running");
	_hmt.push(['_trackEvent', '潜力测试', '开始测试', '基本信息录入', '3']);
}

//注册ajax提交
function regDataFunction(){
	
	var userDataArr = [];
	var qaObj = $(".qa_main");
	var qaLen = qaObj.length;
	
	for( var i = 0 ; i < qaLen ; i ++){
		
		if(qaObj.eq(i).attr("page-code") != ""){
			
			userDataArr.push(qaObj.eq(i).attr("page-code"));	
		}
	}
	
	var UserDataStr =  userDataArr.join(",");
	var compName = $("#reg_comname").val();
	var selectJdVal = $("#reg_jd_select").val();//所属阶段
	var selectVal = $("#reg_select").val();//所属行业
	var telVal = $("#reg_mobile").val();
	var regCode = $("#reg_code").val();
	var userName = $("#reg_name").val();
	var cf = getQueryString('cf');//渠道
	
	/*相亲大会标记*/
	var dhurl = window.location.search;
	var dhloc = dhurl.substring(dhurl.lastIndexOf('=')+1, dhurl.length); 
	
	$.ajax({
      type: "POST", //用POST方式传输
      dataType: "json", //数据格式:JSON
      url: 'PtlTest!submitAjax.action', //目标地址
      data: { "nosession": true,"uid":userId, "compName":compName , "finStage":selectJdVal, "comIndustry":selectVal ,"tel":telVal,"validateCode":regCode ,"name":userName,"userDataArr":UserDataStr , "cf":cf,"vote":dhloc},//nosession 未登录ajax 请求有效
      error: function (XMLHttpRequest, textStatus, errorThrown) { 
      	alert(errorThrown);
      },
      success: function (msg){
    	  if(msg.dateMeeting == "dateMeet"){
    		  if(msg.result=='0' ){
    			  alert("你已成功完成预报名，请将商业计划书发送至market@ijointoo.com，工作人员会在收到计划书三日内告知预选结果");
    			  window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
    		  } else if(msg.result=='1' || msg.result=='2'){
    			  alert("你已提交过项目，请耐心等待预选结果");
    			  window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
    		  } else {
    			  alert(msg.desc);
    		  }
    	  }else if(msg.dateMeeting == "usually"){
    		  if(msg.result=='0' ){
    			  _hmt.push(['_trackEvent', '潜力测试', '查看得分', '提交成功', '9']);
    	  			window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
    		  } else if(msg.result=='1' || msg.result=='2'){
    			  _hmt.push(['_trackEvent', '潜力测试', '查看得分', '提交成功', '9']);
    	  			alert(msg.desc);
    	  			setTimeout(function(){
    	  				window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
    	  			} , 3000);
    		  } else {
    			  alert(msg.desc);
    		  }
    	  }
    	 /* console.log(msg);
  		if(msg.result=='0' )
  		{
  			if(msg.dateMeeting == "dateMeet"){
  				console.log(msg.dateMeeting);
  				console.log(111);
  				alert("你已成功完成预报名，请将商业计划书发送至market@ijointoo.com，工作人员会在收到计划书三日内告知预选结果");
  				window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
  			} else if(msg.dateMeeting == "usually"){
  				console.log(222);
  				_hmt.push(['_trackEvent', '潜力测试', '查看得分', '提交成功', '9']);
  	  			window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
  			}
  		}else if(msg.result=='1' ){
  			console.log(msg.dateMeeting);
  			console.log(333);
  			if(msg.dateMeeting == "dateMeet"){
  				alert("你已提交过项目，请耐心等待预选结果");
  				window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
  			} else if(msg.dateMeeting == "usually"){
  				console.log(444);
  				_hmt.push(['_trackEvent', '潜力测试', '查看得分', '提交成功', '9']);
  	  			alert(msg.desc);
  	  			setTimeout(function(){
  	  				
  	  				window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
  	  			} , 3000);
  			}
  			
  		}else if(msg.result=='2'){
  			if(msg.dateMeeting == "dateMeet"){
  				alert("你已提交过项目，请耐心等待预选结果");
  				window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
  			} else if(msg.dateMeeting == "usually"){
  				console.log(444);
  				_hmt.push(['_trackEvent', '潜力测试', '查看得分', '提交成功', '9']);
  	  			alert(msg.desc);
  	  			setTimeout(function(){
  	  				
  	  				window.location.href = webroot + "/PtlTest!finRst.action?prjCode=" + msg.prjCode;
  	  			} , 3000);
  			}
  		}
  		else
  		{
  			alert(msg.desc);
  		}*/
      }
  });
}

//最后一步登录注册提交验证
function checkResultPage(){
	
	$(".error_tips").hide();
	var userName = $("#reg_name").val();
	if(userName == "" || userName.length < 2 || !isChName(userName))//真实姓名
	{
		$("#reg_name_tips").show();
		$("#reg_name").focus();
		return false;
	}
	var userMobile = $("#reg_mobile").val();//手机号码
	if(userMobile == "" || !isMobile(userMobile))
	{
		$("#reg_mobile_tips").show();
		$("#reg_mobile").focus();
		return false;
	}
	var regCode = $("#reg_code").val();//所属行业
	if(regCode == "" || regCode < 3)
	{
		$("#reg_code_tips").show();
		$("#reg_code").focus();
		return false;
	}
	
	regDataFunction();
	_hmt.push(['_trackEvent', '潜力测试', '查看得分', '点击按钮', '5']);
}

//壮苗项目提交，局部样式修改
function zmTestCas(){
	//设备版本判断~start~
	//判断浏览器是PC还是mobile
	var isBrowser={  
		versions:function(){   
		 var u = navigator.userAgent, app = navigator.appVersion;   
		 return {//移动终端浏览器版本信息   
		   trident: u.indexOf('Trident') > -1, //IE内核  
		   presto: u.indexOf('Presto') > -1, //opera内核  
		   webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核  
		   gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核  
		   mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端  
		   ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端  
		   android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器  
		   iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器  
		   iPad: u.indexOf('iPad') > -1, //是否iPad    
		   webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部  
		  };  
		  }(),  
		  language:(navigator.browserLanguage || navigator.language).toLowerCase()  
	}   
	//判断浏览器，PC访问直接跳转PC,MOBILE访问跳转MOBILE
	if(isBrowser.versions.mobile || isBrowser.versions.ios || isBrowser.versions.android ||   
			isBrowser.versions.iPhone || isBrowser.versions.iPad){
		
	}else{
		$("#mainview").addClass("zmTest");
	};
	//设备版本判断~end~
}


