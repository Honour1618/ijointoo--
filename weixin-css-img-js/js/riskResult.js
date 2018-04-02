/*
 * 
 * 风险测评结果
 * 
 */
$(function(){
	 setTimeout(function(){
		 var v_height = $(window).height();
		 var contentHeight = $(".bodyBox").height();
		 var offset = v_height - contentHeight;
		 if(offset>0){
			 var  _height = $(".tip_comp_theme").height();
			 $(".tip_comp_theme").height(_height+offset);
		 }
	 }, 100);
	 
	 var browser={
	    versions:function(){
	            var u = navigator.userAgent, app = navigator.appVersion;
	            return {         //移动终端浏览器版本信息
	                trident: u.indexOf('Trident') > -1, //IE内核
	                presto: u.indexOf('Presto') > -1, //opera内核
	                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
	                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
	    mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端 
	                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端 
	                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
	               iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
	               iPad: u.indexOf('iPad') > -1, //是否iPad
	               webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
	            };
        }(),
        language:(navigator.browserLanguage || navigator.language).toLowerCase()
	};
	if(browser.versions.mobile==false){
	   $(".down_group").hide();//PC端的url地址
	}
	
	if(!isWeiXin()){
		$("#share_block").hide();
	}
	//分享 
	$("#btnShare").click(function(){
		wx.onMenuShareAppMessage(dataForWeixin);
	});
	
	/*返回*/
    $("#top_wrap .top_left").bind("click" , function(){
		history.back();
	});
	
	/*固定条的关闭按钮*/
	var close=$('.load i');
	var fixedBar=$('.fixed_bar');
	close.click(function(){
		fixedBar.css({display:'none'});
		$('.footer').css({margin:'0'});
	})
	
	/*判断app,取消共用头部*/
	var appU = navigator.userAgent;

	if( appU.indexOf('ijointoo') > -1){
		
		isApp = true;
		$('.fixed_bar').hide();
	}
	else{
		isApp = false;
	}
	
 });
 //app下载
 function  download(){
	 location.replace( webroot + "/download/download.html");
 }
 //判断是否微信内置浏览器
 function isWeiXin() {
	var ua = window.navigator.userAgent.toLowerCase();
	if (ua.match(/MicroMessenger/i) == 'micromessenger') {
		return true;
	} else {
		return false;
	}
 }