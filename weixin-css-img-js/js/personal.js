/*
 * 个人中心
 * 
 * */

$(function() {
	
	var subNavLi=$('.subNav li');
	var indexWrap=$('.index_wrap');
	var actWrap=$('.activity_wrap');
	var infoWrap=$('.info_wrap')
	var smlNavLi=$('.smlNav li')
	var newContent=$('.newContent');
	var product=$('.product');
	var free=$('.free');

    /*导航*/
	subNavLi.eq(0).click(function(event) {
		$(this).addClass('current').siblings().removeClass('current');
		indexWrap.css({display: 'block'});
		actWrap.css({display: 'none'});
		infoWrap.css({display: 'none'});
	});
	subNavLi.eq(1).click(function(event) {
		$(this).addClass('current').siblings().removeClass('current');
		indexWrap.css({display: 'none'});
		actWrap.css({display: 'block'});
		infoWrap.css({display: 'none'});
	});
	subNavLi.eq(2).click(function(event) {
		$(this).addClass('current').siblings().removeClass('current');
		indexWrap.css({display: 'none'});
		actWrap.css({display: 'none'});
		infoWrap.css({display: 'block'});
	});
    
    /*活动页面导航*/
    smlNavLi.eq(0).click(function(event) {
    	$(this).addClass('change').siblings().removeClass('change');
    	newContent.css({display: 'block'});
    	product.css({display: 'none'});
    	free.css({display: 'none'});
    });
    smlNavLi.eq(1).click(function(event) {
    	$(this).addClass('change').siblings().removeClass('change');
    	newContent.css({display: 'none'});
    	product.css({display: 'block'});
    	free.css({display: 'none'});
    });
    smlNavLi.eq(2).click(function(event) {
    	$(this).addClass('change').siblings().removeClass('change');
    	newContent.css({display: 'none'});
    	product.css({display: 'none'});
    	free.css({display: 'block'});
    });
    

});