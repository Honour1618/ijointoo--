$(function(){
	
	/*var smlNavLi=$('.smlNav li')
	var focusWrap=$('.focusWrap');
	var firmWrap=$('.firmWrap');
	var investWrap=$('.investWrap');
	活动页面导航
    smlNavLi.eq(0).click(function(event) {
    	focusWrap.css({display: 'block'});
    	firmWrap.css({display: 'none'});
    	investWrap.css({display: 'none'});
    });
    smlNavLi.eq(1).click(function(event) {
    	focusWrap.css({display: 'none'});
    	firmWrap.css({display: 'block'});
    	investWrap.css({display: 'none'});
    });
    smlNavLi.eq(2).click(function(event) {
    	$(this).addClass('change').siblings().removeClass('change');
    	$(this).find(a).addClass('choosed');
    	focusWrap.css({display: 'none'});
    	firmWrap.css({display: 'none'});
    	investWrap.css({display: 'block'});
    });*/
    
	
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
	
	if(type == 1){
		$('#focusItem').addClass('change');
		$('#focusItem a').addClass('choosed');
	}else if(type == 2){
		$('#congressItem').addClass('change');
		$('#congressItem a').addClass('choosed');
	}else if(type == 0){
		$('#investItem').addClass('change');
		$('#investItem a').addClass('choosed');
	}
	
    
})