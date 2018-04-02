/*
 * 爱就投2.0-创业者
 * 
 * */

//角色入口的不同分享状态
function failApp(){
	$("#failApp,.common_mask").show();
}
function auditTipShow(){
	$("#auditTipShow,.common_mask").show();
}

$(function(){
	$("#btn").click(function(){
		$("#auditTipShow,.common_mask").hide();
	});
	
	$(".common_mask").click(function(){
		$(".tipShow,.common_mask").hide();
	});
});

//遮罩出现
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
function loadMoreTask(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_btn").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/5) < taskCurrentPage){
		$("#load_more_btn").html("没有更多数据啦！");
		return;
	}
	taskCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlTf!myPrjs.action?rtnType=ajax', //目标地址 
	    data: {"nosession": true,"pageInfo.pageSize":5,"pageInfo.currentPage":taskCurrentPage},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	$.alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
	    	var msgData = msg.list;
	    	var pageSum = msg.total/5;
			if(msg.result=='0')
			{
				var html = "";
				//$(obj).attr("page-num" , pageNo+1);
				//alert(msg.list);
				$.each(msgData , function(k , v){
					var tags=v.prjTag;
					var tag=tags.split(',');
					html +='<a class="business_con" href="PtlTf!prj.action?prjCode='+ v.prePrjCode +'&uid='+ v.userId +'"  >'
							+'<div class="business_man">'
								if(v.userLogo){
									html+='<img src="'+webroot+'/'+v.userLogo+'" class="user_mission"/>';
								}else{
									html+='<img src="'+webroot+'/file/h5/weixin/images/cowLogo.png" class="user_mission"/>';
								}
								//+'<span>'+ v.userName +'</span>'
								html+='<span class="crtTime">'+ new Date(v.crtTime.time).Format("yyyy-MM-dd") +'</span>'
							+'</div>'
							+'<p class="business_title">'+ v.prjName +'</p>'
							+'<ul class="business_tag_con">'
							for(var i=0; i< tag.length; i ++ )
				    		{
				    		   html+= '<li class="business_tag">'+tag[i]+'</li>';
				    		}
						html+='</ul>'
							+'<div class="business_res">'+'项目软肋：'+ v.rscDesc +'</div>'
							if(v.prjStep == 2 || v.prjStep == 4){
								html+='<i class="business_status gray_bg">'+v.flowStsStr+'</i>';
							}else{
								html+='<i class="business_status pink_bg">'+v.flowStsStr+'</i>';
							}
						+'</a>';
				});
				$("#businessCon").append(html);
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




$(function(){
	    function alertDS(str,eleName){
        $(".common_mask").show();
        $(eleName).show();
        $(eleName+" span").html(str);
        $(".btn-close").on("click",function () {
            $(".common_mask").hide();
            $(eleName).hide();
        });
    };

    
    $("#backBtn").on("click",function(){
    	 window.history.back();
    });
    $("#dsCenter").on("click",function(){
        /*alertDS("你还未进行导师认证，只有/i9tou/PtlTf!rccIndex.action?eqType=mb通过导师审核才能竞标项目哦！","#alertJd");*/
    	window.location.href=webroot+"/PtlTf!rccIndex.action?eqType=mb";
    });
    $(".logout__btn").on("click",function(e){
    	e.stopPropagation();
    	alertDS("退出登录","#alertExit");
    	$("#exitBtn").on("click",function(e){
    		e.stopPropagation();
        	$.ajax({
        	    type: "POST", //用POST方式传输
        	    dataType: "json", //数据格式:JSON
        	    url: webroot + "/PtlPortal!logout.action", //目标地址
        	    data: { "nosession": true},//session 未登录ajax 请求有效
        	    error: function (XMLHttpRequest, textStatus, errorThrown) {},
        	    success: function (msg){ 
        	    	submitBool = false;
            		if(msg.result=='9')
            		{
            			alert("失败");
            			return;
            		}
            		else
            		{	
            			window.location.href=webroot+"/PtlMobile!index.action";
            		}

            	},
        	    error:function (msg){ 
        			alert(msg);
        	    }
        	});
    	});

    });
});








