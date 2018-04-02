/*
 * 请如实填写您的项目信息（BP扫描）
 * 
 */

$(function(){
	
	//返回上一步
	$(".fan").bind("click",function(){
		history.back();
	});
	
	$(".myStory").bind("click",function(){//故事模板
		$(".storyTwo,.storyThree,.body_style").hide();
		$(".storyOne,.delete").show();
	});
	$(".yourStory").bind("click",function(){//专业模板
		$(".storyOne,.storyThree,.body_style").hide();
		$(".storyTwo,.delete").show();
	});
	$(".hiStory").bind("click",function(){//情怀模板
		$(".storyTwo,.storyOne,.body_style").hide();
		$(".storyThree,.delete").show();
	});
	$(".delete").bind("click",function(){
		$(".storyOne,.storyTwo,.storyThree").hide();
		$(".body_style").show();
		var Y = $('.storyMood').offset().top;
		$(document).scrollTop(Y);
	});
	
	var isApp = false;
	/*判断app,取消共用头部*/
	var appU = navigator.userAgent;

	if( appU.indexOf('ijointoo') > -1){
		
		isApp = true;
		$('.topNav').hide();
		$(".i_button").attr("href","FaS")
	}
	else{
		isApp = false;
	}
	
	//页面锚点跳转
	var pageNumb = getQueryString('pageNum');
	setTimeout(function(){
		if(pageNumb == 1){
			var Y = $('#basicInfo').offset().top;
			$(document).scrollTop(Y);
		}else if(pageNumb == 2){
			var Y = $('#creatInfo').offset().top;
			$(document).scrollTop(Y);
		}else if(pageNumb == 3){
			var Y = $('#creatMood').offset().top;
			$(document).scrollTop(Y);
		}else if(pageNumb == 4){
			var Y = $('#teamInfo').offset().top;
			$(document).scrollTop(Y);
		}else if(pageNumb == 5){
			var Y = $('#prjInfo').offset().top;
			$(document).scrollTop(Y);
		}
	},100);
});

//获取url参数
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
}

//APP跳转
function gotoActivity(){
	jump.toActivity();
}




