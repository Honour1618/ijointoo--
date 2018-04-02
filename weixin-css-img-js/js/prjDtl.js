$(function(){
	/*固定条取消*/
	 var close=$('.load i');
		var fixedBar=$('.fixed_bar');
		close.click(function(){
			fixedBar.css({display:'none'});
			$('.btn_group').css({bottom:'0'});
			$('#sidebar-tab').css({margin:'10px'});
		})
		
	//返回箭头
	$('.top_left').bind("click" , function(){
		history.back();
	});
		
})