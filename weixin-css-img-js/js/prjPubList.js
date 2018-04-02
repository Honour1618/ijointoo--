/*
 *
 *项目列表 
 * 
 * */
var isApp = false;
 $(function(){
	//返回箭头
	$('.top_left').bind("click" , function(){
		history.back();
	});
	
	/*判断app,取消共用头部*/
	var appU = navigator.userAgent;

	if( appU.indexOf('ijointoo') > -1){
		
		isApp = true;
		$('#top_wrap').hide();
		$("#wrapper").css({'top':'0px'});
	}
	else{
		isApp = false;
	}
	
	pullUpAction ();
 });	
	
var myScroll,
pullDownEl,
pullDownOffset,
pullUpEl,
pullUpOffset,
generatedCount = 0,
currentPage = 0,
isPageLoad = true;
//下拉刷新 
var pullTimer = null;
function pullDownAction () {
	clearTimeout(pullTimer);
	pullTimer = setTimeout(function () {
		requestIscrollData("down" , 1);
	}, 1000);
}
//上拉加载
function pullUpAction () {
	clearTimeout(pullTimer);
	pullTimer = setTimeout(function (){
		currentPage ++;
		requestIscrollData("up",currentPage);
	},1000);
}
//滚动条数据请求
function requestIscrollData(pullType , currentPage){
	$.ajax({
        type: "POST", 
        dataType: "json", 
        url: "PtlWeixin!loadProjects.action?pageSize=5&currentPage="+currentPage, //目标地址
        data: { "nosession": true},//nosession 未登录ajax 请求有效 
        error: function (XMLHttpRequest, textStatus, errorThrown) { 
        	showMsg("加载数据出错！");
    		myScroll.refresh();
        },
        success: function (data){ 
        	if(data.result == '0'){
        	   var html = '';
               $.each( data.lists, function(index, item){
            	   var currentTime = data.currentTime;
            	   var startTime = item.finStartTime;
            	   var endTime = item.finEndTime;
            	   var prejectInfo = prejectInfoView(currentTime,startTime,endTime,item.finSts);//计算项目进度情况
            	   var process = percentage(item.investAmt,item.finAmt);//进度百分比
            	   var score;
            	   if((item.investAmt/item.finAmt) < 0.45){
            		   score = "#444";
            	   }else{
            		   score = "#fff";
            	   }
            	   var name = item.finName;
            	   /*if(name && name.length > 12){
            		   name = name.substring(0,12)+"...";
            	   }else if(name==undefined || name=="undefined"){
            		   name = "";
            	   }*/
            	   /*var prjOpType = item.prjOpType;
            	   if(prjOpType == "0")
            		   prjOpType = '<a class="prjTip" href="'+webroot+'/data/comm/plate_0.html">优选板</a>';
            	   else if(prjOpType == "1")
            		   prjOpType = '<a class="prjTip" href="'+webroot+'/data/comm/plate_1.html">定向板</a>';*/
            	   var specList = "";
//            	 console.log(item);
            	   var specLists = item.specList;
            	   if(specLists != null && specLists.length > 0){
            		   for(var i=0;i<specLists.length;i++){
            			   specList += '<li>'+specLists[i]+'</li>';
            		   }
            	   }
            	   html+='<a class="project_list_a" href="'+webroot+'/Mobile.action?appCode=test&method=wxPrj&prjCode='+item.finCode+'" target="_top">'
            	   	    +'<div class="project_panel">'
            	   	 	   +'<div class="project_title">'+name+'</div>'
	            	   	   +'<img src="'+webroot+'/h5/img/'+prejectInfo[0]+'" class="project_status_img"/> '
				           +'<div class="project_info pro_info">'
		            	   	   +'<div class="logo"><img src="'+webroot+''+item.finLogoUrl+'"/></div>'
		            	   	   +'<div class="text">'
						           +'<div class="data_item change_w" align="center">'
							           +'<div class="p_font_green p_font_12">¥'+moneytrans(item.followStartAmt)+'元</div>'
							           +'<div class="data_item_label">起投</div>'
						           +'</div>'
						           +'<div class="progress_down">'
			            	   		   +'<div class="progress_up" style="width: '+process+';background:url('+webroot+'/file/h5/weixin/images/item_bar.png);"></div>'
		            	   	  	   +'</div>'
			            	   	   +'<div class="data_item procent" align="center">'
				            	   		+'<span><b class="p_font_green">'+process+'</b></span>'
				            	   +'</div>'
				            	   +'<ul id="item_tag">'
										+specList
							       +'</ul>'
					           +'</div>'
				           +'</div>'
	            	   	   /*+'<div class="c"></div>'  
	            	   	   +'<div class="c"></div>'*/
		            	   +'<div class="project_info itembt">' 
			            	   +'<div class="data_item" align="center">'
			            	   		+'<img src="'+webroot+'/file/h5/weixin/images/item_icon1.png"/>'
			            	   		+'<span><b class="color_r">'+moneytrans(item.investAmt)+'元</b></span>'
			            	   +'</div>'
			            	   +'<div class="data_item project_day" align="center">'
			            	   		+'<img src="'+webroot+'/file/h5/weixin/images/item_icon2.png"/>'
			            	   		+'<span><b>'+moneytrans(item.applyNum)+'人</b></span>'
			            	   +'</div>'
			            	   		+'<div class="data_item project_end_time" style="font-size: 12px;border:0;">'
			            	   		+'<img src="'+webroot+'/file/h5/weixin/images/item_icon3.png"/>'
			            	   		+prejectInfo[1]
            	   			   + '</div>'
		            	   +'</div>'
            	   	   +'</div>'
            	   	   +'</a>';
                });
	        	$("#thelist").append(html);
	        	myScroll.refresh();
	        	//myScroll.scrollTo(0, 100, 200, true);
          	}else{
          		showMsg("无更多数据！");
	        	myScroll.refresh();
          		currentPage--;//当前页无数据，回退一页
          	}
        	$("#pullUp").hide();
        	if(isPageLoad){
        		isPageLoad = false;
        	}
        }
    });
 currentPage++;//下拉加载=下一页	
	
}
//计算剩余融资时间+项目进展情况
function prejectInfoView(_currentTime,_startTime,_endTime,finSts){
	var currentTime = new Date(string2date(_currentTime));
	var startTime = new Date(string2date(_startTime));
	var endTime = new Date(string2date(_endTime));
	var leftTime,innerHtml = "",statusHtml="",statusHtml_bg="",process_img=""; 
	if(finSts==0 || finSts==1 ){//项目未开始
		process_img="process_status_no.png";
		innerHtml = _startTime+"开始";
		statusHtml = "即将开始";
		statusHtml_bg = "process_status_no";
		leftTime = startTime-currentTime;
		//innerHtml = leftTimeView(leftTime)+"开始";
	}else if(finSts==2 || finSts==4 ){//项目进行中
		if(finSts==2)//进行中
			process_img="process_status_in.png";
		if(finSts==4)//超募
			process_img="process_status_over.png";
		
		leftTime = endTime-currentTime;
		innerHtml = leftTimeView(leftTime)+"结束";
		statusHtml = "进行中";
		statusHtml_bg = "process_status_in";
	}else if(finSts==3 || finSts==5 ){//项目已结束
		process_img="process_status_full.png";
		innerHtml = "已结束";
		statusHtml = "已结束";
		statusHtml_bg = "process_status_full";
	}
	return new Array(process_img,innerHtml,statusHtml,statusHtml_bg);
}
