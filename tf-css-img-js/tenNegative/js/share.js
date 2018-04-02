/*
page for negative-list
2016-06-27
*/

requirejs.config({
	baseUrl : webroot + "/file/commonJs",
	paths: {
		"jquery": "jquery-2.11.min",
		"chartjs" : "chart.min"
	}
});
var isApp = false;
var nowWidth = 0;
var nowBl = 0;
requirejs(["jquery"] , function($){
	//用户数据采集	

	$(function(){
		var localUrl = window.location.href;
		//页面入口来源

		
		nowWidth = $(window).width();
		nowBl = nowWidth/414;

		//注册页自适应
		
		$(".share_content").css({
			"-moz-transform" : "scale("+ nowBl +")", 
			"-webkit-transform":"scale("+ nowBl +")", 
			"-o-transform":"scale("+ nowBl +")",
			"transform":"scale("+ nowBl +")"
		});

		
		//设备版本判断~start~
		//判断浏览器是PC还是mobile
		var isBrowser={
			versions:function(){   
			 var u = navigator.userAgent, app = navigator.appVersion;   
			 return {//移动终端浏览器版本信息   
			   trident: u.indexOf('Trident') > -1, //IE内核  
			   presto: u.indexOf('Presto') > -1, //opera内核  
			   webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核  
			   gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核  
			   mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端  
			   ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端  
			   android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器  
			   iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器  
			   iPad: u.indexOf('iPad') > -1, //是否iPad    
			   webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部  
			  };  
			  }(),  
			  language:(navigator.browserLanguage || navigator.language).toLowerCase()  
		}   
		//判断浏览器，PC访问直接跳转PC,MOBILE访问跳转MOBILE
		if(isBrowser.versions.mobile || isBrowser.versions.ios || isBrowser.versions.android ||   
				isBrowser.versions.iPhone || isBrowser.versions.iPad){
			
		}else{
			$('.striping,.stageTwo').hide();
			$("#myChart").attr({//潜力展示
				width: 230,
				height: 226
			});
			$("#share_main").addClass("zmTest");//壮苗局部字号调整
		};
		//设备版本判断~end~
		
		//获取结果展示
		initPage();
		$(window).scroll(function(){

			var $this =$(this),
			viewH =$this.height(),//可见高度  
			contentH =$(document).height(),//内容高度
			scrollTop =$this.scrollTop();//滚动高度  
	        if(contentH - viewH - scrollTop <= 100)  //到达底部100px时,加载新内容  
	        {
	        	$(".arrow_bottom").hide();
	        }
	        else{
	        	$(".arrow_bottom").show();
	        }
	     });
	
	});	
});

function initPage(){
	var tempArr = [];//临时数组，判断数组值全等
	for(var i=0;i<chartDataArr.length;i++){
		if(chartDataArr[i] == 1.0){
			tempArr[i] = chartDataArr[i];
		}
	}
	if(tempArr.length >= 5){
		for(var i=0;i<chartDataArr.length;i++){
			chartDataArr[i] = chartDataArr[i]*2;
		}
	}
	console.log(tempArr);
	console.log(chartDataArr);
//	$(".score_desc").html('恭喜您!您的总排名为'+ TSRank +'<br/>战胜了同行业'+ parseInt(100 * (1- msg.IDTSRank/msg.InDNum))  +'%的小伙伴！');	
		$(".result_score_main").show().addClass("animated zoomIn");
		
		requirejs(["jquery" , "chartjs"] , function($){
	
			var data = {
	            labels: chartNameArr,
	            datasets: [
	            {
		            label: "",
		            fillColor: "rgba(255,147,0,0.3)",
		            strokeColor: "rgba(68,16,2,.3)",
		            /*pointColor: "rgba(68,16,2,.3)",
		            pointStrokeColor: "#441002",*/
		            pointHighlightFill: "#441002",
		            pointHighlightStroke: "rgba(68,16,2,.3)",
		            data: chartDataArr
	            },
	            {
	                label: "default",
	                fillColor: "rgba(247,62,25,0)",
	                strokeColor: "rgba(247,62,25,0)",
	                /*pointColor: "rgba(247,62,25,0)",
	                pointStrokeColor: "rgba(247,62,25,0)",*/
	                pointHighlightFill: "rgba(247,62,25,0)",
	                pointHighlightStroke: "rgba(247,62,25,0)",
	                data: [1, 1, 1, 1, 1]
	             }]
	        };
			var options = {
	            //Boolean - Whether to show lines for each scale point
	            scaleShowLine : true,
	            showTooltips:false,
	            //Boolean - Whether we show the angle lines out of the radar
	            angleShowLineOut : true,

	            //Boolean - Whether to show labels on the scale
	            scaleShowLabels : false,

	            // Boolean - Whether the scale should begin at zero
	            scaleBeginAtZero : true,

	            //String - Colour of the angle line
	            angleLineColor : "#441002",
	            scaleLineColor:"#441002",

	            //Number - Pixel width of the angle line
	            angleLineWidth : 1,

	            //String - Point label font declaration
	            pointLabelFontFamily : "'Arial'",

	            //String - Point label font weight
	            pointLabelFontStyle : "normal",

	            //Number - Point label font size in pixels
	            pointLabelFontSize : 16,

	            //String - Point label font colour
	            pointLabelFontColor : "#441002",

	            //Boolean - Whether to show a dot for each point
	            pointDot : true,

	            //Number - Radius of each point dot in pixels
	            pointDotRadius : 3,

	            //Number - Pixel width of point dot stroke
	            pointDotStrokeWidth : 1,

	            //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
	            pointHitDetectionRadius : 20,

	            //Boolean - Whether to show a stroke for datasets
	            datasetStroke : true,

	            //Number - Pixel width of dataset stroke
	            datasetStrokeWidth : 2,

	            //Boolean - Whether to fill the dataset with a colour
	            datasetFill : true,

	            //String - A legend template
	            legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

	            }
	
			var ctx = document.getElementById("myChart").getContext("2d");			
			var myRadarChart = new Chart(ctx).Radar(data, options);
		
		});
		
		var newDesc = "";
		if( 100 * (1-IDTSRank/InDNum) >= 20 ){
			
			newDesc = shareDesc_d.split("%")[0] + parseInt(100 * (1-IDTSRank/InDNum)) + "%" + shareDesc_d.split("%")[1];
		}
		
		var localUrl = window.location.href;
		wechatConfig();//微信分享
		$(".arrow_bottom").show().addClass("animated flash");
		
}

//分享引导
function shareFriend(){
	$("#share_mask").fadeIn(500);
	$("#share_mask").bind("click" , function(){
		
		$(this).fadeOut(500);
	});
	_hmt.push(['_trackEvent', '潜力测试结果页', '立即分享', '点击按钮', '0']);
	
}

//APP跳转
function gotoActivity () {
	jump.toActivity();
}