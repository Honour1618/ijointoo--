/*
 * 
 * 投资经理信息采集
 * 
 */

var InterValObj; //timer变量，控制时间
var count = 90; //间隔函数，1秒执行
var curCount;//当前剩余秒数
var code = ""; //验证码
var submitBool = false;//默认提交状态
var isCaseSubmitBool = false;
$(function(){
	

	var defaultCheck = 0;
	$("#submit_btn").bind("click" , function(){
		if( !checkInputRole() ) return;
		
		var userMobile = $("#user_mobile").val();//手机号码
		var regCode = $("#reg_code").val();//手机验证码
		var userName = $("#user_name").val();//真实姓名
		
		if( !submitBool ){
			$("#submit_btn").addClass("submiting");
			submitBool = true;
			memcolSubmitData();
			/*window.location.href=webroot+"/PtlTf!investMemHome.action?eqType=mb";*/

		}
	});
	
	$(".form_main input").keydown(function(){
		$(".error_tips").hide();
	});
	$(".form_main input").change(function(){
		$(".error_tips").hide();
	});

	checkSub("#gzCheck");
	checkSub("#jtCheck");
	checkSub("#tzCheck");
    function checkSub(className){
		var n=$(className).children(".checked").size();
		if(n=="" || n== undefined){
			n=0;
		}
    	$(className).on("click","a",function(){
    		if(!$(this).hasClass("checked")){
    			if(n<4){
        			$(this).addClass("checked").parent("div").siblings(".error_tips").hide();
        			
    				n++;
    			}else{
    				$(className).children(".checked").eq(0).removeClass("checked");
    				$(this).addClass("checked");	
    			}
    		}else{
    			$(this).removeClass("checked");
    			n--;	
    		}

    		console.log(n);
    	});
    };
	

	//上传头像预览
	document.getElementById("user_avatar").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#user_avatar_show") , $("#user_avatar_data") , "360");
        }
    });
	//上传名片预览
	document.getElementById("user_bcard").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#user_bcard_show") , $("#user_bcard_data") , "640");
        }
	});
	//上传个人风采照预览
	document.getElementById("user_mien").addEventListener('change' , function(e){
		var files = this.files;
		if(files.length){
			checkFile(this.files , $("#user_mien_show") , $("#user_mien_data") , "640");
		}
	});
	//上传项目图片
	document.getElementById("item_pic").addEventListener('change' , function(e){
		var files = this.files;
		if(files.length){
			checkFile(this.files , $("#item_pic_show") , $("#item_pic_data") , "360");
		}
	});
	
	//form 隐藏域赋值
	/*$(".form_main li input , .form_main li textarea").change(function(){
		var obj = $(this);
		var thisId = obj.attr("id");
		$("#" + thisId + "_hidden").val(obj.val());
		
	});*/
	//屏蔽手机前进提交按钮
	$(".form_main input[type=text]").keydown(function(e){
		if( e.keyCode == 13 ){
			checkInputRole();
			return false;
		}
	});
	
    /*弹出警示框遮罩*/
	$(".common_mask").bind("click" , function(){
		$(".common_mask,.alertShow").hide();
	});
	

	var userQq = $("#user_qq").val();//QQ/微信
	var userEmail = $("#user_email").val();//邮箱
	var userMobile = $("#user_mobile").val();//手机号码
	if(userEmail != ""){
		$(".check_email").attr("checked","checked");
	}
	if(userQq != ""){
		$(".check_qq").attr("checked","checked");
	}
	if(userMobile != ""){
		$(".check_mobile").attr("checked","checked");
	}
	
	//返回到信息提交页
	$(".backCollect").bind("click" , function(){
		$(".bygone").hide();
		$(".form_main").show();
		var Y = $('#goneItem').offset().top;
		$(document).scrollTop(Y);
	});
	
	//判断案例标题和描述离开焦点事件
	isBlurEvent();

	
	$(".compRangStr").change(function(){//区域默认状态的颜色
		var addrColorInit = $(".compRangStr").val();
		if(addrColorInit != ""){
			$(".compRangStr").css({
				color:'#333'
			});
		}else{
			$(".compRangStr").css({
				color:'#999'
			});
		}
	});
	
	$(".compIndustryStr").change(function(){//行业默认状态的颜色
		var addrColorInit = $(".compIndustryStr").val();
		if(addrColorInit != ""){
			$(".compIndustryStr").css({
				color:'#333'
			});
		}else{
			$(".compIndustryStr").css({
				color:'#999'
			});
		}
	});
	
});

