<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" id="viewport" name="viewport">
	<meta http-equiv="Expires" CONTENT="0"> 
	<meta http-equiv="Cache-Control" CONTENT="no-cache"> 
	<meta http-equiv="Pragma" CONTENT="no-cache"> 
	<title>${prj.finName}</title> <!--  项目名称 -->
	<link type="image/x-icon" rel="shortcut icon" href="${ctx }/favicon.ico" /> 
	<link type="text/css" rel="stylesheet" href="${ctx }/h5/css/mobile.css"/>
	<script src="<s:url value="/mobile/jquery-1.9.1.min.js"/>"	type="text/javascript"> </script>
	<script type="text/javascript">
		$(function(){
			$("#apply").click(function(){
				if($("#focusFlg").val() != null && $("#focusFlg").val() =='1')
					$("#pform").attr('action','<s:url value="/PtlSignup.action"/>') ;
				$("#pform").submit();
			});
		});
	</script>
</head>
<body class="page_bgcolor">
	<form id="pform" action='<s:url value="/Mobile.action"/>' method=post>
	<input type=hidden name="appCode" value="test"/>
	<input type=hidden name="method" value="wxReq"/>
	<input type=hidden name="finCode" value="${prj.finCode}"/>
	<input type=hidden name="recommendUid" value="${recommendUid}"/>
	<input type=hidden name="to" value="${to}"/>
	<div class="bodyBox">
	 	  <div class="index_content">
				<div class="title">${prj.finName}</div>
			  	<div class="f_content">
					<img src="${ctx }${comp.compMedUri}"/>    <!-- 企业宣传图片 -->
					<pre style="border:0;padding-left:5px; padding-top:1px; padding-bottom:1px;font-family: '微软雅黑';">${comp.compSimpDesc}</pre>
				</div><!-- 企业简介 -->
			
			    <c:forEach var="list" items="${comp.compFeatureList}" >
				   <c:if test="${not empty list.featureTitle}">
				   <div class="f_title"><p >
				 		<strong>${list.featureTitle}</strong>
				   </p>
				   </div>
				   </c:if>
				    <c:if test="${not empty list.featureImgUrl}">
				   <div class="f_content">
				  	<img style="max-height:900px"  src="${ctx }${list.featureImgUrl}"/>
				   </div>
				   </c:if>
				    <c:if test="${not empty list.featureDesc}">
					<div class="f_content">
						<pre class="f_content" style="border:0;padding-left:0px; padding-top:1px; padding-bottom:1px;font-family: '微软雅黑';">${list.featureDesc}</pre>
				    </div>
				   </c:if>
			    </c:forEach>
			    <br/>
			    <br/>
			    <br/>
		  </div>
		  <s:if test="#attr.prj.finSts ==1 || #attr.prj.finSts ==2 || #attr.prj.finSts ==4">
			    <s:if test=" #attr.startTime > #attr.curTime " >
					<input type=hidden name="focusFlg" value="1" id="focusFlg"/>
			 			<s:if test="#attr.prj.preFlg==1" > 
			  		 		<div class="index_content_btns index_btn"><input type="button" id="apply"  value="即将开始"  disabled="disabled"/></div> 	<!--分享-->
			 		 	</s:if>
			 		 	<s:else>
			 		 		<div class="index_content_btns index_btn"><input type="button" id="apply"  value="预报名"  /></div> 	<!--分享-->
			 		 	</s:else>
				</s:if>
				<s:elseif test=" #attr.endTime < #attr.curTime" >
			   		<div class="index_content_btns index_btn"><input type="button" id="apply" class ="sign_btn_gray" value="融资已结束" disabled="disabled"/></div> 	<!--分享-->
				</s:elseif>
			  	<s:else>
			    	<div class="index_content_btns index_btn"><input type="button" id="apply"  value="预报名" /></div> 	<!--分享-->
				</s:else>
		  </s:if>
		  <s:else>
		  		<div class="index_content_btns index_btn"><input type="button" id="apply" class ="sign_btn_gray" value="${prj.finStsStr}" disabled="disabled"/></div> 	<!--分享-->
		  </s:else>
		
	</div>
	</form>
</body>
</html>