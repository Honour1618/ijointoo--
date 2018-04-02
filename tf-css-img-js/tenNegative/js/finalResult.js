/*
web page for ten nagative
2017-11-06
*/

requirejs.config({
	baseUrl : webroot + "/file/commonJs",
	paths: {
		"jquery": "jquery-2.11.min"
	}
});
requirejs(["jquery"] , function($){
	
	$(function(){
		imageLoad(imgFileArr);
		wechatConfig();//微信分享
	});
});

//图片预加载
function imageLoad(loadImgArr){
	var len = loadImgArr.length;
	var n = 100/len;
	var imgLoadNum = 0;
	var imgLoad = null;
	var num = 0;
	for(var i = 0; i<len; i++)
	{
		imgLoad = new Image();
		imgLoad.onload = function(){
			imgLoadNum++;
			num = parseInt(n * imgLoadNum);
			$(".loading_num span").html(num);
			if( num == 100 ){
				$(".loading_num span").html(100);
				setTimeout(function(){
		            $("#splashscreen").fadeOut(500 , function(){
		            	$("#splashscreen").remove();
		            	$(".result_score_main").show();
		            });
		        },300);
			}
		};
		imgLoad.src = webroot + "/file/tf/tenNegative/img/" + loadImgArr[i];	
	}
}



