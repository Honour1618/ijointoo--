/*
 * 
 * 爱就投会员登录
 ***/


$(function(){
	loadProjects();
	reSlideView();
});
function loadProjects(){
	$.ajax({
        type: "POST", 
        dataType: "json", 
        url: "PtlWeixin!loadProjects.action?pageSize=3&currentPage=1", //目标地址
        data: { "nosession": true},//nosession 未登录ajax 请求有效 
        error: function (XMLHttpRequest, textStatus, errorThrown) { 
        	showMsg("加载数据出错！");
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
            	   if(name && name.length > 12){
            		   name = name.substring(0,12)+"...";
            	   }else if(name==undefined || name=="undefined"){
            		   name = "";
            	   }
            	   var prjOpType = item.prjOpType;
            	   if(prjOpType == "0")
            		   prjOpType = '<a class="prjTip" href="'+webroot+'/data/comm/plate_0.html">定向板</a>';
            	   else if(prjOpType == "1")
            		   prjOpType = '<a class="prjTip" href="'+webroot+'/data/comm/plate_1.html">优选板</a>';
            		   
            	   html+='<div class="swiper-slide"><a href="'+webroot+'/Mobile.action?appCode=test&method=wxPrj&prjCode='+item.finCode+'" target="_top">'
            	   	    +'<div class="project_panel">'
            	   	 	   +'<div class="project_title">'+name+'</div>'
	            	   	   +'<img src="'+webroot+'/h5/img/'+prejectInfo[0]+'" class="project_status_img"/> '
				           +'<div class="project_info">'
		            	   	   +'<div class="prjlogo"><img src="'+webroot+''+item.compLogo+'"/></div>'
		            	   	   +'<div class="text">'
						           +'<div class="data_item" align="center">'
							           +'<div class="p_font_ora p_font_16">'+moneytrans(item.finAmt)+'元</div>'
							           +'<div class="data_item_label">目标融资</div>'
						           +'</div>'
						           +'<div class="data_item" align="center">'
							           +'<div class="p_font_green p_font_16">'+moneytrans(item.followStartAmt)+'元</div>'
							           +'<div class="data_item_label">起投</div>'
						           +'</div>'
						           +'<div class="data_item" align="center">'
						           	   +'<div class="p_font_green p_font_16">'+prjOpType+'</div>'
							           +'<div class="data_item_label">认证类别</div>'
						           +'</div>'
					           +'</div>'
					           +'<div class="project_end_time" style="font-size: 12px;">'+prejectInfo[1]+'</div>'
				           +'</div>'
	            	   	   +'<div class="c"></div>'
	            	   	   +'<div class="progress_down">'
	            	   		   +'<div class="progress_up" style="width: '+process+';background-color: #07B4A0;"></div>'
            	   	  	   +'</div>'
	            	   	   +'<div class="c"></div>'
		            	   +'<div class="project_info" style="line-height: 30px;padding-left:0px;">'
			            	   +'<div class="data_item" align="center">'
			            	   		+'<span>筹资进度<b class="p_font_green">'+process+'</b></span>'
			            	   +'</div>'
			            	   +'<div class="data_item" align="center">'
			            	   		+'<span>筹资人数<b class="p_font_green">'+moneytrans(item.applyNum)+'人</b></span>'
			            	   +'</div>'
			            	   +'<div class="data_item" align="center">'
			            	   		+'<span>筹资金额<b class="p_font_green">'+moneytrans(item.investAmt)+'元</b></span>'
			            	   +'</div>'
		            	   +'</div>'
            	   	   +'</div>'
            	   	   +'</a></div>';
                });
	        	$("#projectBlock").html(html);
	        	var mySwiper = new Swiper('.swiper-container', {autoplay: 5000,loop : true});
          	}else{
          		showMsg("无更多数据！");
          	}
        }
    });
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
function reSlideView(){
	/*鼠标移过，左右按钮显示*/
	$(".wwwjsdaimacom").hover(function(){
		$(this).find(".prev,.next").fadeTo("show",0.1);
	},function(){
		$(this).find(".prev,.next").hide();
	})
	/*鼠标移过某个按钮 高亮显示*/
	$(".prev,.next").hover(function(){
		$(this).fadeTo("show",0.7);
	},function(){
		$(this).fadeTo("show",0.1);
	});
	$(".wwwjsdaimacom").slide({ titCell:".num ul" , mainCell:".jsdaima" , effect:"fold", autoPlay:true, delayTime:1000 , autoPage:true });
}