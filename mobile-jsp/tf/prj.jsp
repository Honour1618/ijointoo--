<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>爱就投|让资本带着资源投向高成长企业|健康生活第一筹众平台</title>
    <meta name="description" content="爱就投，让资本带着资源，投向真的有梦想的企业，成就每个人的创富梦想！爱就投，让人类商业文明提前进入共产主义！精品项目，爱就投！"/>
	<meta name="keywords" content="爱就投，私募股权融资，众筹，筹众，股权融资，股权投资，原始股，原始股投资，移动交易平台"/>
    <link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/file/tf/projectDes/css/projectDes.css">

   	<script type="text/javascript" src="${ctx }/js/sha1.js"/></script>
 	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
 	<script src="//wximg.qq.com/wxp/libs/wxmoment/0.0.4/wxmoment.min.js"></script>
 	<script type="text/javascript" src="${ctx }/file/commonJs/iscroll-probe.js"></script>
	<script type="text/javascript" src="${ctx}/file/commonJs/jquery-2.11.min.js"></script>
	<script type="text/javascript" src="${ctx }/mobile/common.js"></script>
	<script type="text/javascript" src="${ctx }/h5/js/i9tou_base.js"></script>
	<script type="text/javascript" src="${ctx }/file/tf/projectDes/js/projectDes.js?ver=1.3"></script>
	<script type="text/javascript">
		//wechat share start
		var shareTitle = '${shareTitle}';
		var shareDesc_s = '${shareDesc}';
		var shareDesc_d = '${desc_d}';
		var shareAppId = '${jsapi.appId}';
		var shareTimestamp = '${jsapi.timestamp}';
		var shareNonceStr = '${jsapi.nonceStr}';
		var shareTicket = '${jsapi.jsapi_ticket}';
		var shareImg = '${shareImg}';
		var commUrl = '${commUrl}';
		var prePrjCode = '${prj.prePrjCode}';
		//wechat share end
		
		//声明动态全局变量 JS调用 
		var webroot = '${ctx}';
		var isLogin = '${login}';//判断是否登陆
		var irank = '${irank}';//总排名
		var indRank = '${indRank}';//行业排名
		var prjCode='${prj.prePrjCode }';
		var chouId = '${tfib.cfno}';
		var loginFlg = '${login}';
		var progressNum = '${(tfib.realAmt * 100 / tfib.targAmt)}'; //进度速度
		var goodFlg = '${goodFlg}';
		var doFlg = '${doFlg}';
		var ftotal = '${ftotal }';
		var supportNone ="${tfib.finSts =='2' or tfib.finSts== '4'} ";
		var fillAmt2 = "${fillAmt2}";
		var istest = "${istest}";
		var creatorPicUrl = "${creatorPicUrl}";
		var videoUrl = "${prj.videoUrl}";
		var cfno="${cfno}";
		var cerFlag="${cerFlag }";
	</script>
