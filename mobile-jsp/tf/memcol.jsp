<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en" font-size="62.5%">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投|优选创业导师|让专业发挥价值</title>
    <meta name="description" content="爱就投，让资本带着资源，投向真的有梦想的企业，成就每个人的创富梦想！爱就投，让人类商业文明提前进入共产主义！精品项目，爱就投！"/>
	<meta name="keywords" content="爱就投，私募股权融资，众筹，筹众，股权融资，股权投资，原始股，原始股投资，移动交易平台"/>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${ctx}/file/tf/tfManager/css/tfManager.css" />
</head>
	<!-- 融测测投资经理信息收集 -->
    <body class="clearfix">
	  	<div class="page">
	  	<form action="PtlTf!memColDo.action" method="post" enctype="multipart/form-data" id="form_main">
            <div class="teac-title"><img src="${ctx}/file/tf/tfManager/images/teacher-title_03.png" alt="导师登记" ></div>
            <dl class="teac-msg-box">
                <dt><img src="${ctx}/file/tf/tfManager/images/teac-msg_03.png" alt="大侠姓名"></dt>
                <dd><input type="text" maxlength="20" id="user-name" name="investMemInfo.userName" placeholder="请输入您的姓名（2-20个汉字）"></dd>
                <dt><img src="${ctx}/file/tf/tfManager/images/teac-msg_13.png" alt="大侠手机号码" ></dt>
                <dd><input type="tel" maxlength="11" id="tel-number" name="investMemInfo.userMobile" placeholder="请输入您的中国大陆手机号码"></dd>
                <dt><img src="${ctx}/file/tf/tfManager/images/teac-msg_15.png" alt="大侠名帖"></dt>
                <!--        <dd><input type="file" id="user_avatar" class="user_acatar_btn" accept="image" capture="camera" ><button class="uploadIcon" id="upload-avatar">上传</button><input type="hidden" class="userAvatarData" id="user_avatar_data" /></dd>-->
                <dd >
                    <input type="file" id="user_avatar" class="user_acatar_btn" accept="image"  >
                    <div id="user_avatar_show" class="user-img-show"></div>
                </dd>
                <dd >
                    <input type="file" id="user_avatar2" class="user_acatar_btn2" accept="image"  >
                    <botton class="iconUp">重新选择</botton>
                    <input type="hidden" name="zipTouzCard" id="user_avatar_data" />	
                    <input type="hidden" name="operType" value="step1" />
                </dd>
            </dl>
            <button id="subApply" class="sub-apply"></button>
            <img src="${ctx}/file/tf/tfManager/images/teac-bottom-bg_09.png" alt="底部背景" class="boxBg">
            </form>
        </div>

		<!-- 页面警示框 -->
		<div class="alertShow">
			<span></span>
		</div>
		<div class="common_mask"></div>
		<!-- 加载动画 -->
		<div class="loadingPic"></div>
  	

    
