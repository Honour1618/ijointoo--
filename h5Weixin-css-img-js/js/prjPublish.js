/*
 * 
 * 爱就投平台项目众筹
 ***/

var ua = navigator.userAgent.toLowerCase();
if (/ipad|ipod|iphone/i.test(ua)) {
	$("#p_up").hide();
}
function hideMsg(){
	$("#msg_panel").hide();
}
function myCheckbox(obj,thisobj){
	var o = document.getElementById(obj);
	if(o.checked){
		thisobj.style.backgroundImage='url('+webroot+'/mobile/checkOff.JPG)';
		o.checked = false;
		$("#submit").attr("disabled","disabled");
	}else{
		thisobj.style.backgroundImage='url('+webroot+'/mobile/checkOn.JPG)';
		o.checked = true;
		$("#submit").removeAttr("disabled");
	}
}
function getFileName(obj){
	var strFileName=obj.value.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1");  //正则表达式获取文件名，不带后缀
    return strFileName;
}

function getFileExt(obj){
    return obj.value.replace(/.+\./,"");
}

function showInfo(obj){
	if(getFileExt(obj).toLowerCase()!="pptx" &&  getFileExt(obj).toLowerCase() != "pptx"&&  getFileExt(obj).toLowerCase() != "pdf"){
		alert("文件格式要求为ppt 或pptx或pdf类型的压缩文件");
		obj.value = "";
		return ;
	}
}
function validate(){
	var phone=$("#rUserMobile").val();//手机号
	if(phone == null ){
		alert("请先输入手机号码");
		return false;
	}else if(!/^\d{11,11}$/.test(phone)){
		alert("手机号码11位，请正确输入");
		$("#rUserMobile").focus();
		return false;
	}
	return true ;
}