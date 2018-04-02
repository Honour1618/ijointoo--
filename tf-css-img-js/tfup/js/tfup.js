/*
 * 请如实填写您的项目信息（BP扫描）
 * 
 */

$(function(){
	
	menu_rightBar_defaultFun();
	
	 //选区初始化
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
	
	//点击提交项目信息
	$("#btnLogin").bind("click" , function(e){
		if($("#compName").val() == ""){//企业名称
			$("#compName").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			return;
		}else{
			$("#compName").css({"border":"none"});
		}
		
		/*if($("#rscDesc").val() == ""){//寻求资源
			$("#rscDesc").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			$("#compName").css({"border":"none"});
			return;
		}else{
			$("#compName,#rscDesc").css({"border":"none"});
		}*/
		
		var a=document.getElementById("address");
	    var b=a.options[a.selectedIndex].value;
	    $("#compRangStr").val(b);
	    
		//提交
		var formMain = document.getElementById("ajaxForm");
		formMain.submit();
		
	});
	
	
});


