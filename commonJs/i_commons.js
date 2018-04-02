	//百度统计
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?58e626be451c5f320e8a30581e18c3d8";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
$(function(){
	//首先将#back-to-top隐藏
	$("#back-to-top").hide();
	//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
	$(window).scroll(function() {
		if ($(window).scrollTop() > 100) {
			$("#back-to-top").fadeIn(500);
		} else {
			$("#back-to-top").fadeOut(500);
		}
	});
	//当点击跳转链接后，回到页面顶部位置
	$("#back-to-top").click(function() {
		$('body,html').animate({
			scrollTop : 0
		}, 100);
		return false;
	});

	//about.html...左侧导航特效
	$(".about_nav li").hover(function(){
		 $(this).removeClass("about_nav_static").addClass("about_nav_hover");
	},function(){
		 $(this).removeClass("about_nav_hover").addClass("about_nav_static");
	});

});
/**
 * index.html文字列表滚动函数
 */
function txt_scroll(){
	var $self = $("#into_companys_list"); 
	var lineHeight = $self.find("div:first").height(); //获取行高

	$self.animate({ "margin-top" : -lineHeight +"px" }, 600 , function(){
		$self.css({"margin-top" : "0px"}).find("div:first").appendTo($self); //appendTo能直接移动元素
	});
}
/**
 * 金额转换
 * @param value
 * @returns {String}
 */
function moneytrans(value){
	if(name==null || name==undefined || name=="undefined"){
		return "0";
	}
	if(value >=10000 && value % 10000 == 0){
		return ""+ (value/10000)+"万";
	}else if(value >=10000 && value % 10000 != 0){
		return ""+ (value/10000)+"万";
	}else{
		return ""+value ;
	}
}
/**
 * 计算百分比：保留2位小数
 * @param current 当前值
 * @param total 总数
 */
function percentage(current,total){
	return (Math.round(current / total * 10000) / 100.00 + "%");
}

/**
 * 计算倒数时间
 * @param leftTime
 * @returns {String}
 */
function leftTimeView(leftTime){
	var leftsecond = parseInt(leftTime/1000); 
	var day=Math.floor(leftsecond/(60*60*24)); 
	var hour=Math.floor((leftsecond-day*24*60*60)/3600); 
	var minute=Math.floor((leftsecond-day*24*60*60-hour*3600)/60); 
	var second=Math.floor(leftsecond-day*24*60*60-hour*3600-minute*60); 
	var innerHtml = "";
	if(day > 0)
		innerHtml += day + "天";
	if(hour > 0)
		innerHtml += hour + "小时";
	if(minute > 0)
		innerHtml += minute + "分";
	if(second >= 0)
		innerHtml += second + "秒";
	return innerHtml;
}
/**
 * 字符转日期
 */