/*

//案例增加完成
function exampleData1(){
	var dataObj = $("#form_small_main").serializeArray();
	//发表评论 ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url:webroot + '/PtlTf!ajaxInvestCase.action', //目标地址 
	    data: dataObj,//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.memFeature;
	    	if(msg.result=='0'){
	    		console.log(msgData);
				var html ='<ul class="add_item" data-num="'+msgData.objId+'">'
								+'<li class="add_item">'
									+'<div class="add_item_con">'
										+'<img class="add_item_img" src="'+webroot+'/'+msgData.featureImgUrl+'" />'
										+'<p class="add_item_title">'+msgData.featureTitle+'</p>'
									+'</div>'
									+'<pre class="add_item_detail">'+msgData.featureDesc+'</pre>'
									+'<div class="add_item_fun">'
										+'<div class="add_item_modify">'
											+'<img src="'+webroot+'/file/tf/tfManager/images/modify.png" />'
											+'<span>修改</span>'
										+'</div>'
										+'<div class="add_item_delete" onclick="deleteData(this , \''+msgData.objId+'\');">'
											+'<img src="'+webroot+'/file/tf/tfManager/images/delete.png" />'
											+'<span>删除</span>'
										+'</div>'
									+'</div>'
								+'</li>'
							+'</ul>';
				$("#anList-Box").append(html);
				$(".bygone,.addExample p").hide();
				$(".form_main").show();
				var nowTotal = $(".add_item").attr("data-num");
				$("#addItemId").val(nowTotal);
			}
    		else{
    			alertShow(msg.desc,2000);
    		}
        }
	});
}*/

/*弹出警示框*/
var alertTimer = null;
function alertShow(str , timer){
	$(".alertShow,.common_mask").show();
	$(".alertShow span").html(str);
	clearTimeout(alertTimer);
	alertTimer = setTimeout(function(){
		$(".alertShow,.common_mask").hide();
	} , timer);
}
/*添加案例字符长度实时展示*/
function strnum(inputName,num) {
    $(inputName).on("input propertychange",function () {
        var len=$(this).val().length;
    	var str=$(this).val();
        if(len<num){
            $(this).next(".compNameL").children("strong").text(len);	
        }else{
        	$(this).val(str.substring(0, num));
        	 $(this).next(".compNameL").children("strong").text(num);
            
        }
        $(this).focus();
    });
};

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
 * 是否是中文名
 * @param val
 * @returns
 */
function isChName(val){
	var patrn = /^[\u4E00-\u9FA5]{2,20}$/;	
	if(!patrn.test(val))
		return false;
	else
		return true ;
}


/* 判断上传文件是否为符合图片规范 */
function isImageFile(val){
	var patrn = /\.(jpg|png|gif|jpeg)$/i;
	if (!patrn.test(val))	return false;
	return true;	
}
/* 邮箱验证 */
function isEmail(val){
	var patrn = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if (!patrn.test(val))	return false;
	return true;	
}
/*
//图形验证码
function sendMessage() {
	if( curCount > 0) return;
	$(".error_tips").hide();
	
	var userMobile=$("#user_mobile").val();//手机号
	if(userMobile == null || userMobile.length==0){
		$("#user_mobile_tips").show();
		$("#user_mobile").focus();
		return;
	}else if(!isMobile(userMobile)){
		$("#user_mobile_tips").show();
		$("#user_mobile").focus();
		return;
	}
	var randCode = $("#randCode").val();
	if(randCode=="" || randCode.length <4){
		$("#reg_randcode_tips").show();
		$("#randCode").focus();
		return false;
	}
	
	//向后台发送处理数据
    $.ajax({
    	type: "POST", //用POST方式传输
		dataType: "json", //数据格式:JSON
		url: webroot + '/PtlVCode!applyWithImg.action', //目标地址
		data: { "nosession": true,"tel": userMobile,"randCode":randCode },//nosession 未登录ajax 请求有效
		success: function (msg){ 
			
			if(msg.result == 0){
				InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
				curCount = count;
				//设置button效果，开始计时
			//	$("#btnSendCode").hide();
				$("#v_btn_view").html(curCount + "秒");
			}else if(msg.result == 9){
				window.clearInterval(InterValObj);//停止计时器
				$("#btnSendCode").removeAttr("disabled");//启用按钮
				$("#btnSendCode").removeClass("sign_btn_gray");
				$("#btnSendCode").addClass("btn_valid");
				$("#v_btn_view").html("重新获取");
				code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
				$("#reg_randcode_tips").html(msg.desc).show();
				return ;
			}else if(msg.result == 4){
				$("#reg_randcode_tips").html(msg.desc).show();
				window.clearInterval(InterValObj);//停止计时器
				$("#v_btn_view").html("稍候重试");
				return ;
			}
		}
    });
}*/

