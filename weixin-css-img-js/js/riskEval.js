/*
 * 风险测评
 * 
 * */
$(function(){
	
	/*返回*/
	$("#top_wrap .top_left").bind("click",function(){
		history.back();
	})
	
	/*$(".list_item").find(" .input_item_box:last").attr("style","border-bottom:1px solid #f3f3f3;");*/
	var msg_tip=$("#msg_tip");
	if(msg_tip !=null){
		$("#msg_tip").html(msgTip).slideDown("slow");
	}
	$("#btn_submit").click(function(){
		$(".list_item").removeAttr("style");
  	  	$("#myForm").submit();
    });
	$(".input_item_box").click(function(){
		$(this).parent().find(".input_item_box").removeClass("item_bg");
  	  	$(this).addClass("item_bg");
		$(this).siblings("div").children("input").each(function(){
			if($(this).attr("checked")==true || $(this).attr("checked")=="checked"){
    			$(this).attr("checked",false);
			}
		});
  	  	$(this).find("input").attr("checked",true);
    });
	$("form").submit(function(e){
		var canContinue = true ;
		$(".list_item").each(function(){
			var val = $(this).find(":radio:checked").val();
			if(val == undefined || val.length == 0){ 
				$(this).attr("style","border:1px solid red"); 
				canContinue = false ;
			}
		});
		if(!canContinue){
			alert("你还有题目未选择！");
		}
	    return canContinue ;
	});
}); 