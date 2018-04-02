/*
info page for ten nagative
2017-11-07
*/

requirejs.config({
	baseUrl : webroot + "/file/commonJs",
	paths: {
		"jquery": "jquery-2.11.min",
		"zepto" : "zepto.min",
		"sm" : "sm.min",
		"exif": "exif",
		"ajaxfileupload": "ajaxfileupload"
	}
});

requirejs(["jquery"] , function($){
	
	$(function(){
		var localUrl = window.location.href;
		
		requirejs(["jquery" ,"zepto" , "sm", "exif","ajaxfileupload"] , function($){
			
			//初始化hash
			window.location.hash = "#homePage";
			
			txtNum('.home_page_info','#creator',512);//创始人简介
			txtNum('.home_page_info','#creatorMood',512);//创业初衷
			txtNum('.home_page_info','#creatorTeam',512);//团队介绍
			txtNum('.home_page_info','#itemBrief',512);//项目简介
			txtNum('.home_page_info','#itemAdvan',512);//竞争优势
			
			picPrev("creatorPic","#creator_pic_show","#creator_pic_data");//创始人图片
			picPrev("teamPic","#team_pic_show","#team_pic_data");//团队图片
			
			//获取load callback
			var dispatchPanelEvent = function(fnc,myPanel){
				if (typeof fnc === "string" && window[fnc]) {
					return window[fnc](myPanel);
				}
				else if(fnc.indexOf(".")!==-1){   
					var scope=window,items=fnc.split("."),len=items.length,i=0;
					for(i;i<len-1;i++){
						scope=scope[items[i]];
						if(scope===undefined) return;
					}
					return scope[items[i]](myPanel);
				}
			};
			$(document).on("panelload",function(e){ 
			   var hasLoad=$(e.target).attr("data-load");
			   return dispatchPanelEvent(hasLoad,e.target);
			});
			$(document).on("panelunload",function(e){
			   var hasLoad=$(e.target).attr("data-unload");
			   return dispatchPanelEvent(hasLoad,e.target);
			});
			
			
		});
		wechatConfig();//微信分享
		
	});
});

function timeValid(btnName, way, cancelTimer){
	var loseTimer = null;
	$(btnName).attr("onclick",null);
	clearTimeout(loseTimer);
	loseTimer = setTimeout(function(){
		$(btnName).attr("onclick",way);
	},cancelTimer);
}

// Page-One
function pageOne(){
	ajaxFileUpload("creatorPic","#creator_pic_show");// 上传创始人图片
	if(!checkout("compName","请输入企业名称")){ return false;};//企业名称
	if(!checkout("creator","请输入创始人信息")){ return false;};//创始人介绍
	if(!checkout("creator_pic_data","请选择图片")){ return false;};//创始人图片
	
	$("body,html").css({"background" : "#ffffff"});
	$(".page-one").attr("href","#pageTwo");
	timeValid(".page-one", "pageOne()", 3000);
	_hmt.push(['_trackEvent', '项目录入', '开始录入', '企业信息', '下一步']);
}

// Page-Two
function pageTwo(){
	ajaxFileUpload("teamPic","#team_pic_show");// 上传创业团队图片
	if(!checkout("creatorMood","请输入创始初衷")){ return false;};//创始初衷
	if(!checkout("creatorTeam","请输入团队介绍")){ return false;};//团队介绍
	if(!checkout("team_pic_data","请选择图片")){ return false;};//团队图片
	
	$("body,html").css({"background" : "#ffffff"});
	$(".page-two").attr("href","#pageThree");
	timeValid(".page-two", "pageTwo()", 3000);
	_hmt.push(['_trackEvent', '项目录入', '开始录入', '创业团队', '下一步']);
}

//第二轮问答动画调动
function next_quiz(){
	$(".goon_btn").attr("href","#TF_INDEX_10");
	$("#TF_INDEX_10").find(".qa_li").addClass("animate_running");
	_hmt.push(['_trackEvent', '潜力测试', '下一步', '心理学切换', '2']);
}

//检验输入信息
function checkout(idName,msg){
	var idName = $("#"+idName).val();
	if(idName == ""){
		alert(msg);
		return false;
	}
	return true;
}

function mediaPlayObj(obj){
	
	//音乐播放
	var oMedia = document.getElementById('media_obj');
	var mediaType = $(oMedia).attr("data-media");
	if( mediaType == "false" ){	
		oMedia.pause();
		$(oMedia).attr("data-media" , "true");
		$(obj).removeClass("btnRotate");
	}
	else{
		oMedia.play();
		$(oMedia).attr("data-media" , "false");
		$(obj).addClass("btnRotate");
	}
	 	
}

//监听字数
function txtNum(eleBox,inputName,num){
	var l=$(inputName).val().length;  
	$(inputName).next(".compNameL").children("strong").text(l);
	$(eleBox).on('input propertychange',inputName,function() {
        var len=$(this).val().length;
    	var str=$(this).val();
       	var s=$(this).next(".compNameL").children("strong");
        if(len<=num){
            s.text(len);	
        }else{
        	$(this).val(str.substring(0, num));
        	 s.text(num);
            return;
        }
        $(this).focus();
	});
}