//加载动画
function loadingMore(){
	$(".loadingPic,.common_mask").show();
	clearTimeout(alertTimer);
	alertTimer = setTimeout(function(){
		$(".loadingPic,.common_mask").hide();
		alert("网络请求失败...请刷新页面");
	} , 30000);
	
}

//短信验证码
/*function messageCodeCheck(phone , name , code){
	
	$.ajax({
	    type: "POST", //用POST方式传输
	    dataType: "json", //数据格式:JSON
	    url: webroot + "/PtlMobile!ajaxRegedit.action", //目标地址
	    data: { "nosession": true,"tel": phone,"name":name,"validateCode":code  },//session 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	
	    },
	    success: function (msg){ 
	    	submitBool = false;
    		if(msg.result=='9')
    		{
    			$("#reg_code_tips").show();
    			$("#reg_code").focus();
    			$("#submit_btn").removeClass("submiting");
    			return;
    		}
    		else
    		{	
    			loadingMore();
    		//	$("#user_bcard").remove();
    		//	$("#user_avatar_data").remove();
    			$("#user_bcard , #user_avatar").remove();
    		//	var formMain = document.getElementById("form_main");
    		//	formMain.submit();
    			memcolSubmitData();
    		}

    	},
	    error:function (msg){ 
			alert(msg);
	    }
	});
}*/

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
  //动态切换验证码
function changeImagelabel() {
	$(".yzm_img").attr("src" , webroot + "/genVerifyCode.do?dt="+ Math.random());
}

//检验图片提交
function checkFile(files , showObj , dataObj , nowSize){

	if( showObj != undefined ){
		showObj.html("").show();
	}
	
    if (files.length != 0) {
        //获取文件并用FileReader进行读取
        var html = '';
      
    	var orientation = 0;
        EXIF.getData(files[0],function(){
            orientation=EXIF.getTag(this,'Orientation');
        });

        var reader = new FileReader();
        if(!/image\/\w+/.test(files[0].type)){
        	obj.html("请确保文件为图像类型");
            return false;
        }
        
        reader.onload = function(e) {
        	getImgData(this.result,orientation,function(data){
                //这里可以使用校正后的图片data了 
        		
        		if( dataObj != undefined ){
        			dataObj.val(data);
        		}
        		
        		html = '<div class="item"><img src="'+data+'" /></div>';
        		if( showObj != undefined ){
        			showObj.html(html);
        		}
    
            } , nowSize); 
        };
        reader.readAsDataURL(files[0]);
    }
}

