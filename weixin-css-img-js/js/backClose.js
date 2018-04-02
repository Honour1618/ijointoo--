$(function(){
	/*返回*/
    $("#top_wrap .top_left").bind("click" , function(){
		history.back();
	});
    
    /*固定条的关闭按钮*/
	var close=$('.load i');
	var fixedBar=$('.fixed_bar');
	close.click(function(){
		fixedBar.css({display:'none'});
		$('..watchItem').css({margin:'0'});
	})
})