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
	        url: "PtlMobile!inforQryAjax.action", //目标地址
	        data: { "nosession": true,"type":typeNum,"pageSize":"5","currentPage":currentPage},//nosession 未登录ajax 请求有效 
	        error: function (XMLHttpRequest, textStatus, errorThrown) { 
	        	showMsg("加载数据出错!");
     		//myScroll.refresh();
	        },
	        success: function (data){
	        	var html = '';
	        	/*console.log(data);*/
	        	if(data.result == '0'){
	               $.each( data.lists, function(index, item){
	            	   //资讯页面
         		   var title = item.title;
         		   var summary = item.summary;
         		   var logo = item.logo;
         		   var time = item.time;
         		   var webUrl = item.webUrl;
//         		   if(text && text.length > 130){
//             		   text = text.substring(0,130)+"...";
//             	   }else if(text==undefined || text=="undefined"){
//             		   text = "";
//             	   }
             	   if(!time){
             		   time = "";
             	   }	
             	   
	            	   	html+='<a class="infoCon" href="'+webUrl+'">'
			            	   		+'<div class="text_info">'
										+'<h2>'+title+'</h2>'
										+'<p>'+summary+'</p>'
									+'</div>'
									+'<div class="img_info">'
										+'<img src="'+webroot+logo+'">'
										+'<span>'+time+'</span>'
									+'</div>'
								+'</a>';
	                });
	               if( pullType == "down"){
	            	   
	            	   $("#thelist").html(html);
	               }
	               else{
	            	   $("#thelist").append(html);
	            	   
	               }

		        	myScroll.refresh();
		        	//myScroll.scrollTo(0, 100, 200, true);
	          	}else{
	          		showMsg("无更多数据！");
	          		myScroll.refresh();
	        		currentPage--;//当前页无数据，回退一页
	          	}
	        	$("#pullUp").hide();
	        	showloading(false);
	        }
	    });
	// currentPage++;//下拉加载=下一页
	
}

function gotoActInfo(activityNo){
	var s_url = webroot+"/PtlSignup!actRegInit.action?activityNo="+activityNo;
	if(uid!=null && uid.length>0)
		s_url += "&uid="+uid;
	window.location.href = s_url;
}
$(function(){
	
	//默认执行滚动事件
	myScroll = new iScroll("wrapper" , {
		useTransition: true,
		onScrollEnd: function () {
			if (pullDownEl.className.match('flip')) {
				pullDownEl.className = 'loading';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Loading...';				
				pullDownAction();	// Execute custom function (ajax call?)
			} else if (pullUpEl.className.match('flip')) {
				pullUpEl.className = 'loading';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = 'Loading...';				
				pullUpAction();	// Execute custom function (ajax call?)
			}
		}
		
	});
	
	if(typeNum == 4){
		$('#1 a').addClass('change');
		$('#1').addClass('choosed');
	}else if(typeNum == 3){
		$('#2 a').addClass('change');
		$('#2').addClass('choosed');
	}else if(typeNum == 1){
		$('#3 a').addClass('change');
		$('#3').addClass('choosed');
	}else if(typeNum == 5){
		$('#4 a').addClass('change');
		$('#4').addClass('choosed');
	}else if(typeNum == 0){
		$('#5 a').addClass('change');
		$('#5').addClass('choosed');
	}
	
	/*$('ul.litNav li a').each(function(){
	    if($($(this))[0].href==String(window.location))
	    	$(this).addClass('change');
	});
	*/
	/*固定条的关闭按钮*/
	var close=$('.load i');
	var fixedBar=$('.fixed_bar');
	close.click(function(){
		fixedBar.css({display:'none'});
		$('#wrapper').css({bottom:'0'});
	});
	

});