//验证输入框规则
function checkInputRole(){
	$(".error_tips").hide();
	var userName = $("#user_name").val();//真实姓名
	if(userName == "" || userName.length < 2 || !isChName(userName))
	{
		$("#user_name_tips").show();
		$("#user_name").focus();
		return false;
	}
	
	/*var userAvatar = $("#user_avatar").val();//上传头像
	if(userAvatar == "" || !isImageFile(userAvatar))
	{
		$("#user_avatar_tips").show();
		$("#user_avatar").focus();
		return false;
	}*/
	var userComName = $("#user_comname").val();//任职公司
	if(userComName == "")
	{
		$("#user_comname_tips").show();
		$("#user_comname").focus();
		return false;
	}
	var userPost = $("#user_post").val();//公司职位
	if(userPost == "")
	{
		$("#user_post_tips").show();
		$("#user_post").focus();
			return false;
	}
	
	//所在区域初始化
    var provincesArr = provinces.split("=");
    var provincesLen = provincesArr.length;
    if(provincesLen > 0){
    	$(".compRangStr option").each(function( k ,v ){
    		var match = $(v).html();
    		if(address == match){
    			$(this).attr("selected","selected");
    			return;
    		}
		});
    }
    var a=document.getElementById("address");
    var b=a.options[a.selectedIndex].value;
    $("#addRangStr").val(b);
    var aVal = $("#address").val();//所在区域
    if(aVal == ""){
    	$("#address_tips").show();
		var addressY = $('#address').offset().top;
		$(document).scrollTop(addressY);
    	return false;
    }
    
    //所在行业初始化
    var compRangListArr = compRangList.split("=");
    var compRangListLen = compRangListArr.length;
    if(compRangListLen > 0){
    	$(".compRangList option").each(function( k , v ){
    		var industryMatch = $(v).html();
    		if(address == industryMatch){
    			$(this).attr("selected","selected");
    			return;
    		}
    	});
    }
    var aIndustry = document.getElementById("industry");
    var industryVal = aIndustry.options[aIndustry.selectedIndex].value;
    $("#industryStr").val(industryVal);
    var userIndustry = $("#industry").val()//所属行业
    if(userIndustry == ""){
    	$("#industry_tips").show();
    	var industryY = $("#industry").offset().top;
    	$(document).scrollTop(industryY);
    	return false;
    }
    
    var userUniversity = $("#user_university").val();//毕业院校
    if(userUniversity == ""){
    	$("#user_university_tips").show();
    	$("#user_university").focus();
    	return false;
    }
	var compNum = 1;//关注领域
	var compLen = $("#gzCheck a.checked").length;
	var compStr = "";
	if(compLen <= 4){
		$("#gzCheck a").each(function( k ,v ){
			if($(v).hasClass("checked")){
				compStr += $(v).attr("data-val");
				if( compNum < compLen ){
					compStr += ",";
				}
				compNum++;
			}
		});
		$("#compRangStr").val(compStr);
	}
	if( compStr == "" ){
		$("#user_industry_tips").show();
		$(document).scrollTop($("#gzCheck").offset().top-100);
		return false;
	}
	
	var jnpNum = 1;//精通技能
	var jnpLen = $("#jtCheck a.checked").length;
	var jnpStr = "";
	if(jnpLen <= 4){
		$("#jtCheck a").each(function( k ,v ){
			if($(v).hasClass("checked")){
				jnpStr += $(v).attr("data-val");
				if( jnpNum < jnpLen ){
					jnpStr += ",";
				}
				jnpNum++;
			}
		});
		$("#jineng").val(jnpStr);
	}
	if( jnpStr == "" ){
		$("#jn_industry_tips").show();
		$(document).scrollTop($("#jtCheck").offset().top-100);
		
		return false;
	}
	
	var preferNum = 1;//投资偏好
	var preferLen = $(".preferRangList a.checked").length;
	var preferStr = "";
	if(preferLen <= 4){
		$(".preferRangList a").each(function( k ,v ){
			if($(v).hasClass("checked")){
				preferStr += $(v).attr("data-val");	
				if( preferNum < preferLen ){
					preferStr += ",";
				}
				preferNum++;
			}
		});
		$("#preferRangStr").val(preferStr);
	}
	if( preferStr == "" ){
		$("#ph_prefer_tips").show();
		$(document).scrollTop($("#tzCheck").offset().top-100);
		return false;
	}
	
	var userIdea = $("#user_idea").val();//投资理念
	if(userIdea == "")
	{
		$("#user_idea_tips").show();
		$("#user_idea").focus();
		return false;
	}
	
	var userCase = $("#user_case").val();//过往案例
	if(userCase == "")
	{
		$("#user_case_tips").show();
		$("#user_case").focus();
		return false;
	}
	/*var userQq = $("#user_qq").val();//QQ/微信
	if(userQq == "")
	{
		$("#user_qq_tips").show();
		$("#user_qq").focus();
		return false;
	}*/
/*	var userEmail = $("#user_email").val();//邮箱
	if(userEmail == "" || !isEmail(userEmail))
	{
		$("#user_email_tips").show();
		$("#user_email").focus();
		return false;
	}*/
	
	var userMobile = $("#user_mobile").val();//手机号码
	if(userMobile == "" || !isMobile(userMobile))
	{
		$("#user_mobile_tips").show();
		$("#user_mobile").focus();
		return false;
	}
	
/*	var userQq = $("#user_qq").val();//QQ/微信
	var userEmail = $("#user_email").val();//邮箱
	var userMobile = $("#user_mobile").val();//手机号码
	if(userQq == "" && userEmail == "" ){
		$("#user_email_tips").show();
		return false;
	}*/
	
/*	var regCode = $("#reg_code").val();//手机验证码
	if(userMobile != "" && regCode == "" )
	{
		$("#reg_code_tips").show();
		$("#reg_code").focus();
		return false;
	}*/
	if($("#user_bcard_show").children("#mpImgUri_preview").get(0)){
		var img=$("#user_bcard_show").children("#mpImgUri_preview").get(0).tagName ;
		if(img == "IMG"){
			
		}
	}else{
		var userBCard = $("#user_bcard").val();//名片
		if(userBCard == "" || !isImageFile(userBCard))
		{
			console.log("选择图片");
			$("#user_bcard_tips").show();
			$("#user_bcard").focus();
			return false;
		}
	};
	


	
	//是否公开
	var isCheckLabel = [];
	$(".check_label").each(function(k , v){
		var $this = $(this).children("input");
		if( $this.prop("checked")==true || $this.prop("checked")=="checked"){
			isCheckLabel[k] = 1;
		}
		else{
			isCheckLabel[k] = 0;
		}
	});
	
	$("#pubChk").val(isCheckLabel);
	if(isCheckLabel == "0,0,0"){
		alert("QQ、邮箱或者手机号必须公开一项");
		return false;
	}
	return true;
}