function string2date(DateStr){
	if(typeof DateStr=="undefined")
		return new Date();
	if(typeof DateStr=="date")
		return DateStr;
	var converted = Date.parse(DateStr);
	var myDate = new Date(converted);
	if(isNaN(myDate)){
		DateStr=DateStr.replace(/:/g,"-");
		DateStr=DateStr.replace(" ","-");
		DateStr=DateStr.replace(".","-");
		var arys= DateStr.split('-');
		switch(arys.length){
			case 7 : myDate = new Date(arys[0],--arys[1],arys[2],arys[3],arys[4],arys[5],arys[6]);break;
			case 6 : myDate = new Date(arys[0],--arys[1],arys[2],arys[3],arys[4],arys[5]);break;
			default: myDate = new Date(arys[0],--arys[1],arys[2]);break;
		}
	};
	return myDate;
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
/**
 * 显示消息  页面右下角提示
 * msg 消息内容
 * callback 要执行的回调函数
 */
function f_confirm(msg, callback){
	art.dialog({
		width: 250,
		height: 100,
		lock:true,
		icon: 'question',
		content: msg,
		ok: function() {
			this.close();
			callback();
		},
		cancelVal: '关闭',
		cancel: true//为true等价于function(){}
	});
}
function f_gotoDialog(url,width,height,title){
	if(!title)
		title="详情";
	art.dialog.open(url,{title: title, width: width, height: height});
}
function f_openDialog(_width,_height,title,_html,_id){
	if(!title)
		title="详情";
	if(!_id)
		_id = "mydialog";
	art.dialog({width:_width, height:_height, title: title,content: _html,id:_id,lock: true});
}
//获取网站的根目录
function getRootPath() {
    var pathName = window.parent.location.pathname.substring(1);
    var webName = pathName.indexOf('/') > 0 ? pathName.substring(0, pathName.indexOf('/')) : pathName;
    if (webName == "") {
        return window.location.protocol + '//' + window.location.host + '/';
    }
    // return window.location.protocol + '//' + window.location.host + '/' + webName + '/';
    return window.location.protocol + '//' + window.location.host + '/';
}

//获取完整路径：controller, methodName一定要输入
function getControllerUrl(controller, methodName) {
    if (typeof (controller) == "undefined") {
        alert("请输入控制器名称");
        return "";
    }

    if (typeof (methodName) == "undefined") {
        alert("请输入调用的目标");
        return "";
    }
    return getRootPath()+ controller + "/" + methodName;
}

//窗体自适应大小
function autoResize(options) {
    var size = getGridWidthAndHeigh();
    if ($.isFunction(options.callback)) {
        options.callback(size);
    }
    // 窗口大小改变的时候
    window.onresize = function () {
        var size = getGridWidthAndHeigh(true);
        $(options.dataGrid).jqGrid('setGridHeight', size.height).jqGrid('setGridWidth', size.width);
    };
}
//获取jqgrid宽度和高度
function getGridWidthAndHeigh(resize) {
    return GetJqGridHeight(resize);
}

//获取文档可见区域的宽度
function getDocumentWidth() {
    return document.documentElement.clientWidth;
}

//获取文档可见区域的高度
function getDocumentHeight() {
    return document.documentElement.clientHeight;
}
//获取表格的高度
function GetJqGridHeight(height) {
    var docheight = getDocumentHeight();
    var headheight = 0;
    if ($(".pageHeader").length != 0) {//存在pageHeader 
        headheight = $(".pageHeader").height();
    }
    var panelBarheight = 0;
    if ($(".panelBar").length != 0) {//存在pageHeader 
        panelBarheight = $(".panelBar").height();
    }
    return (docheight - headheight - panelBarheight - 60);
    //    if (isNaN(height))
    //        return (docheight - headheight - 20);
    //    else
    //        return (docheight - headheight - height);
}


//清除HTML标记
function ClearHtml(str) {
    return str.replace(/<[^>]+>/g, "");
}

//转换时间格式
function formatDateTime(value) {
    var d = new Date(+/\d+/g.exec(value));
    return d.toLocaleString();
}

//转换时间格式
function formatDate(value) {
    var d = new Date(+/\d+/g.exec(value));
    return d.toLocaleString();
}

//转换时间格式
function formatShortDate(value) {
    var d = new Date(value);
    return d.toLocaleString();
}
//打开新tab
function openTab(url, title) {
    navTab.openTab("tab" + title, url, { title: title, fresh: true, data: {} });
}

//打开新Iframetab
function openIframeTab(url, title) {
    navTab.openTab("tab" + title, url, { title: title, fresh: true, data: {}, external: true });
}
//验证数据
function CheckData() {
    var flag = true;
    var $requireds = $(".required");
    var html;
    for (var i = 0; i < $requireds.length; i++) {
        if ($requireds.eq(i).val() == "" && $requireds.eq(i).offset().top > 0) {
            flag = false;
            if ($requireds.eq(i).next(".error").length != 0)
                continue;
            html = '<span title="必填字段" class="error">必填字段</span>';
            $requireds.eq(i).after(html);
        } else {
            $requireds.eq(i).next(".error").remove();
        }
    }

    var $mail = $(".email");
    for (var i = 0; i < $mail.length; i++) {
        if ($requireds.eq(i).offset().top > 0 && $mail.eq(i).val() != "" && $mail.eq(i).val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null) {
            flag = false;
            if ($requireds.eq(i).next(".error").length != 0)
                continue;
            html = '<span title="请输入合法的Email" class="error">请输入合法的Email</span>';
            $mail.eq(i).after(html);
        } else {
            $mail.eq(i).next(".error").remove();
        }
    }

    var $phone = $(".phone");
    for (var i = 0; i < $phone.length; i++) {
        if ($requireds.eq(i).offset().top > 0 && $phone.eq(i).val() != "" && $phone.eq(i).val().match(/\d{3}-\d{8}|\d{4}-\d{7}/) == null) {
            flag = false;
            if ($requireds.eq(i).next(".error").length != 0)
                continue;
            html = '<span title="请输入合法的电话" class="error">请输入合法的电话</span>';
            $phone.eq(i).after(html);
        } else {
            $phone.eq(i).next(".error").remove();
        }
    }

    var $number = $(".number");
    for (var i = 0; i < $number.length; i++) {
        if ($requireds.eq(i).offset().top > 0 && isNaN($number.eq(i).val())) {
            flag = false;
            if ($requireds.eq(i).next(".error").length != 0)
                continue;
            html = '<span title="请输入合法的数字" class="error">请输入合法的数字</span>';
            $number.eq(i).after(html);

        } else {
            $number.eq(i).next(".error").remove();
        }
    }

    var $url = $(".url");
    for (var i = 0; i < $url.length; i++) {
        if ($requireds.eq(i).offset().top > 0 && $url.eq(i).val() != "" && $url.eq(i).val().match('[a-zA-z]+://[^\s]*') == null) {
            flag = false;
            if ($requireds.eq(i).next(".error").length != 0)
                continue;
            html = '<span title="请输入合法的Url" class="error">请输入合法的Url</span>';
            $url.eq(i).after(html);

        } else {
            $url.eq(i).next(".error").remove();
        }
    }

    var $lettersonly = $(".lettersonly");
    for (var i = 0; i < $lettersonly.length; i++) {
        if ($requireds.eq(i).offset().top > 0 && $lettersonly.eq(i).val() != "" && $lettersonly.eq(i).val().match(/^[a-zA-Z]+$/) == null) {
            flag = false;
            if ($requireds.eq(i).next(".error").length != 0)
                continue;
            html = '<span title="请输入合法的字母" class="error">请输入合法的字母</span>';
            $lettersonly.eq(i).after(html);

        } else {
            $lettersonly.eq(i).next(".error").remove();
        }
    }

    var $creditcard = $(".lettersonly");
    for (var i = 0; i < $creditcard.length; i++) {
        if ($requireds.eq(i).offset().top > 0 && $creditcard.eq(i).val() != "" || isNaN($creditcard.eq(i).val()) || $creditcard.eq(i).val().length != 19) {
            flag = false;
            if ($requireds.eq(i).next(".error").length != 0)
                continue;
            html = '<span title="请输入合法的银行帐号" class="error">请输入合法的银行帐号</span>';
            $creditcard.eq(i).after(html);

        } else {
            $creditcard.eq(i).next(".error").remove();
        }
    }
    if (!flag)
        alertMsg.warn("请你输入合法的数据！");
    return flag;
}


function formatnewDateTime(value) {
    if (value == "/Date(-62135596800000)/") {
        return "";
    }
    var d = new Date(+/\d+/g.exec(value));
    return d.format("yyyy-MM-dd hh:mm:ss");
}
Date.prototype.format = function (format) {
    var o =
    {
        "M+": this.getMonth() + 1, //month
        "d+": this.getDate(),    //day
        "h+": this.getHours(),   //hour
        "m+": this.getMinutes(), //minute
        "s+": this.getSeconds(), //second
        "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
        "S": this.getMilliseconds() //millisecond
    }
    if (/(y+)/.test(format))
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
    return format;
}


function redirect(url) {
    location.href = url;
}

//检测邮箱格式
function is_email(str) {
    var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    return reg.test(str);
}
//设为首页
function SetHomePage(obj, url) {
    try {
        obj.style.behavior = 'url(#default#homepage)'; obj.setHomePage(url);
    } catch (e) {
        if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            } catch (e) {
                return false;
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage', url);
        }
    }
}
//加入收藏
function AddFavorite(url, title) {
    try {
        window.external.addFavorite(url, title);
    } catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        } catch (e) {
            return false;
        }
    }
}

