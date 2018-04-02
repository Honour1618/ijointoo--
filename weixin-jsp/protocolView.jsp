<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1, user-scalable=yes">
    <title>${title}-</title>
	<link rel="shortcut icon" href="<s:url value="/favicon.ico"/>" type="image/x-icon" /> 
	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
 	<link type="text/css"  rel="stylesheet"  href='<s:url value="/h5/css/fakeloader.css"/> '>
	<style type="text/css">
		.pdf_page_item{width: 100%;text-align: center;}
		.pdf_page_item img{width: 100%;}
		.zoom_in {background-color: #0f0f0f;color: #fff;z-index: 999;position: fixed;bottom: 20px;left: 50px;font-size:18px;
				width: 30px;height: 30px;line-height: 30px;text-align: center;cursor: pointer;border-radius: 100%;
				background: rgba(0, 0, 0, 0.60) !important;filter: Alpha(opacity = 65);	background: black;}
		.zoom_out {background-color: #0f0f0f;color: #fff;z-index: 999;position: fixed;bottom: 20px;left: 10px;font-size:24px;
				width: 30px;height: 30px;line-height: 30px;text-align: center;cursor: pointer;border-radius: 100%;
				background: rgba(0, 0, 0, 0.60) !important;filter: Alpha(opacity = 65);	background: black;}
		.target_pdf {background-color: #0f0f0f;color: #fff;z-index: 999;position: fixed;bottom: 20px;right: 10px;font-size:12px;
				width: 60px;height: 25px;line-height: 25px;text-align: center;cursor: pointer;border-radius: 5px;
				background: rgba(0, 0, 0, 0.60) !important;filter: Alpha(opacity = 65);	background: black;}
	</style>
	<script src="<s:url value="/js/jquery-1.10.2.min.js"/> "></script>
	<script src='<s:url value="/h5/js/fakeloader.js"/>' ></script>
	<script type="text/javascript">
		$(function(){
			$(".fakeloader").fakeLoader({timeToHide:1200,bgColor:"#07b4a0",
			    spinner:"spinner1"
			});
			<c:forEach var="a" items="${lists}" varStatus="status">
		    	$("#imgList").append('<div class="pdf_page_item"><img u="image"  id="imgV${status.index}" src="${ctx}/${a}" /></div>');
		    </c:forEach>
		    var bk = '<div align="center" style="margin-bottom: 20px;"></div>';
			$("#imgList").append(bk);
			
			var viewWidth = $(window).width()-30;
			setTimeout(function(){
				$("#imgList").width(viewWidth);
			},2000);
			var mulriple = 1;
			$(".zoom_in").click(function(){
				if(mulriple==1){
					$("#imgList").width(viewWidth*2);
					mulriple++;
				}else if(mulriple==2){
					$("#imgList").width(viewWidth*3);
					mulriple++;
				}
			});
			$(".zoom_out").click(function(){
				if(mulriple==3){
					$("#imgList").width(viewWidth*2);
					mulriple--;
				}else if(mulriple==2){
					$("#imgList").width(viewWidth);
					mulriple--;
				}
			});
			$(".target_pdf").click(function(){
				window.location.href = "${ctx}/${src}";
			});
			
			if(isWeiXin()){
				$(".zoom_in").hide();
				$(".zoom_out").hide();
				$(".target_pdf").hide();
			}
		});
		//判断是否微信内置浏览器
		 function isWeiXin() {
			var ua = window.navigator.userAgent.toLowerCase();
			alert(ua);
			if (ua.match(/MicroMessenger/i) == 'micromessenger') {
				return true;
			} else {
				return false;
			}
		 }
	</script>
</head>
<body style="margin:0px; padding:0px;">
    <div class="fakeloader"></div>
	<div class="container" id="imgList" style="width:300%"></div>
	<div class="zoom_out">-</div>
	<div class="zoom_in" >+</div>
	<div class="target_pdf">查看原文</div>
</body>
</html>