//图片压缩
function getImgData(dataURL,dir,callback , nowSize){
	
    img = new Image(),
    degree=0;
    img.onload = function() {
    	var degree=0,drawWidth,drawHeight,width,height;
        drawWidth=this.naturalWidth;
        drawHeight=this.naturalHeight;
        //以下改变一下图片大小
        var maxSide = Math.max(drawWidth, drawHeight);
        if (maxSide > nowSize) {
            var minSide = Math.min(drawWidth, drawHeight);
            minSide = minSide / maxSide * nowSize;
            maxSide = nowSize;
            if (drawWidth > drawHeight) {
                drawWidth = maxSide;
                drawHeight = minSide;
            } else {
                drawWidth = maxSide;
                drawHeight = maxSide*maxSide/minSide;
            }
        }
        var canvas=document.createElement('canvas');
        canvas.width=width=drawWidth;
        canvas.height=height=drawHeight; 
        var context=canvas.getContext('2d');
        
        //判断图片方向，重置canvas大小，确定旋转角度
        switch(dir){
            case 3:
                degree=180;
                drawWidth=-width;
                drawHeight=-height;
                break;
            case 6:
                canvas.width=height;
                canvas.height=width; 
                degree=90;
                drawWidth=width;
                drawHeight=-height;
                break;
            case 8:
                canvas.width=height;
                canvas.height=width; 
                degree=270;
                drawWidth=-width;
                drawHeight=height;
                break;
        }
        //使用canvas旋转校正
        context.fillStyle = "#fff";
        context.fillRect(0, 0, canvas.width, canvas.height);   
        context.rotate(degree*Math.PI/180);
        context.drawImage(this,0,0,drawWidth,drawHeight);
        //返回校正图片
        callback(canvas.toDataURL("image/jpeg",1));

    };
    img.src = dataURL;
}

//信息提交
function memcolSubmitData(){
	var dataObj = $("#form_main").serializeArray();
	$.ajax({
	    type: "POST", //用POST方式传输
	    dataType: "json", //数据格式:JSON
	    url: webroot + "/PtlTf!ajaxMemDo.action", //目标地址
	    data: dataObj ,//session 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	alert(XMLHttpRequest);
	    },
	    success: function (msg){ 
	    //	console.log(msg);
	    	$(".loadingPic,.common_mask").hide();
    		if(msg.result=='0')
    		{
    			window.location.href = webroot +  "/PtlTf!investMemHome.action?eqType=mb"+"&investMemInfo.userId="+userId+"&pageInfo.currentPage=1&pageInfo.pageSize=5";   ///PtlTf!investMemHome.action?eqType=mb
    		}
    		else{
    			$("#submit_btn").removeClass("submiting");
    			submitBool = false;
    			alert(msg.desc);
    		}
    	},
	    error:function (msg){
			alert(msg);
	    }
	});
}

//删除添加的项目信息
function deleteData(objId){
	$("#investCase_img"+objId).remove();
	$("#investCase_tle"+objId).remove();
	$("#investCase_dsc"+objId).remove();
	$("#investCaseShow"+objId).remove();
	$.ajax({
	    type: "POST", //用POST方式传输
	    dataType: "json", //数据格式:JSON
	    url: webroot +'/PtlTf!ajaxDelInvstCase.action', //目标地址  新增/PtlTf!ajaxInvestCase.action   修改 /PtlTf!ajaxUpdateInvstCase.action
	    data: {
	    	"nosession":"true",
	    	"memFeature.objId":objId
	    },
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	console.log(XMLHttpRequest.responseText);
	    },
	    success: function (data){ 
    		if(data.result=='0')
    		{
    			console.log("删除成功");
    			$("#addExamCon").children(".add_item").each(function(){
    				if($(this).attr("data-id")==objId){
    					$(this).remove();

    					return;
    				}
    			});
    		}
    		else{
    			console.log(data.message);

    		}
    	}
	});
	
}

