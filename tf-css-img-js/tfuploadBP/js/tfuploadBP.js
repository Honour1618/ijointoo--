/*
 * 请如实填写您的项目信息（BP扫描）
 * 
 */

$(function(){
	
	var bbt = $("#plantBook").val();
	if(bbt != "" || rspBussPPT != ""){
		$(".preImageContent").show();
	};
	
	menu_rightBar_defaultFun();
	
	//点击提交项目信息
	$("#btnLogin").bind("click" , function(e){
		
		var plantBook = $("#plantBook").val();
		if(plantBook == "" && rspBussPPT == ""){//商业计划书
			$("#plantBook").focus().css("outline-color","#f74a3d");
			return;
		}
		
		//提交
		var formMain = document.getElementById("ajaxForm");
		formMain.submit();
		
	});
	$("#plantBook").change(function(){
		var fileA = $(this).val();
		$(".abLoad").html(fileA);
		
	});
});

























