<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投|优选创业导师|让专业发挥价值</title>
    <meta name="description" content="爱就投，让资本带着资源，投向真的有梦想的企业，成就每个人的创富梦想！爱就投，让人类商业文明提前进入共产主义！精品项目，爱就投！"/>
	<meta name="keywords" content="爱就投，私募股权融资，众筹，筹众，股权融资，股权投资，原始股，原始股投资，移动交易平台"/>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${ctx}/file/tf/tfManager/css/dstfManager.css" />
</head>
	<!-- 融测测投资经理信息收集 -->
    <body>
    		    <header class="clearfix" id="headerOne">
        <button class="back__btn" id="backBtn"><img src="${ctx}/file/h5/weixin/images/back-btn.png" alt="返回"></button>
        <div class="header--title">创业导师中心</div>
        <button class="logout__btn"><img src="${ctx}/file/h5/weixin/images/logout.png" alt="退出"></button>
    </header>
    	<form action="PtlTf!memColDo.action" method="post" enctype="multipart/form-data" id="form_main">
	    	<ul class="form_main" data-userId="${userId}">
	    		<li>
	    			<p class="colRed">请认真填写以下信息，将作为众创生态系统公证的身份。</p>
	    		</li>
				<li class="h5_input_border">
					<img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"/>
					<input name="investMemInfo.userName" type="text"  id="user_name" maxlength="20" placeholder="你的真实姓名" value="${investMemInfo.userName}" class="checkKey"/>
					<span class="error_tips" id="user_name_tips">请输入中文姓名（2-20）字</span>
				</li>
				<li class="h5_input_border h5_input_rela">
					<img alt="" src="${ctx}/file/tf/tfManager/images/choose.png" class="ico_img_choose"/>
					<span class="file_text">上传头像</span>
					<input type="file" accept="image" capture="camera" class="short"  id="user_avatar" placeholder="请上传PNG、JPG、GIF格式个人头像" name="headPic" />
					<button class="file_input"/>上传</button>
					<span class="error_tips" id="user_avatar_tips">请上传PNG、JPG、GIF格式个人头像</span>
					<input type="hidden"  id="user_avatar_small"/>
				</li>
				<li id="user_avatar_show" class="preImageContent" <c:if test="${not empty wxLogo || not empty investMemInfo.userLogo }">style="display: list-item;"</c:if>>
					<c:if test="${not empty wxLogo }">
						<div class="item"><img src="${wxLogo}" alt="img"></div>
					</c:if>
					<c:if test="${ empty wxLogo }">
						<c:if test="${ not empty investMemInfo.userLogo }">
							<div class="item"><img src ="${ctx}/${investMemInfo.userLogo}" /></div>
						</c:if>
					</c:if>
				</li>
				<li class="h5_input_border">
					<img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"/>
					<input type="text" name="investMemInfo.compName"  id="user_comname" maxlength="20" placeholder="你当前所在公司名称"  value="${investMemInfo.compName}" class="checkKey"/>
					<span class="error_tips" id="user_comname_tips">请正确填写你当前所在公司名称</span>
				</li>
				<li class="h5_input_border">
					<img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"  />
					<input name="investMemInfo.position" type="text" id="user_post" maxlength="20" placeholder="你在公司中的职位"  value="${investMemInfo.position}" class="checkKey"/>
					<span class="error_tips" id="user_post_tips">请正确填写目前职位全称</span>
				</li> 
	        	<li class="h5_input_border" style="padding-top: 0;">
	        		<img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"  />
	        		<input type="hidden" class="form-control" name="investMemInfo.areaRang" value="1" id="addRangStr"/>
	        		<select class="compRangStr" id="address">
	        			<option value="" class="area_belong">所在区域</option>
	        			<c:forEach var="prj" items="${provinces }" varStatus="status">
	        				<option value="${prj.value}" <c:if test="${investMemInfo.areaRang eq prj.value}">selected='selected'</c:if> >${prj.value}</option>
	        			</c:forEach>
	        		</select>
	        		<span class="error_tips" id="address_tips">请选择所在区域</span>
	        	</li>
	        	<li class="h5_input_border" style="padding-top: 0;">
	        		<img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"  />
	        		<input type="hidden" class="form-control" name="investMemInfo.industry" value="1" id="industryStr"/>
	        		<select class="compIndustryStr" id="industry">
	        			<option value="" class="area_belong">所属行业</option>
	        			<c:forEach var="prj" items="${compRangList }" varStatus="status">
	        				<option value="${prj.value}" <c:if test="${investMemInfo.industry eq prj.value}">selected='selected'</c:if> >${prj.key}</option>
	        			</c:forEach>
	        		</select>
	        		<span class="error_tips" id="industry_tips">请选择所属行业</span>
	        	</li>
				<li class="h5_input_border">
					<img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"/>
					<input name="investMemInfo.gu" type="text"  id="user_university" maxlength="20" placeholder="毕业院校" value="${investMemInfo.gu }" class="checkKey"/>
					<span class="error_tips" id="user_university_tips">请正确填写你的毕业院校</span>
				</li>
				<li class="h5_title">
	    			<p>个人风采照</p>
	    		</li>
	    		<li class="h5_input_border mt10 h5_input_rela" style="margin-top: 0;">
					<img alt="" src="${ctx}/file/tf/tfManager/images/choose.png" class="ico_img_choose"/>
					<span class="file_text">支持jpg、png格式</span>
					<input type="file" placeholder="请上传PNG、JPG、GIF格式的图片"  class="short"  id="user_mien" accept="image" capture="camera" name="singlePic"/>
					<button class="file_input"/>上传</button>
					<span class="error_tips" id="user_mien_tips">请上传PNG、JPG、GIF格式的图片</span>
				</li>
				<li id="user_mien_show" class="preImageContent">
					<c:if test="${not empty investMemInfo.photo}">
						<img src="${investMemInfo.photo}"/>
					</c:if>
				</li>
				<li class="h5_title">
	    			<p><b class="signInte">*</b> 关注领域 <span class="grayShow">（最多选四个）</span></p>
	    		</li>

				<li class="h5_input_border compRangLi">
					<div class="compRangList" id="gzCheck">
						<c:forEach  var="item" items="${compRangList}" varStatus="status">
	
						<c:if test="${fn:contains(investMemInfo.userRang,item.value)==true}">
							<a data-val="${item.value}" class="checked">${item.key}</a>
	        			</c:if>
	        			<c:if test="${fn:contains(investMemInfo.userRang,item.value)==false}">
	        				<a data-val="${item.value}">${item.key}</a>
	        			</c:if>

						</c:forEach>
					</div>
					<input type="hidden" name="investMemInfo.userRang"  value="" id="compRangStr"/>
					<span class="error_tips" id="user_industry_tips">选择你关注领域，最多4个</span>
				</li>
				<li class="h5_title">
	    			<p><b class="signInte">*</b> 精通技能<span class="grayShow">（最多选四个）</span></p>
	    		</li>
	    		<li class="h5_input_border compRangLi">
					<div class="compRangList" id="jtCheck">
						<c:forEach  var="item" items="${memSkills}" varStatus="status">
						<c:if test="${fn:contains(investMemInfo.skill,item.value)==true}">
							<a data-val="${item.value}" class="checked">${item.key}</a>
	        			</c:if>
	        			<c:if test="${fn:contains(investMemInfo.skill,item.value)==false}">
	        				<a data-val="${item.value}" >${item.key}</a>
	        			</c:if>
					</c:forEach>

					</div>
					<input type="hidden" name="investMemInfo.skill"  value="" id="jineng"/>
					<span class="error_tips" id="jn_industry_tips">选择你精通技能，最多4个</span>
				</li>
				<li class="h5_title">
	    			<p><b class="signInte">*</b> 投资阶段偏好 <span class="grayShow">（最多选四个）</span></p>
	    		</li>
				<li class="h5_input_border compRangLi">
					<div class="preferRangList" id="tzCheck">
						<c:forEach  var="item" items="${finStageList}" varStatus="status">
						<c:if test="${fn:contains(investMemInfo.invstStages,item.fieldVal)==true}">
							<a data-val="${item.fieldVal}" class="checked">${item.fieldValChNm}</a><!-- fieldVal=00,fieldValChNm=种子轮 -->
	        			</c:if>
	        			<c:if test="${fn:contains(investMemInfo.invstStages,item.fieldVal)==false}">
	        				<a data-val="${item.fieldVal}">${item.fieldValChNm}</a><!-- fieldVal=00,fieldValChNm=种子轮 -->
	        			</c:if>
						</c:forEach>
					</div>
					<input type="hidden" name="investMemInfo.invstStages"  value="" id="preferRangStr"/>
					<span class="error_tips" id="ph_prefer_tips">选择你的专属投资偏好，最多4个</span>
				</li>
				<li class="h5_title">
	    			<p><b class="signInte">*</b> 投资理念 </p>
	    		</li>
				<li class="h5_textarea_border">
					<textarea  id="user_idea" name="investMemInfo.investIdea"  placeholder="投资理念：请写下你的投资理念，示例：由点及面，先专注做好一件事再慢慢上下游延伸形成系统（沈南鹏）" />${investMemInfo.investIdea}</textarea>
					<span class="error_tips" id="user_idea_tips">投资理念：请写下你的投资理念，示例：由点及面，先专注做好一件事再慢慢上下游延伸形成系统（沈南鹏）</span>
				</li>
				<li class="h5_title">
	    			<p><b class="signInte">*</b> 履历 </p>
	    		</li>
				<li class="h5_textarea_border">
					<textarea  name="investMemInfo.userDesc"  placeholder="请描述一下你的从业经历，尤其是成功的投资辅导经验" id="user_case"/>${investMemInfo.userDesc }</textarea>
					<span class="error_tips" id="user_case_tips">请描述一下你的从业经历</span> 
				</li>
				<li class="h5_title" id="goneItem">
	    			<p><b class="signInte">*</b> 过往案例 </p>
	    		</li>
	    		<li class="h5_textarea_border">
	    			<div id="addExamCon">
	    					<c:forEach var="feature" items="${memFeatures }" varStatus="status">
                    		<ul class="add_item aitmFlg" id="investCaseShow0" data-id="${feature.objId}">
                    		<li class="add_item">
                    		<div class="add_item_con">
                    		<img class="add_item_img" src="${ctx}/${feature.featureImgUrl}">
                    		<p class="add_item_title">${feature.featureTitle}</p></div><pre class="add_item_detail">${feature.featureDesc }</pre><div class="add_item_fun"><div class="add_item_modify" onclick="editData(this,${feature.objId});"><img src="${ctx}/file/tf/tfManager/images/modify.png">
                    		<span>修改</span>
                    		</div>
                    		<div class="add_item_delete" onclick="deleteData(${feature.objId});"><img src="${ctx}/file/tf/tfManager/images/delete.png"><span>删除</span></div></div>
                    		</li>
                    		</ul>
	        			</c:forEach>
	    			</div>
					<div class="addExample" onclick="addgoneCon();">
						<img alt="" src="${ctx}/file/tf/tfManager/images/addExample.png" />
						<span>添加案例</span>
						<p>请从最近的一份案例说起</p>
					</div>
					<div class="anList-Box">

					</div>	
				</li>
				<li class="h5_title">
	    			<p><b class="signInte">*</b> 联系方式 <span class="grayShow">（仅向创业者公开）</span></p>
	    		</li>
				<li class="h5_input_border">
					<%-- <img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"/> --%>
										<input name="investMemInfo.userMobile" type="tel"  maxlength="11" id="user_mobile" placeholder="请填写输入手机号码（必填）" class="checkKey middle" value = "${investMemInfo.userMobile }"/>
					<label class="check_label">
						<input type="checkbox" class="check_mobile" />选中公开
					</label>
					<span class="error_tips" id="user_mobile_tips">请正确输入11位手机号码</span>
					
					
				</li>
				<li class="h5_input_border">
					<%-- <img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"/> --%>
					<input type="text"  name="investMemInfo.qq" maxlength="20" value="${investMemInfo.qq}" placeholder="请填写你的QQ号或微信号" id="user_qq" class="checkKey middle"/>
					<label class="check_label">
						<input type="checkbox" class="check_qq" />选中公开
					</label>
					<span class="error_tips" id="user_qq_tips">请填写你的QQ号或微信号</span>
				</li>
				<li class="h5_input_border">
					<%-- <img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"/> --%>
					<input name="investMemInfo.userMail" value="${investMemInfo.userMail}" type="text"  placeholder="请填写你经常使用的邮箱地址" id="user_email" class="middle checkKey"/>
					<label class="check_label">
						<input type="checkbox" class=" check_email" />选中公开
					</label>
					<span class="error_tips" id="user_email_tips">请填写邮箱地址或QQ号或微信号</span>
				</li>

				<!--li class="h5_agreement">
					<label class="checkInput_label">填写即同意</label>
					<a class="agreement_link" target="_blank" href="http://www.ijointoo.com/data/comm/i9tou.html">《爱就投会员服务协议》</a>
					<span class="error_tips" id="reg_agreement_tips">请先同意爱就投服务协议</span>
				</li-->
				<li class="h5_title">
	    			<p><b class="signInte">*</b> 上传名片  </p>
	    		</li>
				<li class="h5_input_border mt10 h5_input_rela">
					<img alt="" src="${ctx}/file/tf/tfManager/images/choose.png" class="ico_img_choose"/>
					<span class="file_text">创业导师名片</span>
					<input type="file" placeholder="请上传PNG、JPG、GIF格式的图片"  class="short"  id="user_bcard" accept="image" capture="camera"/>
					<button class="file_input"/>上传</button>
					<span class="error_tips" id="user_bcard_tips">请上传PNG、JPG、GIF格式的图片</span>
				</li>
				<li id="user_bcard_show" class="preImageContent">
					<c:if test="${ not empty  investMemInfo.userSts}"><img id="mpImgUri_preview"  src="${ctx}/getCertificate.do?certType=8&uid=${investMemInfo.userId}&timesession=${nowDate}" /></c:if> 
				</li>

				<li>
					<input type="hidden" name="zipHeadPic" id="user_avatar_data"/>
					<input type="hidden" name="zipTouzCard" id="user_bcard_data"/>
					<input type="hidden" name="zipSinglePic" id="user_mien_data" /><!-- 新传个人风采的值 -->
					<input type="hidden" name="pubChk" id="pubChk"/>
					<input type="hidden" name="nosession" value="true"/>
					<input type="hidden" name="addItemId" value="true" id="addItemId" />
					<div class="reg_btn" id="submit_btn"/>提交</div>
				</li>
			</ul>
			<div id="caseInpuHiddens"></div>
	  	</form>
	  	<!-- 过往案例 -->
	  	<header class="clearfix" id="headerTwo">
        	<button class="back__btn" id="backPrep"><img src="${ctx}/file/h5/weixin/images/back-btn.png" alt="返回"></button>
        	<div class="header--title">案例添加</div>
        	<button class="logout__btn"><img src="${ctx}/file/h5/weixin/images/logout.png" alt="退出"></button>
    		</header>
	  	<form enctype="multipart/form-data" id="form_small_main">
	  	
			<div class="bygone"><!-- 后台需传值 -->

				<img src="${ctx}/file/h5/weixin/images/prevHei.png" class="backCollect"/>
				<div class="h5_input_border h5_input_rela">
					<img alt="" src="${ctx}/file/tf/tfManager/images/choose.png" class="ico_img_choose"/>
					<span class="file_text">上传LOGO</span>
					<input type="file" accept="image" capture="camera" class="short"  id="item_pic" placeholder="请上传PNG、JPG、GIF格式个人头像" name="casePic" />
					<button class="file_input"/>上传</button>
					<span class="error_tips" id="item_pic_tips">请上传项目图片</span>
					<input type="hidden" name="zipCasePic" id="item_pic_data" />
				</div>
				<div id="item_pic_show" class="preImageContent" >
					<div class="item_photo"><img class="item_img" src ="${ctx}/${memFeature.featureImgUrl}" /></div>
				</div>
				<div class="h5_input_border">
					<img alt="" src="${ctx}/file/tf/tfManager/images/enter.png" class="ico_img"/>
					<input name="memFeature.featureTitle" type="text"  id="item_name" maxlength="20" placeholder="案例名称" class="checkKey"/>
					<span class="error_tips" id="item_name_tips">请填写你的案例名称</span>
				</div>
				<div class="h5_title">
					<img src="${ctx}/file/tf/tfManager/images/choose.png" class="ico_img_choose" style="margin-right: 10px;" />
					案例描述
				</div>
				<div class="h5_textarea_border">
					<textarea class="desc" id="desc_comment" name="memFeature.featureDesc" placeholder="说点什么吧~"  ></textarea>
					<p class="compNameL"><strong>0</strong>/512</p>
					<span class="error_tips" id="desc_comment_tips">请描述下你的案例</span>
				</div>
				<div class="rwdBtn">
					<input type="button" class="reward_btn" value="保存" id="item_submit" />
				</div>
			</div>
			<input type="hidden" name="nosession" value="true"/>
			<input type="hidden" id="tmpObjId"/>
		</form>
		<!-- 页面警示框 -->
		<div class="alertShow">
			<span></span>
		</div>
		<div class="common_mask"></div>
		<!-- 加载动画 -->
		<div class="loadingPic"></div>
  	    <div class="alertDS alert__exit" id="alertExit">
        <span></span>
        <div class="btn__box clearfix">
            <input type="button" class="btn fl btn--active" value="退出" id="exitBtn">
            <input type="button" class="btn fr btn--warning  btn-close" value="取消">
        </div>
    	</div>
    <script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/commonJs/exif.js"></script>
    <script type="text/javascript">
    	var webroot = "${ctx}";
    	var provinces = "${provinces }";
    	var match = "${investMemInfo.areaRang}";
    	var compRangList = "${compRangList}";
    	var industryMatch = "${investMemInfo.industry}";
    	var userId="${investMemInfo.userId}";
    	var checkArr="${investMemInfo.ciType}";
    	
    	$(function(){
    		console.log("状态码："+"${investMemInfo.userSts}");
    	})
    </script>
    <script type="text/javascript" src="${ctx}/file/tf/tfManager/js/dstfManager.js"></script>
    
	</body>
</html>






