/**
* 全选checkbox,注意：标识checkbox id固定为为check_box
* @param string name 列表check名称,如 uid[]
*/
function selectall_checkbox(name) {
    if ($("#check_box").attr("checked") == false) {
        $("input[name='" + name + "']").each(function () {
            this.checked = false;
        });
    } else {
        $("input[name='" + name + "']").each(function () {
            this.checked = true;
        });
    }
}
/**
 * 自定义弹出层
 * @param tag 元素Id
 * @param obj
 * @param msg
 * @param color 提示文字颜色
 */
function show(tag, obj, msg, color) {
    $("#whitecontentInfo").html(msg);
    $("#whitecontentInfo").css("color",color);
    var light = document.getElementById(tag);
    light.style.display = 'block';
    $("#"+obj).mousedown(function(e) {
    	target = $("#"+tag);
    	target.css('cursor','move');
    	var offset = target.offset();
    	var x = e.pageX - offset.left;
    	var y = e.pageY - offset.top;
    	$(document).bind("mousemove",function(ex){
    		target.stop();
    		var viewWidth = $(window).width();
        	var viewHeight = $(window).height();
    		var maxWidth = viewWidth - target.width();
    		var maxHeight = viewHeight - target.height();
            var _x = ex.pageX - x;
            var _y = ex.pageY - y;
            if(_x > 0 && _x < maxWidth && _y > 0 && _y < maxHeight){
                target.animate({ left: _x+'px', top:_y+'px'},1);
            }
        });
    });
    $(document).mouseup(function(ex){
    	if(target){
    		if(target.css('cursor')){
                target.css('cursor','pointer');
            }
            $(this).unbind("mousemove");
            var offset = target.offset();
            var x = offset.left;
            var y = offset.top;
            var id = target.attr("id");
    	}
    });

}
/**
 * 隐藏元素
 * @param tag 元素Id
 */
function hide(tag) {
    var light = document.getElementById(tag);
    light.style.display = 'none';
    var fade = document.getElementById('fade');
    if (fade) {
    	fade.style.display = 'none';
	}
}
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
var rd1=new Date().getFullYear();

/**
 * 去除字符串中所有空格
 */
function txtTrim(str) {
    return str.replace(/\s+/g, "");
}
