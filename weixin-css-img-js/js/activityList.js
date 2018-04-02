/*
 * 
 * 活动页
 * 
 */
var myScroll,
		pullDownEl, 
		pullDownOffset,
		pullUpEl,
		pullUpOffset,
		generatedCount = 0,
		currentPage = 1,
		activityType = 1,
		isPageLoad = true;
//下拉刷新 
function pullDownAction () {
	myScroll.refresh();
}
//上拉加载
function pullUpAction () {
	 $.ajax({
	        type: "POST", 
	        dataType: "json", 
	        url: "PtlMobile!loadActivities.action?pageSize=5&activityType="+activityType+"&currentPage="+currentPage, //目标地址
	        data: { "nosession": true},//nosession 未登录ajax 请求有效 
	        error: function (XMLHttpRequest, textStatus, errorThrown) { 
	        	showMsg("加载数据出错!");
        		myScroll.refresh();
	        },
	        success: function (data){ 
	        	var html = '';
	        	if(data.result == '0'){
	               $.each( data.lists, function(index, item){
	            	   if(activityType==1){//普通活动  最新活动
	            		   var time = item.activityTm;
	            		   var address = item.activityAddr;
	            		   var text = item.activitySummary;
	            		   if(text && text.length > 130){
	                		   text = text.substring(0,130)+"...";
	                	   }else if(text==undefined || text=="undefined"){
	                		   text = "";
	                	   }	
	                	   if(!time){
	                		   time = "";
	                	   }
	                	   if(!address){
	                		   address = "";
	                	   }	
	            	   	   html+='<div class="activity" onclick="gotoActInfo(\''+item.activityNo+'\')">'
		            	   			   +'<img src="'+webroot+'/'+item.mediaURI+'"   class="userlogo"/> '
			            	   	 	   +'<div class="other-club">'
				            	   	   		+'<h4>'+item.activityTitle+'</h4>'
			            	   	   			+'<div class="other-address"><img src="'+webroot+'/file/h5/weixin/images/new_icon01.png" style="width:15px;margin-right:5px;"><span>'+time+'</span></div>'
			            	   	   			+'<div class="other-time"><img src="'+webroot+'/file/h5/weixin/images/new_icon02.png" style="width:15px;margin-right:5px;"><span>'+address+'</span></div>'
							                +'<div class="other_txt">'+text+'</div>'
						               +'</div>'
	            	   	   	  	 +'</div>';
	            	   	}
	            	   if(activityType==2 || activityType==3){//产品众筹 公益众筹 
	            		   var expectAmt = item.expectAmt;
	            	   	   var totalReqAmt = item.totalReqAmt;
	            	   	   var process = '0.00%';
	            	   	   var txtFlag='进行中';
	            	   	   var txtFlagStyle='process_ing';
	            	   	   if(item.finishFlag){
	            	   		   txtFlag='已结束';
	            	   		   txtFlagStyle='process_end';
	            	   	   }
	            	   	   if(expectAmt!=0){
	            	   		  process = percentage(totalReqAmt,expectAmt);
	            	   	   }
	            		   html+='<div class="activity location" onclick="gotoActInfo(\''+item.activityNo+'\')">'
				            		   +'<div class="'+txtFlagStyle
				            		   +'">'
											/*+'<b></b>'*/
											+'<i>'+txtFlag+'</i>'
											/*+'<span>'+txtFlag+'</span>'*/
										+'</div>'
		            	   			   +'<img src="'+webroot+'/'+item.mediaURI+'"   class="userlogo"/> '
			            	   	 	   +'<div class="activity_zc">'
				            	   	   		+'<div class="activity_title" style="margin-top:5px;">'+item.activityTitle+'</div>'
						               +'</div>'
						               +'<div class="row proBar" style="margin-left: 0px;">'
							              +'<div class="proWrap">'
							              		+'<div class="progress-bar progress-bar-success inprogressBar1 proIn" role="progressbar" aria-valuemin="0" aria-valuemax="100" id="progressBar" style="width:'+process+';max-width:100%;min-width:40px;">'/*+process*/
							              		+'</div>'
								       	  +'</div>'
								       +'</div>'
						               +'<div class="activity-yc ">'
								           // +'<div class="progressbar">'
									          //  +'<div class="progress_up" style="width: '+process+';background-color: #6699FF; height:100%;"></div>'
								           // +'</div>'
								           +'<div class="progressMain">'
												+'<div class="nummber1">'
													+'<div class="container" style="width:100%;">'
														+'<div class="row ">'
															/*+'<img src="'+webroot+'/h5/img/1.png" alt="" class="load col-xs-2">'*/
														+'<span class="col-xs-5 congress"><b>'+(totalReqAmt/100).toFixed(2)+'元</b><br/>已预约</span>'
														+'<span class="col-xs-9 congress"><b>'+item.yuanExpectAmt+'元</b><br/>筹资目标</span>'
														+'<span class="col-xs-4 congress" style="background:none;">'+'<font>'+item.curNum+'</font>'+'<br/>支持人数</span>'
													+'</div>'
												+'</div>'		
												+'</div>'
												+'<div class="nummber2">'
													+'<div class="row">'
														/*+'<img src="'+webroot+'/h5/img/2.png" alt="" class="col-xs-3 load1">'*/
													+'</div>'
												+'</div>'
											+'</div>'
								           // +'<div class="activity-y">'
								           // 		// +'<span class="configRight">已筹金额:'+'<font>¥'+(totalReqAmt/100).toFixed(2)+'元</font>'+'</span>'
								           // 		// +'<span>'+'<font>'+process+'</font>'+'<br>剩余时间</span>'
								           // +'</div>'
						               +'</div>'
	            	   	   	  	 +'</div>';
	            	   }
	            	   if(activityType == 7){
	            		   var time = item.activityTm;
	            		   var address = item.activityAddr;
	            		   var text = item.activitySummary;
	            		   if(text && text.length > 130){
	                		   text = text.substring(0,130)+"...";
	                	   }else if(text==undefined || text=="undefined"){
	                		   text = "";
	                	   }	
	                	   if(!time){
	                		   time = "";
	                	   }
	                	   if(!address){
	                		   address = "";
	                	   }	
	            	   	   html+='<div class="activity" onclick="gotoActInfo(\''+item.activityNo+'\')">'
		            	   			   +'<img src="'+webroot+'/'+item.mediaURI+'"   class="userlogo"/> '
			            	   	 	   +'<div class="other-club">'
				            	   	   		+'<h4>'+item.activityTitle+'</h4>'
			            	   	   			+'<div class="other-address"><img src="'+webroot+'/file/h5/weixin/images/new_icon01.png" style="width:15px;margin-right:5px;"><span>'+time+'</span></div>'
			            	   	   			+'<div class="other-time"><img src="'+webroot+'/file/h5/weixin/images/new_icon02.png" style="width:15px;margin-right:5px;"><span>'+address+'</span></div>'
							                +'<div class="other_txt">'+text+'</div>'
						               +'</div>'
	            	   	   	  	 +'</div>';
	            	   }
	                });
		        	$("#thelist").append(html);
		        	myScroll.refresh();
		        	//myScroll.scrollTo(0, 100, 200, true);
	          	}else{
	          		showMsg("无更多数据！");
	          		myScroll.refresh();
	        		currentPage--;//当前页无数据，回退一页
	          	}
	        	if(isPageLoad){
	        		isPageLoad = false;
	        	}
	        	$("#pullUp").hide();
	        	showloading(false);
	        }
	    });
	 currentPage++;//下拉加载=下一页
}

