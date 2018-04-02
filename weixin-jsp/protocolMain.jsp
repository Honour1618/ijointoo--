<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<c:set var="currentPage" value="publishMain"/>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>${prj.simpName}项目-投资人协议</title>
	<link rel="shortcut icon" href="<s:url value="/favicon.ico"/>" type="image/x-icon" /> 
 	<link href='<s:url value="/h5/css/i9tou_style.css"/> ' rel="stylesheet">
	<link href='<s:url value="/h5/css/fakeloader.css"/> ' rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
    <script type="text/javascript" src='<s:url value="/h5/js/jquery.js"/>' ></script>
    <script type="text/javascript" src='<s:url value="/h5/js/fakeloader.js"/>' ></script>
    <script type="text/javascript">
	    String.prototype.startWith=function(str){    
	    	  var reg=new RegExp("^"+str);    
	    	  return reg.test(this);       
	    };
	
	    var ua = navigator.userAgent.toLowerCase();
	    var baseUri = '<%=request.getContextPath()%>/';
	    // 需要判断是ios或android，
	    //ios 直接打开
	    //android 用图片view
	    function view(obj,iu,au){
		   	if(/android/i.test(ua)){
	   			obj.href = '<s:url value="/PtlPublish!protocoldtl.action"/>?pageNo='+au;
			}else {
				 obj.href = iu;
			}
	     	$(".fakeloader").fakeLoader({ timeToHide:5000,bgColor:"#07b4a0",spinner:"spinner1"});
	     	return false ;
			//obj.onclick();
	   	}
    </script>
</head>
<body style="padding-bottom:50px;" class="page_bgcolor" >
    <div class="fakeloader"></div>
    <div class="container">
      	<s:if test="#attr.noneFlg != null">
           <div class="row" style="background:white">
		       <div class="chatItem i_left">
		       		 <div class="chatItemContent">
		       		 <div class="cloud cloudText">
		       		 <div class="cloudPannel">
			       		 	<div class="cloudBody">
								<div class="cloudContent">
									温馨提示：当前项目协议还未就绪，我们将尽快提供。
								</div>
							</div>
						<div class="cloudArrow "></div>
		       		 </div>
		        	</div>
		        </div>
		        </div>
	        </div>
        </s:if>
        <s:else>
        	<h3 class="form-signin-heading" align=center>${prj.simpName}项目协议明细(点击查看详情)</h3>
	        <div class="list-group" >
		  	   	 <c:forEach var="list" items="${lists}" varStatus="status">
		    		<a class="list-group-item if_title_b" href="#" onclick="javascript:view(this,'${list.href}','${list.pageNo}')" >
		     			<table style="width:100%"><tr><td>${list.protocolName}</td><td align=right> &gt; </td></tr></table>
		      	 	</a>
		     	 </c:forEach>
	       	</div>
        </s:else>
	</div>
 </body>
</html>