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
	<link  type="image/x-icon" rel="shortcut icon" href="<s:url value="/favicon.ico"/>" /> 
	<link type="text/css" rel="stylesheet"  href="${ctx }/web/js/bootstrap/3.2.0/css/bootstrap.min.css"/>
	<!-- <link type="text/css" rel="stylesheet" href="${ctx }/h5/css/mobile.css"/> -->
	<link type="text/css" rel="stylesheet" href="${ctx }/h5/css/i9tou_style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/h5/css/iscroll.css">
	<%-- <script type="text/javascript" src="${ctx }/h5/js/iscroll-x.js"></script> --%>
	<style type="text/css">
		/* 顶部开始 */
		#top_wrap{
			background: #fff;
		}
		.top{
			width: 100%;
			height: 38px;
			line-height: 38px;
			text-align: center;
			font-size: 18px;
			position:relative;
			box-shadow: 1px 0px 3px #999;
		}
		.top_left{
			width: 36px;
			height: 36px;
			background: url('${ctx}/file/h5/weixin/images/back.png') 13px no-repeat;
			background-size: 10px 16px;
			position:absolute;
			left:0px;
			top:1px;
		}
		/* 顶部结束 */
		#sidebar-tab{margin-bottom:1.5em;overflow:hidden;}
		#tab-title{border-bottom: 1px solid #e7e7e7;float: left;width: 100%;height: 32px;margin-top: 20px;}
		#tab-title div.tabTag{cursor:pointer;float: left;height: 100%;width: 50%;text-align: center;/*line-height: 32px;*/font-size: 14px;}
		#tab-title div.selected{color:#33a9fc;border-bottom:2px solid #33a9fc;padding: 0 38px;font-size:14px;} /*标题被选中时的样式*/
		#tab-content .hide{display:none;} /*默认让第一块内容显示，其余隐藏*/
		#tab-content div.tabContent{padding: 10px 0;overflow:hidden;}
		#tab-content div.tabContent textarea{resize:none;border:1px solid #e6e6e6;padding:5px 0 50px 5px;}
		#tab-content div.tabContent img{text-align: center;border-radius:3px;}
		.risk_tip {background-color: rgba(0, 0, 0, 0.75);display:none;position: absolute;margin-top: 100px; min-height: 200px;width:100%;max-width: 640px; padding: 10px;color: #fff;cursor: pointer;line-height: 30px;z-index: 999;}
		.closebox{position: absolute;top: 5px;right: 10px;font-family: cursive;font-size:20px;;color: white;width: 20px;height: 25px;cursor: pointer;font-family:"微软雅黑";}
		.prj_process_dtl{padding-left: 10px;padding-right: 10px; padding-top: 5px; border:1px solid;}
		.prj_process_dtl div.row{margin-top: 5px;}
		/*改动*/
		.btn_group{height: 60px;border-top: 1px solid #e6e6e6;position: fixed;bottom: 0;width: 100%;max-width: 640px;background-color: #f5f5f5;padding-top: 10px;}
		.forum_btn{width: 20%;float: left;color:#333;text-align: center;line-height: 68px;font-size: 14px;cursor: pointer;border: none;}
		.forum_btn span{position: relative;}
		.forum_btn img{width:25px;height:25px;position: absolute;top:-23px;left:6px;}
		.forum_btn2{width: 20%;float: right;color:#333;text-align: center;line-height: 68px;font-size: 14px;cursor: pointer;border: none;}
		.forum_btn2 span{position:relative;}
		.forum_btn2 img{width:25px;height:25px;position: absolute;top:-23px;left:6px;}
		.apply_btn{width:60%;float: left;background-color: #f74a3d;color: #fff;text-align: center;line-height: 38px;font-size: 16px;cursor: pointer;border: none;border-radius: 19px;height:38px;}
		#weixin_block a{padding-bottom:15px;display: block;}
		/*改动*/
		.control-module { background: none repeat scroll 0 0 #f5f5f5; padding: 0 5.5% 0 6.1%; margin-bottom:10px}
		.control-module em {line-height: 52px;padding-left: 8px;font-style:normal;}		
		.control-module em  i { border-bottom: 4px solid transparent; border-left: 4px solid #333; border-top: 4px solid transparent;display: inline-block;height: 0;margin-left: -10px;margin-top: 22px;position: absolute; width: 0;}
		.module-border{border: 1px solid #ff6633; height: 35px;line-height: 35px;text-align: center;border-radius: 4px;width: 70px;margin-top: 8px;}
	    .prjTip{  color: #fff;display: inline-block;font-size: 22px;min-height: 24px;position:absolute;left:5px;border-bottom: 2px solid #fff}
		.itemTip {display:none;width:100%;text-align:right;height:20px;line-height:20px;color:red;font-size: 12px;magin-bottom:2px}
		.q_title{background-color: #fff;padding:12px 15px;}
		.q_title table tr td{padding:0 6px 6px 0;text-align:left;color:#a2a2a2;}
		.q_title strong{text-align:left;color:#656565;font-size:14px;}
		.q_content{padding-left:20px;padding-top:3px;padding-bottom:3px;background:white;font-size:14px;color:#0a7ac4;margin-bottom:10px;}
		.queationLine{border:1px solid #eee;width:100%;margin: 0 auto;padding:0 6px;margin-bottom:5px;}
		
		
		/*项目足迹css样式开始*/
		body{font-family: "微软雅黑";}
		.theme{width: 100%;text-align:center;border-bottom: 1px solid #cdcdcd;background-color: #fff;}
		.theme p{padding:10px;margin-top:20px;color: #343434;font-size: 20px;}
		.signupBanner{text-align: center;position: relative;}
		.signupBanner img{width:100%;}
		.signupBanner .youxuan{width: 100px;position: absolute;right: 6%; bottom: -20px;}
		.navTab{width: 100%;background-color: #fff;}
		.navTab ul{overflow:hidden;zoom:1;padding:10px 6px 0 0;}
		.navTab ul li{width: 25%;float: left;font-size: 18px;text-align: center;border-right: 1px solid #cdcdcd;margin-top: 10px;font-size:16px;color:#3ba1ba}
		.navTab ul li.current{border-right: none;}
		.progressMain{width: 100%;border-bottom: 1px solid #cdcdcd;padding: 20px;background-color: #fff;}
		/*.progressBar1{width:100%;height:20px;margin: 0 auto;background-color:#cdcdcd;border-radius: 13px;padding-right: 100px;}
		.inProgressBar1{width:100%;height:20px;background-color:#fd7b66;border-radius: 13px;text-align:center;}
		.inProgressBar1 a{text-decoration:none;line-height: 20px;color: #fff}*/
		.inprogressBar1{background-color: #fd7b66;height:20px;border-radius: 13px;}
		.nummber1{font-size: 14px;padding-bottom:5px;}
		.nummber1 .load{padding-right:0px;padding-left:0px;width:60px;height:40px;background-size: cover;margin-left:5px;}
		.nummber1 span{padding-left:5px;}
		.nummber2{text-align:right;font-size: 14px;padding-right:5px;}
		.nummber2 .load1{padding-right:0px;padding-left:0px;width:60px;height:40px;background-size: cover;margin-top:5px;}
		.nummber2 span{padding-right:5px;text-align:right;padding-top:26px;margin-left:-1px;}
		.idea{font-size: 18px;margin-top: 10px;}
		.proSand{background-color: #fff;width: 100%;padding-bottom: 15px;}
		.inproSand{padding-top:15px;}
		.proSand p a{text-decoration: none;}
		.inproSand{width: 100%;}
		.inproSand li{;text-align: center;border-right: 1px solid #cdcdcd;padding: 0 14px 0 0;color:#fea201;font-size:16px;}
		.inproSand li span{color:#fea201}
		.inproSand li.current{border-right:none;}
		.inproSand li a{font-size: 20px; color:#fea201;text-decoration:none;}
		.inproSand li b{font-size: 14px;color:#929191;font-style:normal;font-weight:normal;}
		.project{width: 100%;padding: 20px 5px 15px 20px;font-size: 16px;color:#343434;}
		.footprint{width: 100%;background-color: #fff;padding:20px 0;}
		.footprint .dianji{margin: 0 auto;background-color: #ccc;width:96%;}
		/*.infootPint1{height: 30px;background-color: #43b5fe;float: left;margin-left:5px; font-size:14px;color:#fff;text-align: center;line-height:30px;outline-style: medium;border: none;}*/
		.infootPint1{width:47%;float: left;border-radius:3px;}
		/*.infootPint2{height: 30px;background-color: #43b5fe;float: right;margin-right: 5px; font-size:14px;color:#fff;text-align: center;line-height:30px;outline-style: medium;border: none;}*/
		.infootPint2{;width:47%;float:right;border-radius:3px;}
		.inestFlow img{width:100%;}
		.financing{background-color: #fff;width: 100%;}
		.financing img{width:80%;margin:0 auto;}
		.financing p{font-size:14px;line-height:30px;padding:12px 10px 5px 25px;text-align:left;}
		.financing p a{color: #343434;font-size:14px;text-decoration: none;}
		.introduct{text-align: center;}
		.introduct .imgHeader{margin:0 auto;} 
		.introduct .imgbody{width: 100%;margin:0 auto;}
		.pictureDoc{background-color: #fff;text-align: center;}
		.pictureDoc img{width: 100%;}
		.risk{padding: 0 20px;text-align:center;}
		.risk img{margin:0 auto;}
		.risk .wenzi{color: #33a9fc;text-align:left;padding-top:20px;line-height:25px;padding-left:18px;font-size:14px;}
		.linePhone a{color:#fb9318;padding:15px 0 0 20px;display: block;font-size:16px;margin-bottom: 10px;}
		.aboutMore{width:100%;padding:28px 100px;background-color: #fff;text-align: center;}
		.aboutMore input{background-color: #43b5fe;height:35px;outline-style:medium;color:#fff;border:none;font-size:14px;border-radius:2px;}
		.crowdFund{background-color: #fff;width: 100%;padding:15px 50px;}
		.foud a{height:100%;font-size: 16px;color:#343434;}
		.crowdFund img{width: 100%;margin-top: 5px;}
		.crowdFund h4{text-align:center;padding:10px 0;height: 35px;border-bottom: 1px solid #33a9fc;margin:10px auto;width:80%;}
		.crowdFund h4 a{color:#33a9fc; }
		.nowStatus{width: 100%;padding:13px;position: relative;background-color: #f2f2f2;}
		.nowStatus span a{font-size: 16px;}
		.nowStatus span a b{color: #f74a3d; margin-left: 5px;}
		.nowStatus .closeBnt{width:30px;height:30px;position: fixed;top:5px;right:5px;z-index:101;}
		.nowYear{width:100%;position:relative;}
		.newMain{width:100%;padding-bottom: 50px;}
		.inheader{width:100%;height:35px;line-height: 35px;font-size:14px;position: relative;padding-left: 20px;position: relative;}
		.mounth1{padding-right:0px;}
		.marcTime1{height:35px;font-size:14px;padding-top:3px;margin:0 auto;position:absolute;top:2px;left:-58px;width:20%;}
		.marcTime1 b{width:12px;height:12px;border-radius:50%;display: block;background-color: #d1d1d1;position:absolute;top:-18px;left:51px;}
		.marcTime1 	img{width:40px;height:24px;}
		.inheader .marcTime1 span{position:absolute;top:-4px;left: 1px;text-align:center;color:#acacac;text-decoration:none;font-size:12px;}
		.line{width:100%;background-color: #fff;position:relative;min-height:30px;}
		.line .inheader2{width:100%;line-height: 35px;font-size:14px;position: relative;padding-left: 20px;position: relative;}
		.inheader2 .yuan{width:12px;height: 12px;background-color: #e7e7e7;display: inline-block;border-radius: 50%;position: absolute;top:12px;left: -7px;z-index:1;}
		.line .marcTime2{height:35px;font-size:14px;padding-top:3px;margin:0 auto;position:absolute;top:2px;left:-58px;width:20%;z-index:1;}
		.line .marcTime2 img{width:40px;height:24px;z-index:1;}
		.line .marcTime2 span{position:absolute;top:-2px;left: 1px;text-align:center;font-size:12px;color:#a3a3a3;}
		.yearTimer1{height:35px;font-size:14px;padding-top:3px;margin:0 auto;position:absolute;top:-26px;left:-58px;}
		.yearTimer1 img{width:38px;height:24px;}
		.yearTimer1 span{position:absolute;top:-4px;left: 3px;font-size:12px;text-align:center;}
		.yearTimer1 span a{color:#a3a3a3;text-decoration:normal;}
		.inheader .yuan{width:12px;height: 12px;background-color: #ccc;display: inline-block;border-radius: 50%;position: absolute;top:10px;left: -5px;background-color: #32a9fd;}
		.inheader .active{background-color: #f64a3c;}
		.inheader .disabled{background-color: #d3d3d3;}
		.onheader{width:100%;height:40px;}
		.inheader span{padding:2px 10px 2px 0;color: #3cabff;}
		.inheader .active_txt{color: #f44d3b;border-right:none;}
		.inheader .land{border-right:none;}
		.inheader .overEnd{border-right:none;color: #d3d3d3;}
		.inbody .overEnd{border-right:none;color: #d3d3d3;}
		.inbody .mainLeft{border-left: 2px solid #d3d3d3;}
		.inbody .keepLeft{border-left: 2px solid #f44736;}
		.inbody a{text-decoration: none;}
		.inbody p{padding:0 0 0 20px;border-left: 2px solid #32a9fd;min-height:20px;color:#666666;}
		.inbody .active_desc{border-left: 2px solid #f44d3b;}
		.inbody p a{color:#666666;}
		.inbody p b{color:#666666;font-weight:normal; }
		.inheader .plan1{width:40%;height:26px;border-radius:15px;line-height:26px;text-align: center;border:none;outline:medium;background-color: #36a9f9;color:#fff;float:right;}
		.inbody p.current{padding-bottom:20px;}
		.listForm1{padding:10px;border-bottom: 1px solid #e7e7e7;color: #33a9fc;font-size:14px;}
		.listForm2{padding:10px;border-bottom: 1px solid #e7e7e7;font-size:14px;}
		.closebox1{position: absolute;top: 10px;right: 10px;font-family: cursive;font-size:20px;;color: white;width: 20px;height: 25px;cursor: pointer;font-family:"微软雅黑";}
		
		
		.fixed_btns {position: fixed;bottom: 120px;right: 20px;}
		.fixed_btns a{font-size: 14px;text-align:center;text-decoration:none;color:#d1d1d1;display:block;width:50px;-moz-transition:color 1s; -webkit-transition:color 1s;-o-transition:color 1s;}
		.fixed_btns a .remittance{display:block;height:50px;width:50px;background:url(${ctx}/h5/img/remittance.png) no-repeat center center;-moz-transition:background 1s;-webkit-transition:background 1s;-o-transition:background 1s;border-radius: 50%;-webkit-background-size: cover;background-size: cover;z-index:100;}
		.fixed_btns a .luyan{display:block;height:50px;width:50px;background:url(${ctx}/h5/img/luyan.png) no-repeat center center;-moz-transition:background 1s;-webkit-transition:background 1s;-o-transition:background 1s;border-radius: 50%;-webkit-background-size: cover;background-size: cover;z-index:100;}
		.shixian{border:1px solid #f5f5f5;width:100%;position: absolute;top:17px;}
		#wrapper{z-index:10;}
		.f_title{font-size: 18px;width: 100%;text-indent: 10px}
		.f_content{background-color: #FFFFFF;color: #000000;font-size: 17px;line-height: 25px; margin: 0 0px;padding: 0 10px;text-align: left}
		img{vertical-align: middle;width:100%;border:0;display: block;}
		pre {  white-space: pre-wrap;       /* css-3 */ white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */ white-space: -pre-wrap;      /* Opera 4-6 */ white-space: -o-pre-wrap;    /* Opera 7 */ word-wrap: break-word;       /* Internet Explorer 5.5+ */ overflow: auto}
		.sign_btn_gray {
			background: #d4d4d4; /* Old browsers */
			background: -moz-linear-gradient(top,  #c0bebe 1%, #d4d4d4 100%); /* FF3.6+ */
			background: -webkit-gradient(linear, left top, left bottom, color-stop(1%,#c0bebe), color-stop(100%,#d4d4d4)); /* Chrome,Safari4+ */
			background: -webkit-linear-gradient(top,  #c0bebe 1%,#d4d4d4 100%); /* Chrome10+,Safari5.1+ */
			background: -o-linear-gradient(top,  #c0bebe 1%,#d4d4d4 100%); /* Opera 11.10+ */
			background: -ms-linear-gradient(top,  #c0bebe 1%,#d4d4d4 100%); /* IE10+ */
			background: linear-gradient(to bottom,  #c0bebe 1%,#d4d4d4 100%); /* W3C */
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#c0bebe', endColorstr='#d4d4d4',GradientType=0 ); /* IE6-9 */
		}
		.shareTip{position: fixed;width:100%;max-width:640px;height:100%;top: 0;z-index:10001;background-image:url('${ctx}/h5/img/shareImg.png');
			background-position:right 0;background-repeat:no-repeat;background-color:rgba(0, 0, 0, 0.73);display:none;}
			
		.thelist_req_item{width:100%;min-height: 100px;border-top: 1px solid#EFEFEF;margin-top: 8px;float: left;background-color: #fff;font-family: 微软雅黑,Arial;font-size:13px;cursor: pointer;}
		.thelist_txt_group{float: left;width: 100%;}
		.thelist_photo{width: 50px;margin: 15px 20px 0 20px;;float: left;position: absolute;}
		.thelist_text{padding-left: 90px;width: 100%;float: left;}
		.thelist_title{height: 25px;margin-top: 15px;}
		.thelist_content{height: auto;line-height: 20px;margin-right:15px;margin-bottom:5px;}
		.thelist_nav_block{width: 230px;height: 35px;margin: 10px auto;cursor: pointer;font-size: 16px;font-weight: bold;font-family: 微软雅黑;}
		.thelist_footer{z-index:999; position: fixed; bottom:10px;right: 0px; width: 100%; }
		.thelist_comments{float:right;margin-right: 15px;font-size: 12px;}
		.thelist_userlogo{border-radius: 100%;width: 50px;}
		.rsp_block{width: 99%;width: 99%;padding: 10px 10px 10px 10px;margin: 5px 0;background-color: #f5f5f5;}
		.rsp_block .u_title{color: blue;}
		.rsp_block .u_content{height: auto;line-height: 25px;}
		.mask{background-color: #B9B7B7;/* opacity: 0.5; -moz-opacity:0.70; filter: alpha(opacity=70);  */z-index: 99;height: 100%;width: 100%;background-repeat:repeat;position:fixed;top: 0px;left: 0px;}
		
		.req_item{width:100%;min-height: 80px;float: left;background-color: #fff;font-family: 微软雅黑,Arial;font-size:13px;}
		.req_item:first-child{margin: 0 0 10px;}
		.req_item:first-child .title,.req_item:first-child .content{border-left: 0;}
		.txt_group{float: left;width: 100%;}
		.photo{width: 50px;margin: 15px 20px 0 15px;position: absolute;}
		.text{width: 100%;float: left;padding-left: 80px;}
		.title{float: left;color: #444;padding-left: 8px;border-left: 2px solid   #cccccc;width: 100%;}
		.title .username{font-weight:700;font-size:16px;margin-top: 12px;}
		.title .timeago{color: #BAB9B9;margin-top: 4px; font-size: 12px}
		.content{line-height: 25px;color: #444;padding-left: 8px;border-left: 2px solid  #cccccc;float: left;width: 100%;padding-bottom: 15px;}
		.comments{float:right;margin-right: 15px;font-size: 12px;}
		.timeago+img{position:relative;top: -19px;left:-14px;}
		.userlogo{border-radius: 100%;width: 50px;}
		.footer{margin: 0 auto;height: 45px;line-height:45px;position: fixed;z-index: 999;bottom:0;left:0;background-color:#A1ACA7;	width: 100%;text-align: center;}
		.mask{background-color: #B9B7B7;/* opacity: 0.5; -moz-opacity:0.70; filter: alpha(opacity=70);  */z-index: 99;height: 100%;width: 100%;background-repeat:repeat;position:fixed;top: 0px;left: 0px;}
		#back-to-top {position: fixed;bottom: 104px;right: 12px;}
		
		/* 页面功能性调整 */
		.alert-danger{
			background-color: none;
		    border-color: none;
		}
	</style>
	<script type="text/javascript" src='<s:url value="/h5/js/jquery.js"/>' ></script>
	<script type="text/javascript" src="${ctx }/web/js/bootstrap/3.2.0/js/bootstrap.js"></script>
	<script type="text/javascript" src="<s:url value="/mobile/common.js"/> "></script>
	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  
	<script type="text/javascript" src="<s:url value="/js/sha1.js"/> "></script>
	<script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
	<script type="text/javascript" src="${ctx }/h5/js/timeago.js"></script>
	<script type="text/javascript" type="text/javascript">
		var dataForWeixin={
				appId:	'${jsapi.appId}',//"wx52222341d8f2e13f",
				imgUrl: "${commUrl}${comp.compLogo}",
				<s:if test="#attr.prj.marketingURL == null" > 
					link:	"${commUrl}/Mobile.action?appCode=test&method=wxPrj&prjCode=${prj.finCode}<s:if test='#attr.to != null'>&to=${to}</s:if>&rc=${sessionScope.arc}",
				</s:if>
				<s:else>
					link:	"${prj.marketingURL}",
				</s:else>
				//<s:if test="#attr.prj.finCode=='90000801'" > 
				//link:	"http://www.sunjoypai.com/html/xjp3/index.html?from=singlemessage&isappinstalled=0",
				//</s:if>
				//<s:else>
				//link:	"${commUrl}/Mobile.action?appCode=test&method=wxPrj&prjCode=${prj.finCode}",
				//</s:else>	
				title:	'${prj.finName}',
				desc:	'${prj.finTitle}',
				fakeid:	""
		};
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
			
			var interval = 1000; 
			var curTime = ${curTime};
			var startTime =  ${startTime};
			var endTime =  ${endTime};
			var  step = -1;
			<s:if test="#attr.prj.finSts ==1 || #attr.prj.finSts ==2 || #attr.prj.finSts ==4">
				var intVal = window.setInterval(function(){ShowCountDown();}, interval); 	
			</s:if>
			function leftTimeView(startTime1,endTime1)
			{
				var leftTime=endTime1-startTime1; 
				var leftsecond = parseInt(leftTime/1000); 
				var day1=Math.floor(leftsecond/(60*60*24)); 
				var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
				var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
				var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 
				var innerHtml = "";
				if(day1 > 0)
					innerHtml+= "<strong>"+day1 +"</strong>天";
				if(hour > 0)
					innerHtml+= "<strong>"+hour+"</strong>小时 ";
				if(minute > 0)
					innerHtml+="<strong>"+minute +"</strong>分 ";
				if(second >=0)
					innerHtml+= "<strong>"+second +"</strong>秒 ";
				return innerHtml;
				
			}
			function applyRemain(startTime1,endTime1)
			{
				var leftTime=endTime1-startTime1; 
				var leftsecond = parseInt(leftTime/1000); 
				var day1=Math.floor(leftsecond/(60*60*24)); 
				if(day1 > 1)
					return "";
				var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
				var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
				var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 
				var innerHtml = "";
				if(day1 > 0)
					innerHtml+= "<strong>"+day1 +"</strong>天";
				if(hour > 0)
					innerHtml+= "<strong>"+hour+"</strong>小时 ";
				if(minute > 0)
					innerHtml+="<strong>"+minute +"</strong>分 ";
				if(second >=0)
					innerHtml+= "<strong>"+second +"</strong>秒 ";
				return innerHtml;
				
			}
			function ShowCountDown() 
			{
				curTime+=1000;
				var innerHtml = "";
				if(startTime> curTime )
				{
					innerHtml = leftTimeView(curTime,startTime);
					if(step != 0)
					{
						step = 0;
						$("#finSts").html("即将开始 "); 
						<s:if test="#attr.prj.preFlg==1 || #attr.prj.preFlg==9" > 
						$("#apply").val("即将开始"); 
						$("#apply").attr("disabled","disabled");
						$("#apply").addClass("sign_btn_gray");
				  		</s:if>
				  		<s:else>
						$("#apply").val("申请报名"); 
						</s:else>
					}
					
				}
				else if(startTime <  curTime && endTime  > curTime ) // 项目进行中
				{
					innerHtml = applyRemain(curTime,endTime);
					if(step != 1)
					{	
						step = 1;
						$("#finSts").html("进行中 "); 
						$("#apply").val("申请报名 "); 
						$("#apply").removeAttr("disabled");
						$("#apply").removeClass("sign_btn_gray");
						$("#preTip").html(""); 
						$("#preTip1").html(""); 
						//查看是否有打款通知
						<c:if test="${not empty payFlg}">
						 var payTime =  "${payTime}";
						 if(payTime  < curTime)
								$("#finSts").html("打款中 "); 
				 		</c:if>
						
					}
				}
				else if(curTime > endTime)
				{
					innerHtml = "";
					if(step != 2)
					{
						step = 2;
						$("#finSts").html("融资已结束 "); 
						$("#apply").val("融资已结束"); 
						$("#apply").attr("disabled","disabled");
						$("#apply").addClass("sign_btn_gray");
						clearInterval(intVal);
					}
				}
				if(innerHtml.length>0){
					innerHtml = "还剩"+innerHtml;
					$("#leftTip").html(innerHtml).show();
				}else{
					$("#leftTip").hide();
				}
			} 
			
			function marketShow(){
				$(".marketing").show();
				$(".marketing").click(function(){
					$(this).hide();
				});
			}
			function reload(){
				if(q_reload == 1)
					return ;
			    $.ajax({
			        type: "POST", //用POST方式传输
			        dataType: "json", //数据格式:JSON
			        url: '<s:url value="/PtlPublish!questionQry.action"/>', //目标地址
			        data: { "nosession": true,"finCode":"${prj.finCode}" },//nosession 未登录ajax 请求有效
			        error: function (XMLHttpRequest, textStatus, errorThrown) { 
			           },
			        success: function (data){ 
			        	q_reload = 1;
			        	if(data.result == '0')
			        	{
			               var tHtml="<div style='height: 30px;font-size:16px;text-align:left;line-height:30px;padding-left:15px;'><strong>投资者提问：</strong><br/></div >";
			               $.each( data.lists, function(index, content){
			            	   tHtml+='<div class="q_title"><table width="100%"><tr><td align="right">['+content.userName+'  '+content.reqTime+']</td></tr></table><div class="queationLine"></div><strong>'+content.reqcontent+'</strong></div >';
			            	  if(content.rspContent != null && content.rspContent.length > 0 ) 
			            		  tHtml+= '<div class="q_content">${prj.simpName}：'+content.rspContent+'</div>';
			               });
			               if(tHtml.length > 0)
			            	 {
			            	   $("#custQ").html(tHtml);
			            	 }
			            	 
			          	}
			        }
			    });
			}
			function  qask(){
				var  ask_c = $("#ask").val();
				if(ask_c.trim().length==0){
					$("#ask_tip").show();
					$("#ask_tip").html("问题不能为空");
					return ;
				}else if(ask_c.length < 6 ||  ask_c.length > 256 ){
					$("#ask_tip").show();
					$("#ask_tip").html("问题长度为6-256个字符");
					return ;
				}
				$("#ask_tip").html("");
				$("#ask_tip").hide();
		    	$("#btn_q").attr("disabled", "true");
		    	 $.ajax({
			            type: "POST", //用POST方式传输
			            dataType: "json", //数据格式:JSON
			            url: '<s:url value="/PtlPublish!question.action"/>', //目标地址
			            data: { "nosession": true,"finCode":"${prj.finCode}","question":ask_c},//nosession 未登录ajax 请求有效
			            error:function (XMLHttpRequest, textStatus, errorThrown) { 
			            	flag =  false ;
			            	$("#ask_tip").show();
							$("#ask_tip").html("提问失败，请稍候再试");
			               	$("#btn_q").removeAttr("disabled");
			            },
			            success:function (data){
			           		if(data.result == '0'){
			           			$("#ask_tip").show();
								$("#ask_tip").html("提问成功，项目方会尽快给你解答");
				               	$("#btn_q").removeAttr("disabled");
			              	}			           		
			           		else if(data.result == '1'){
				               	$("#btn_q").removeAttr("disabled");
				               	showMsg(data.desc);
			              	}else{
			            		$("#ask_tip").show();
								$("#ask_tip").html("非常抱歉，提问失败，请稍候再试");
			                    $("#btn_q").removeAttr("disabled");
			          		}
			            }
		    	 });
			}


			var q_reload=0;
			//pageload 
			$(function(){
				
				//返回箭头
				$('.top_left').bind("click" , function(){
					history.back();
				});
				
				
				$('#tab-title .tabTag').click(function(){
					$(this).addClass("selected").siblings().removeClass("selected");//改变tab 
					//$("#tab-content div").eq($(this).index()).show().siblings().hide();//显示对应的tab内容
					//if(!$("#question").is(':hidden')){ 
					if($(this).attr("id")=="questionTag"){
						reload();
						$("#question").show();
						$("#userlist").hide();
						$("#collapseFlag").hide();
						
					}else{
						$("#userlist").show();
						$("#question").hide();
						$("#collapseFlag").show();
						
					}

				}); 
				$("#forum").click(function(){
					reload();
					$("#question").show();
					$("#userlist").hide();
					$("#collapseFlag").hide();
					$("#questionTag").addClass("selected");
					$("#userlistTag").removeClass("selected");
					$("html,body").animate({scrollTop: $("#question").offset().top}, 1000);
					$("#questionTag").addClass("selected").siblings().removeClass("selected");//改变tab 
					
				})
				$("#showFirend").click(function(){
					 if (typeof WeixinJSBridge == 'undefined') return false;   
			
					marketShow();
				});
				$("#showCircle").click(function(){
					 if (typeof WeixinJSBridge == 'undefined') return false;   
					marketShow();
				});
				$("#showAll").click(function(){
					$(this).hide();
					$("#part").hide();
					$("#all").show();
				});
				$("#apply").click(function(){
					if(step == 0){
						$("#pform").attr('action','<s:url value="/PtlSignup.action"/>') ;
					}
					$("#pform").submit();
				});
				<s:if test="#attr.prj.finSts ==1 || #attr.prj.finSts ==2 || #attr.prj.finSts ==4">
					<s:if test=" #attr.curTime < #attr.startTime " >
						$("#finSts").html("即将开始 "); 
						<s:if test="#attr.prj.preFlg==1 || #attr.prj.preFlg==9" > 
							$("#apply").val("即将开始"); 
							$("#apply").attr("disabled","disabled");
				  		</s:if>
					  	<s:else>
							$("#apply").val("预热报名"); 
					  	</s:else>
						step = 0 ;
					</s:if>
					<s:elseif test=" #attr.endTime < #attr.curTime " >
						$("#finSts").html("融资已结束 "); 
						$("#apply").val("融资已结束"); 
						$("#apply").attr("disabled","disabled");
						$("#apply").addClass("sign_btn_gray");
						step = 2;
					</s:elseif>
			  		<s:else>
						step = 1;
						$("#apply").removeAttr("disabled");
				      	<s:if test="#attr.prj.finPercent>100" > 
				      		$("#finSts").html("已超募") ;
				       	</s:if>
				   		<s:else>
				     		$("#finSts").html("进行中");                        
						</s:else>
				      	//查看是否有打款通知 
						<c:if test="${not empty payFlg}">
						 var payTime =  "${payTime}";
						 if(payTime  < curTime)
								$("#finSts").html("打款中 "); 
				 		</c:if>
					</s:else>
				</s:if>
				<s:else>
					$("#finSts").html("${prj.finStsStr} "); 
					$("#apply").val("${prj.finStsStr}"); 
					$("#apply").attr("disabled","disabled");
					$("#apply").addClass("sign_btn_gray");
				</s:else>
				
				if(isWeiXin()){
				   $("#weixin_block").show();//微信访问显示二维码					
				}

				$(".risk_tip").slideDown(1000);
				$("#closebox").click(function(){
					$(".risk_tip").slideUp(1000);
				});
				setTimeout(function(){				
					$(".risk_tip").hide();
				},10000);
				$(document).click(function(){
					$(".risk_tip").hide();
				});
				
				//折叠效果
				var showFlag = true;
				$("#collapseFlag").click(function(){
					if(showFlag==true){
						$(this).find("img").attr("src","${ctx }/h5/img/ico_collapse_up.png");
						$("#collapseFlagTxt").html("点击收起");
						$("#userlist").show();
						showFlag = false;
					}else{
						$(this).find("img").attr("src","${ctx }/h5/img/ico_collapse_down.png");
						$("#collapseFlagTxt").html("点击展开");
						$("#userlist").hide();
						showFlag = true;
					}
				});
				
				//进度条效果
				var original_size = ${prj.finPercent};
				if(original_size<10)
					original_size = 10;
				else if(original_size>100)
					original_size = 100;
				var init_size = 10;
				var processTimer = window.setInterval(function(){
					if(init_size > original_size){
						window.clearInterval(processTimer);
						$("#progressBar").width(original_size+"%");
						$("#progressBar").html("${prj.finPercent}"+"%");
					}else{
						init_size += 1;
						$("#progressBar").width(init_size+"%");
					}
				},5);


				// 弹出项目足迹内容
				$("#btnfootmark").click(function(){
					var doflag = "${not empty projectLogoList ? 'true' : 'false'}";
					$(".closeBnt").show();
					if(doflag=="true"){
						$("#wrapper").show();
						$("#wrapper").stop().animate({
							top:'0px'
						},500);
					}else{
						$("#msg_div").html("当前暂无项目足迹");
						$('#myModal').modal({keyboard: true });
						setTimeout(function(){$("#myModal").modal('hide');},1800);
					}
				});
				//项目协议
				$("#btnprotocol").click(function(){
					var doflag = "${not empty protocolFlg ? 'true' : 'false'}";
					if(doflag=="true"){
						location.href='<s:url value="/PtlPublish!protocol.action"/>?finCode=${prj.finCode}';
					}else{
						$("#msg_div").html("当前暂无项目资料");
						$('#myModal').modal({keyboard: true });
						setTimeout(function(){$("#myModal").modal('hide');},1800);
					}
				});

				//点击关闭页面
				$(".closeBnt").click(function(){
					$("#wrapper").stop().animate({
						top:'100%'
					},500);
					$(".closeBnt").hide();
					$("#wrapper").hidden();
					
				});
				//金钱数值转换
				$("#compAss").text(moneytrans($("#compAss").text()));
				$("#followStartAmt").text(moneytrans($("#followStartAmt").text()));
				
				$("#btn_img_share").click(function(){
					 $("#shareTip").show();
				});
				$("#shareTip").click(function(){
					 $(this).hide();
				});

				convertTime();
		});
			
			function convertTime(){
				$(".timeago").each(function(){ //时间戳转换
	        		if($(this).hasClass("converted")){
	        			return;
	        		}
					$(this).html(jQuery.timeago($(this).html()));
					$(this).addClass("converted");
				});
			}
			var s_upNo;
			function gotoRspList(upNo){
				s_upNo = upNo;
				var backurl = location.href.substring(location.href.lastIndexOf("/")+1,location.href.length);
				$.ajax({
			        type: "POST", 
			        dataType: "json", 
			        url: "PtlWeixin!checkLogin.action",
			        data: { nosession: true,backUrl:backurl},
			        success: function (data){ 
			        	if(data.result=="0"){
			        		$("#operateBlock").show();
			        		$("#tipBlock").hide();
			        	}else{
			        		$("#tipBlock").show();
			        		$("#operateBlock").hide();
			        	}
			        	$("#code_login_box").show();
			        }
				});
				
				$("#reqContent").focus(function(){
					$(".footer").get(0).style.bottom = 'initial';
					$(".footer").get(0).style.top = '60px';
				});
				$(window).click(function(){
					$(".footer").get(0).style.bottom = '60px';
					$(".footer").get(0).style.top = 'initial';
				});
				//window.location.href = "${ctx}/PtlPublish!forumRspList.action?upNo="+upNo;
			}
			
			//发帖 
			function publishForum(){
				var reqContent = $("#reqContent").val();
				if(reqContent==null || reqContent.length==0){
					showMsg("请输入文字！");
					return false;
				}
				showloading();
				$("#submit_btn").text("正在保存...");
	        	$("#submit_btn").attr("disabled","disabled");
				$.ajax({
			        type: "POST", 
			        dataType: "json", 
			        url: "PtlPublish!saveforums.action",
			        data: { nosession: true,upNo: s_upNo,"reqContent":reqContent},
			        success: function (data){ 
			        	showloading(false);
			        	if(data.result=="0"){
			        		showMsg("发布成功！");
			        		setTimeout(function(){window.location.reload();},800);
			        	}else{
			        		showMsg("发布失败！");
			        	}
			        	$("#code_login_box").hide();
			        }
				});
			}
	</script>
</head>
<body class="page_bgcolor" style="background:#ffffff;">

	<c:if test="${not empty payFlg}"><!-- 查看是否有打款通知 -->
		<div class="fixed_btns" style="display: block;bottom: 180px;"><a href="${ctx }/PtlWeixin!myPayInfo.action"><span class="remittance"></span></a></div>
     </c:if>
	<c:if test="${not empty roadShowFlg}"><!-- 查看是否有路演邀请 -->
		<div class="fixed_btns" style="display: block;"><a href="${ctx }/PtlWeixin!prjRoadShowList.action"><span class="luyan"></span></a></div>
	</c:if>
	<%-- <c:if test="${not empty acn }"> <!-- 项目活动 -->
		<div class="fixed_btns" style="display: block;"><a href="/PtlSignup!actRegInit.action?activityNo=${acn.activityNo}"><span class="luyan"></span></a></div>
	</c:if> --%>
	<div id="back-to-top" style="display: block;"><a href="#top"><span></span></a></div>
	
	
	<!-- 项目足迹主页面开始 -->
	<div class="page_body">
		<!-- 顶部开始 -->
		<div id="top_wrap">
			<div class="top">
				项目详情
				<div class="top_left"></div>
			</div>
		</div>
		<!-- 顶部结束 -->
		<!-- 项目风险提示 -->	
		<c:if test="${prj.notifyTip != null && fn:length(prj.notifyTip) > 0 }">
			<div class="risk_tip">
				 <div  id="closebox" class="closebox">x</div>
				 <div class="f_title" style="margin-top:8px">
			 		<p style="margin:0"><strong>风险揭示</strong></p>
			 		<hr style="height:4px;margin:0;margin-top:2px"/>
				 </div>
				 <div>
					<pre style="background-color: rgba(0, 0, 0, 0.75);border-radius: 0px;line-height: 25px;font-size:14px;border:0;color: #fff; font-family: '微软雅黑';">${prj.notifyTip}</pre>
				 </div>
			</div>
		</c:if>
			
		<!-- 企业宣传图片开始 -->
		<div class="signupBanner">
			<img src="${ctx }${comp.compMedUri}" style="width: 100%;"/>
			<s:if test="#attr.prj.prjOpType ==1" >
	  				<a href="${ctx }/data/comm/plate_1.html"><img src="${ctx }/h5/img/plate_1.png" class="youxuan"/></a>
	  		</s:if>
			<s:if test="#attr.prj.prjOpType ==0" >
	  				<a href="${ctx }/data/comm/plate_0.html"><img src="${ctx }/h5/img/plate_0.png"  class="youxuan"/></a>
	  		</s:if>
	  		<s:if test="#attr.prj.prjOpType ==9" >
	  				<a href="${ctx }/data/comm/plate_1.html"><img src="${ctx }/h5/img/plate_1.png"  class="youxuan"/></a>
	  		</s:if>
	  		<s:if test="#attr.prj.prjOpType ==6" >
	  				<a href="${ctx }/data/comm/plate_6.html"><img src="${ctx }/h5/img/plate_6.png"  class="youxuan"/></a>
	  		</s:if>
		</div>
		<!-- 企业宣传图片结束 -->
		<div class="theme"><p>${prj.finTitle}</p></div>
		<c:if test="${not empty prj.specList }">
		<div class="navTab" >
			<ul>
			<c:forEach items="${prj.specList }" var="show">
				<li>${show}</li>
			</c:forEach>
			</ul>
		</div>
		</c:if>
		<div class="progressMain">
				<!-- 已预约开始 -->
				<div class="nummber1 container ">
					<div class="row">
						<img src="${ctx }/h5/img/1.png" alt=""class="col-xs-4 load">
						<span class="col-xs-6">已预约:<b>￥${prj.investAmtStr}元</b></span>
					</div>
				</div>
				<!-- 已预约结束 -->

			  <div class="row" style="margin-left: 0px;">
	              <div class="col-xs-11 col-ms-10" style="background-color: #F5F5F5; padding: 0px; height: 20px; border-radius: 13px;">
	                  <div class="progress-bar progress-bar-success inprogressBar1" role="progressbar"  aria-valuemin="0" aria-valuemax="100"  id="progressBar"></div>
		       	  </div>
		      </div>
			<!-- 进度条结束 -->
			
			<!-- 筹资目标开始 -->
			<div class="nummber2">
					<div class="row">
						<span class="col-xs-9">筹资目标:<b>￥${prj.finAmtStr}元</b></span>
						<img src="${ctx }/h5/img/2.png" alt=""class="col-xs-3 load1">
					</div>
				</div>
			<!-- 筹资目标结束 -->
		</div>
		<!-- 估值开始 -->
		<div class="proSand container">
			<div class="row">
				<ol class="inproSand">
					<li class=" col-xs-4" >￥<span id="compAss">${prj.compAss }</span><br><b>估值</b></li>
					<li class="col-xs-4"><span id="followStartAmt">${prj.followStartAmt }</span><br><b>起投金额</b></li>
					<li class="current col-xs-4">${tot}<c:if test="${not empty tot}">人</c:if><br><b>预约人数</b></li>
				</ol>
			</div>
		</div>
		<!-- 估值结束 -->
		
		<!-- 项目来源开始 -->
		<c:if test="${not empty prj.prjProvide }">
			<div class="project">
					<b>项目来源</b>:<br>
					${prj.prjProvide }
			</div>
		</c:if>
		<!-- 项目来源结束 -->
		
		<c:if test="${empty login }">
			<script type="text/javascript">
				var rd1=new Date().getFullYear();
				var InterValObj; //timer变量，控制时间
				var count = 90; //间隔函数，1秒执行
				var curCount;//当前剩余秒数
				var code = ""; //验证码
				var codeLength = 6;//验证码长度
				function sendMessage() {
					var phone = document.getElementById("mobile");  
					var phoneVal = $("#reg_mobile").val();
				    var dealType; //验证方式
				 	curCount = count;
					if(phoneVal == null || phoneVal.length==0){
						alert("请输入手机号");  
						$("#reg_mobile").focus();
						return;
					}else if(!isMobile(phoneVal)){
						alert("不是正确的手机号码，请重新输入");
						$("#reg_mobile").focus();
						return;
					}
			           var randCode = $("#randCode").val();
			            if(randCode=="" || randCode.length <4){
			            	alert("请正确输入图形验证码！");
			            	$("#randCode").focus();
			            	return false;
			            }
			            
				    	//设置button效果，开始计时
				        $("#btnSendCode").attr("disabled", "true");
				        $("#btnSendCode").removeClass("btn_valid");
				        $("#btnSendCode").addClass("sign_btn_gray");
				        $("#v_btn_view").html(curCount + "秒");
				        $("#errTip").hide();
				        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
						//向后台发送处理数据
				        $.ajax({
				            type: "POST", //用POST方式传输
				            dataType: "json", //数据格式:JSON
				            url: '<s:url value="/PtlVCode!applyWithImg.action"/>', //目标地址
				            data: { "nosession": true,"tel": phoneVal,"randCode":randCode },//nosession 未登录ajax 请求有效
				            error: function (XMLHttpRequest, textStatus, errorThrown) { },
				            success: function (msg){
				            	if(msg.result == 9)
				            	{
				    		        window.clearInterval(InterValObj);//停止计时器
				    		        $("#btnSendCode").removeAttr("disabled");//启用按钮
				    		        $("#btnSendCode").removeClass("sign_btn_gray");
				    		        $("#btnSendCode").addClass("btn_valid");
				    		        $("#v_btn_view").html("重新获取");
				    		        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
				            		alert(msg.desc);
				            		return ;
				            	}
				            	else if(msg.result == 4)
				            	{
				            		alert(msg.desc);
				    		        window.clearInterval(InterValObj);//停止计时器
				    		        $("#v_btn_view").html("稍候重试");
				            		return ;
				            	}
		
				            	
				            }
				        });
				}
				
				//timer处理函数
				function SetRemainTime() {
				    if (curCount == 0) {                
				        window.clearInterval(InterValObj);//停止计时器
				        $("#btnSendCode").removeAttr("disabled");//启用按钮
				        $("#btnSendCode").removeClass("sign_btn_gray");
				        $("#btnSendCode").addClass("btn_valid");
				       $("#v_btn_view").html("重新获取");
				        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
				    }
				    else {
				        curCount--;
				        $("#v_btn_view").html( curCount + "秒");
				    }
				}
				
				function validate(){
					m = document.getElementById("mobile");  
					m.setCustomValidity("两次密码必须输入一致！");  
					return false ;
				}
				function autoImg(){
					var win_width = $(window).width();
					if(win_width>640)
						win_width = 640;
					var scale = win_width / 640;
					var top_offset = 390 * scale;
					var img_btn_width = 200 * scale;
					$("#btn_rule").css("top",top_offset + "px");
					$("#btn_rule img").width(img_btn_width);
				}
				function tryLogin()
				{
					$("#dlv_login_tip").hide();
					$("#dlv_reg_tip").show();
					$("#module-zk").show();
					$("#module-zck").hide();
					$("html,body").animate({scrollTop: $("#login_module").offset().top}, 1000);
				}
				function tryReg()
				{
					$("#reg_mobile").val($("#login_tel").val());
					$("#errTip_view").html("");
					$("#errTip").hide();
					$("#dlv_reg_tip").hide();
					$("#dlv_login_tip").show();
					$("#module-zck").show();
					$("#module-zk").hide();
				}
				function viewDtl()
				{
					document.documentElement.scrollTop = document.body.scrollTop =0;
					$("#login_module").hide();
					$("#dtl_module").show();
					$("#dtl_module_btn").show();	
					$("#ask_btn").show();
				}
				function isChName(val)
				{
					reg = /^[\u4E00-\u9FA5]{2,20}$/;	
					if(!reg.test(val)){
						return false;
					}
					else
						return true ;
				}
				$(function(){
					autoImg();
					$("#dlv_login_tip").click(function(){
						$("#dlv_login_tip").hide();
						$("#dlv_reg_tip").show();
						$("#module-zk").show();
						$("#module-zck").hide();
						
					})
					$("#dlv_reg_tip").click(function(){
						$("#dlv_reg_tip").hide();
						$("#dlv_login_tip").show();
						$("#module-zck").show();
						$("#module-zk").hide();
					})
					$("#btn_login").click(function(){
					var phone=$("#login_tel").val();//手机号
					if(isMobile(phone)== false)
					{
							$("#login_tel_tip").html("请正确输入手机号");
							$("#login_tel_tip").show();
							$("#login_tel").focus();
							return false;
					}
					$("#login_tel_tip").hide();
		  			$("#btn_login").attr("disabled", "true");
		       			$("#btn_login").html("认证中...");
						//向后台发送处理数据
					    $.ajax({
					            type: "POST", //用POST方式传输
					            dataType: "json", //数据格式:JSON
					            url: '<s:url value="/PtlMobile!ajaxLoginQ.action"/>', //目标地址
					            data: { "nosession": true,"tel": phone  },//nosession 未登录ajax 请求有效
					            error: function (XMLHttpRequest, textStatus, errorThrown) { },
					            success: function (msg){ 
					            		if(msg.result=='0')
					            		{
					            			viewDtl();
					            		}
					            		else if(msg.result=='8')
					            		{
					            			$("#errTip_view").html(msg.desc+'<a href="javascript:tryReg();"style="float:right;color:#ff6633;cursor:pointer;font-size:14px;text-decoration:underline;"><strong>尝试注册？</strong></a>');
					            			$("#errTip").show();
					            			$("#btn_login").html("再次登录");
					               			$("#btn_login").removeAttr("disabled");
					            		}
					            		else
					            		{
					            			$("#errTip_view").html(msg.desc);
					            			$("#errTip").show();
					            			$("#btn_login").html("再次登录");
					               			$("#btn_login").removeAttr("disabled");
					            		}
		
					            	},
					            error:function (msg){ 
			            			$("#btn_login").html("再次登录");
			               			$("#btn_login").removeAttr("disabled");
					            }
					    });
						return false ;
					});
					$("#btn_reg").click(function(){
						var name = $("#reg_name").val();//姓名
						if(!isChName(name))
						{
							$("#reg_name_tip").html("请输入中文姓名(2-20)字");
							$("#reg_name_tip").show();
							$("#reg_name").focus();
							return false;
						}
						$("#reg_name_tip").hide();
						var phone=$("#reg_mobile").val();//手机号
						if(isMobile(phone)== false)
						{
								$("#reg_mobile_tip").html("请正确输入手机号");
								$("#reg_mobile_tip").show();
								$("#reg_mobile").focus();
								return false;
						}
						$("#reg_mobile_tip").hide();
						var code = $("#reg_code").val();//验证码
						if(code.length < 4)
						{
							$("#reg_code_tip").html("请正确输入");
							$("#reg_code_tip").show();
							$("#reg_code").focus();
							return false;
						}				
						$("#reg_code_tip").hide();
			  			$("#btn_reg").attr("disabled", "true");
			       			$("#btn_reg").html("注册中...");
							//向后台发送处理数据
						    $.ajax({
						            type: "POST", //用POST方式传输
						            dataType: "json", //数据格式:JSON
						            url: '<s:url value="/PtlMobile!ajaxRegedit.action"/>', //目标地址
						            data: { "nosession": true,"tel": phone,"name":name,"validateCode":code  },//nosession 未登录ajax 请求有效
						            error: function (XMLHttpRequest, textStatus, errorThrown) { },
						            success: function (msg){ 
						            	
						            		if(msg.result=='0'|| msg.result=='1')
						            		{
						            			if(msg.result=='1')
						            				alert("您已经是爱就投会员");
						            			else
						            				alert("恭喜您成为爱就投会员")
						            				viewDtl();
						            		}
						            		else
						            		{
						            			$("#reg_code_tip").html(msg.desc);
						            			$("#reg_code_tip").show();
						            			$("#btn_reg").html("快速申请");
						               			$("#btn_reg").removeAttr("disabled");
						            		}
		
						            	},
						            error:function (msg){ 
				            			$("#btn_reg").html("快速申请");
				               			$("#btn_reg").removeAttr("disabled");
						            }
						    });
							return false ;
						});			
					
					convertTime();
				});
				function changeImagelabel() {
					document.getElementById("image1").src = "${ctx}/genVerifyCode.do?dt="+ Math.random();
				}
				function convertTime(){
					$(".timeago").each(function(){ //时间戳转换
		        		if($(this).hasClass("converted")){
		        			return;
		        		}
						$(this).html(jQuery.timeago($(this).html()));
						$(this).addClass("converted");
					});
				}
				//发帖 
				function publishForum(){
					var reqContent = $("#reqContent").val();
					if(reqContent==null || reqContent.length==0){
						showMsg("请输入文字！");
						return false;
					}
					showloading();
					$("#submit_btn").text("正在保存...");
		        	$("#submit_btn").attr("disabled","disabled");
					$.ajax({
				        type: "POST", 
				        dataType: "json", 
				        url: "PtlPublish!saveforums.action",
				        data: { nosession: true,prjCode:"${prjCode}",title:"${title}","reqContent":reqContent},
				        success: function (data){ 
				        	showloading(false);
				        	if(data.result=="0"){
				        		showMsg("发布成功！");
				        		setTimeout(function(){window.location.reload();},800);
				        	}else{
				        		showMsg("发布失败！");
				        	}
				        }
					});
				}
			</script>
		    <div id="login_module" class="mt_20">
			     <!-- 展示可公开的概要信息 -->
			     <c:forEach var="list" items="${prj.finFeatureList}" varStatus="status">
			       <s:if test="#attr.list.isPublic == 1">
					   <c:if test="${not empty list.featureTitle}">
						   <div class="f_title" style="margin-top:8px">
						   		<p style="margin:0"><strong>${list.featureTitle}</strong></p>
						   		<hr style="height:4px;margin:0;margin-top:2px"/>
						   </div>
					   </c:if>
					   <c:if test="${not empty list.featureImgUrl}">
						   <div class="f_content">
						  		<img src="<%=request.getContextPath()%>${list.featureImgUrl}?rd=1" style="max-height:900px"/>
						   </div>
					   </c:if>
					    <c:if test="${not empty list.featureDesc}">
							<div class="f_content">
								<pre class="f_content" style="border:0;padding-left:0px; padding-top:1px; padding-bottom:1px;font-family: '微软雅黑';">${list.featureDesc}</pre>
							</div>
					   </c:if>
					   <c:if test="${not empty list.linkUrl}">
					   		<div class="dtl-lnk" style="padding:10px;font-color:red;font-size:16px;text-align:right"><a class="btn-lnk" href="${list.linkUrl}"><strong>&nbsp;&nbsp;${list.linkTitle}&nbsp;&nbsp;>&nbsp;&nbsp;</strong></a></div>
					  </c:if>
					</s:if>
				</c:forEach>
			    
				<!-- 详细信息登录注册模块 -->    
			    <p align="center">详细信息只对<strong style="font-size:16px">爱就投会员</strong>可见，您可以选择：</p>
			    <div class="control-module ">
				    <em><i></i>已经是会员</em> <div class="module-border" style="float:right;color:#ff6633;cursor:pointer;" id="dlv_login_tip">快速登录</div>
						<div id ="errTip" class="alert with-icon" style="display:none">  <!-- alert-danger该标签中的类名 -->
				            <i class="icon-frown"></i>
				            <div class="content" id ="errTip_view"></div>
				          </div>
				         <div class="row "  id="module-zk" style="display:none;">
							<div class="input-group">
								<span class="input-group-addon if_title_b">手机号</span>
								<input class="form-control input-large" type="tel"  placeholder="您的常用手机号" name="tel" id="login_tel" />
							</div>
							<div class="itemTip" id="login_tel_tip"></div>
							<div style="width:100%;text-align:center">
								<button class="mt_10 mb_10" style="width:80px;height:30px;    background: none repeat scroll 0 0 #ff6633;border-radius:4px;color:#fff;border:none;" id="btn_login">登录提交</button>
							</div>
						</div>		    
			    </div>
			    <div class="control-module ">
			    	<em><i></i>还未成为爱就投会员</em> <div class="module-border" style="float:right;color:#ff6633;cursor:pointer; display:none" id="dlv_reg_tip">快速申请</div>
				    <div id="module-zck">
						<div id ="rerrTip" class="alert alert-danger with-icon" style="display:none">
				            <i class="icon-frown"></i>
				            <div class="content" id ="rerrTip_view"></div>
				          </div>
						<div class="row">
							<div class="input-group">
								<span class="input-group-addon if_title_b">姓&nbsp;&nbsp;名</span>
								<input class="form-control input-large" type="text"  placeholder="您的中文姓名" name="name"  id="reg_name"/>
							</div>
							<div class="itemTip" id="reg_name_tip"></div>
						</div>
						<div class="row mt_10">
							<div class="input-group">
								<span class="input-group-addon if_title_b">手机号</span>
								<input class="form-control input-large" type="tel"  placeholder="您的常用手机号" name="mobile" id="reg_mobile" />
							</div>
								<div class="itemTip" id="reg_mobile_tip"></div>
						</div>
						<div class="row mt_10">
							<div class="input-group" >
								<span class="input-group-addon if_title_b">图形码</span>
								<input name="randCode" class="form-control" type="tel" placeholder="图片验证码"  id="randCode"/>
								<span class="input-group-btn ">
									<a href="javascript:changeImagelabel();" title="换一张" class="check_img">
										<img id="image1" src="<s:url value='/genVerifyCode.do'/>" style="border-width: 0px;width: 80px;padding-left: 5px;" />
									</a>
								</span>
							</div>
						</div>
						<div class="row mt_10">
							<div class="input-group">
								<span class="input-group-addon if_title_b">验证码</span>
								<input class="form-control input-large" name="validateCode" id="reg_code" type="tel" placeholder="短信验证码" />
								<span class="input-group-btn ">
									<button class="btn btn-warning btn-large" style=" background: none repeat scroll 0 0 #eb4141;width:100px" name="btnSendCode" id="btnSendCode"  type="button" onclick="sendMessage()" ><span id="v_btn_view" >点击获取</span></button>
								</span>
							</div>
								<div class="itemTip" id="reg_code_tip"></div>
						</div>
						<div class="row mt_10 txt_center">
							<label class="v_align" style="margin-top: 10px;font-weight: normal;font-family: 微软雅黑;padding-left: 5px;">申请即同意<a href="${ctx }/data/comm/i9tou.html" style="color: #2364D2;text-decoration:underline;">《爱就投会员服务协议》</a></label>
							<!-- <div class="input-group">
								<input  type="checkbox"  name="member.recommUserId" value="" style="width: 15px;height: 15px;" class="v_align"/>
							</div> -->
						</div>
						<div style="width:100%;text-align:center">
						<button class="mt_10 mb_10" style="width:80px;height:30px;    background: none repeat scroll 0 0 #ff6633;border-radius:4px;color:#fff;border:none;" id="btn_reg">申请提交</button>
						</div>
					</div>
			    </div>
  		    </div>
		</c:if>
		
	    <div id="dtl_module" style="${empty login ? 'display:none' : ''}">
	    	<!-- 查看项目足迹开始 -->
			<div class="footprint container">
				<div class="dianji">
					<input type="image" src="${ctx }/h5/img/infootPint2.png" class="infootPint1" id="btnfootmark" style=""/>
					<input type="image" src="${ctx }/h5/img/infootPint1.png" class="infootPint2" id="btnprotocol" style=""/>
				</div>	
			</div>
			<!-- 查看项目足迹结束 -->
			
			<!-- 01平台投资流程开始 -->
			<div class="inestFlow">
				<img src="${ctx }/h5/img/flow.png ">
			</div>
			<!-- 01平台投资流程结束-->
	    
	    	<!-- 02融资说明开始-->
			<div class="financing">
					<img src="${ctx }/h5/img/rongzi.png " alt="">
					<div class="f_content" style="padding-bottom: 10px;">
						<pre class="f_content" style="border:0;padding-left:20px; padding-bottom:0px;font-family: '微软雅黑';">
							<br/><strong>开始时间：</strong><span style="color: #EB7F38;font-size:15px">${prj.chFinStartTime}</span><br/>${prj.finDesc}<br/><c:if test="${not empty prj.cntName}"><strong>直通项目专线:</strong>&nbsp;<a href="tel:${prj.cntMobile}" style="color: #FF6600;">${prj.cntMobile}</a>&nbsp;|&nbsp;${prj.cntName}</c:if>
						</pre>
					</div>
			</div>
			<!-- 02融资说明结束-->
			
			<!-- 03项目介绍开始-->
			<div class="introduct">
				<img src="${ctx }/h5/img/projectObj.png " class="imgHeader">
				<%-- <img src="${ctx }/h5/img/introductMain.png" class="imgbody"> --%>
				<c:if test="${not empty prj.finVideoUrl  }"> <!-- 有视频 -->
					 <div class="f_title" ><strong>视频介绍</strong></div>
					 <div style="margin-top: 10px;">
					 	<iframe height="250px" width="100%"  frameborder="0" allowfullscreen="true" autoplay="false" src="${prj.finVideoUrl }"></iframe>
					 </div>
				 </c:if>
				 
				<c:forEach var="list" items="${prj.finFeatureList}" varStatus="status">
					<c:if test="${not empty list.featureTitle}">
						<div class="f_title" style="margin-top:8px;text-align: left;">
								<p style="margin:0"><strong>${list.featureTitle}</strong></p>
								<hr style="height:4px;margin:0;margin-top:2px"/>
						</div>
					</c:if>
					<c:if test="${not empty list.featureImgUrl}">
						<div class="f_content">
							<img src="${ctx }${list.featureImgUrl}?rd=1" style="max-height:1280px"/>
						</div>
					</c:if>
					 <c:if test="${not empty list.featureDesc}">
						 <div class="f_content">
							<pre class="f_content" style="border:0;padding-left:0px; padding-top:1px; padding-bottom:1px;font-family: '微软雅黑';">${list.featureDesc}</pre>
						 </div>
					 </c:if>
					<c:if test="${not empty list.linkUrl}">
						 <div class="dtl-lnk" style="padding:10px;font-color:red;font-size:16px;text-align:right"><a class="btn-lnk" href="${list.linkUrl}"><strong>&nbsp;&nbsp;${list.linkTitle}&nbsp;&nbsp;>&nbsp;&nbsp;</strong></a></div>
					</c:if>
				</c:forEach>
			<s:if test="#attr.prj.FeeFlg">
				<div class="f_title" style="margin-top:8px;text-align: left;">收费提示：</div>
				<div class="f_content" style="color:#fea201;font-size:16px">作为对平台工作人员的辛苦付出的打赏，你在实际投资时，需要支付一定的服务费（${prj.feeDesc}）<s:if test="#attr.prj.feePercent != null">：您实际投资金额的${prj.feePercent}%<s:if test="#attr.prj.feeUpAmt > 0" >，最高不超过${prj.feeUpAmt}元 。</s:if></s:if><s:else>${prj.feeUpAmt}元</s:else></div>
			</s:if>
			</div>
			<!-- 03项目介绍结束-->
		
		
			<!-- 04风险提示开始-->
			<div class="risk">
				<img src="${ctx }/h5/img/risk.png" alt="">
				<div class="row">
					<p class="col-xs-12 wenzi">
					<s:if test="#attr.prj.prjOpType==1">
					1、本项目由企业委托爱就投进行信息发布，爱就投只对信息真实性做了审核；<br/>2、在投资前您需要考虑一下您的资金计划，股权投资的时间有点长哟；<br/>3、任何投资都会有风险，您成为“风险投资家”之前，需要认真考虑决策；<br/>4、您在爱就投平台投资单一项目，最多只能是您可动用金融资产的十分之一。
					</s:if> 
 					<s:elseif test="#attr.prj.prjOpType==9">
					仅限于定向邀请，谢绝转发
					</s:elseif>
					 <s:else>
					亲，在投资前您需要考虑一下您的资金计划，股权投资的时间有点长哟；<br/>1、任何投资都会有风险，您成为“风险投资家”之前，需要认真考虑决策；<br/>2、您在爱就投平台投资单一项目，最多只能是您可动用金融资产的十分之一；<br/>3、您申请之后，我们需要对您做资格审查，只有符合爱就投合格投资人要求的亲才可以获得最终投资机会。
					</s:else>	
					</p>
					<span class="col-xs-12 linePhone"><a href="tel:18221874996">投资咨询顾问：18221874996（ 冉婷婷 ）</a></span>
					<span class="col-xs-12 linePhone"><a href="tel:13916925328">投资咨询顾问：13916925328（ 李远谋 ）</a></span>
					<!-- span class="col-xs-12 linePhone"><a href="tel:18720268883">投后管理服务：18720268883（ 柯     慧 ）</a></span-->
					<!-- <span class="col-xs-12 linePhone"><a href="tel:18221956007">平台运营支持：18221956007（  张    霞 ）</a></span>-->
				</div>
			</div>
			<!-- 04风险提示结束-->

			<!-- 了解跟多开始 -->
			<s:if test="#attr.comp.compFeatureList.size() > 0" >
				<div class="aboutMore container">
					<div class="row">
						<input type="button" class="col-xs-12" value="了解更多项目信息"  id="dtl_more" onclick="location.href='${ctx}/Mobile.action?${compDtl}&uid=${recommendUid}'"/>
					</div>
				</div>
	   		</s:if>
			<!-- 了解跟多结束-->

		</div>
		
		<!-- 报名人数开始 -->
		<div id="sidebar-tab">
			<div id="tab-title">
				<div class="tabTag selected" id="tabTag selectedag">
					报名人数( <s:if test="#attr.tot > 0">${tot}</s:if><s:else>0</s:else>)
				</div>
				<div class="tabTag" id="questionTag">问题解答(${qsSize })</div>
				<div style="clear: both;"></div>
			</div>
			<div style="clear: both;"></div>
			<div id="tab-content">
				<!-- 
				<div style="width: 100%;text-align: center;margin-top: 10px;" id="collapseFlag">
					<img src="${ctx }/h5/img/ico_collapse_down.png" style="width: 48px;display:initial;cursor: pointer;"/>
					<div id="collapseFlagTxt" style="margin-top: -10px;">点击展开</div>
				</div>  -->
				<div class="tabContent" id="userlist" >
					<s:if test="#attr.tot > 0">
						<table style="width: 100%;">
						   <c:forEach var="list" items="${users}" >
								<tr >
									<td class="listForm1">&nbsp;&nbsp;<s:if test="#attr.list.remark == '1'.toString()">${list.userName}</s:if><s:else>${list.userNameMark}</s:else></td><td align="right" class="listForm2" > ${list.wantAmtStr} 元</td>
								</tr>
							</c:forEach>
						</table>
					</s:if>
					<!-- 评论是跟预约放在一起的，需要调整
					<c:if test="${not empty discussList }">
						<div id="uNum" style="width: 100%;padding-bottom: 0px;margin-top:-9px;border-bottom: 1px solid #eee;float: left;">
							<c:forEach items="${discussList}" var="fdb">
								<c:if test="${not empty fdb.forum }">
									<div class="thelist_req_item" onclick="gotoRspList('${fdb.forum.curNo}')">
										<div class="thelist_txt_group">
											<div class="thelist_photo">
												<img src="${ctx }/${fdb.forum.memberInfo.userLogo}" class="userlogo">
											</div>
											<div class="thelist_text">
												<div class="thelist_title">
													<span style="font-size: 16px;">${fdb.userName }</span>
													<c:if test="${not empty fdb.investAmt}">
														<span style="font-size: 16px;">&nbsp;&nbsp;支持了&nbsp;${fdb.investAmt }&nbsp;元</span>
													</c:if>
													<span class="thelist_comments"><img src=" <s:url value='/h5/img/discuss.png'/> " style="margin-top: -2px; width: 20px;">评论&nbsp;&nbsp;<span style="padding: 0 0px;"></span></span>
												</div>
												<div class="timeago" style="margin-top: 0px; color: #BAB9B9; font-size: 12px">${fdb.investTime }</div>
												<div class="thelist_content mt_10">${fdb.investDesc }</div>
												<c:forEach items="${fdb.forum.subs}" var="subforum">
													<div class="rsp_block">
														<div class="u_title">
															<span>${subforum.memberInfo.userName }</span><span class="timeago" style="padding: 0 20px;color: #BAB9B9;">${subforum.reqTime }</span>
														</div>
														<div class="u_content">${subforum.reqcontent }</div>
													</div>
												</c:forEach>
												
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						</c:if>
						 -->
				</div>
				<div class="tabContent" id="question" style="display: none;">
					<c:forEach var="list" items="${qs}" >
						<div class="q_title" ><strong>${list.reqcontent}</strong></div >
						<div class="q_content" >小爱：${list.rspContent}</div>
					</c:forEach>
					<div id="custQ"></div>
					<div class="mt_10">
							<textarea  name="question" id="ask"  style="width: 100%;" placeholder="我还有疑问和关心的事项"></textarea>
							<div class="itemTip" id="ask_tip" style="width:95%;margin-right:10px"></div>
					</div>
					<div id = "ask_btn" style="width:30%;float:right;margin-right:20px;margin-top:10px;${empty login ? 'display:none' : ''}"><a href='javascript:qask();' id="btn_q"><img src="${ctx }/h5/img/tiwen.png" style="width:100%;"/></a></div>
				</div>
			</div>
		</div>	
		<!-- 报名人数结束 -->
		
		
		<!-- 微信才显示 -->
		<div id="weixin_block" >
			<div  style="background:white;text-align: center;">
			  	<img src="${ctx }/h5/img/quickr.png"  style="width:300px;margin: 0 auto;"/>
			</div>
			<div  style="background:white;text-align: center;">
			  	<img src="${ctx}/mobile/wap_tip.gif" style="width:125px;height:70px;margin: 0 auto;"/>
			</div>
			<div  style="background:white;text-align: center;">
			 	<a href="${ctx}/PtlWeixin!prjPubList.action" style=" color: #33a9fc;font-size:16px;height:80px;padding-top:10px;">查看更多项目</a>
			</div>
	    </div>
	
		<div style="height: 50px;background-color:#fff;"></div>
		
		<!-- 项目足迹结束主页面结束 -->
		<form id="pform" action='<s:url value="/Mobile.action"/>' method="post">
			<input type=hidden name="appCode" value="test"/>
			<input type=hidden name="method" value="wxReq"/>
			<input type=hidden name="finCode" value="${prj.finCode}"/>
			<input type=hidden name="recommendUid" value="${recommendUid}"/>
			<input type=hidden name="to" value="${to}"/>
		    <div class="btn_group" id="dtl_module_btn" style="${empty login ? 'display:none' : ''}">
			 	<div class="forum_btn" id="forum"   >
		 	 		<span style="padding-top:1px;padding-bottom:3px;">
		 	 		<img src="${ctx }/h5/img/dayi.png" alt=""/>
		 	 		答疑(<font color=black>${qsSize }</font>)
		 	 		</span>
			 	</div>
			 	<input class="apply_btn" id="apply"  type="button"  value="申请报名"/>
			    <!--分享-->
			    <div class="forum_btn2" id="btn_img_share" >
		 	 		<span style="padding-top:1px;padding-bottom:3px;" onclick="">
		 	 		<img src="${ctx }/h5/img/fenxiang.png" alt=""/>
		 	 		分享
		 	 		</span>
			 	</div>
			 <div id="leftTip" style="display:none;height: 32px; border-top: 1px solid #e6e6e6; position: fixed; bottom: 60px; width: 100%; max-width: 640px; background-color: #f5f5f5; padding-top: 10px; text-align: center;"></div>
			 </div>
		</form>
    
    
	    <!-- 项目足迹开始 -->
	    <div id="wrapper" style="height:100%;position:fixed;top:100%;background-color:#fff;display:none">
				<div  id="closebox1" class="closebox1"><img src="${ctx }/h5/img/ico-close.png"/></div>
				<div id="scroller">
				<div id="pullDown" style="display: none;"><span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span></div>
				<div id="pullUp" style="display: none;position: fixed;z-index:10;bottom: 0px;width: 100%;max-width: 640px;"><span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span></div>
				<div class="footePrint">
					<div class="nowStatus">
						<span><a>当前状态:<b>${projectLogoCurrent.stsDesc }</b></a></span>
						<div class="closeBnt">
							<img src="${ctx }/h5/img/ico-close.png" alt="">
						</div>
					</div>
					
					<div class="newMain">
						<c:forEach items="${projectLogoList }" var="projectLogo" varStatus="s">
						<c:if test="${s.index eq 0 }">
							<!-- 实线-年份开始 -->
							<div class="line">
								<div class="container">
									<div class="row">
										<div class="mounth1 col-xs-2 "></div>
										<div class="col-xs-10">
												<!-- 2016年12月02开始 -->
												<div class="inheader2">
													<div class="yuan"></div>
													<!-- 日期 -->
													<div class="marcTime2">
														<img src="${ctx }/h5/img/001.png" alt="">
														<span><fmt:formatDate value="${projectLogo.crtTime }" pattern="yyyy"/></span>
													</div>	
											</div>	
										</div>
									</div>
								</div>
								<div class="shixian"></div>
							</div>
							<!-- 实线-年份结束 -->
						</c:if>
						<div class="main1">
							<div class="container">
								<div class="row">
									<div class="mounth1 col-xs-2 "></div>
									<div class="col-xs-10">
										<!-- 2016年12月02开始 -->
										<div class="inheader">
											<div class="yuan ${projectLogo.objId eq projectLogoCurrent.objId ? 'active' : '' }  ${projectLogo.activeFlg eq '0' ? 'disabled' : ''}"></div>
											<span class="${projectLogo.objId eq projectLogoCurrent.objId ? 'active_txt' : ''} ${projectLogo.activeFlg eq '0' ? 'overEnd' : ''}">${projectLogo.stsDesc }</span>
											
											<!--<c:if test="${not empty projectLogo.attName }">
												<input type="button" value="${projectLogo.attName }" class="plan1" onclick="location.href='${ctx}/${projectLogo.attachUri }'">
											</c:if>
											-->
											<!-- 日期 -->
											<c:if test="${projectLogo.activeFlg ne '0'}">
											<div class="marcTime1">
												<img src="${ctx }/h5/img/002.png" alt="">
													<span><fmt:formatDate value="${projectLogo.crtTime }" pattern="dd/MM"/></span>
											</div>	
											</c:if>
											<!-- 日期 -->
										</div>
										<div class="inbody">
											<p class="${projectLogo.objId eq projectLogoCurrent.objId ? 'active_desc' : ''}  ${projectLogo.activeFlg eq '0' ? 'overEnd mainLeft' : ''}">${projectLogo.dtlDesc }</p>
										</div>
										<!-- 2016年12月02结束-->
									</div>
								</div>			
							</div>
						</div>
						</c:forEach>
	
						<!-- 数据十开始 -->
						<div class="main1" style="display: none;">
							<div class="container">
								<div class="row">
									<div class="mounth1 col-xs-2 "></div>
									<div class="col-xs-10">
										<!-- 2016年02月02开始 -->
										<div class="inheader onheader">
											<div class="yuan disabled"></div>
											<span class="overEnd">投后管理</span>
											<!-- 日期 -->
											<div class="marcTime1">
												<img src="${ctx }/h5/img/002.png" alt="">
												<span>02/02</span>
											</div>	
											<!-- 日期 -->
										</div>
										<div class="inbody">
												<p class="overEnd mainLeft current">详细说明:主要内容
													主要内容,<br>主要内容
												</p>
										</div>
										<!-- 2016年02月02结束-->
									</div>
								</div>
							</div>
						</div>
						<!-- 数据十结束 -->
					</div>
				</div>
			</div>
		</div>
	
	<div class="shareTip" id="shareTip"></div>	
	
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 200px;">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header" style="border: none;">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      	</div>
	         <div class="modal-body">
		        <div class="msg_div" id="msg_div" style="font-size: 16px; min-height: 50px; text-align: center;"></div>  
	      	</div>
		</div>
	   </div>
	</div>
	
	<div class="footer register" id="code_login_box" style="display: none;">
		<div class="input-group" id="operateBlock"  style="margin-left:10px;margin-right:10px;margin-top: 5px;">
			<input class="form-control input-large" name="vCode" type="text" placeholder="说点什么吧..."  style="height: 35px;" id="reqContent"/>
			<div class="input-group-btn ">
				<button type="button" class="submit_btn" style=" width:70px" onclick="publishForum();">发送</button>
			</div>
		</div>
		<div id="tipBlock" style="color: #1F0B09;font-family: 微软雅黑;">也想说两句？要先<a href="${ctx }/PtlWeixin!showLogin.action" style="color: #EA1717;">登录</a>哟</div>
	</div>
</div>
</body>
</html>