function gotoActInfo(activityNo){
	var s_url = webroot+"/PtlSignup!actRegInit.action?activityNo="+activityNo;
	if(uid!=null && uid.length>0)
		s_url += "&uid="+uid;
	window.location.href = s_url;
}
$(document).ready(function(){
	//$(".fakeloader").fakeLoader({timeToHide:1000,bgColor:"#07b4a0",spinner:"spinner1"});
	activityType = 1;
	//pullUpAction();
	$("#title li").bind("click" , function(){
		showloading();
		$("#title li").removeClass("choosed");
		$("#title li a").removeClass("current");
		$(this).addClass("choosed");
		$(this).children('a').addClass("current");
		$("#thelist").html("");
		currentPage = 1;
		activityType = $(this).attr("id");
		pullUpAction();
	});
	
	/*取消空白页*/
	if(isFrm == "app"){
		$('.top').css({top:'0'});
		$('#scroller').css({padding:'0'});
	}
	
	/*固定条的关闭按钮*/
	var close=$('.load i');
	var fixedBar=$('.fixed_bar');
	close.click(function(){
		fixedBar.css({display:'none'});
		$('.page_body').css({'margin-bottom':'0'});
	})
	
	//不同url参数
	var actTypeChoose = getQueryString('actType');
	if(actTypeChoose == 1){
		$("#title li#1").trigger("click");
	}else if(actTypeChoose == 2){
		$("#title li#2").trigger("click");
	}else{
		window.reload=$("#title li#1").trigger("click");
	}
	
});

//获取url参数
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
}





