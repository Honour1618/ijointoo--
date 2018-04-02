/*
 * 
 * 爱就投会员登录
 ***/

var myScroll,
	pullDownEl, 
	pullDownOffset,
	pullUpEl,
	pullUpOffset,
	generatedCount = 0,
	currentPage = 1,
	hideMsgTime = 2000,
	isPageLoad = true;
//下拉刷新 
function pullDownAction () {
	 myScroll.refresh();
}
//滚动翻页
function pullUpAction () {
	 $.ajax({
	        type: "POST", 
	        dataType: "json", 
	        url: "PtlWeixin!loadCkProjects.action?pageSize=5&currentPage="+currentPage, //目标地址
	        data: { "nosession": true},//nosession 未登录ajax 请求有效 
	        error: function (XMLHttpRequest, textStatus, errorThrown) { 
	        	showMsg("加载数据出错！");
        		myScroll.refresh();
	        },
	        success: function (data){
	        	var html = '';
	        	if(data.result == '0'){
	               $.each( data.lists, function(index, item){
	            	   var currentTime = data.currentTime;
	            	   var startTime = item.startTime;
	            	   var endTime = item.endTime;
	            	   var prjDesc = item.prjDesc;
	            	   if(prjDesc==undefined || prjDesc=="undefined"){
	            		   prjDesc = "";
	            	   }
	            	   var reViewTime = item.crtTime;
	            	   if(reViewTime && reViewTime.length>=10){
	            		   reViewTime = reViewTime.substring(0,10);
	            	   }
	            	   html+=''
	            	   	    +'<div class="project_panel" onclick="gotoDtl(\''+item.objId+'\')">'
		            	   	   +'<div class="project_title">'+item.prjName+'</div>'
		            	   	   +'<div class="project_content">'+prjDesc+'</div>'
		            	   	   +'<div class="project_comp_link"><a href="'+item.compUrl+'">'+item.compName+'</a></div>'
	            	   	   	+'</div>';
	                });
		        	$("#thelist").append(html);
		        	myScroll.refresh();
		        	myScroll.scrollTo(0, 100, 200, true);
	          	}else{
	          		showMsg("无更多数据！");
		        	myScroll.refresh();	
	        		currentPage--;//当前页无数据，回退一页
	          	}
	        	$("#pullUp").hide();
	        	if(isPageLoad){
		        	$("#btn_group").show();
	        		isPageLoad = false;
	        	}
	        }
	    });
		currentPage++;//下拉加载=下一页
}
function gotoDtl(objId){
	location.href = webroot +"/PtlActivity!showProjectVote.action?objId="+objId;
}
$(document).ready(function(){
	pullUpAction ();
    $(".fakeloader").fakeLoader({timeToHide:1200,bgColor:"#07b4a0",spinner:"spinner1"});
});