/*
 * 爱就投2.0-投资行家项目列表
 * 
 */

$(function(){
	/*所属行业*/
	$(".classifyOne").click(function(){
		$(".classifyTwo,.classifyThree").removeClass("classifyCur");
		$(".classifyOne").addClass("classifyCur");
		$(".one").show();
		$(".two,.three").hide();
	});
	/*排序*/
	$(".classifyTwo").click(function(){
		$(".classifyOne,.classifyThree").removeClass("classifyCur");
		$(".classifyTwo").addClass("classifyCur");
		$(".two").show();
		$(".one,.three").hide();
	});
	/*平台职业*/
	$(".classifyThree").click(function(){
		$(".classifyOne,.classifyTwo").removeClass("classifyCur");
		$(".classifyThree").addClass("classifyCur");
		$(".three").show();
		$(".one,.two").hide();
	});
	/*点击跳转*/
	$(".classify a").click(function(){
		$(".classify").hide();
	});
	/*点击关闭筛选*/
	$("#share_mask").click(function(){
		$(".classify,#share_mask").hide();
	});
});

/*筛选*/
function choose(){
	$(".classify,#share_mask").show();
}

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

var agreeCurrentPage = 1;
//成功助创更多
function loadMoreInvo(obj , pageNo){
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_btn").attr("page-num");
	if( pageNo == undefined )	pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/5) < agreeCurrentPage){
		$("#load_more_btn").html("没有更多数据啦！");
		return;	
	}
	agreeCurrentPage++;
	//加载更多ajax
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlTf!investorList.action?rtnType=ajax', //目标地址 
	    data: { "nosession": true,"pageInfo.pageSize":5,"pageInfo.currentPage":agreeCurrentPage,"sort":sort,"tfPrjInfo.industry":industry,"investMemInfo.proRole":proRole},//nosession 未登录ajax 请求有效
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
				$(obj).attr("page-num" , msg.total);
				$.each(msgData , function(k , v){
					html +='<a class="bidding_con invest_list_con" href="'+ webroot +'/PtlTf!investMemHome.action?eqType=mb&investMemInfo.userId='+v.userId+'">'
							+'<div class="business_man invester">'
							 	+'<img src="'+ webroot + "/"+ v.userLogo +'" class="user_mission"/>'
							 	+'<div class="invester_r">'
									+'<span class="mr8">'+ v.userName +'</span>'
									+'<img class="level" src="'+webroot+'/file/h5/weixin/images/level'+v.recommLevel+'.png" />'
									+'<p>'+ v.proRoleStr +'</p>'
								+'</div>'
							+'</div>'
							+'<p class="target_title invest_title">企业名称：<span>'+ v.compName +'</span></p>'
							+'<p class="target_tag invest_tag">关注领域：<span>'+ v.userRangStr +'</span></p>'
							+'<div class="bidding_follow invest_follow">'
								+'<ul>'
									+'<li>'
										+'<img src="'+webroot+'/file/h5/weixin/images/investOne.png" />'
										+'<span>综合排名：<b>'+v.sumRank+'</b></span>'
									+'</li>'
									+'<li>'
										+'<img src="'+webroot+'/file/h5/weixin/images/investTwo.png" />'
										+'<span>成功项目：<b>'+v.succNum+'</b></span>'
									+'</li>'
									+'<li class="ping">'
										+'<img src="'+webroot+'/file/h5/weixin/images/investThree.png" />'
										+'<span>好评率：<b>'+v.posPercent+'%</b></span>'
									+'</li>'
								+'</ul>'
							+'</div>'
						+'</a>';
				});
			
				
				$(".prjShow").append(html);
				loadingMore();
    		}else{
    			$("#load_more_btn").html("无更多数据！");
    			agreeCurrentPage--;
    		}
        }
	});
}






























