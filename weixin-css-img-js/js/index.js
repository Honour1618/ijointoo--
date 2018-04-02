$(function() {
	
	//项目进度条动画
	function proProgress(){
		var liObj = $(".itemCon");
		var li_len = liObj.length;
		liObj.find("#progress_main i").css({"width" : "0"});
		for(var i=0; i< li_len ; i++){
			var dataNum = liObj.eq(i).attr("data-num");
			if(dataNum>=100){
				dataNum=100;
			}
			liObj.eq(i).find("#progress_main i").animate({
				"width" : dataNum + "%"
			} , 1000);
		}
		
	}
	proProgress();


	/*固定条的关闭按钮*/
	var close=$('.load i');
	var fixedBar=$('.fixed_bar');
	close.click(function(){
		fixedBar.css({display:'none'});
		$('.footer').css({margin:'0'});
	})
	
	
	/*轮播图效果*/
	TouchSlide({ 
		slideCell:"#focus",
		titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
		mainCell:".bd ul", 
		effect:"leftLoop", 
		autoPlay:true,//自动播放
		autoPage:true //自动分页
	});
	/*轮播效果完成*/
	
	
	/*banner图结束*/
	
	/*hot热线*/
	$('.hot').click(function(){
		$('.hotwire').show();
		$('.xy').show();
	});
	$('.xy').click(function(){
		$('.hotwire').hide();
		$('.xy').hide();
	})
	$('.cancel').click(function(){
		$('.hotwire').hide();
		$('.xy').hide();
	})
	
	
	Wa_SetImgAutoSize();
	/*意见反馈弹出窗*/
	$('#suggestion').click(function(){
		$('.about_msg').show();
		$('.indexInfo').hide();
	})
	
});
/*意见反馈弹出窗*/
/**
 * 验证手机号
 * @param s
 * @returns {Boolean}
 */
function isMobil(s){
	//电信号段:133/153/180/181/189/177；
	//联通号段:130/131/132/155/156/185/186/145/176；
	//移动号段：134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
	//var patrn= /^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
	var patrn= /^(13[0-9]|14[57]|15[0-9]|17[678]|18[012356789])\d{8}$/ ;
	if (!patrn.test(s)) 
		return false;
	return true;
}
/**
 * 去除字符串中所有空格
 */
function txtTrim(str) {
    return str.replace(/\s+/g, "");
}
/**
 * 显示消息  页面右下角提示
 * msg 消息内容
 * msgType 消息类型：info、success、warning、error、loading
 */
function f_tip(msg, msgType){
	if(!msgType){
		msgType = 'info';
	}
	art.dialog({
	    width: 300,
	    height: 100,
	    lock:true,
	    time:1.5,
	    icon: msgType,
	    content: msg
	});
}
function sendSysReback(){
	var userName = $("#userName").val();
	var userMobile = $("#userMobile").val();
	var content = $("#content").val();
	var s_url =  "PtlPortal!ajaxSuggest.action"
	if(userId!=""){//会员已登录
		s_url += "?userId="+userId;
	}else{
		if(txtTrim(userName).length==0){
			alert("请输入你的姓名！");
			return false;
		}
		if(!userMobile){
			alert("请输入手机号！");
			return false;
		}
		if(!isMobil(userMobile)){
			alert("手机号格式不正确！");
			return false;
		}
	}
	if(content.length==0){
		alert("请填写反馈意见！");
		return false;
	}
	$.ajax({
        type: "post", //使用post方法访问后台 
        dataType: "json",
        url: s_url,
        data: { "nosession": true, "userName":userName, "userMobile":userMobile, "content": content},//nosession 未登录ajax 请求有效
         success: function (data) {
             if (data.result == 0) {//发送成功
            	 f_tip("感谢你的反馈，我们将尽快处理！");
            	 art.dialog.list['suggest_dialog'].close();
             }else{
            	 alert("服务器响应出错！")
             }
        }
    });
}


/*banner图开始*/

function Wa_SetImgAutoSize(){
	//var img=document.all.img1;//获取图片
//	var img=obj;
//	var MaxWidth=640;//设置图片宽度界限
//	var MaxHeight=170;//设置图片高度界限
/*	var HeightWidth=img.offsetHeight/img.offsetWidth;//设置高宽比
	var WidthHeight=img.offsetWidth/img.offsetHeight;//设置宽高比
	if(img.readyState!="complete")return false;//确保图片完全加载
	if(img.offsetWidth>MaxWidth){
	img.width=MaxWidth;
	img.height=MaxWidth*HeightWidth;
	}
	if(img.offsetHeight>MaxHeight){
	img.height=MaxHeight;
	img.width=MaxHeight*WidthHeight;
	}*/
	var img=$('.bd li img');
	var windowWidth = $("body").width();
	var imgRealHeight = windowWidth * 170/640;
	img.css({
		height : imgRealHeight,
		width: windowWidth
		
	});
	
	
}

/*数量信息轮播开始*/
function autoScroll(obj){
   $(obj).find("ul").animate({
       marginTop : "-26px"
   },500,function(){
       $(this).css({marginTop : "0px"}).find("li:first").appendTo(this);
   })
}
$(function(){
   setInterval('autoScroll("#demo")',2000);
})
/*数量信息轮播结束*/