<%--     <script type="text/javascript" src="${ctx}/file/tf/tfManager/js/tfManager.js"></script> --%>
    
	</body>
	<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/file/commonJs/exif.js"></script>
    <script type="text/javascript" src="${ctx}/file/tf/tfManager/js/judgeWeb.js"></script>
    <script type="text/javascript">
   
	var webroot = "${ctx}";
	var provinces = "${provinces }";
	var match = "${investMemInfo.areaRang}";
	var compRangList = "${compRangList}";
	var industryMatch = "${investMemInfo.industry}";
    //上传头像预览
    document.getElementById("user_avatar").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#user_avatar_show") , $("#user_avatar_data") , "360");
        }
        $("#user_avatar").css("display","none");
        $(".user_acatar_btn2").show();
        $(".iconUp").css("display","block");
       
        
    });

    //上传头像预览2
    document.getElementById("user_avatar2").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#user_avatar_show") , $("#user_avatar_data") , "360");
        }
        
    });
    //检验图片提交
    function checkFile(files , showObj , dataObj , nowSize){
        if( showObj != undefined ){
            showObj.html("").show();
        }

        if (files.length != 0) {
            //获取文件并用FileReader进行读取
            var html = '';

            var orientation = 0;
            EXIF.getData(files[0],function(){
                orientation=EXIF.getTag(this,'Orientation');
            });

            var reader = new FileReader();
            if(!/image\/\w+/.test(files[0].type)){
                showObj.html("请确保文件为图像类型");
                return false;
            }

            reader.onload = function(e) {
                getImgData(this.result,orientation,function(data){
                    //这里可以使用校正后的图片data了
                    if( dataObj != undefined ){
                        dataObj.val(data);
                    }
                    html = '<div class="item"><img src="'+data+'" /></div>';
                    if( showObj != undefined ){
                        showObj.html(html);
                    }
                } , nowSize);
            };
            reader.readAsDataURL(files[0]);
        }
    }

    //图片压缩
    function getImgData(dataURL,dir,callback , nowSize){

        img = new Image(),
            degree=0;
        img.onload = function() {
            var degree=0,drawWidth,drawHeight,width,height;
            drawWidth=this.naturalWidth;
            drawHeight=this.naturalHeight;
            //以下改变一下图片大小
            var maxSide = Math.max(drawWidth, drawHeight);
            if (maxSide > nowSize) {
                var minSide = Math.min(drawWidth, drawHeight);
                minSide = minSide / maxSide * nowSize;
                maxSide = nowSize;
                if (drawWidth > drawHeight) {
                    drawWidth = maxSide;
                    drawHeight = minSide;
                } else {
                    drawWidth = maxSide;
                    drawHeight = maxSide*maxSide/minSide;
                }
            }
            var canvas=document.createElement('canvas');
            canvas.width=width=drawWidth;
            canvas.height=height=drawHeight;
            var context=canvas.getContext('2d');

            //判断图片方向，重置canvas大小，确定旋转角度
            switch(dir){
                case 3:
                    degree=180;
                    drawWidth=-width;
                    drawHeight=-height;
                    break;
                case 6:
                    canvas.width=height;
                    canvas.height=width;
                    degree=90;
                    drawWidth=width;
                    drawHeight=-height;
                    break;
                case 8:
                    canvas.width=height;
                    canvas.height=width;
                    degree=270;
                    drawWidth=-width;
                    drawHeight=height;
                    break;
            }
            //使用canvas旋转校正
            context.fillStyle = "#fff";
            context.fillRect(0, 0, canvas.width, canvas.height);
            context.rotate(degree*Math.PI/180);
            context.drawImage(this,0,0,drawWidth,drawHeight);
            //返回校正图片
            callback(canvas.toDataURL("image/jpeg",1));

        };
        img.src = dataURL;
    }
    
    
    /**
     * 验证手机号
     * @param s
     * @returns {Boolean}
     */
     function isMobile(s){
   		//电信号段:133/153/180/181/189/177；
   		//联通号段:130/131/132/155/156/185/186/145/176/175/166；
   		//移动号段：134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
   		var patrn= /^(13[0-9]|14[579]|15[0-9]|16[6]|17[135678]|18[0123456789])\d{8}$/ ;
   		if (!patrn.test(s))
   			return false;
   		return true;
   	}

    /**
     * 是否是中文名
     * @param val
     * @returns
     */
    function isChName(val){
    	var patrn = /^[\u4E00-\u9FA5]{2,20}$/;	
    	if(!patrn.test(val))
    		return false;
    	else
    		return true ;
    }

    /* 判断上传文件是否为符合图片规范 */
    function isImageFile(val){
    	var patrn = /\.(jpg|png|gif|jpeg)$/i;
    	if (!patrn.test(val))	return false;
    	return true;	
    }

    /* 验证提交规则 */
    function subPd(){
    	var uname=$("#user-name").val();
    	var telNum=$("#tel-number").val();
		var imgVal = $('#user_avatar_data').val();
		
    	if(uname==""||uname.length<2|| !isChName(uname)){
    		alertShow("姓名格式有误",1000);
    		return false;
    	}else if(telNum == "" || !isMobile(telNum)){
    		alertShow("手机号格式有误",1000);
    		return false;
    	}else if(imgVal=="undefined" || imgVal ==""){
    		alertShow("请选择图片",1000);
			return false;
		}else{
			console.log("ok");
			return true;
		}

    }
    
    /*弹出警示框*/
    var alertTimer = null;
    function alertShow(str , timer){
    	$(".alertShow,.common_mask").show();
    	$(".alertShow span").html(str);
    	clearTimeout(alertTimer);
    	alertTimer = setTimeout(function(){
    		$(".alertShow,.common_mask").hide();
    	} , timer);
    }
    	$(function(){
    		$("#subApply").on("click",function(){
    			if(subPd()){
    				
    				return true;
    			}else{
    				subPd();
    				console.log("手机号或者用户名错误");
    				return false;
    			}
    		})
    	})
    </script>
</html>






























