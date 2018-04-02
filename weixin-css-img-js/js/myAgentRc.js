/*
 *联合合伙人 
 * 
 */

var currentPage = 1;
$(function(){
	
	/*返回*/
	$("#top_wrap .top_left").bind("click",function(){
		history.back();
	});
	
	/*固定条的关闭按钮*/
	var close=$('.load i');
	var fixedBar=$('.fixed_bar');
	close.click(function(){
		fixedBar.css({display:'none'});
		$('.footer').css({margin:'0'});
	});
	
	$("#nav li").click(function(){
        $("#nav li").removeClass("active")
        $(this).addClass("active");
    });

	$("#loadCurrentAgent").click(function(){
		$("#loadCurrentAgent_box").show();
		$("#loadHistoryAgent_box").hide();
		$("#loadAgentResult_box").hide();
	});
	$("#loadHistoryAgent").click(function(){
		/* $("#historyAgent_box").html("");
		loadHistoryAgent(currentPage); */
		$("#loadCurrentAgent_box").hide();
		$("#loadHistoryAgent_box").show();
		$("#loadAgentResult_box").hide();
	});
	$("#loadAgentResult").click(function(){
		$("#loadCurrentAgent_box").hide();
		$("#loadHistoryAgent_box").hide();
		//$("#loadAgentResult_box").show();
	});
	$("#btnLoadHisAgent").click(function(){
		currentPage++;
		loadHistoryAgent(currentPage);
	});
	
});
  

//加载项目列表-一行
function loadHistoryAgent(currentPage){
  showloading();
    $.ajax({
        type: "POST", //用POST方式传输
        dataType: "json", //数据格式:JSON
        url: "PtlActivity!loadHistoryAgent.action?currentPage="+currentPage+"&pageSize=15", //目标地址
        data: { "nosession": true, userId:agentUid},//nosession 未登录ajax 请求有效 
        error: function (XMLHttpRequest, textStatus, errorThrown) { 
        	showMessage("加载数据出错!");
        },
        success: function (data){ 
        	var html = '';
        	if(data.result == '0'){
        	   var totalSize = 0;
               $.each( data.lists, function(index, item){
            	   html+='<div style="background-color:white;margin-top:20px;cursor: pointer;" onclick="toDetail('+item.objId+',true)">'
            	   	    +'<div style="padding-left:20px;"><div class="dian"></div>'+item.prjName+'</div>'
            	   	    +'<div style="padding-left:30px;color:#6B6B6B;">项目开始时间：'+item.signStartTime+'</div>'
            	   	    +'<div style="padding-left:30px;color:#6B6B6B;">项目开始时间：'+item.signEndTime+'</div>'
            	   	    +'<div style="padding-left:30px;border-top:1px solid #c2c2c2;">推荐人数：<span style="color:#ff6633;">'+item.totalNum+'</span>人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;预约总额：<span style="color:#ff6633;">'+item.totalAmtStr+'</span>元</div>'
            	   	+'</div>';
            	   totalSize++;
               });
	           $("#historyAgent_box").append(html);
	           if(totalSize<15){
	        	   $("#btnLoadHisAgent").hide();//已无更多数据 
	           }
          	}else{
          		showMsg("无更多数据！");
          		$("#btnLoadHisAgent").hide();//已无更多数据 
          		$("#historyAgent_box").html('<div style="text-align: center;">暂无历史推荐项目！</div>');
          	}
        	showloading(false);
        }
    });
}

function toDetail(objId,timeout){
	  $("#objId").val(objId);
	  if(timeout){    		  
	  	$("#timeout").val("true");
	  }
		  $("#agentForm").attr("action",webroot+'/PtlActivity!agentRcEdit.action').submit();
  }
