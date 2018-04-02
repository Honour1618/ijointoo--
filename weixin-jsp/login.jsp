<!DOCTYPE html>
<html lang="utf-8">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>爱就投会员登录</title>
<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${ctx }/file/commonCss/baseh5.css"/>
<link rel="stylesheet" type="text/css" href="${ctx }/file/h5/css/login/login.css"/>
<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/file/h5/js/login/login.js"></script>
<script>
	var webroot="${ctx }";
</script>
</head>
<body >
	<div class="page_body">
		<!-- 顶部开始 -->
	    <div class="top">
	    	<div class="topIn">
	    		<div class="top_left"></div>
	    		<img class="logo_bg" src="${ctx }/file/h5/image/logo.png"/>
	    		<div class="top_right"></div>
	            <ul class="item">
	                <li><a href="${ctx }/">首页</a></li>
	                <li><a href="${ctx }/web_projects">项目</a></li>
	                <li><a href="${ctx }/web_acts">活动</a></li>
	                <li><a href="${ctx }/web_news">资讯</a></li>
	                <li><a href="${ctx }/web_about">关于我们</a></li>
	                <li><a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">下载APP</a></li>
	            </ul>
	    	</div>
	    </div>
		<div class="bg"></div>
		<div class="bg_xy"></div>
	
		<!-- 输入手机号登陆开始 -->
		<div class="phoneSign" id="phoneSign">
			
			<!-- logo开始 -->
		    <div class="logo">
		    	<img src="${ctx }/file/h5/image/logoCenter.png">
		    </div>
		    <!-- 页面来源提示性文字 -->
		    <c:if test="${not empty loginTip}">
		    	<div class="rf_notice"><span>*</span> ${loginTip  }</div>
		    </c:if>
		    
			<div class="telephone">
				<input type="tel" placeholder="请输入手机号码" id="userMobile" maxlength="11">
				<p><span>*</span> 若手机未注册将自动创建爱就投账户</p>
			</div>
			<div class="err_msg"></div>
			
			 <!-- 按钮开始 -->
			<div class="subTj">
				<input type="button" class="button" value="下一步" id="next">
			</div>
			<!--<div class="agree">
    			<p>已阅读并同意<a href="javascript:;">《爱就投服务协议》</a></p>
    		</div>
    		按钮结束 -->
    		
		</div>
		<!-- 输入手机号登陆结束-->
		
		<!-- 协议部分 -->
			<div class="information">
	               <div class="modal  bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display:none;">
	                   <div class="modal-dialog modal-lg">
	                     <div class="modal-content">
	                       <div class="modal-header">
	                       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
	                         <h4 class="modal-title" id="myLargeModalLabel">《爱就投服务协议》</h4>
	                       </div>
	                       <div class="modal-body">
								<h4>第一条 定义与解释</h4>
								<p>1.1 除本协议另有规定外，下列用语或术语应当具有以下定义：
								爱就投指上海爱就投金融信息服务有限公司运营的为用户提供信息对接服务的互联网平台。
								用户指符合爱就投规定的条件、同意遵守本协议的约定、使用爱就投平台服务并自愿申报注册成为爱就投平台会员且被许可的主体。
								投资人指符合爱就投规定的在线投资相关资格要求、同意遵守本协议的约定自愿申请并经爱就投审核通过，使用爱就投在线投资服务的用户。
								平台服务指爱就投为用户提供的一系列信息对接服务、平台软件系统支持等服务，包括但不限于发布/浏览信息服务、在线投资/融资服务等。
								在线投资/融资服务指爱就投为投资人/企业提供的在线投资/融资服务，包括但不限于提供项目信息、提供在线投资/融资工具及其他相关服务。</p>

								<h4>第二条 协议当事人</h4>

								<p>2.1 爱就投与用户经友好协商，依据《中华人民共和国合同法》、《中华人民共和国公司法》及其他相关法律、法规的规定，本着平等、自愿、等价有偿的原则，就爱就投向用户提供在线投资服务事宜，达成本服务协议，以资共同遵守。</p>
								<p>2.2 除非协议中另有约定，爱就投、用户在本协议中合称为“双方”，单称为“一方”。</p>


								<h4>第三条 服务内容</h4>
	
								<p>3.1 用户在阅读、理解本协议内容并同意接受本协议后，自愿申报注册成为爱就投平台认证会员的，在本协议生效后有权依据爱就投的相关规定及本协议的约定使用爱就投平台服务，并使用本协议及其签署同意的其他协议规定的相应服务。</p>
								<p>3.2 投资人在本协议生效后有权依据爱就投的相关规定及本协议的约定使用爱就投平台提供的平台服务。</p>
								<p>3.3 爱就投依据本协议的约定，运用自身的软件平台通过移动互联网络为用户提供平台服务。</p>
	

								<h4>第四条 服务期限与服务价款</h4>

								<p>4.1 本协议服务期限自本协议生效之日起至用户会员资格被终止之日或平台服务中所涉具体交易或事项完成之日止（二者中以后到时间为准）。</p>
								<p>4.2 投资人（包括投资人设立的有限合伙企业）使用爱就投平台提供的在线投资服务投资于爱就投平台提供的项目融资公司、取得项目融资公司股权/股份/份额的，投资人应向爱就投支付服务价款。 </p>
								<p>4.3 用户在服务期限内使用爱就投提供的其他有偿服务的，应根据与爱就投达成的相关协议支付服务价款。</p>
	

								<h4>第五条 爱就投之权利和义务</h4>

								<p>5.1 爱就投声明并承诺其是依据中国法律设立并有效存续的有限责任公司，具有一切必要的权利及能力订立及履行本协议项下的所有义务和责任；本协议一经生效即对其具有法律约束力。</p>
								<p>5.2 爱就投承诺并保证运用其爱就投平台为用户提供本协议约定的服务，但不对以下事项作出担保或保证或承担任何责任：
								   （1） 用户利用爱就投平台发布的信息的真实性、准确性、完整性、合法性、及时性或有效性；
								   （2） 用户的投资收益、交易的达成等事项；
								   （3） 投资人的投资损失；
								   （4） 除另有特殊说明外，爱就投不以口头、书面或其他任何形式为用户提供意见或信息。</p>
								<p>5.3 爱就投承诺并保证依据自身既有条件和水平最大限度的维护爱就投平台的系统稳定性，但不就电讯系统或互联网的中断或无法运作、技术故障、计算机错误或病毒、信息损坏或丢失或由此而产生的其他任何非自身原因引起的问题向用户或任何第三方承担赔偿责任。</p>
								<p>5.4 爱就投承诺并保证严格尊重和维护用户的隐私，保守用户的秘密，除非经用户书面授权，爱就投承诺并保证不公开、修改或透露用户/创业者/投资人的基本资料、公司保密信息，亦不公开爱就投平台各项服务中的非公开内容，但以下情况除外：
								   （1） 根据中国法律、法规和规范性文件的强制性规定，或应有权机关要求，有义务提供用户在爱就投平台网页上发布的信息内容及其发布时间、互联网地址或者域名等信息；
								   （2） 为维护爱就投平台的知识产权和其他合法权益；
								   （3） 在紧急情况下为维护用户个人和社会大众的合法权益；
								   （4） 根据本协议及爱就投的相关规定或者爱就投平台认为必要的其他情况下。</p>
								<p>5.5 用户有如下行为之一的，爱就投平台有权单方终止本协议，立即停止对用户发布信息的技术支持和其他服务，并保存有关记录、删除含有有关信息的地址、目录或关闭服务器，必要时可依据中国法律、法规及规范性文件向国家有关机关报告。用户应承担全部法律责任，并赔偿爱就投、及其他任何第三方由此受到的损失，包括合理的追索费用：
								   （1） 用户提供的信息/产品侵害任何第三方知识产权、财产权等合法权益，或可能对第三方造成不利影响或侵害；
								   （2） 用户利用爱就投平台提供之网络平台进行任何违法犯罪活动，或宣传散播法律法规禁止散播的信息，或实施其他损害爱就投平台利益的行为；
								   （3） 用户有违反本协议及爱就投制定的其他相关制度、规则的行为，经爱就投警告后在一定期限内仍未改正；
								   （4） 用户的行为严重干扰爱就投正常的服务活动。</p>
								<p>5.6 爱就投承诺并保证若其或爱就投违反上述承诺和保证而给用户造成损失，或导致无法提供本协议所述之服务，爱就投同意对用户因此而遭受的损失承担相应的赔偿责任。</p>


								<h4>第六条 用户之权利和义务</h4>

								<p>6.1 用户声明并承诺其是依据中国法律设立并有效存续的有限责任公司/股份有限公司/其他形式的组织或为具有完全民事行为能力的自然人，具有一切必要的权利及能力订立及履行本协议项下的所有义务和责任；本协议一经生效即对其具有法律约束力。</p>
								<p>6.2 用户有权依据本协议的约定使用爱就投平台提供的各项服务。</p>
								<p>6.3 用户承诺并保证遵守本协议以及其与爱就投或其关联方签署的其他协议的约定，并遵守爱就投制定的其他相关制度、规则，维护爱就投的正常运作及其公信力，不实施有损于爱就投的行为，包括但不限于以下行为：
								   （1） 未经爱就投书面许可，通过本协议约定方式之外的途径进入爱就投计算机信息网络系统或者使用本协议约定范围外的信息网络资源或服务；
								   （2） 未经爱就投书面许可，对爱就投平台计算机信息网络功能进行删除、修改或者增加；
								   （3） 未经爱就投书面许可，对爱就投平台计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加；
								   （4） 故意制作、传播计算机病毒等破坏性程序；
								   （5） 其他危害计算机信息网络安全、妨碍爱就投正常运作、有损其公信力的行为。</p>
								<p>6.4 用户承诺并保证妥善保管其在爱就投平台的账号和密码，并对其账户中的所有活动和事件承担责任。用户有权随时修改其密码和图标，也可注销旧的帐户开立新帐户。用户若发现任何非法使用其帐号或存在安全漏洞的情况，应立即通知爱就投并采取措施以减少不必要的损失。</p>
								<p>6.5 用户承诺并保证在本协议第4.1款规定的服务期限内，仅接受爱就投提供的服务，不再与其他任何第三方就与本协议服务内容相同或类似的服务事项进行磋商、谈判或者合作。</p>
								<p>6.6 用户承诺并保证按照本协议第4.2、4.3款的规定向爱就投按时、足额支付服务价款。</p>
								<p>6.7 用户承诺并保证其提供或发布的所有信息（包括但不限于用户/创业者/投资人的基本资料、公司保密信息等）是真实、准确、完整的，符合中国各项法律、法规及规范性文件以及爱就投相关规则的规定，不存在虚假、误导性陈述或重大遗漏，并承诺及时对已发布的信息进行更新、维护和管理。</p>
								<p>6.8 用户承诺并保证其提供或发布的信息不存在以下情形：
								   （1） 违反中国各项法律、法规及规范性文件规定的；
								   （2） 危害国家安全、泄露国家秘密、颠覆国家政权、破坏国家统一的，煽动民族仇恨、民族歧视，破坏民族团结的，破坏国家宗教政策、宣扬邪教和封建迷信的，有损国家荣誉和利益的；
								   （3） 散布谣言、含有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪信息，扰乱社会秩序，破坏社会稳定的；
								   （4） 侮辱或者诽谤他人，侵犯其他任何第三方知识产权及其他合法权益的；
								   （5） 其他含有法律、法规及规范性文件禁止内容的。</p>
								<p>6.9 用户承诺并保证依据自身判断对在爱就投平台上创建、发布公司或投资公司作出独立的、审慎的决定，并保证依法、依约完成其通过使用爱就投平台提供的服务而达成的各项交易。</p>
								<p>6.10 用户承诺并保证使用爱就投平台服务的风险由其自身承担，其根据自身需求下载或通过爱就投平台产品服务取得相关信息资料，并由其自行承担系统受损、资料丢失以及其它任何风险。</p>
								<p>6.11 用户承诺并保证若其违反上述承诺和保证而给爱就投造成损失，用户同意对爱就投因此而遭受的损失承担相应的赔偿责任。</p>
	

								<h4>第七条 知识产权</h4>

								<p>7.1 爱就投平台所提供服务涉及到的其自身开发的产品的所有权以及软件的知识产权等归爱就投所有。</p>
								<p>7.2 用户或用户代理的著作权人同意爱就投在本协议有效期内对用户所上载的原创作品或是用户得到著作权人授权转载的作品享有使用权，但该等作品的所有权/著作权仍归用户或原著作权人享有。</p>


								<h4>第八条 税项和费用之规定</h4>

								<p>协议各方一致同意，本协议所涉及的税项和费用，按照中国有关法律、法规及规范性文件的规定办理。法律没有明确规定的，由各方各自/平均负担。</p>
	

								<h4>第九条 税项和费用之规定</h4>
	
								<p>协议各方一致同意，本协议所涉及的税项和费用，按照中国有关法律、法规及规范性文件的规定办理。法律没有明确规定的，由各方各自/平均负担。</p>
		

								<h4>第九条 保密义务</h4>
		
								<p>9.1 协议任何一方对根据本协议获得的其他方的保密信息（包括但不限于爱就投的技术秘密、资源，用户的基本资料等保密信息）及本协议所涉保密事项承担同等保密义务，未经协议其他方许可不得擅自将有关信息、资料披露给第三方（根据法律要求履行必要的信息披露义务除外）；如因违反本保密义务给任一方造成经济损失的，应予以赔偿。</p>
								<p>9.2 协议任何一方对于基于本协议从另一方获取的标有秘密或专有标记的信息或技术、商业或者管理等方面的有关知识，应当承担保密义务，在本协议有效期内或本协议履行完毕之后，任何一方不得利用这些知识或信息，不得向他人披露；如因违反本保密义务给其他方造成经济损失的，应予以赔偿。</p>
								<p>9.3 上述保密义务不适用于任何下列情况：
								   （1） 在本协议签订当日或之后任何时间，并非由于接受方的原因而为公众所知的保密资料；
								   （2） 有关法律、行政法规、规范性文件和有关政府、行业主管部门规定须予披露时；
								   （3） 为执行本协议，各方可按需要合理地向其雇员、专业顾问或代理人披露适当的保密资料，各方须确保和促使其雇员、专业顾问或代理人遵守本协议约定的保密义务。</p>


								<h4>第十条 法律适用和争议解决</h4>
	
								<p>10.1 本协议的制定、解释、及其在执行过程中出现的或与本协议有关的异议的解决，受中华人民共和国现行有效的法律、法规及规范性文件的约束。</p>
								<p>10.2 在本协议执行过程中，若出现与本协议有关的争议，协议各方应尽量本着友好协商的精神予以协商解决；若各方于三十日内协商不能解决或任意一方不同意协商解决的，则任何一方有权将争议提交爱就投所在地有管辖权的法院通过诉讼解决。</p>
								<p>10.3 在诉讼过程中，除有争议的事项外，本协议应继续执行。</p>
				

								<h4>第十一条 违约责任</h4>
				
								<p>对于协议一方的任何违约行为，其他方有权以书面形式通知违约方要求补救。除非违约方在十日内采取及时、充分的补救措施，否则要求补救的守约方有权就其所受的损失要求违约方赔偿。</p>
						

								<h4>第十二条 不可抗力</h4>
				
								<p>12.1 本协议所指不可抗力系指:地震、风暴、严重水灾或其他自然灾害，瘟疫、战争、暴乱、敌对行动、公共骚乱、公共敌人的行为、政府或公共机关禁止，黑客攻击、政府管制或因第三方原因导致网络通讯瘫痪等任何一方无法预见、无法控制和无法避免的事件。</p>
								<p>12.2 若发生了不可抗力事件导致任何一方或各方不能履行其任何的契约性义务，该等义务应在不可抗力事件存在时暂停，而义务的履行期应自动按暂停期顺延而不加以处罚。</p>
								<p>12.3 遭遇不可抗力的一方或各方应在发生不可抗力事件后的十天内向其他方提供发生不可抗力和其持续期的适当证明，并应尽其最大努力终止不可抗力事件或减少其影响。</p>
								<p>12.4 发生不可抗力事件时，各方应立即磋商以寻求一个公平的解决方法，并应采用所有合理努力以减轻不可抗力的影响。</p>
					
								<h4>第十三条 协议的生效与终止</h4>
		
								<p>13.1 本协议自用户同意接受本协议全部条款之日（以在本协议下方“□我同意”处划“√”为准）起生效。本协议生效后，对各方均具有法律约束力。</p>
								<p>13.2 本协议自第4.1款所述服务期限届满之日起终止。</p>
							

								<h4>第十四条 附则</h4>
					
								<p>14.1 本协议取代了各方就服务事项之前所达成的任何口头协议、谅解或备忘录。 本协议项下的条款和条件构成各方完整和有约束力的义务，协议各方就本协议未尽事宜经协商一致签署的补充协议或确认函，与本协议具有同等的法律效力。</p>
								<p>14.2 爱就投可因情势变更等原因修改本协议的条款，如用户继续使用爱就投平台提供的服务，则视为已明知并同意遵守修改后的协议；如不同意，可提出终止协议的要求并注销其在爱就投平台的账号。</p>
								<p>14.3 除非取得爱就投的书面同意，用户不得将其在本协议项下的全部或部分权利与义务转让给任何第三方。</p>
								<p>14.4 本协议部分条款无效、被撤销或者终止的，不影响其他条款的效力，其他条款仍然有效。</p>
								<p>14.5 任何一方未能或延迟行使和/或享受其根据本协议享有的权利和/或利益，不应视为对该等权利和/或利益的放弃，且对该等权利和/或利益的部分行使不应妨碍未来对此等权利和/或利益的行使。</p>
						
	                       </div>
	                   </div><!-- /.modal-content -->
	                  </div><!-- /.modal-dialog -->
	               </div>
	         </div>
		
		
		
		
		
		<!-- 已经是爱就投会员用验证码登陆开始 -->
		<!-- 点击切换 -->
		<div class="codeLoad" id="regloginbox" style="display:none">
		
			<div id="loginTipbox">
				<!-- 提示信息开始 -->
			    <div class="tip">
			    	您已成为爱就投会员，使用手机验证码或密码登录
			    </div>
			    <div class="loadStyle">
					<input type="button" value="验证码登录" maxlength="6" class="codeLoad current" onclick="showCodeLogin();">
					<input type="button" value="密码登录" maxlength="6" class=""  onclick="showPwdLogin();">
				</div>
			</div>
			<div id="regTipbox">
				您好，您还不是爱就投会员，请注册获得更多体验！
			</div>
		
		
			<!-- 图片验证码登陆 -->
			<div class="mainLoad" id="code_login_box">
				<div class="userInform6 disNone" id="userNamebox" style="display: none;">
					<input name="userName" class="" type="text" placeholder="请输入中文姓名" maxlength="8" id="userName" style="width: 100%;"/>
				</div>
				<div class="err_msg" style="margin:auto"></div>
				<div class="userInform6 disNone" id="addrLogin">
	        		<input type="hidden" class="form-control" name="investMemInfo.areaRang" value="1" id="addRangStr"/>
	        		<select class="compRangStr" id="address">
	        			<option value="" class="area_belong">所在区域</option>
	        			<c:forEach var="pro" items="${provinces }" varStatus="proStatus">
	        				<option value="${pro.fieldVal}" <c:if test="${investMemInfo.areaRang eq pro.fieldVal}">checkec</c:if>>${pro.fieldValChNm}</option>
	        			</c:forEach>
	        		</select>
	        		<div class="err_msg" id="address_tips">请选择所在区域</div>
	        	</div>
	        	<div class="userInform6 disNone" id="indusLogin">
	        		<input type="hidden" class="form-control" name="investMemInfo.industry" value="1" id="industryStr"/>
	        		<select class="compIndustryStr" id="industry">
	        			<option value="" class="area_belong">所属行业</option>
	        			<c:forEach var="ind" items="${compRangList }" varStatus="status">
	        				<option value="${ind.fieldVal}" <c:if test="${investMemInfo.industry eq ind.fieldVal}">checkec</c:if>>${ind.fieldValChNm}</option>
	        			</c:forEach>
	        		</select>
	        		<div class="err_msg" id="industry_tips">请选择所属行业</div>
	        	</div>
				<div class="userInform6 compRangLi disNone" id="seeLogin">
					<p>关注领域 <span class="grayShow">（最多选四个）</span></p>
					<div class="compRangList">
						<c:forEach  var="item" items="${compRangList}" varStatus="status">
							<a data-val="${item.fieldVal}">${item.fieldValChNm}</a>
						</c:forEach>
					</div>
					<input type="hidden" name="investMemInfo.userRang"  value="" id="compRangStr"/>
					<span class="err_msg" id="user_industry_tips" style="margin:auto">请选择关注领域</span>
				</div>
				<div class="userInform6">
					<input name="randCode" class="" maxlength="6" type="tel" placeholder="请输入图片验证码" id="randCode">
					<div class="yanzheng1">
						<a href="javascript:changeImagelabel();" title="换一张" class="check_img">
							<img id="image1" src="<s:url value='/genVerifyCode.do'/>" style="">
						</a>
					</div>
				</div>
				<div class="err_msg" style="margin:auto;"></div>
				<!-- 页面警示框 -->
				<div class="alertShow">
					<span></span>
				</div>
				<div class="common_mask"></div>
	
				<!-- 点击获取手机验证码 -->
				<div class="userInform2" id="dlv_v">
					<input type="tel" name="code" maxlength="6" placeholder="请输入手机验证码" id="vcode">
					<input type="button"  class="yanZheng" value="获取验证码" id="btnSendCode" onclick="sendMessage();" style="background-color:#fff;">
					<input class="yanZheng" value="60s" id="btnSendCodeTime" style="display: none;">
				</div>
				<div class="err_msg" style="margin:auto;"></div>
				<div id="regProtocol">
					<i onclick="isChecked(this)"></i>
    	            <label class="v_align">已阅读并同意</label>
    	            <div class="motai"> 
	                      <span><a href="${ctx }/data/comm/i9tou.html" style="color:#F83E18">《爱就投用户服务协议》</a></span>和<span><a href="${ctx}/htmlview/appDoc/agreement/secret.html" style="color:#F83E18">《爱就投隐私政策》</a></span>
	                </div>
				</div>
	
				<div class="subTj1">
					<input type="button" class="button" value="登录" onclick="btnCodeDo();" id="btnRegLogin">
				</div>
			</div>
	
				
	
			<!-- 密码登陆 -->
			<div class="mianLoad2" id="pwd_login_box" style="display: none;">
				<input type="password" placeholder="请输入登录密码"  id="password">
	
				<!-- 登陆 -->
				<div class="subTj2">
					<input type="button" class="button" value="登录" onclick="btnPwdDo()">
				</div>
				<!-- 登陆 -->
			</div>
			<div class="err_msg"></div>
				
			
			
		</div>
	</div>

	<!-- 已经是爱就投会员用验证码登陆结束-->
	
	
<script language="javascript">
	var webroot = "${ctx}";
	var provinces = "${provinces }";
	var match = "${investMemInfo.areaRang}";
	var compRangList = "${compRangList}";
	var industryMatch = "${investMemInfo.industry}";
	//百度统计
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?58e626be451c5f320e8a30581e18c3d8";
		var s = document.getElementsByTagName("script")[0]; 
		s.parentNode.insertBefore(hm, s);
	})();
</script>
</body>
</html>