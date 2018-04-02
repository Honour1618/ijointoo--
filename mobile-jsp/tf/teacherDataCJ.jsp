<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>爱就投|优选投资经理|让专业发挥价值</title>
    <meta name="description" content="爱就投，让资本带着资源，投向真的有梦想的企业，成就每个人的创富梦想！爱就投，让人类商业文明提前进入共产主义！精品项目，爱就投！"/>
	<meta name="keywords" content="爱就投，私募股权融资，众筹，筹众，股权融资，股权投资，原始股，原始股投资，移动交易平台"/>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/tf/tfManager/css/base.css">
  	<link rel="stylesheet" href="${ctx}/file/tf/tfManager/css/teacherDataCJ.css">
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/commonJs/exif.js"></script>
    <script type="text/javascript" src="${ctx}/file/tf/tfManager/js/judgeWeb.js"></script>
</head>
<body>
<form action="PtlTf!memColDo.action" method="post" enctype="multipart/form-data" id="form_main">
	<div class="page">
    <div class="teac-title clearfix"><img src="${ctx}/file/tf/tfManager/images/teacher-title1.png" alt="案例添加" ></div>
    <dl class="teac-msg-box" data-userId="${userId}">
        <dt><img src="${ctx}/file/tf/tfManager/images/quyu-title.png" alt="所在区域"></dt>
        <dd>
            <!-- <input type="hidden" class="form-control" name="investMemInfo.areaRang"  id="addRangStr"> -->
            <select name="investMemInfo.areaRang" id="" class="al-add" id="qySelect" style="background:#ffffff">
                <option value class="area_belong">所在区域 </option>
	        		   <c:forEach var="prj" items="${provinces }" varStatus="status">
	        				<option value="${prj.value}" <c:if test="${investMemInfo.areaRang eq prj.value}">selected="selected"</c:if>>${prj.value}</option>
	        			</c:forEach>
            </select>
        </dd>
        <dt><img src="${ctx}/file/tf/tfManager/images/hangye-title.png" alt="擅长行业"></dt>
        <dd class="h5_input_border compRangLi">
        	<input type="hidden"  name="investMemInfo.userRang"  id="hyStr"/>
	        <div class="industry-box">
	        		<c:forEach var="prj" items="${compRangList }" varStatus="status">
	        			<c:if test="${fn:contains(investMemInfo.userRang,prj.value)==true}">
	        				<span class="industry-list industry-list-active" value="${prj.value}" <c:if test="${investMemInfo.industry eq prj.value}">checkec</c:if>>${prj.key}</span>
	        			</c:if>
	        			<c:if test="${fn:contains(investMemInfo.userRang,prj.value)==false}">
	        				<span class="industry-list" value="${prj.value}" <c:if test="${investMemInfo.industry eq prj.value}">checkec</c:if>>${prj.key}</span>
	        			</c:if>
	        		</c:forEach>
	        </div>
        </dd>
        <dt><img src="${ctx}/file/tf/tfManager/images/jintong-title.png" alt="精通技能"></dt>
        <dd>
        	<input type="hidden"  name="investMemInfo.skill"  id="jnStr"/>
        	<div class="jintong-box">
        				<c:forEach  var="item" items="${memSkills}" varStatus="status">
						<c:if test="${fn:contains(investMemInfo.skill,item.value)==true}">
	        				<span class="industry-list industry-list-active" value="${item.value}">${item.key}</span>
	        			</c:if>
	        			<c:if test="${fn:contains(investMemInfo.skill,item.value)==false}">
	        				<span class="industry-list"  value="${item.value}">${item.key}</span>
	        			</c:if>
					</c:forEach>
        	</div>
        </dd>
        <dt><img src="${ctx}/file/tf/tfManager/images/guanzhu-title.png" alt="关注阶段"></dt>
        <dd>
        	<input type="hidden"  name="investMemInfo.invstStages"  id="gzStr"/>
        	<div class="jineng-box">
					<c:forEach  var="item" items="${finStageList}" varStatus="status">
						<c:if test="${fn:contains(investMemInfo.invstStages,item.fieldVal)==true}">
	        				<span class="industry-list industry-list-active" value="${item.fieldVal}">${item.fieldValChNm}</span>
	        				
	        			</c:if>
	        			<c:if test="${fn:contains(investMemInfo.invstStages,item.fieldVal)==false}">
	        				<span class="industry-list" value="${item.fieldVal}">${item.fieldValChNm}</span>
	        			</c:if>
					</c:forEach>
        	</div>	
        </dd>
        <dt class="teac-title2 clearfix"><img src="${ctx}/file/tf/tfManager/images/teacher-title2.png" alt="导师资质"></dt>
        <dt><img src="${ctx}/file/tf/tfManager/images/menpai-title.png" alt="所在门派" class="menpai"></dt>
        <dd><input type="text" class="al-add"  maxlength="20" name="investMemInfo.compName" value="${investMemInfo.compName}" id="menpai" placeholder="请输入您的公司名称（40字以内）"><p class="ts">请正确输入公司名称，（2-20）个字</p></dd>
        <dt><img src="${ctx}/file/tf/tfManager/images/zhiwei-title.png" alt="大侠职位"></dt>
        <dd><input type="text" class="al-add" maxlength="20"  name="investMemInfo.position" value="${investMemInfo.position}"  id="zhiwei" placeholder="请输入您目前职位（20字以内）"><p class="ts">请正确输入职位，（2-20）个字</p></dd>
        <dt><img src="${ctx}/file/tf/tfManager/images/touzi-title.png" alt="投资理念"></dt>
        <dd>
        	<textarea  class="al-ln" maxlength="50"  name="investMemInfo.investIdea"  id="linian" placeholder="请说出您的投资理念（50字以内，例如：最重要的是人，精神比能力更重要）">${investMemInfo.investIdea}</textarea>
        	<p class="ts">请正确输入投资理念，（2-50）个字</p></dd>
        <dt><img src="${ctx}/file/tf/tfManager/images/lvli-title.png" alt="投资履历"></dt>
        <dd>
       	<textarea  class="al-ms" name="investMemInfo.userDesc"  id="lvli" placeholder="请简单描述您的过往经历（512字以内）">${investMemInfo.userDesc}</textarea>
       	<p class="input-prompt"><span>0</span>/512</p>