//增加案例
function addgoneCon(){
	$("#item_submit").attr("disabled",false);
	$(".compNameL").children("strong").text("0");
	if($(".aitmFlg").size()==5){
		alert("最多添加5个案例！");
		return;
	}
	$("#headerOne").hide();
	$("#headerTwo").show();
	//清空输入项中的缓存
	$("#item_pic_show").find("img").attr("src","");
	/*$("").attr("display","");*/
	$("#item_pic").val('');
	$("#item_name").val("");
	$("#desc_comment").val("");
	$(".bygone").show();
	$(".form_main,#item_pic_show").hide();
	$("#item_submit").attr("dataToType","0");
}

//编辑案例
function editData(t,objId){
	$("#item_submit").attr("disabled",false);
	$(".bygone").show();
	$(".form_main").hide();
	$("#headerOne").hide();
	$("#headerTwo").show();


	//获取值
	var imgSrc = $(t).parent(".add_item_fun").siblings(".add_item_con").children(".add_item_img").attr("src");
	var title = $(t).parent(".add_item_fun").siblings(".add_item_con").children(".add_item_title").text();
	var detail = $(t).parent(".add_item_fun").siblings(".add_item_detail").text();
    var str="";
    str+="<div class='item'>";
    str+="<img src="+webroot+imgSrc+"/>";
    str+="</div>";
	$("#item_pic_show").html();
	
	$("#item_submit").attr({"dataToType":"1","dataId":objId});
	//赋值
	$("#item_pic_show").html(str).show();
	$("#item_pic_show").find("img").attr("src",imgSrc);
	$("#item_name").val(title);
	$("#desc_comment").val(detail);
	$(".compNameL").children("strong").text($("#desc_comment").val().length);
	//传入当前编辑案例的objId
	$("#tmpObjId").val(objId);
}



//判断是案例否能提交
function isCaseSubmit(itemName , desComment){
//	alert(itemName +"--"+2 +"---"+desComment);
	if(itemName != "" && desComment != ""){
		$("#item_submit").addClass("changeColor");
		isCaseSubmitBool = true;
	}
}

/*添加案例，优化保存体验*/
function isBlurEvent(){
	var itemName = '';//项目名称
	var desComment = '';//项目描述
	$("#item_name").blur(function(){
		itemName = $("#item_name").val();//项目名称
		desComment = $("#desc_comment").val();//项目描述
	
		isCaseSubmit(itemName ,desComment );
	});
	$("#desc_comment").blur(function(){
		itemName = $("#item_name").val();//项目名称
		desComment = $("#desc_comment").val();//项目描述
		isCaseSubmit(itemName ,desComment );
	});
}

$("#backBtn").on("click",function(){
	history.back();
});

//增加案例验证
var addAnli=function(){
	var pic=$("#item_pic_data").val();
	var title=$("#item_name").val();
	var desc=$("#desc_comment").val();
	
	if(pic ==""||pic ==undefined){
		alertShow("请添加logo",2000);
		return false;
	}
	
	if(title==""||title.length<2){
		alertShow("请正确填写标题",2000);
		return false;
	}
	
	if(desc==""||desc.length<2){
		alertShow("请正确填写案例描述",2000);
		return false;
	};
	return true;
};
//修改案例验证
var xgAnli=function(){
	var pic=$("#item_pic_data").val();
	var title=$("#item_name").val();
	var desc=$("#desc_comment").val();
	if(title==""||title.length<2){
		alertShow("请正确填写标题",2000);
		return false;
	}
	if(desc==""||desc.length<2){
		alertShow("请正确填写案例描述",2000);
		return false;
	};
	return true;
};
//弹窗
function alertDS(str,eleName){
    $(".common_mask").show();
    $(eleName).show();
    $(eleName+" span").html(str);
    $(".btn-close").on("click",function () {
        $(".common_mask").hide();
        $(eleName).hide();
    });
};


