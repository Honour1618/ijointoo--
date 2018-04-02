/*
 * 爱就投2.0-投资行家-历史修改
 * 
 * */

function back(){
	history.back();
}

var alertTimer = null;
function loadingMore(){
	$(".loadingPic").show();
	$(".common_mask").show();
	alertTimer = setTimeout(function(){
		$(".loadingPic").hide();
		$(".common_mask").hide();
	} , 300);
	
}

var taskCurrentPage = 1;
//加载更多任务列表页
function loadMoreAmend(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_btn").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/3) < taskCurrentPage){
		$("#load_more_btn").html("没有更多数据啦！");
		return;
	}
	taskCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!bpHisList.action?rtnType=ajax', //目标地址 
	    data: {"nosession": true,"pageInfo.pageSize":3,"pageInfo.currentPage":taskCurrentPage,"eqType":'mb',"tfPrjInfo.prePrjCode":prePrjCode,"rspid":rspid,"sts":sts},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.list;
	    	var pageSum = msg.total/3;
			if(msg.result=='0')
			{
				var html = "";
				
				$.each(msgData , function(k , v){
					
					html +='<ul class="mission_con">'
							+'<li>'
								+'<label>修改时间：</label>'
								+'<strong> '+ new Date(v.crtTime.time).Format("yyyy-MM-dd hh:mm:ss.S") +'</strong>'
							+'</li>'
							+'<li>'
								+'<label>修改纪要：</label>'
								+'<strong>'+ v.submitDesc +'</strong>'
							+'</li>'
							+'<li class="modifyBP">'
								+'<label>修改附件：</label>'
								+'<a href="'+v.bpUrlDown+'">'
									+'<img src="'+webroot+'/file/h5/weixin/images/modifyBP.png" />'
								+'</a>'
							+'</li>'
							+'<li class="modifyPic">'
								+'<label>修改图片：</label>'
								+'<img class="modifyImg" src="'+ webroot +'/'+ v.rspImgUri +'" />'
							+'</li>'
						+'</ul>';
				});
				$(".missionDtl").append(html);
				loadingMore();
  		}else{
  			$("#load_more_btn").html("无更多数据！").unbind('');
  			taskCurrentPage--;
  		}
      }
	});
}


//对Date的扩展，将 Date 转化为指定格式的String   
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.Format = function(fmt)   
{ //author: meizz   
var o = {   
"M+" : this.getMonth()+1,                 //月份   
"d+" : this.getDate(),                    //日   
"h+" : this.getHours(),                   //小时   
"m+" : this.getMinutes(),                 //分   
"s+" : this.getSeconds(),                 //秒   
"q+" : Math.floor((this.getMonth()+3)/3), //季度   
"S"  : this.getMilliseconds()             //毫秒   
};   
if(/(y+)/.test(fmt))   
fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
for(var k in o)   
if(new RegExp("("+ k +")").test(fmt))   
fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
return fmt;   
}