<%--         	<input type="hidden" name="investMemInfo.investIdea" id="lniptln">
        	<div  class="al-ln txtSR"  contenteditable="true" data-text="请简单描述您的过往经历（512字以内）"   id="lvli" >${investMemInfo.investIdea}</div> --%>
        	<p class="ts">请正确输入投资履历，(2-512)个字</p>
        </dd>
        <dt class="teac-title2 clearfix"><img src="${ctx}/file/tf/tfManager/images/teacher-title3.png" alt="导师传奇"></dt>
        <dt><img src="${ctx}/file/tf/tfManager/images/guowang-title.png" alt="过往案例"></dt>
        <dd>
        	<div class="anLi-box">
				<div class="anLi-check" <c:if test="${memFeatures!=null}">style="display:none;"</c:if> onclick="addAnli(event)"><img src="${ctx}/file/tf/tfManager/images/addanli-img_03.png" alt="添加案例"></div>
				<div class="anLI-list-box">
                	    <c:forEach var="feature" items="${memFeatures }" varStatus="status">
	        				<div class="anLi-list clearfix" data-id="${feature.objId}">
                        	<h3>${feature.featureTitle}</h3>
                        	<p>${feature.featureDesc }</p>
                        	<input type="button" class="anLi-list-btn del" onclick="delAnli(event,this,${feature.objId})" >
                        	<input type="button" class="anLi-list-btn revise" onclick="xgAnli(event,this,${feature.objId})">
                        	<div class="anLi-list-icon"><img src="${ctx}/${feature.featureImgUrl}"/></div>
                    		</div>
	        			</c:forEach>
                    <div  class="addAl-btn" id="addALBtn" onclick="addAnli(event)" <c:if test="${memFeatures==null}">style="display:none;"</c:if> ><img src="${ctx}/file/tf/tfManager/images/add-anli-btn.png" alt="添加案例"></div>
            	</div>
        </dd>
    </dl>
    <input type="hidden" name="operType" value="step2" />
    <img src="${ctx}/file/tf/tfManager/images/teac-bottom-bg_09.png" alt="底部背景" class="boxBg">
    <button id="subApply" class="sub-apply" ></button>
</div>
</form>
<!-- 添加案例 -->
<div class="page2" id="addPage">
    <div class="teac-title clearfix"><img src="${ctx}/file/tf/tfManager/images/add-anli-title.png" alt="案例添加" ></div>
    <form enctype="multipart/form-data" id="form_small_main">
    	  <dl class="teac-msg-box">
        <dd >
            <input type="file" id="user_avatar2" class="user_acatar_btn2" accept="image"   name="casePic"  >
            <div id="user_avatar_show2" class="user-img-show2"></div>
            <input type="hidden"  id="user_avatar_data2" name="zipCasePic"/>	
            <input type="hidden" name="nosession" value="true" />
        </dd>
        <dd>
        	<input type="file" id="user_avatar1" class="user_acatar_btn" accept="image"   >
            <p class="reCheck-btn">重新选择</p>	
        </dd>
        <dt><img src="${ctx}/file/tf/tfManager/images/anli-title_07.png" alt="案例名称"></dt>
        <dd><input type="text" class="al-add" maxlength="16" id="anLiTitle" name="memFeature.featureTitle" ><p class="input-prompt"><span>0</span>/16</p></dd>
        <dt><img src="${ctx}/file/tf/tfManager/images/anli-title_10.png" alt="案例描述"></dt>
        <dd>
        <textarea  class="al-ms"  id="anLiTesc" name="memFeature.featureDesc" placeholder="请简单描述该项目及您对该项目的贡献"></textarea>
        
<!--         <div class="al-ms txtSR" contenteditable="true" data-text="请简单描述该项目及您对该项目的贡献"></div> -->
        <p class="input-prompt"><span>0</span>/512</p></dd>
    	</dl>
    </form>
    <img src="${ctx}/file/tf/tfManager/images/teac-bottom-bg_09.png" alt="底部背景" class="boxBg">
    <button class="back-btn" onclick="back(event)"><img src="${ctx}/file/tf/tfManager/images/back-btn-bg_03.png" alt="返回"></button>
    <button id="subApply2" class="sub-apply" dataUp-flag="0"></button>
</div>

		<!-- 页面警示框 -->
		<div class="alertShow">
			<span></span>
		</div>
		<div class="common_mask"></div>
</body>
<script>
	var webroot = "${ctx}";
	var provinces = "${provinces }";
	var match = "${investMemInfo.areaRang}";
	var compRangList = "${compRangList}";
	var indus="${investMemInfo.industry}";
	var userId="${uid}";
/* 	var anliList="${memFeatures}"; */
</script>
<script src="${ctx}/file/tf/tfManager/js/teacherDataCJ.js"></script>
</html>