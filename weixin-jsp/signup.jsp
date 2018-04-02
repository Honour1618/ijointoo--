<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" id="viewport" name="viewport">
	<meta http-equiv="Expires" CONTENT="0"> 
	<meta http-equiv="Cache-Control" CONTENT="no-cache"> 
	<meta http-equiv="Pragma" CONTENT="no-cache"> 
	<title>爱就投预约申请报名</title>
	<link type="text/css" rel="stylesheet" href="${ctx }/h5/css/i9tou_style.css"/>
	<style type="text/css">
		/*新增加样式*/
		.diskHeader{width: 100%;background-color: #fff;}
		.diskTitle{text-align: center;font-size: 18px;padding:15px;}
		.diskTitle a{font-size: 16px;font-style: normal;color: #656565;text-decoration: none;}
		.xian{border-bottom: 1px solid #d3d3d3;width: 95%;margin:0 auto;}
		.promptMoney{background-color: #fff;padding-top:10px;height:40px;}
		.promptMoney span{width:30%;height:40px;display:inline-block;float: left;padding-left:10px;color: #656565;}
		.promptMoney b{width: 60%;display:inline-block;font-size: 14px;height:40px;float: left;color: #f74a3d;font-weight: normal;}
		.funding{background-color: #fff; padding-top: 11px;padding-bottom: 4px;;min-height:35px;height:auto;}
		.funding span{width:30%;height:35px;display:inline-block;float: left;padding-left:10px;color: #656565;}
		.funding .line_span{width:45%;height:35px;display:inline-block;float: left;padding-left:10px;color: #656565;position: relative;}
		.funding .amt_item_static{width: 45%;height: 30px;border: 1px solid #3dc0f7;border-radius: 20px;color: #3dc0f7;background-color: #fff;cursor: pointer;-webkit-appearance: none;margin:5px 5px;}
		.funding .amt_item_selected{width: 45%;height: 30px;border: none;border-radius: 20px;color: #fff;background-color: #3dc0f7;cursor: pointer;-webkit-appearance: none;margin:5px 5px;}
		.selection{background-color: #fff;padding-top:10px;height:40px;margin-bottom:10px; }
		.selection p{line-height: 30px;height:40px;display:inline-block;float: left;padding-left:10px;color: #656565;}
		.selection span{width:40%;height:40px;display:inline-block;float: left;text-align: center;position: relative;cursor: pointer;}
		.selection .inchoose{position: absolute;width:100px;background-color: #fff;top:28px;right:0;display: none;}
		.userInform{background-color: #fff;padding:10px 0;height:30px;}
		.userInform input{height: 30px;width:80%;border:none;font-size:14px;color:#1E1E24;padding-left:10px; }
		.userInform span{width: 10%;padding-left:10px;color: #656565;}
		.userInform1{background-color: #fff;padding:10px 0;height:30px;}
		.userInform1 input{height: 30px;width:80%;border:none;font-size:14px;color:#1E1E24;padding-left:10px;}
		.userInform1 span{width: 10%;padding-left:10px;color: #656565;}
		.userInform2{background-color: #fff;padding:10px 0;height:30px;}
		.userInform2 input{height: 30px;width:30%;border:none;font-size:14px;color:#1E1E24;padding-left:10px;}
		.userInform2 span{width: 20%;padding-left:10px;color: #656565;}
		.userInform2 input.yanZheng{width:100px;border:none;border-left:1px solid #c7c7cd;height: 30px;font-size:14px;color:#077EDB;float: right;cursor: pointer;}
		.userInform3{background-color: #fff;padding:10px 0;height:30px;}
		.userInform3 input{height: 30px;width:60%;border:none;font-size:14px;color:#1E1E24;padding-left:10px;}
		.userInform3 span{width: 10%;padding-left:10px;color: #656565;}
		.userInform4{background-color: #fff;padding:10px 0;}
		.userInform5{background-color: #fff;text-align: center;padding-top: 0px;}
		.userInform5 .wenben{width: 95%;height:70px;border: 1px solid #d3d3d3;font-size:14px;color:#565661;text-indent:5px;padding-top: 5px;outline: medium;}
		.resource{background-color: #fff;text-align: center;text-align: right;padding-right: 10px;font-size: 14px;color: red;}
		.apply{background-color: #fff;padding-top:30px;text-align: center;padding-bottom: 20px;}
		.apply input{width: 80%; height: 40px; border-radius: 20px; background-color: #f74a3d; color: #fff; font-size: 16px; border: none;-webkit-appearance: none;}
		input,textarea{font-family: "微软雅黑";}
		input:FOCUS{outline-style: none;}
		.input_item_box{width: 95%;border:1px dashed #ccc;border-bottom: none;line-height: 20px;margin: auto;padding: 8px 0px;color:#756E6E;}
		input[type=radio],input[type=checkbox],label{vertical-align: middle;margin: 0 0 0 5px;font-size: 14px;}
		.err_msg{color: #D20E0E;width: 100%;margin: auto;font-size: 12px;background-color: rgb(255, 233, 227);text-indent: 10px;height: 25px;line-height: 25px;display: none;}
	</style>
	
</head>
<body class="page_bgcolor">
<!-- 预约开始 -->
<div class="page_body">
<form id="pform" action='<s:url value="/Mobile.action"/>' method="post">
	<input type=hidden name="appCode" value="test"/>
	<input type=hidden name="method" value="wxApply"/>
	<input type=hidden name="finCode" value="${prj.finCode}"/>
	<input type=hidden name="recommendUid" value="${recommendUid}"/>
	<div class="diskHeader">
		<p class="diskTitle">${prj.finName}</p>
	</div>
	<div class="xian"></div>
	<div class="promptMoney">
		<span style="font-weight: bold;">申请提示</span>
		<b class="">实际投资额不超过本人可支配金额融资产的1/10 !</b>
	</div>
	<c:if test="${not empty userAmt }" >
			<div class="funding" style="margin-top:10px;">
				<span style="color:red;width:100%;">您已成功预约：${userAmt }元</span>
			</div>
			<div class="xian"></div>
	</c:if>	
	<div class="funding">
		<span style="font-weight: bold;" class="line_span" >请选择预约金额</span>
	</div>
	<div class="funding">
		<div style="text-align: left;padding-left: 15px;" id="amt_item_list">
			<c:forEach items="${priceList}" var="price" varStatus="status">
				<c:choose>
					<c:when test="${price.reqNum == 0}">
						<input type="button" value="${price.title}" class="amt_item_static" id="amt_item_${status.index }" onclick="amtclick(this,'${price.amt}','${price.textDesc}','${price.priceNo }')"/>
					</c:when>
					<c:otherwise>
						<input type="button" value="${price.title}--${price.reqNum}人次预约" class="amt_item_static" id="amt_item_${status.index }" onclick="amtclick(this,'${price.amt}','${price.textDesc}','${price.priceNo }')"/>
					</c:otherwise>
				</c:choose>
					
			</c:forEach>
			
		</div>
		<div id="amt_desc" style="margin-top:20px;padding-left:15px;padding-bottom:5px;color:red;text-align: left;font-size:14px;"></div>
		<input type="hidden"  name="investAmt" id="investAmt" value="">
		<input type="hidden"  name="priceNo" id="priceNo" value="">
	</div>
	<!-- 
	<div class="funding">
		<span>预约金额</span>
		<input type="button" value="${amtSep}元以下" class="amt_item_selected" id="amt_item_left" onclick="to_change(1)"/>
		<input type="button" value="${amtSep}元及以上" class="amt_item_static" id="amt_item_right" onclick="to_change(0)"/>
	</div>
	
	<div class="xian"></div>
	<div class="selection">
		<p>请选择申请报名金额</p>
		<select name="investAmt" id="investAmt" style="border: none; color: #444; font-size: 14px; font-family: '微软雅黑'; height: 30px; width: 50%; float: right; margin-right: 10px;outline: medium;"></select>
	</div>
	<s:if test="#attr.amtTip != null">
		<div class="div2" style="display: block;">${amtTip}</div><div style="clear:both"></div>
	</s:if>
	<s:else>
		<div class="div2" style="display: none;"></div><div style="clear:both"></div>
	</s:else>
	-->	
	<!-- 用户姓名开始 -->
	<div class="userInform" style="margin-top:10px;">
		<span>姓名</span>
		<input type="text" class="" name="name" placeholder="请输入姓名" value="${uname}">
	</div>
	<div class="err_msg"></div>
	<div class="xian"></div>
	<!-- 用户姓名结束 -->
	
	<!-- 用户手机开始 -->
	<div class="userInform1">
		<span>手机</span>
		<input type="text"  class="" name="phone" id="phone" placeholder="请输入手机号码" value="${utel}">
	</div>
	<div class="err_msg"></div>
	<div class="xian"></div>
	<!-- 用户手机结束 -->
	
	<!-- 验证码开始 -->
	<div class="userInform2" id="dlv_v" <s:if test="#session.rapid == false"> style="display:none"</s:if> >
		<span>验证码</span>
		<input type="tel" name="code" placeholder="请输入验证码" id="vcode">
		<input type="text"  class="yanZheng" value="获取验证码" id="btnSendCode" onclick="sendMessage()">
		<input class="yanZheng" value="60s" id="btnSendCodeTime" style="display: none;"></input>
	</div>
	<div class="err_msg" id="codeTip"></div>
	<div class="xian"></div>
	<!-- 验证码结束 -->
	
	<!-- 推荐人姓名开始 -->
	<c:if test="${empty  rmember }">
		<div class="userInform3">
			<span>推荐人姓名</span>
			<input type="text" name="rname"  id="rname" placeholder="推荐也会有小小惊喜哦（非必填）" value="">
		</div>
		<div class="err_msg"></div>
		<div class="xian"></div>
		<div class="userInform3">
			<span>推荐人手机</span>
			<input  type="tel" name="rphone" id="rphone" placeholder="11位手机号（非必填）" value="">
		</div>
		<div class="err_msg"></div>
		<div class="xian"></div> 
	</c:if>
	<!-- 推荐人姓名结束 -->
	
	<!-- 备注开始 -->
	<div class="userInform3">
		<span>备注</span>
		<input type="text"  name="remark"  id="remark" placeholder="可填写所在城市（非必填）">
	</div>
	<div class="err_msg"></div>
	<div class="xian"></div>
	<!-- 备注结束 -->
	
	<!-- 我的资源开始 -->
	<div class="userInform4" style="height: auto;">
		<div style="height: 30px;padding-left:10px;color: #656565;">我的资源</div>
		<s:if test="#attr.rscMap != null">
			<c:forEach var="list" items="${rscMap}" varStatus="status">
			<div class="input_item_box">
				<input name="rscTip" type="checkbox" value="${list.value}" class="input_size"/><label>${list.key}</label>
			</div>	
			</c:forEach>		
			<div style="border-top: 1px dashed #ccc;width: 95%;margin: auto;"></div>
		</s:if>
	</div>
	<!-- 我的资源结束 -->

	<!-- 相关资源开始 -->
	<div class="userInform5">
		<textarea class="wenben" name="investDesc" id="investDesc" placeholder="在这里输入相关我的资源"></textarea>
	</div>
	<!-- 相关资源结束 -->
	
	<div class="resource">“资源”是您优先入选众筹股东的重要依据</div>

	<!-- 报名开始 -->
	<div class="apply">
		<input type="button" id="sure" value="申请报名">
	</div>
	<!-- 报名结束 -->

</form>
</div>
			
<!-- 预约结束 -->
	<script	type="text/javascript" src="${ctx }/mobile/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx }/js/sha1.js"/></script>
 	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
 	<script src="//wximg.qq.com/wxp/libs/wxmoment/0.0.4/wxmoment.min.js"></script>
	<script	type="text/javascript" src="${ctx }/js/md5.js"></script>
	<script type="text/javascript">
		
		var dataForWeixin={
				appId:	'${jsapi.appId}',//"wx52222341d8f2e13f",
				imgUrl: "${commUrl}${comp.compLogo}",
				link:	"${commUrl}/Mobile.action?appCode=test&method=wxPrj&prjCode=${prj.finCode}<s:if test='#attr.to != null'>&to=${to}</s:if>&rc=${sessionScope.arc}",
				title:	'${prj.finName}',
				desc:	'${prj.finTitle}',
				fakeid:	""
		};
	//	var dataLink = dataForWeixin.link;
		//alert(dataLink);
		var a = "jsapi_ticket=${jsapi.jsapi_ticket}&noncestr=${jsapi.nonceStr}&timestamp=${jsapi.timestamp}&url="+location.href.split('#')[0];
		var signature = hex_sha1(a);
		
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${jsapi.appId}', // 必填，公众号的唯一标识
		    timestamp:'${jsapi.timestamp}', // 必填，生成签名的时间戳 
		    nonceStr: '${jsapi.nonceStr}', // 必填，生成签名的随机串 
		    signature: signature,// 必填，签名，见附录1
		    jsApiList: [
		                'checkJsApi',
		                'onMenuShareTimeline',
		                'onMenuShareAppMessage',
		                'onMenuShareQQ',
		                'onMenuShareWeibo'
		              ]
	   });
	   wx.ready(function () {
		  wx.onMenuShareAppMessage(dataForWeixin);
		  wx.onMenuShareTimeline(dataForWeixin);
		  wx.onMenuShareQQ(dataForWeixin);
		  wx.onMenuShareWeibo(dataForWeixin);
		});
		wx.error(function(res){
		    //config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
			//alert("error");
		});
		
		/*-------------------------------------------*/
		var InterValObj; //timer变量，控制时间
		var count = 90; //间隔函数，1秒执行
		var curCount;//当前剩余秒数
		var code = ""; //验证码
		var codeLength = 6;//验证码长度
		function isChName(val)
		{
			reg = /^[\u4E00-\u9FA5]{2,20}$/;	
			if(!reg.test(val)){
				return false;
			}
			else
				return true ;
		}
		function sendMessage() {
		    curCount = count;
		    var dealType; //验证方式
			var phone=$("#phone").val();//手机号
			if(phone == null ){
				alert("请先输入手机号码");
				return;
			}else if(!/^\d{11,11}$/.test(phone)){
				alert("手机号码11位，请重新输入");
				$("#phone").focus();
				return;
			}
		    //设置button效果，开始计时
		    $("#btnSendCode").hide();
		    $("#btnSendCodeTime").show().val(curCount + "秒");
		    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
			rd1 = genR(phone);
			//向后台发送处理数据
		    $.ajax({
		            type: "POST", //用POST方式传输
		            dataType: "json", //数据格式:JSON
		            url: '<s:url value="/PtlVCode!applyR.action"/>', //目标地址
		            data: { "nosession": true,"tel": phone ,"rd":rd1 },//nosession 未登录ajax 请求有效
		            error: function (XMLHttpRequest, textStatus, errorThrown) { },
		            success: function (msg){ }
		    });
		}
		//timer处理函数 
		function SetRemainTime() {
		    if (curCount == 0) {                
		        window.clearInterval(InterValObj);//停止计时器
			    $("#btnSendCodeTime").hide();
		        $("#btnSendCode").show().val("点击重新获取");
		        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
		    }
		    else {
		        curCount--;
		        $("#btnSendCodeTime").val( curCount + "秒");
		    }
		}    
		function verify(){
			var phone=$("#phone").val();//手机号
			var code =$("#vcode").val();//验证码
			var rphone =$("#rphone").val();//验证码
			var flag = false ;
			var amt = $("#investAmt").val();//金额
			if(rphone != null && rphone == phone)
		    {
				alert("推荐人不能是您本人");
				return ;
		    }
			if(!confirm("您此次申请报名的金额是 ："+(amt/10000) +"万。\n按'确定'提交申请,按'取消'修改金额"))
			{
				$("#investAmt").focus();
				return ;
			}
			$("#sure").val("正在处理,请稍候...");
			$("#sure").attr("disabled", "true");
			if($("#dlv_v").is(":hidden"))
			{
               	$("#pform").submit();
             	$("#sure").removeAttr("disabled");
             	return ;
			}
		    $.ajax({
		        type: "POST", //用POST方式传输
		        dataType: "json", //数据格式:JSON
		        url: '<s:url value="/PtlVCode!verify.action"/>', //目标地址
		        data: { "nosession": true,"tel": phone,"code":code },//nosession 未登录ajax 请求有效
		        error: function (XMLHttpRequest, textStatus, errorThrown) { 
		        	flag =  false ;
		           	$("#sure").removeAttr("disabled");
		        	$("#sure").val("申请报名");
		          
		        },
		        success: function (data){ 
		        	if(data.result == '0')
		        	{
		               	$("#pform").submit();
		             	$("#sure").removeAttr("disabled");
		         	}
		        	else
		        	{
						curCount = 0 ;
				$("#codeTip").show();
				$("#codeTip").html("验证码输入有误,请重新输入");
		            	$("#sure").removeAttr("disabled");
		         	$("#sure").val("申请报名");
		     		alert("验证码输入有误,请重新输入");
		     		$("#vcode").val("");
		     		$("#vcode").focus();
		      		}
		        	
		        }
		    });
			return flag ;
		}
		function recommCheck(){
			var  rName =$("#rname").val();
			var  rPhone = $("#rphone").val();
			if(rName != null && rName.length> 0){
				if(rName.length>14||rName.length<2){
					alert("姓名长度为2-14个字符");
					document.getElementsByName("rname").focus();
					return false ;
				}
				if(rPhone == null || rPhone.length == 0){
					alert("请输入推荐人手机号");
					$("#rphone").focus();
					return false ;
				}
			}	
			if(rPhone != null && rPhone.length> 0){
				if(!/^\d{11,11}$/.test(rPhone)){
					alert("手机号格式不对：11位");
					document.getElementsByName("rphone").focus();
					return false ;
				}
				if(rName == null || rName.length == 0)
				{
					alert("请输入推荐人姓名");
					$("#rname").focus();
					return false ;
				}
			}	
			return true ;
		}
		function rscCheck(){
			var  rscChks =document.getElementsByName("rscTip");
			var  remark = document.getElementsByName("remark").value;
			var chkFlg = false ;
			if(rscChks != null){
				$("[name='rscTip']").each(function(){
					if(this.checked)
						chkFlg = true ;
				});
				if(!chkFlg && (remark == null || remark.length < 6)){
					alert("请至少选择一个或填写一下您拥有的资源");
					return false;
				}
			}else{
				if((remark == null || remark.length < 6)){
					alert("请填写一下您的资源");
					return false;
				}
			}
			return true ;
		}
		
		function to_change(type)
		{
			var ihtml='<option value="" selected>--请选择申请报名金额--</option>';
			if(type==0) //领投
			{
				<c:if test="${fn:length(amtMaps1) lt 2}">
					ihtml='';
				</c:if>
				$("#lb_follow").removeClass("lb_color");
				$("#lb_lead").addClass("lb_color");
				<c:forEach var="list" items="${amtMaps1}" varStatus="status">
					ihtml+='<option value="${list.key}">${list.value} </option>';
				</c:forEach>
				$("#amt_item_right").removeClass("amt_item_static").addClass("amt_item_selected");
				$("#amt_item_left").removeClass("amt_item_selected").addClass("amt_item_static");
			}
			if(type==1)//跟投
			{
				<c:if test="${fn:length(amtMaps) lt 2}">
					ihtml='';
				</c:if>
				$("#lb_lead").removeClass("lb_color");
				$("#lb_follow").addClass("lb_color");
				<c:forEach var="list" items="${amtMaps}" varStatus="status">
					ihtml+='<option value="${list.key}">${list.value} </option>';
				</c:forEach>
				$("#amt_item_left").removeClass("amt_item_static").addClass("amt_item_selected");
				$("#amt_item_right").removeClass("amt_item_selected").addClass("amt_item_static");
			}
			$("#investAmt").val("");
			$("#investAmt").html(ihtml);
		}
		
		
		function amtclick(obj,amt,desc,priceNo){
			/** 初始化所有按钮为   未选中状态  */
			$("#amt_item_list input").removeClass("amt_item_selected").addClass("amt_item_static");
			/** 当前点击按钮选中  */
			$("#"+obj.id).removeClass("amt_item_static").addClass("amt_item_selected");
			if(desc != null && desc.length > 5)
				$("#amt_desc").html("预约提示：  "+desc);
			else
				$("#amt_desc").html("");
			$("#investAmt").val(amt/100);
			$("#priceNo").val(priceNo);
		}
		//pageload 
		$(function(){
			$("#sure").click(function(){
				if($("#investAmt").val()=='')
				{
					alert("请选择您此次申请报名的金额");
					$("#investAmt").focus();
					return ;
				}
				$("input[name='name']").blur();
				$("input[name='phone']").blur();
				$("input[name='code']").blur();
				if(!recommCheck())
					return ;
				if($("input[name='name']").data("canSave")&&$("input[name='phone']").data("canSave") ){
					if(!$("#dlv_v").is(":hidden")) {
						if($("input[name='code']").data("canSave"))
							verify();
					}
					else
						verify();
				}
			
			});
			$("input[name='name']").blur(function(){
				if($(this).val().trim().length ==0){
					$(this).parent().next().show();
					$(this).parent().next().html("姓名不能为空");
					$(this).data("canSave",false);
				}else if($(this).val().length>20||$(this).val().length<2){
					$(this).parent().next().show();
					$(this).parent().next().html("姓名长度为2-20个字符");
					$(this).css({
						borderColor: '#FF6D4F',
		            	backgroundColor:'#FFE9E3'
					});
					$(this).data("canSave",false);
				}else{
					 
					if(!isChName($(this).val()))
					{
						$(this).parent().next().show();
						$(this).parent().next().html("请输入正确的中文姓名");
						$(this).data("canSave",false);
					}
					else
				    {
						$(this).parent().next().hide();
						$(this).parent().next().html("");
						$(this).data("canSave",true);
				    }
				}
			});
			$("input[name='code']").blur(function(){
				if($("#dlv_v").is(":hidden"))
					return ;
				var cv = $(this).val().trim().length;
				if(cv == 0 ){
					$("#codeTip").show();
					$("#codeTip").html("验证码不能为空");
					$(this).data("canSave",false);
				}else if(cv < 4){
					$("#codeTip").show();
					$("#codeTip").html("输入不正确，验证码为4-6位数字");
					$(this).data("canSave",false);
				}else{
					$("#codeTip").hide();
					$("#codeTip").html("");
					$(this).data("canSave",true);
				}
			});
			$("input[name='phone']").blur(function(){
				var sTel='${utel}';
				if($(this).val().trim()==""){
					$(this).parent().next().show();
					$(this).parent().next().html("手机号不能为空");
					$(this).data("canSave",false);
				}else if(!/^\d{11,11}$/.test($(this).val())){
					$(this).parent().next().show();
					$(this).parent().next().html("手机号格式不对：11位");
					$(this).data("canSave",false);
				}else{
					if($(this).val()!=sTel){
						if($("#dlv_v").is(":hidden"))
							$("#dlv_v").show();
					}else{
						<s:if test="#session.rapid == false">
							$("#dlv_v").hide();
						</s:if>
					}
					$(this).parent().next().hide();
					$(this).parent().next().html("");
					$(this).data("canSave",true);
				}
			});
			to_change(1);
			
			$(".input_item_box label,img").click(function(){
           		$(this).parent().siblings(".input_item_box").find("input").checked = '';
				var $input = $(this).siblings("input");
				var input = $input.get(0);
				if(input.checked)
					input.checked = '';
				else
					input.checked = 'checked';
			});
		});
		//if (document.all) 
		//	document.body.style.csstext="border:5 ridge red";
		
		
	</script>
</body>
</html>