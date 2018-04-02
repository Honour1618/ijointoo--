/*
 * 请如实填写您的项目信息（BP扫描）
 * 
 */

$(function(){
	
	
	menu_rightBar_defaultFun();
	
	//点击提交项目信息
	$("#btnLogin").bind("click" , function(e){
		
		if($("#userAvatar").val() == ""){//创业情怀
			$("#userAvatar").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			return;
		}
		
		//提交
		var formMain = document.getElementById("ajaxForm");
		formMain.submit();
		
		
	});
});

//限制输入字数
function LimitTextArea(field){ 
	maxlimit=512;
	var realNum = field.value.length;
	var numM = maxlimit - realNum;
	if(numM >= 0){
		$(".compNameL strong").html(numM);
	}else{
		field.value = field.value.substring(0, maxlimit);
		$(".compNameL strong").css("color","#f74a3d");
	}
}