$(function(){
	strnum("#desc_comment",512);
	strnum("#user_idea",50);
	strnum("#user_case",512);
	//是否公开
	checkArr=checkArr.split(",");
	$(".check_label").each(function(i){
		console.log(checkArr[i]);
		console.log($(this));
			if(checkArr[i]=="1"){
				$(this).children("input").prop("checked",true);
		}else{
			$(this).children("input").prop("checked",false);
		}	
	});

	//是否公开点击时判断是否为空，为空则不能勾选
	$(".checkKey").on("input propertychange",function(){
		console.log("--");
		if($(this).val()==""){
			$(this).siblings(".check_label").children("input").prop("checked",false);
		}
	});
	$(".check_label").children("input").change(function(){
		console.log("选择了");
		if($(this).parent(".check_label").siblings(".checkKey").val()==""){
			$(this).prop("checked",false);
			$(this).parent(".check_label").siblings(".error_tips").show();
			console.log($(this).prop("checked"));
		}else{};
	});

	
	//退出登录
    $(".logout__btn").on("click",function(e){
    	console.log("退出");
    	e.stopPropagation();
    	alertDS("退出登录","#alertExit");
    	$("#exitBtn").on("click",function(e){
    		e.stopPropagation();
        	$.ajax({
        	    type: "POST", //用POST方式传输
        	    dataType: "json", //数据格式:JSON
        	    url: webroot + "/PtlPortal!logout.action", //目标地址
        	    data: { "nosession": true},//session 未登录ajax 请求有效
        	    error: function (XMLHttpRequest, textStatus, errorThrown) {},
        	    success: function (msg){ 
        	    	submitBool = false;
            		if(msg.result=='9')
            		{
            			alert("失败");
            			return;
            		}
            		else
            		{	
            			window.location.href=webroot+"/PtlMobile!index.action";
            		}

            	},
        	    error:function (msg){ 
        			alert(msg);
        	    }
        	});
    	});

    });
	
	
	//案例返回
	$("#backPrep").on("click",function(){
		$("#headerTwo").hide();
		$(".bygone").hide();
		$("#headerOne").show();
		$(".form_main").show();
		$("#item_pic_data").val("");
		$("#item_submit").attr("dataid","");
	});
					//过往案例提交
				$("#item_submit").bind("click" , function(){
					
					if($(this).attr("datatotype")=="0"){
						console.log("添加案例");
						var dataObj = $("#form_small_main").serializeArray();
							if(addAnli()){
								$("#item_submit").attr("disabled",true);
								$.ajax({
								    type: "POST", //用POST方式传输
								    dataType: "json", //数据格式:JSON
								    url: webroot + "/PtlTf!ajaxInvestCase.action", //目标地址  新增/PtlTf!ajaxInvestCase.action   修改 /PtlTf!ajaxUpdateInvstCase.action
								    data: dataObj,
								    error: function (XMLHttpRequest, textStatus, errorThrown) {
								    	console.log(XMLHttpRequest.responseText);
								    },
								    success: function (data){ 
							    		if(data.result=='0'){
											// 新增案例
											var caseHtml = "<input type='hidden' name='investCaseData[" + 1
													+ "].featureImgUrl' id='investCase_img" 
													+ "' value='" + dataObj[0].value + "'/>";
											caseHtml += "<input type='hidden' name='investCaseData[" + 1
													+ "].featureTitle' id='investCase_tle" + 1
													+ "' value='" + dataObj[1].value + "'/>";
											caseHtml += "<input type='hidden' name='investCaseData[" + 1
													+ "].featureDesc' id='investCase_dsc" + 1 + "' value='"
													+ dataObj[2].value + "'/>";
											$("#caseInpuHiddens").append(caseHtml);
											
							    			var str="";
							    			str+='<ul class="add_item aitmFlg" id="investCaseShow0" data-id="'+data.memFeature.objId+'">';
							    			str+='<li class="add_item">';
							    			str+='<div class="add_item_con">';
							    			str+='<img class="add_item_img" src="'+webroot+'/'+data.memFeature.featureImgUrl+'">';
							    			str+='<p class="add_item_title">'+data.memFeature.featureTitle+'</p></div><pre class="add_item_detail">'+data.memFeature.featureDesc+'</pre><div class="add_item_fun"><div class="add_item_modify" onclick="editData(this,'+data.memFeature.objId+');"><img src='+webroot+'"/file/tf/tfManager/images/modify.png">';
							    			str+='<span>修改</span>';
							    			str+='</div>';
							    			str+='<div class="add_item_delete" onclick="deleteData('+data.memFeature.objId+');"><img src='+webroot+'"/file/tf/tfManager/images/delete.png"><span>删除</span></div></div>';
							    			str+='</li>';
							    			str+='</ul>';
											// $("#addExamCon").prepend(html);
											$("#addExamCon").append(str);
											$(".bygone").hide();
											$("#headerTwo").hide();
											$(".form_main").show();
											$("#headerOne").show();
											
											/*$("#addItemId").val("");*/
											var itemPic = $("#item_pic").val();//项目图片
								    		if(itemPic == "" || !isImageFile(itemPic)){
								    			$("#investCase_img"+i).val("file/tf/tfManager/images/item_img_bg.png");
								    			$("#investCaseShow"+i).find(".add_item_img").attr("src",webroot+"/file/tf/tfManager/images/item_img_bg.png");
								    		} 
											return ;
							    		}else if(data.result=='9'){
							    			if(data.errorCause =="1"){
							    				//登录失败
							    				window.location.href="${ctx}/PtlTf!perfectInfo.action";
							    				return;
							    			}else if(data.errorCause =="2"){
							    				alertShow("图片上传失败",1000);
							    				return;
							    			}else if(data.errorCause =="3"){
							    				alertShow("图片格式不对 （只支持：jpg, png ,gif, jpeg)",1000);
							    				return;
							    			}else{
							    				alertShow(data.desc,1000);
							    				$("#subApply2").attr({"disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
							    				return;
							    			}
							    		};
							    	}
								});
								
								var Y = $('#goneItem').offset().top;
								$(document).scrollTop(Y);
							}

					}else if($(this).attr("datatotype")=="1"){
						console.log("修改案例");
						var dataObj = $("#form_small_main").serializeArray();
						if($(this).attr("dataid")!=""&& $(this).attr("dataid")!=undefined){
							var n={
									name:"memFeature.objId",
									value:$(this).attr("dataid")
							};
							dataObj.push(n);
						};
						console.log(dataObj);
											// 修改案例
						if(xgAnli()){
							$("#item_submit").attr("disabled",true);
							$.ajax({
							    type: "POST", //用POST方式传输
							    dataType: "json", //数据格式:JSON
							    url: webroot + "/PtlTf!ajaxUpdateInvstCase.action", //目标地址  新增/PtlTf!ajaxInvestCase.action   修改 /PtlTf!ajaxUpdateInvstCase.action
							    data: dataObj,
							    error: function (XMLHttpRequest, textStatus, errorThrown) {
							    	console.log(XMLHttpRequest.responseText);
							    },
							    success: function (data){ 
						    		if(data.result=='0'){
						    			$("#addExamCon").children(".add_item").each(function(){
						    				if($(this).attr("data-id")==data.memFeature.objId){
						    					$(this).remove();
						    				}
						    			});

						    			var str="";
						    			str+='<ul class="add_item aitmFlg" id="investCaseShow0" data-id="'+data.memFeature.objId+'">';
						    			str+='<li class="add_item">';
						    			str+='<div class="add_item_con">';
						    			str+='<img class="add_item_img" src="'+webroot+'/'+data.memFeature.featureImgUrl+'">';
						    			str+='<p class="add_item_title">'+data.memFeature.featureTitle+'</p></div><pre class="add_item_detail">'+data.memFeature.featureDesc+'</pre><div class="add_item_fun"><div class="add_item_modify" onclick="editData(this,'+data.memFeature.objId+');"><img src='+webroot+'"/file/tf/tfManager/images/modify.png">';
						    			str+='<span>修改</span>';
						    			str+='</div>';
						    			str+='<div class="add_item_delete" onclick="deleteData('+data.memFeature.objId+');"><img src='+webroot+'"/file/tf/tfManager/images/delete.png"><span>删除</span></div></div>';
						    			str+='</li>';
						    			str+='</ul>';

									$("#addExamCon").append(str);
									$("#item_submit").attr("dataid","");
										$(".bygone").hide();
										$("#headerTwo").show();
										$(".form_main").show();
										$("#headerOne").show();
										$("#tmpObjId").val("");
										/*window.location.reload();//刷新当前页面.
*/										return ;
						    			
						    		}else if(data.result=='9'){
						    			if(data.errorCause =="1"){
						    				//登录失败
						    				window.location.href="${ctx}/PtlTf!perfectInfo.action";
						    				return;
						    			}else if(data.errorCause =="2"){
						    				alertShow("图片上传失败",1000);
						    				return;
						    			}else if(data.errorCause =="3"){
						    				alertShow("图片格式不对 （只支持：jpg, png ,gif, jpeg)",1000);
						    				return;
						    			}else{
						    				alertShow(data.desc,1000);
						    				$("#subApply2").attr({"disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
						    				return;
						    			}
						    		};
						    	}
							});
							
							var Y = $('#goneItem').offset().top;
							$(document).scrollTop(Y);
						}

					}
					
});
});