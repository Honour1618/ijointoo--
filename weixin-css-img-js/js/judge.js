$(function(){

	//设备版本判断
	var subNavLi=$('.subNav li');
	//判断浏览器是PC还是mobile
	var isBrowser={  
		versions:function(){   
		 var u = navigator.userAgent, app = navigator.appVersion;   
		 return {//移动终端浏览器版本信息   
		   trident: u.indexOf('Trident') > -1, //IE内核  
		   presto: u.indexOf('Presto') > -1, //opera内核  
		   webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核  
		   gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核  
		   mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端  
		   ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端  
		   android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器  
		   iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器  
		   iPad: u.indexOf('iPad') > -1, //是否iPad    
		   webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部  
		  };  
		  }(),  
		  language:(navigator.browserLanguage || navigator.language).toLowerCase()  
	}   
	//判断浏览器，PC访问直接跳转PC,MOBILE访问跳转MOBILE
	if(isBrowser.versions.mobile || isBrowser.versions.ios || isBrowser.versions.android ||   
			isBrowser.versions.iPhone || isBrowser.versions.iPad){
		
		}else{
			if(selectFlg == "index"){
				window.location.href =webroot +  "/";
			}else if(selectFlg == "activity"){
				window.location.href = webroot + "/web_acts";
			}else if(selectFlg == "news"){
				window.location.href = webroot + "/web_news";
			}
	}
	/*设备版本判断*/
});