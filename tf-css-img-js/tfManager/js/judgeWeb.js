/*
 * 
 * 导师认证-判断版本信息
 *  * *  */

$(function(){
	//判断浏览器是PC还是mobile
	var isBrowser={
		versions:function(){
			var u = navigator.userAgent, app = navigator.appVersion;
			return{//移动终端浏览器版本信息
				trident: u.indexOf('Trident') > -1, //IE内核
				presto: u.indexOf('Presto') > -1, //opera内核
				webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
				gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
				mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
				ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
				android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
				iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
				iPad: u.indexOf('iPad') > -1, //是否iPad
				webApp: u.indexOf('Safari') == -1 //是否web应用程序，没有头部与底部
			};
		}(),
		language:(navigator.browserLanguage || navigator.language).toLowerCase()
	}
	//判断浏览器，PC访问直接跳转PC，MOBILE访问跳转MOBILE
	if(isBrowser.versions.mobile || isBrowser.versions.ios || isBrowser.versions.android || isBrowser.versions.iPhone || isBrowser.versions.iPad){
		/*window.location.href= webroot + "/PtlActivity!lureNU.action";*/
	}else{//在PC,导师样式调整
		$('html,body,.page2').css({
			'min-width': '253px',
			'height': '436px',
			'overflow-x': 'hidden'
		});
		$(".swiper-slide").css({'height': '436px'});
		$(".helpBtn").css({'bottom': '18px'});
		$(".teac-msg-box").css({'width': '94%'});
		$(".user-img-show").css({'width': '193px'});
		$(".teac-msg-box>dd>input").css({'font-size': '10px'});
		$(".success-box img").css({
			'width': '80%',
		    'margin-left': '-40%'
		});
	}
});