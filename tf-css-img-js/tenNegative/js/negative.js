/*
web page for ten nagative
2017-11-06
*/

requirejs.config({
	baseUrl : webroot + "/file/commonJs",
	paths: {
		"jquery": "jquery-2.11.min",
		"zepto" : "zepto.min",
		"sm" : "sm.min",
		"chartjs" : "chart.min"
	}
});
var isApp = false;
var nowWidth = 0;
var nowBl = 0;
requirejs(["jquery"] , function($){
	//用户数据采集	
	var	userDataArr = [];
	var isCheckBox = false;
	
	$(function(){
		var localUrl = window.location.href;
		//页面入口来源
		imageLoad(imgFileArr);
		$.config = {
			autoInit: true
		}
		
		//页面入口来源
		if(document.location.hash != "" && document.location.hash != "#mainWrap"){	
			document.location.hash = "#mainWrap";
		}
		
		nowWidth = $(window).width();
		nowBl = nowWidth/414;
		wechatConfig();

		
		$(".checkInput_label").bind("click" , function(){
			
			if( !isCheckBox ){		
				$(this).find("span").addClass("selected");
				isCheckBox = true;
			}
			else{
				$(this).find("span").removeClass("selected");
				isCheckBox = false;
			}
		});
		//注册页自适应
		
		$(".share_content").css({
			"-moz-transform" : "scale("+ nowBl +")", 
			"-webkit-transform":"scale("+ nowBl +")", 
			"-o-transform":"scale("+ nowBl +")",
			"transform":"scale("+ nowBl +")"
		});
		//验证input
		checkInput();
		
		requirejs(["jquery" ,"zepto" , "sm"] , function($){
			
			setTimeout(function(){
				//初始化hash
				window.location.hash = "#mainWrap";
				
				$("body").ready(function(){
					
					if( isApp || userId != '' ){
						
						$(".qa_main:last").attr("data-next" , "#FEND_0");
					}else{
						
						$(".qa_main:last").attr("data-next" , "#REG_H5");
					}
					
					//imageLoad(imgFileArr);
					
			        $(".qa_ul .qa_li").bind("click" , function(){
			        	var thisObj = $(this);
			        	var nextPageId = thisObj.parent().parent().parent().attr("data-next");
			        	var userData = thisObj.attr("user-data");		        	
			        	thisObj.parent().parent().parent().attr("page-code" , userData);
		        		if(nextPageId == "#FEND_0"){		        		
			        		regDataFunction();		
			        	}
		        		
			        	$(nextPageId).find(".top_el,.goon_btn").removeClass("animated zoomIn");
			        	thisObj.attr("href",nextPageId);
			        	$(nextPageId).find(".qa_li").addClass("animate_running");
			        	_hmt.push(['_trackEvent', '潜力测试', nextPageId, '基本信息问题', '0']);
			        });
				} , 500);
		    });
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
	});
	zmTestCas();//壮苗样式调整
});


//问答问题动画回调
function transformCallback( pageObj ){
	$(".qa_ul .qa_li").hide().removeClass("animate_running");
	$(pageObj).find(".qa_ul .qa_li").show().addClass("animate_running");
}

//录入系统开始
function startCon(){
	$("body,html").css({"background" : "#ffffff"});
	$(".enter_btn").attr("href","#main");
	_hmt.push(['_trackEvent', '项目录入', '开始录入', '潜力测试', '下一步']);
}

//初次信息录入
function startApp(){
	$("body,html").css({"background" : "#ffffff"});
	$(".start_btn").attr("href","#MENU_INFO");
	_hmt.push(['_trackEvent', '潜力测试', '下一步', '首页开始', '1']);
	//$.router.load("#MENU_INFO");
	//FEND_0
}

//第二轮问答动画调动
function next_quiz(){
	$(".goon_btn").attr("href","#TF_INDEX_10");
	$("#TF_INDEX_10").find(".qa_li").addClass("animate_running");
	_hmt.push(['_trackEvent', '潜力测试', '下一步', '心理学切换', '2']);
}

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
			$(".loading_num").html(num);
			if( num == 100 ){
				$(".loading_num").html(100);
				setTimeout(function(){
		            $("#splashscreen").fadeOut(500 , function(){
		            	$("#splashscreen").remove();
		            	$(".main_el_1 , .start_btn").show().addClass("animated zoomIn");
		            	$(".start_btn").show().addClass("animated pulse");
		            	setTimeout(function(){
		        			$(".main_el_2").show().addClass("animated bounceInRight");
		        			$(".main_el_3").show().addClass("animated bounceInLeft");
		        			$(".main_el_4").show().addClass("animated flash");
		        		} , 500);
		            });
		        },1000);
			}
		};
		imgLoad.src = webroot + "/file/tf/tenNegative/img/" + loadImgArr[i];	
	}
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




