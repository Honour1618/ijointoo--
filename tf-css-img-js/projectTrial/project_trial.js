/*
 * 项目筹审
 * 
 */
var myScroll,
	pullDownEl,
	pullDownOffset,
	pullUpEl,
	pullUpOffset,
	generatedCount = 0,
	currentPage = 1,
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
	pullTimer = setTimeout(function () {
		currentPage ++;
		requestIscrollData("up",currentPage);
	}, 1000);
}

//滚动条数据请求
function requestIscrollData(pullType , currentPage){
	$.ajax({
		type: "POST",
		dataType: "json",
		url: webroot+"/PtlMng!loadPrl.action",//目标地址
		data: { "nosession": true,"pageSize":"8","currentPage":currentPage},//nosession 未登录ajax 请求有效
		error: function (XMLHttpRequest, textStatus, errorThrown) {
			showMsg("加载数据出错!");
		},
		success: function (data){
			var html='';
			if(data.result == '0'){
				//"id","title","rang","time","cntName","cntMobile","prePrjCode"
				$.each( data.lists, function(index, item){
					var title = item.title;
					var industry = item.rang;
					var time = item.time;
					var manager = item.cntName+"|"+item.cntMobile;
					var webUrl = linkBase+item.id;
					
					html+='<a class="infoCon" href="'+webUrl+'" target="_blank">'
								+'<div class="text_info">'
									+'<h2>'+title+'</h2>'
									+'<span>所属行业：'+industry+'</span><br/>'
									+'<span>最近时间：'+time+'</span><br/>'
									+'<p>项目联系人：'+manager+'</p>'
								+'</div>'
							+'</a>';
				});
				if( pullType == "down"){
					$("#thelist").html(html);
				}else{
					$("#thelist").append(html);
				}
				myScroll.refresh();
			}else{
				showMsg("无更多数据!");
				myScroll.refresh();
				currentPage--;//当前页无数据，回退一页
			}
			$("#pullUp").hide();
			showloading(false);
		}
	});
	//currentPage++;//下拉加载=下一页
}

function gotoTrial(trialNo){
	var s_url = webroot+"/PtlSignup!actRegInit.action?trialNo="+trialNo;
	if(uid!=null && uid.length>0)
		s_url += "&uid="+uid;
	window.location.href = s_url;
}
$(function(){
	//默认执行滚动事件
	myScroll = new iScroll("wrapper" , {
		useTransition: true,
		onScrollEnd: function () {
			if(pullDownEl.className.match('flip')) {
			   pullDownEl.className = 'loading';
			   pullDownEl.querySelector('.pullDownLabel').innerHTML = 'loading...';
			   pullDownAction();  //Execute custom function (ajax call?)
			} else if (pullUpEl.className.match('flip')){
				pullUpEl.className = 'loading';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = 'loading...';
				pullUpAction();  //Execute custom function (ajax call?)
			};
		}
	})
	pullDownAction();
})