</head>
<!-- 融测测项目详情 -->
<body>
    <div id="content">
    	<!-- 头部 -->
    	<header class="top">
    		融资项目详细信息
	     	<c:if test="${empty from}">
	     		<img src="${ctx}/file/tf/projectDes/img/prjBack.png" class="prjBack" />
	     	</c:if>
	     	<a href="${ctx}/PtlTf!userDetail.action?uid=${prj.userId }&pageInfo.currentPage=1&pageInfo.pageSize=3" class="business_home">
	     		<img src="${ctx}/file/tf/projectDes/img/business_home.png" />
	     	</a>
	     	<img src="${ctx}/file/tf/projectDes/img/prjShare.png"  class="prjShare"/>
	 		<input type="hidden" id="prjCode" value="${prj.prePrjCode }">
	     	<!-- 基本信息部分 -->
    	</header>
    	
    	<div id="attr_small_nav_fixed">
			<c:if test="${not empty tfib}"> <!-- 有助创信息，则需要展示助创目标和助创回报 -->
				<ul class="small_nav">
					<li><span class="author_story current">创业故事</span></li>
					<li><span class="author_goal">助创目标</span></li>
					<li><span class="author_reply">或有事项</span></li>
				</ul>
			</c:if>
		</div>
    	
    	<!-- H5 app公用 内容区域 -->
	
    	<div class="content-box" id="wrapper">
    		<div id="scroller">
			<c:choose>
				<c:when test="${not empty prj.videoUrl}">    <!--如果 --> 
					<div id="WxMomentVideo" class="wxvideo"></div>
					<div class="playControl">
						<img src="${ctx}/file/tf/projectDes/img/playControl.png" />
					</div>
				</c:when>
				
				<c:otherwise>  <!--否则 -->
					<div class="main_pic mainPic">
						<c:if test="${not empty creatorPicUrl}">
							<img class="main_pic" src="${ctx}${creatorPicUrl}"/>
							<%-- <p class="userFeng">${prj.userName}承诺：你的成功助创将在下轮融资时<br/>获得<b style="color:red">100倍</b>的优先认购权(八折)及<b style="color:red">${tfib.rtnMulNum}%</b>的回馈 --%></p>
						</c:if>
						<!-- div class="whiteMask"></div -->
						<c:if test="${empty creatorPicUrl}">
							<img class="main_pic" src="${ctx}/file/tf/projectDes/img/banner.jpg"/>
							<div class="userImg">
								<img src ="${ctx }/${prj.userLogo}" />
								<p>${prj.userName}<%-- 承诺：你的成功助创将在下轮融资时<br/>获得<b style="color:red">100倍</b>的优先认购权(八折)及<b style="color:red">${tfib.rtnMulNum}%</b>的回馈 --%></p>
							</div>
						</c:if>
					</div>
				</c:otherwise>
			</c:choose>
			<!--i class="prj_rank">TOP <b>10</b></i-->
			<div class="tag_con">
				<h2>${prj.prjName }</h2>
				<c:if test="${not empty prj.industryStr}">
					<div class="manufacture">
						<%-- <img src="${ctx }/file/tf/projectDes/img/manufacture.png"> --%>
						<span>${prj.industryStr }</span>
					</div>|
				</c:if>
				<c:if test="${not empty prj.finStageStr}">
					<div class="stage">
						<%-- <img src="${ctx }/file/tf/projectDes/img/stage.png"> --%>
						<span>${prj.finStageStr }</span>
					</div>
				</c:if>
				
				<!-- 项目简称开始 -->
				<div class="pro">
					<div class="pro_item">
						<%-- <i>已助创：<strong>¥${tfib.realAmtStr }<c:if test="${empty tfib.realAmtStr}">0</c:if>元</strong></i> --%>
						<em id="progress_main" class="bar" >
							<i>
								<b class="borderSum">
									<c:if test="${!empty tfib }">
										<fmt:formatNumber value="${(tfib.realAmt * 100 / tfib.targAmt)}" maxFractionDigits="1" />%
									</c:if>
									<c:if test="${empty tfib}">
										0%
									</c:if>
								</b>
							</i>
						</em>
						<%-- <span>助创目标：<strong>¥${tfib.targAmtStr}<c:if test="${empty tfib.targAmtStr}">0</c:if>元</strong></span> --%>
					</div>
					<ul class="pro_bottom">
						<li>
							<!-- 判断如果是待发起项目 -->
							<c:if test="${prj.flowSts==12 }">
								<i>${prj.targAmt}<c:if test="${empty prj.targAmt}">0</c:if>元</i>
							</c:if>
							<c:if test="${prj.flowSts!=12 }">
								<i>${tfib.targAmtStr }<c:if test="${empty tfib.targAmtStr}">0</c:if>元</i>
							</c:if>
							<span>助创目标</span>
						</li>
						<li>
							<i>${tfib.realAmtStr}<c:if test="${empty tfib.realAmtStr}">0</c:if>元</i>
							<span>助创金额</span>
						</li>
						<li>
							<c:choose>
								<c:when test="${prj.flowSts > 25}">
									<i>${prj.bidNum}人</i>
									<span>竞标人数</span>
								</c:when>
								<c:otherwise>
									<i>${prj.giveNum}人</i>
									<span>助创人数</span>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
				<!-- 项目简称结束 -->
			</div>
			<c:if test="${not empty prj.prjTag }">
				<div class="itemTagTitle"><img src="${ctx}/file/tf/projectDes/img/item_tag.jpg" /></div>
				<ul class="tag">
					<c:forEach items="${prj.prjTag }" var="show">
						<li>${show}</li>
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${not empty dsInfo}">
				<div class="creatTeach">
					<img src ="${ctx }/${dsInfo.userLogo}" class="creatUser" />
					<div class="creatInfo">
						<h2>${dsInfo.userName}</h2>
						<p>${dsInfo.position}</p>
					</div>
					<img src="${ctx}/file/tf/projectDes/img/creatTeachIcon.png" class="creatIcon" />
				</div>
			</c:if>
			<div id="attr_small_nav">
				<c:if test="${not empty tfib}"> <!-- 有助创信息，则需要展示助创目标和助创回报 -->
					<ul class="small_nav">
						<li><span class="author_story current">创业故事</span></li>
						<li><span class="author_goal">助创目标</span></li>
						<li><span class="author_reply">或有事项</span></li>
					</ul>
				</c:if>
			</div>
			<!-- 创业故事 -->
			<div class="storyOne" id="storyOne">
				<c:forEach  var="compFeature" items="${compFeatures}" varStatus="status">
					<div class="createDesc">
						<c:if test="${not empty compFeature.featureTitle || not empty compFeature.featureImgUrl || not empty compFeature.featureDesc}">
							<h2><%-- <img src="${ctx}/file/tf/projectDes/img/${compFeature.featureCode}.png"/> --%>
								<span>${compFeature.featureTitle}<img src="${ctx}/file/tf/projectDes/img/amtitle.jpg" class="amtitle" /></span>
							</h2>
						</c:if>
						<div class="createDesc-text-box">
							<c:if test="${not empty compFeature.featureImgUrl && compFeature.featureCode != '01'}">
								<img src="${ctx}${compFeature.featureImgUrl}" />
							</c:if>
							<c:if test="${not empty compFeature.featureDesc}">
								<pre>${compFeature.featureDesc}</pre>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<!-- 助创目标 -->
			<!-- 判断如果不是待发起项目,则正常显示助创目标和或有事项 -->
			<c:if test="${prj.flowSts!=12 }" >
				<c:if test="${not empty tfib.cfDesc}" >
					<div class="goalSup" id="goalSup">
						<h2><%-- <img src="${ctx }/file/tf/projectDes/img/rwxq.png"/> --%>
							<span>助创目标：<b>${priceTitle }</b><img src="${ctx}/file/tf/projectDes/img/amtitle.jpg" class="amtitle" /></span>
						</h2>
						<pre>${tfib.cfDesc}</pre>
					</div>
				</c:if>
				<!-- 或有事项 -->
				<c:if test="${not empty tfib.rightsDesc}" >
					<div class="rewardSup" id="rewardSup">
						<h2><%-- <img src="${ctx }/file/tf/projectDes/img/huibaoicon.png"/> --%>
							<span>或有事项<%-- ：<b>${tfib.rtnMulNum}%</b> --%><img src="${ctx}/file/tf/projectDes/img/amtitle.jpg" class="amtitle" /></span>
						</h2>
						<pre>${tfib.rightsDesc}</pre>
					</div>
				</c:if>
			</c:if>
			<!-- 判断如果是待发起项目,则不显示承诺回报和助创目标 -->
			<c:if test="${prj.flowSts==12 }">
				<div class="goalSup" id="goalSup"></div>
				<div class="rewardSup" id="rewardSup"></div>
			</c:if>
			<div class="source-box">
				<div class="source"><span>缺乏资源：</span><strong >${prj.rscDesc}</strong></div>
				<c:if test="${showDesc ==1}">
					<div class="source"><span>创业导师：</span><strong >${rspBidBean.userName}</strong></div>
				</c:if>
			</div>
			<c:if test="${showDesc == 1 && prj.flowSts == 21 && prj.flowSts == 25}">
				<div class="Agreement-box">
					<c:if test="${showDesc ==1}">
						<a class="source" href="http://ijointoo.com/htmlview/appDoc/agreement/bidBusiness.html"><span>项目评审协议</span><span class="source-link-to"><img src="${ctx}/file/tf/projectDes/img/nextbtnsource_06.png"/></span></a>
					</c:if>
					<c:if test="${prj.flowSts ==21 || prj.flowSts==25}">
						<a class="source" href="http://ijointoo.com/htmlview/appDoc/agreement/payNotice.html"><span>助创者须知</span><span class="source-link-to"><img src="${ctx }/file/tf/projectDes/img/nextbtnsource_06.png"/></span></a>
					</c:if>
				</div>
			</c:if>
			<!-- 判断如果不是待发起项目,则显示助创明细 -->
			<c:if test="${prj.flowSts !=12 }">
				<div class="list__titleBanner">
					<img src="${ctx }/file/tf/projectDes/img/zc-banner.jpg" />
				</div>
				<c:if test="${ endorseNum > 0}">
					<div class="endorse">已有<strong> ${endorseNum } </strong>个人为Ta证明真实性</div>
					<div class="endorseList-wrap" id="endorseList-wrap">
						<div class="endorseList">
							<c:forEach items="${endorseList }" var="endorsel" varStatus="status" >
								<div>
									<img src="${ctx}/${endorsel.userLogo}">
									<p>${endorsel.maskUserName}</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<ul id="list">
					<li class="list--title">已有<span class="list--title--num">"${total}"</span>条微天使助创记录
					</li>
				</ul>
				<div id="pullUp" class="">
					<div class="pullUpLabel">
						<img src="${ctx }/file/tf/projectDes/img/loadingGo.gif" />加载更多
					</div>
				</div>
			</c:if>

			</div>
		</div>

		<!-- 底部 -->
		<div class="effectTop"></div>
   		<div class="effect">
    		<div class="half zan">
				<c:if test="${goodFlg !=1}" >
					<span class="za zaRed" onclick="isLoginShow('dz')"><i>${prj.goodNum }</i></span> <!-- 赞  onclick="isLoginShow('dz')" -->
				</c:if>
				<c:if test="${goodFlg ==1}" >
					<span class="za" id="zaShowMask"><i>${prj.goodNum }</i></span><!-- 已赞 -->
				</c:if>
			</div>
			<div class="half ping">
				<span class="pinglun" ><i>${ftotal}</i></span><!-- 评论 -->
			</div>
			<div class="half bonus">
				<!-- 成功打赏过 -->
				<c:if test="${doFlg == 1}" >
					<span class="bonu bonuRed supportId" onclick="isLoginShow('ds')">继续助创</span>
				</c:if>
				<!-- 助创将开始 -->
				<c:if test="${doFlg == 0}" >
					<span class="bonu supportId">助创将开始</span>
				</c:if>
				<!-- 待支付打赏 or 打赏-->
				<c:if test="${doFlg == 2 or doFlg == 5}">
					<span class="bonu bonuRed supportId" onclick="isLoginShow('ds')" >助创</span>	
				</c:if>
				<!-- 灰色显示打赏 -->
				<c:if test="${doFlg == 11}">
					<span class="bonu supportId grayBg" >助创</span>	
				</c:if>
				<!-- 助创已结束 -->
				<c:if test="${doFlg==9}">
					<span class="bonu supportId grayBg">助创已结束</span>
				</c:if>
				<!-- 补仓 -->
				<c:if test="${doFlg == 6}" >
					<span class="bonu bonuRed supportId" onclick="isLoginShow('bc')" >助创</span>	
				</c:if>
			</div>
		</div>
	</div>
	<!-- 回复-->
	<div class="answer">
		<p>回复</p>
		<textarea class="desc" id="desc_reply" placeholder="说点什么吧~"></textarea>
		<div class="rwdBtn">
			<input type="button" class="reward_btn" value="提交" id="reply_submit"/>
		</div>
		<img src="${ctx}/file/tf/projectDes/img/close.png" class="close" />
	</div>
	<!-- 回复 -->
	<!-- 打赏成功后，弹出框 -->
	<div class="success_ds">
		<img src="${ctx}/file/tf/projectDes/img/success_ds_gb.png" class="success_ds_gb" />
		<%-- <p>感谢你的助创:<strong style="color:#ff0000;">${totalSuptAmt}&nbsp; </strong>元<br/>
			 下次众筹融资成功后<br/>
			 创业者会给予<strong>${tfib.rtnMulNum }%</strong>的助创回报!
		</p> --%>
		<p>您已成功助创</p><strong>${totalSuptAmt}元</strong>
		<div class="success_ds_btn">
			<!-- <button class="success_ds_cancel">取消</button> -->
			<button class="success_ds_cancel"><a href="${ctx}/PtlTf!makeCer.action?uid=${uid}#0">生成证书</a></button>
			<button class="success_ds_share" onclick="isLoginShow('ds')">继续助创</button>
		</div>
	</div>
	<!-- 打赏成功后，弹出框结束 -->
	<!-- 分享引导 -->
	<div id="share_mask"><img alt="" src="${ctx}/file/tf/fintest/img/share_arrow.png" width="218"/></div>
	<!-- 页面警告框 -->
	<div class="alertShow">
		<span></span>
	</div>
	
	<!-- 页面进入提示  -->
	<div class="enter_tip">
		<i></i>
		您的助创金将无偿赠与创业者用于支付创业前期费用，如果：
		a助创成功，且项目完成下一轮融资后，您可以获得创业者的感恩回馈；
		b助创成功，但项目没有完成下一轮融资，您无法获得任何回报；
		c助创失败，平台将原路返还您的助创金。请及时查收您的打款账户。
	</div>
	
	<!-- 风险提示 -->
	<div class="riskTip">
		<h2>风险提示</h2>
		<p>爱就投平台将严格遵守《中华人民共和国网络安全法》及相关法律法规的规定，对本平台用户提供的所有个人信息、隐私和商业秘密（如有）将严格保密，不向他人泄露、出售或者非法提供。对于本平台上线展示的商业项目，本平台不以任何方式向本平台注册用户承诺或暗示承诺最低收益或保障</p>
		<div>
			<button class="riskCan">取消</button>
			<button class="riskAgr">同意</button>
		</div>
	</div>
	
	<!-- 打赏弹出层 -->
	<div class="reward">
		<c:if test="${doFlg == 1 or doFlg == 2 or doFlg == 5}" >
			<div class="funding">
				<input type="hidden"  name="investAmt" id="investAmt" value="">
				<div style="text-align: left;" id="amt_item_list">
					<c:forEach items="${amtLst}" var="show" varStatus="status" >
						<input type="button" value="${show}元" class="amt_item_static" id="amt_item_${status.index }" onclick="amtclick(this,${show})"/>
					</c:forEach>
				</div>
			</div>
			<p>我还能提供如下助创：</p>
			<textarea class="desc" id="desc_ds" placeholder="在这里输入我能提供的资源信息"></textarea>
			<div>
				<p class="financeTip">这么好的项目，融资阶段你愿意投资多少呢！</p>
				<span>众筹意愿</span>
				<select id="future_support" name="">
					<option></option>
					<option value="5万">5万</option>
					<option value="10万">10万</option>
					<option value="20万">20万</option>
					<option value="50万">50万</option>
				</select>
				<c:if test="${showEndorse == 1 }">
					<p class="endorser endorser-nor" data-num="">我愿证明这个项目的真实性</p>
				</c:if>
				<c:if test="${showEndorse == 0 }">
					<p class="endorser endorser-gray">你已为此项目真实性证明</p>
				</c:if>
				<c:if test="${showEndorse == 2 }">
					<p class="endorser endorser-gray">该项目真实性证明人数已达到10人</p>
				</c:if>
			</div>
		</c:if>
		<div class="rwdBtn">
			<input type="button" class="reward_btn" value="提交" onclick="support();" />
		</div>
	</div>
	
	<!-- 登录/APP下载弹出窗 -->
	<div class="login">
		<i></i>
		<div class="login_info">
			<img src="${ctx }/file/finshare/mo/image/logo.png" >
			<p>·只有注册会员才能操作哦</p>
		</div>
		<!-- <a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">
			下载APP
		</a> -->
		<a class="button" id="login_btn" onclick="loginFun(this)" data-type="0">
			立即登录注册
		</a>
	</div>
	<div class="loginUp"></div>
	<!-- 登录/APP下载弹出窗 -->
	
	<!-- 补仓弹出层 -->
	<div class="coverSelf">
		<input type="hidden"  name="coverAmt" id="coverAmt" value="">
		<div class="funding" id="amt_cover_list">
			<c:if test="${fAmtType == 'up' }">
				<input type="button" value="${fillAmt}元" class="amt_item_static" id="amt_item_fillAmt" onclick="amtclick(this,${fillAmt})"/>
			</c:if>
			<c:if test="${fAmtType == 'bt' }">
				<input type="button" value="${fillAmt}元" class="amt_item_static" id="amt_item_${fillAmt}" onclick="amtclick(this,${fillAmt})"/>
				<input type="button" value="${fillAmt2}元" class="amt_item_static amt_item_selected" id="amt_item_${fillAmt2}" onclick="amtclick(this,${fillAmt2})"/>
				<p class="${fillAmt} cover_tip">最低限额补仓，可以进行选择投资经理操作。</p>
				<p class="${fillAmt2} cover_tip2">最高限额补仓，可以让更优质的投资经理，更快速地找到你的项目。</p>
			</c:if>
		</div>
		<div class="rwdBtn">
			<div>
				<input type="button" class="covCancel" value="取消" onclick="coverCancel();" />
			</div>
			<div>
				<input type="button" class="covNext" value="确定" onclick="support('${fillAmt}')" />
			</div>
		</div>
	</div>
	<!-- 补仓弹出层结束 -->
	
	<div class="common_mask"></div>
	<div class="success_mask"></div>
</body>

</html>