//检验图片提交
function checkFile(files , showObj , dataObj){

	if( showObj != undefined ){
		showObj.html("").show();
	}
	
    if (files.length != 0) {
        //获取文件并用FileReader进行读取
        var html = '';
      
    	var orientation = 0;
        EXIF.getData(files[0],function(){
            orientation=EXIF.getTag(this,'Orientation');
        });

        var reader = new FileReader();
        if(!/image\/\w+/.test(files[0].type)){
        	obj.html("请确保文件为图像类型");
            return false;
        }
        
        reader.onload = function(e) {
        	getImgData(this.result,orientation,function(data){
                //这里可以使用校正后的图片data了 
        		
        		if( dataObj != undefined ){
        			dataObj.val(data);
        		}
        		html = '<div class="item"><img src="'+data+'" alt="img" class="real_pic"></div>';
        		if( showObj != undefined ){
        			showObj.html(html);
        		}
    
            }); 
        };
        reader.readAsDataURL(files[0]);
    }
}
		
//图片压缩
function getImgData(dataURL,dir,callback){
	
    img = new Image(),
    degree=0;
    img.onload = function() {
    	var degree=0,drawWidth,drawHeight,width,height;
        drawWidth=this.naturalWidth;
        drawHeight=this.naturalHeight;
        //以下改变一下图片大小
        var nowSize = 640;
        var maxSide = Math.max(drawWidth, drawHeight);
        if (maxSide > nowSize) {
            var minSide = Math.min(drawWidth, drawHeight);
            minSide = minSide / maxSide * nowSize;
            maxSide = nowSize;
            if (drawWidth > drawHeight) {
                drawWidth = maxSide;
                drawHeight = minSide;
            } else {
                drawWidth = minSide;
                drawHeight = maxSide;
            }
        }
        var canvas=document.createElement('canvas');
        canvas.width=width=drawWidth;
        canvas.height=height=drawHeight; 
        var context=canvas.getContext('2d');
        
        //判断图片方向，重置canvas大小，确定旋转角度
        switch(dir){
            case 3:
                degree=180;
                drawWidth=-width;
                drawHeight=-height;
                break;
            case 6:
                canvas.width=height;
                canvas.height=width; 
                degree=90;
                drawWidth=width;
                drawHeight=-height;
                break;
            case 8:
                canvas.width=height;
                canvas.height=width; 
                degree=270;
                drawWidth=-width;
                drawHeight=height;
                break;
        }
        //使用canvas旋转校正
        context.rotate(degree*Math.PI/180);
        context.drawImage(this,0,0,drawWidth,drawHeight);
        //返回校正图片
        callback(canvas.toDataURL("image/jpeg",1));

    };
    img.src = dataURL;
}

//上传图片预览
function picPrev(idName,showObj,dataObj){
	document.getElementById(idName).addEventListener('change', function(e){
	    var files = this.files;
	    if(files.length){
	        checkFile(this.files , $(showObj) , $(dataObj));
	    }
	    $("#"+idName).parent(".home_page_info").find(".alt_pic").css({"display":"block"});
	});
}

//完善信息-ajax-提交
function checkInfo(){

	var a=document.getElementById("address");//所在区域
    var b=a.options[a.selectedIndex].value;
    $("#compRangStr").val(b);
    
    if(!checkout("itemBrief","请输入项目简介")){ return false;};//项目简介
	if(!checkout("itemAdvan","请输入竞争优势")){ return false;};//竞争优势
    
    var compName = $("#compName").val();//企业名称
	var a=document.getElementById("address");
    var addr=a.options[a.selectedIndex].value;//所在城市
	var creator = $("#creator").val();//创始人介绍
	//var creator_pic_data = $("#creator_pic_data").val();//创始人图片
	var creator_pic_data = $("#creator_pic_show").attr("data-path");//创始人图片
	
	var creatorMood = $("#creatorMood").val();//创业初衷
	var creatorTeam = $("#creatorTeam").val();//团队介绍
	//var team_pic_data = $("#team_pic_data").val();//团队图片
	var team_pic_data = $("#team_pic_show").attr("data-path");//团队图片
	
	var itemBrief = $("#itemBrief").val();//项目简介
	var itemAdvan = $("#itemAdvan").val();//竞争优势
	timeValid(".page-btn", "checkInfo()", 3000);
	$.ajax({
      type: "POST", //用POST方式传输
      dataType: "json", //数据格式:JSON
      url: 'PtlMobile!saveAjax.action', //目标地址
      data: { "nosession": true,  "compName":compName,"address":addr,"founderBrief":creator ,"founderImg":creator_pic_data,"mood":creatorMood ,"teamBrief":creatorTeam,"teamImg":team_pic_data,"prjBrief":itemBrief,"advantage":itemAdvan},//nosession 未登录ajax 请求有效
      error: function (XMLHttpRequest, textStatus, errorThrown) { 
      	alert(errorThrown);
      },
      success: function (msg){
    	  console.log(msg);
		  if(msg.result=='0' ){
			  window.location.href = webroot + "/PtlMobile!finalResult.action?prjCode=" + msg.prjCode;
		  } else {
			  alert(msg.desc);
		  }
      }
  });
}

// 文件上传
function ajaxFileUpload(fileId,show) {
    $.ajaxFileUpload({
	    url: webroot + '/upload.do', //用于文件上传的服务器端请求地址
	    secureuri: false, //是否需要安全协议，一般设置为false
	    fileElementId: fileId, //文件上传域的ID
	    dataType: 'json', //返回值类型 一般设置为json
	    success: function (data, status)  //服务器成功响应处理函数
	    {
	        $(show).attr("data-path", data.path);
	        if (typeof (data.error) != 'undefined') {
	            if (data.error != '') {
	                alert(data.error);
	            } else {
	                alert(data.msg);
	            }
	        }
	    },
	    error: function (data, status, e)//服务器响应失败处理函数
	    {
	        alert(e);
	    }
    })
    return false;
}
