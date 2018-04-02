
	//textarea高度自适应
var autoTextarea = function (elem, extra, maxHeight) {
        extra = extra || 0;
        var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
        isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
                addEvent = function (type, callback) {
                        elem.addEventListener ?
                                elem.addEventListener(type, callback, false) :
                                elem.attachEvent('on' + type, callback);
                },
                getStyle = elem.currentStyle ? function (name) {
                        var val = elem.currentStyle[name];
 
                        if (name === 'height' && val.search(/px/i) !== 1) {
                                var rect = elem.getBoundingClientRect();
                                return rect.bottom - rect.top -
                                        parseFloat(getStyle('paddingTop')) -
                                        parseFloat(getStyle('paddingBottom')) + 'px';        
                        };
 
                        return val;
                } : function (name) {
                                return getComputedStyle(elem, null)[name];
                },
                minHeight = parseFloat(getStyle('height'));
 
        elem.style.resize = 'none';
 
        var change = function () {
                var scrollTop, height,
                        padding = 0,
                        style = elem.style;
 
                if (elem._length === elem.value.length) return;
                elem._length = elem.value.length;
 
                if (!isFirefox && !isOpera) {
                        padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
                };
                scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
                //*****
                elem.style.height = minHeight + 'px';
                if (elem.scrollHeight > minHeight) {
                        if (maxHeight && elem.scrollHeight > maxHeight) {
                                height = maxHeight - padding;
                                style.overflowY = 'auto';
                        } else {
                                height = elem.scrollHeight - padding;
                                style.overflowY = 'hidden';
                        };
                        style.height = height +15+ extra + 'px';
                        scrollTop += parseInt(style.height) - elem.currHeight;
/*                        document.body.scrollTop = scrollTop;
                        document.documentElement.scrollTop = scrollTop;*/
                        elem.currHeight = parseInt(style.height);
                };
        };
 
        addEvent('propertychange', change);
        addEvent('input', change);
        addEvent('focus', change);
        change();
};


    function reCheckImg(flag){
    	console.log(flag);
        document.getElementById("user_avatar1").addEventListener('change', function(e){
            var files = this.files;
            if(files.length){
            	flag=1;
            	console.log(flag);
               return flag;
            }else{
            	flag=0;
            	console.log(flag);
            	return flag;
            }
        });
    }
    
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
    
    /* 选择多选项 */
    function checkSub(className){
		var n=$(className).children(".industry-list-active").size();
		if(n=="" || n== undefined){
			n=0;
		}
    	$(className).on("click","span",function(){
    		if(!$(this).hasClass("industry-list-active")){
    			if(n<4){
        			$(this).addClass("industry-list-active");
    				n++;
    			}else{
    				$(className).children(".industry-list-active").eq(0).removeClass("industry-list-active");
    				$(this).addClass("industry-list-active");	
    			}
    		}else{
    			$(this).removeClass("industry-list-active");
    			n--;	
    		}

    		console.log(n);
    	});
    };

  //字数限制
    function LimitTextArea(field){ 
    	maxlimit=512;
    	var realNum = field.value.length;
    	var numM = maxlimit - realNum;
    	if(numM >= 0){
    		$(".compNameL strong").html(numM);
    	}else{
    		field.value = field.value.substring(0, maxlimit);
    		$(".compNameL strong").css("color","#f74a3d");
    	}
    };


    
    /*添加案例字符长度实时展示*/
    function strnum(inputName,num) {
        $(inputName).on("input propertychange",function () {
            var len=$(this).val().length;
        	var str=$(this).val();
            if(len<=num){
                $(this).next(".input-prompt").children("span").text(len);	
            }else{
            	$(this).val(str.substring(0, num));
            	 $(this).next(".input-prompt").children("span").text(num);
                return;
            }
            $(this).focus();
        });
    };

 
    /* 提交前验证 */
    function subGoing(){

    	//所在区域
    	var selVal=$(".al-add").find("option:selected").val();
    	if(selVal=="" || selVal==undefined){
    		var addressY = $('.al-add').offset().top;
/*    		$(document).scrollTop(addressY-60);*/
    		$('html, body').animate({scrollTop:addressY-60}, 'slow');
    		alertShow("请选择所在区域",1000);
    		return false;
    	}
    	
    	//擅长领域
    	var lyCheckLen=0;
    	$(".industry-box").children("span").each(function(){
    		if($(this).hasClass("industry-list-active")){
    			lyCheckLen++;
    		}
    	});
    	if(lyCheckLen==0 || lyCheckLen==undefined){
    		var addressY = $('.industry-box').offset().top;
    		/*$(document).scrollTop(addressY-60);*/
    		$('html, body').animate({scrollTop:addressY-50}, 'slow');
    		alertShow("请选择擅长行业",1000);
    		return false;
    	}
    	
    	//擅长领域
    	var jtCheckLen=0;
    	$(".jintong-box").children("span").each(function(){
    		if($(this).hasClass("industry-list-active")){
    			jtCheckLen++;
    		}
    	});
    	if(jtCheckLen==0 || jtCheckLen==undefined){
    		var addressY = $('.jintong-box').offset().top;
    	/*	$(document).scrollTop(addressY-60);*/
    		$('html, body').animate({scrollTop:addressY-60}, 'slow');
    		alertShow("请选择精通技能",1000);
    		return false;
    	}
    	
    	//大侠关注阶段
    	var gzLen=0;
    	$(".jineng-box").children("span").each(function(){
    		if($(this).hasClass("industry-list-active")){
    			gzLen++;
    		}
    	});
    	if(gzLen==0 || gzLen==undefined ){
    		var addressY = $('.jineng-box').offset().top;
    		/*$(document).scrollTop(addressY-60);*/
    		$('html, body').animate({scrollTop:addressY-60}, 'slow');
    		alertShow("请选择关注阶段",1000);
    		return false;
    	}
    	
    	//所在门派
    	var menpai=$("#menpai").val();
    	if(menpai==undefined || menpai =="" ||menpai.length<2){
    		var addressY = $("#menpai").offset().top;
    	/*	$(document).scrollTop(addressY-60);*/
    		$('html, body').animate({scrollTop:addressY-60}, 'slow');
    		alertShow("请填写所在门派",1000);
    		return false;
    	}
    	//职位
    	var zhiwei=$("#zhiwei").val();
    	if(zhiwei==undefined || zhiwei ==""||zhiwei.length<2){
    		var addressY = $("#zhiwei").offset().top;
    	/*	$(document).scrollTop(addressY-60);*/
    		$('html, body').animate({scrollTop:addressY-60}, 'slow');
    		alertShow("请填写职位",1000);
    		return false;
    	}
    	//理念
    	var linian=$("#linian").val();
    	if(linian==undefined || linian =="" ||linian.length<2){
    		var addressY = $("#linian").offset().top;
    	/*	$(document).scrollTop(addressY-60);*/
    		$('html, body').animate({scrollTop:addressY-60}, 'slow');
    		alertShow("请填写投资理念",1000);
    		return false;
    	}
    	//履历
    	var lvli=$("#lvli").val(); 
    	console.log("履历："+lvli);
    	if(lvli ==undefined || lvli =="" || lvli.length<2){
    		var addressY = $("#lvli").offset().top;
    		/*$(document).scrollTop(addressY-60);*/
    		$('html, body').animate({scrollTop:addressY-60}, 'slow');
    		alertShow("请填写履历",1000);
    		return false;
    	}

    	console.log("履历"+lvli);
    	$("#lniptln").val(lvli);
    	
    	return true;
    }
    /* 监听inputchange事件，显示相应提示 */
    function showTS(className){
        /* 提示 */
    	$(className).on("input propertychange",function(){
    		var strVal=$(this).val();
    		if(strVal.length<2){
    			$(this).next(".ts").show();
    		}else{
    			$(this).next(".ts").hide(); 
    		}
    	});
    };
    

    
    
    //添加案例验证提交
    function subAnLi(){
    	//图片
    	var imgVal=$("#user_avatar_data2").val();
    	if(imgVal=="undefined" || imgVal ==""){
    		$('html, body').animate({scrollTop:0}, 'slow');
    		$("#subApply2").attr({"disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
    		alertShow("请添加Logo",1000);
    		return false;
    	} 
    	//案例名称
    	var anLiTitle=$("#anLiTitle").val();
    	if(anLiTitle.length<2 || anLiTitle ==""){
    		var addressY = $("#anLiTitle").offset().top;
    		/*$(document).scrollTop(addressY-50);*/
    		$('html, body').animate({scrollTop:addressY-50}, 'slow');
    		$("#subApply2").attr({"disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
    		alertShow("请正确填写案例名称",1000);
    		return false;
    	}
    	//案例描述
    	var anLiTesc=$("#anLiTesc").val();
    	if(anLiTesc.length<2 || anLiTesc ==""){
    		var addressY = $("#anLiTesc").offset().top;
    		/*$(document).scrollTop(addressY-50);*/
    		$('html, body').animate({scrollTop:addressY-50}, 'slow');
    		$("#subApply2").attr({"disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
    		alertShow("请正确填写案例描述",1000);
    		return false;
    	}
    	$("#subApply2").attr({"disabled":true});  //新增/修改案例状态 根据状态请求相应的ajax
    	return true;
    }
    //修改案例验证提交
    function subAnLixg(){
    	//案例名称
    	var anLiTitle=$("#anLiTitle").val();
    	if(anLiTitle.length<2 || anLiTitle ==""){
    		var addressY = $("#anLiTitle").offset().top;
    		$('html, body').animate({scrollTop:addressY-50}, 'slow');
    		$("#subApply2").attr({"disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
    		alertShow("请正确填写案例名称",1000);
    		return false;
    	}
    	//案例描述
    	var anLiTesc=$("#anLiTesc").val();
    	if(anLiTesc.length<2 || anLiTesc ==""){
    		var addressY = $("#anLiTesc").offset().top;
    		$('html, body').animate({scrollTop:addressY-50}, 'slow');
    		$("#subApply2").attr({"disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
    		alertShow("请正确填写案例描述",1000);
    		return false;
    	}
    	$("#subApply2").attr({"disabled":true});  //新增/修改案例状态 根据状态请求相应的ajax
    	return true;
    }
    
    //案例修改
    function xgAnli(e,t,oId){
    	console.log(oId);
    	console.log("修改"+oId);
    	//修改按钮后填充数据到新增案例页面
    	$("#subApply2").attr({"dataUp-flag":"1","disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
	/*	alertShow("请正确填写案例描述",1000);*/
    	var me=t;
    	$(function dataTc(){
    		addStyle();
    		console.log("进来了");
			$(".page").hide();
			$(".page2").show();
			var title=$(me).siblings("h3").text();
			var con=$(me).siblings("p").text();
			var img=$(me).siblings(".anLi-list-icon").children("img").clone();
			$("#user_avatar_show2").append(img);
			$(".reCheck-btn").show();
			$("#user_avatar1").css("display","block");
			console.log(img);
			$("#anLiTitle").val(title);
			$("#anLiTesc").val(con);
			$("#subApply2").attr("data-id",oId);
			var pnum=$(t).siblings("p").text().length;
			var hnum=$(t).siblings("h3").text().length;
			$("#anLiTesc").next(".input-prompt").children("span").text(pnum);
			$("#anLiTitle").next(".input-prompt").children("span").text(hnum);
			$('html, body').scrollTop(0);
    	}());

    }
    
    /* 返回按钮 */
    function back(e){
    	e.stopPropagation();
		$(".page2").hide();
		$(".page").show();
		$("#anLiTesc").next(".input-prompt").children("span").text(0);
		$("#anLiTitle").next(".input-prompt").children("span").text(0);
    	//修改按钮后填充数据到新增案例页面
    	$("#subApply2").attr({"dataUp-flag":"0","disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
    	/*$(document).scrollTop();*/
		$('html, body').animate({scrollTop:0}, 'slow');
		addStyle();
		
    }
    
    /* 添加案例  */
    function addAnli(event){
    	event.stopPropagation();
		$(".page").hide();
		$(".page2").show();
    	/*$(document).scrollTop();*/
    	$('html, body').animate({scrollTop:0}, 'slow');
		$("#subApply2").attr({"dataUp-flag":"0","disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
		addStyle();	
    }
    //案例新增页面 初始化样式
    function addStyle(){
    	//隐藏重新选择按钮  隐藏两个选择按钮  清空图片显示框  清空存储图片的隐藏域   还原添加logo的背景
    	$("#user_avatar2").css("display","block");
    	$(".reCheck-btn").hide();
    	$("#user_avatar1").css("display","none");
		$("#user_avatar_show2").empty();
		
		$("#user_avatar_data2").val("");
		$("#anLiTitle").val("");
		$("#anLiTesc").val("");
		$("#user_avatar_show2").css({"background":"url("+webroot+"/file/tf/tfManager/images/add-logo-img_07.png) no-repeat left -2px top -2px","background-size":"105% 105%"}); 
    }
    
    //案例删除
    function delAnli(e,t,oId){
/*    	console.log(oId);
    	console.log("删除"+oId);*/
		$.ajax({
		    type: "POST", //用POST方式传输
		    dataType: "json", //数据格式:JSON
		    url: webroot +'/PtlTf!ajaxDelInvstCase.action', //目标地址  新增/PtlTf!ajaxInvestCase.action   修改 /PtlTf!ajaxUpdateInvstCase.action
		    data: {
		    	"nosession":"true",
		    	"memFeature.objId":oId
		    },
		    error: function (XMLHttpRequest, textStatus, errorThrown) {
		    	console.log(XMLHttpRequest.responseText);
		    },
		    success: function (data){ 
	    		if(data.result=='0')
	    		{
	    			console.log("删除成功");
	    			$(".anLI-list-box").children(".anLi-list").each(function(){
	    				if($(this).attr("data-id")==oId){
	    					$(this).remove();
	    					//控制显示隐藏
	    					var listLen=$(".anLI-list-box").children(".anLi-list").size();
	    					console.log("列表长度:"+listLen);
	    					if(listLen==0){
	    						$(".anLI-list-box").hide();
	    						$('.anLi-check').show();
	    					}
	    					return;
	    				}
	    			});
	    		}
	    		else{
	    			console.log(data.message);

	    		}
	    	}
		});


    }

    //表单提交时  把多选按钮的值填入数组，赋值给隐藏域
	function checkArr(clsName,iptName){
    	var checkStr=new String();
    	$(clsName).children(".industry-list-active").each(function(){
    		var t=$(this).attr("value");
    		checkStr+=t;
    		checkStr+=",";
    	});
		var Str=checkStr.slice(0,(checkStr.length-1));
    	$(iptName).val(Str);
    	
    };
    

    
    //dataUp-flag="0" 0是新增案例   1是修改案例
    //ajax
    function AnliAjax(){
    	//根据状态请求相应的路径    新增 /修改
        $("#subApply2").on("click",function(e){
    		e.stopPropagation();
    		var anLiID=$(this).attr("data-id");
    		var flagType=$(this).attr("dataup-flag");
    		if($(this).attr("dataup-flag")==0){
        		if(subAnLi()){
        			ajaxTo("/PtlTf!ajaxInvestCase.action");
        			return;
        		}else{
            		console.log("保存条件有误");
        		} 
    		}else{
        		if(subAnLixg()){
        			ajaxTo("/PtlTf!ajaxUpdateInvstCase.action",anLiID,flagType);
        			return;
        		}else{
            		console.log("修改条件有误");
        		} 
    		}
    	});
        
        function ajaxTo(url,anLiID,flagType){
			var dataObj = $("#form_small_main").serializeArray();
			console.log("dataObj:"+dataObj);
			if(flagType){
				var n={
						name:"memFeature.objId",
						value:anLiID
				};
				dataObj.push(n);
			};
			console.log(dataObj);
    		$.ajax({
    		    type: "POST", //用POST方式传输
    		    dataType: "json", //数据格式:JSON
    		    url: webroot + url, //目标地址  新增/PtlTf!ajaxInvestCase.action   修改 /PtlTf!ajaxUpdateInvstCase.action
    		    data: dataObj,
    		    error: function (XMLHttpRequest, textStatus, errorThrown) {
    		    	console.log(XMLHttpRequest.responseText);
    		    },
    		    success: function (data){ 
    	    		if(data.result=='0'){
    	        		var aLTitle=$("#anLiTitle").val();
    	        		var imgUrl=$("#user_avatar_data2").val();
    	        		var aLTesc=$("#anLiTesc").val();
    	        		var dataCj={
    	        				aLTitle:aLTitle,
    	        				imgUrl:imgUrl,
    	        				aLTesc:aLTesc
    	        		};

    	        		console.log("flagType："+flagType);
    	        		console.log("dataObj:"+dataObj);
    	        		if(flagType == undefined){
    	        			console.log("新增");
    	        			strAdd(data,dataCj);//新增
    	        			$("#subApply2").attr("dataup-flag",0);
    	        			$(".anLi-check").hide();
    	        			$(".anLI-list-box").show();
    	        			$("#anLiTesc").next(".input-prompt").children("span").text(0);
    	        			$("#anLiTitle").next(".input-prompt").children("span").text(0);
    	            		var addressY = $(".anLi-box").offset().top;
    	            		/*$(document).scrollTop(addressY-50);*/
    	            		$('html, body').scrollTop(addressY-100);
    	        			return;
    	        		}else{
    	        			console.log("修改");
    	        			strxg(data,dataCj);//修改
/*    	        			$("#subApply2").attr("dataup-flag",0);*/
    	        	/*		$('html, body').scrolltop();*/
    	        			return;
    	        		};
    	    		}else if(data.result=='9'){
    	    			if(data.errorCause =="1"){
    	    				//登录失败
    	    				window.location.href="${ctx}/PtlTf!perfectInfo.action";
    	    				return;
    	    			}else if(data.errorCause =="2"){
    	    				alertShow("图片上传失败",1000);
    	    				return;
    	    			}else if(data.errorCause =="3"){
    	    				alertShow("图片格式不对 （只支持：jpg, png ,gif, jpeg)",1000);
    	    				return;
    	    			}else{
    	    				alertShow(data.desc,1000);
    	    				$("#subApply2").attr({"disabled":false});  //新增/修改案例状态 根据状态请求相应的ajax
    	    				return;
    	    			}
    	    		};
    	    	}
    		});
        };
        //字符串拼接方法      新增 / 修改 
        function strAdd(data,dataCj){
			//提交成功
			//案例id memFeature.objId
        	strPing(data,dataCj);
        	$("#addALBtn").show();
        	console.log("进来了新增");
	    	alertShow("新增案例成功",1000);
        }
        function strxg(data,dataCj){
			var anliId=data.memFeature.objId;
        	//先删除原来的案例，再添加返回得到案例
			$(".anLI-list-box").children(".anLi-list").each(function(){
				if($(this).attr("data-id")==anliId){
					$(this).remove();
					return;
				}
			});
			strPing(data,dataCj);
	    	alertShow("修改案例成功",1000);
        }
        function strPing(data,dataCj){
        	var anliId=data.memFeature.objId;
			var list="";
			list+="<div class='anLi-list clearfix' data-id='"+anliId+"'>";
			list+="<h3>"+data.memFeature.featureTitle+"</h3>";
			list+="<p>"+data.memFeature.featureDesc+"</p>";
			list+="<input type='button' class='anLi-list-btn del' onclick='delAnli(event,this,"+anliId+")' >";
			list+="<input type='button' class='anLi-list-btn revise' onclick='xgAnli(event,this,"+anliId+")' >";
			if(data.memFeature.featureImgUrl==""){
				var imgaddress=$("#user_avatar_show2").find("img").prop("src");
				list+="<div class='anLi-list-icon'><img src="+imgaddress+"></div>";
			}else{
				list+="<div class='anLi-list-icon'><img src="+data.memFeature.featureImgUrl+"></div>";
			}
			list+="</div>";
			$(".anLI-list-box").prepend(list);
			//提交成功后 返回案例列表 ,并显示刚新增的案例
			$(".page2").hide();
			$(".page").show();
			$("#user_avatar_show2").empty();
	    	var n=$(".anLI-list-box").offset().top;
	    	$('html, body').scrollTop(n-50);
	    	addStyle();
        }
    }
    
    //页面初始化文本提示
    function txtSub(idName){
    	var name=$(idName).val().length;
    	$(idName).next(".input-prompt").children("span").text(name);
    }
  
    //页面加载完毕初始化
    $(function(){
    	//进页面判断有没有登录
    	if(userId==""){
    		window.location.href=webroot+'/PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('PtlTf!perfectInfo.action');
    	}

        strnum(".al-add",40);
        strnum(".al-ms",512);
        strnum("#lvli",512);
        checkSub(".industry-box");
        checkSub(".jintong-box");
        checkSub(".jineng-box");
        strnum("#lvli",512);
    	showTS(".al-add");
    	showTS(".anLiTesc");
    
    	//调用textarea自适应
        var id1=document.getElementById("lvli");
        var id2=document.getElementById("anLiTesc");
        autoTextarea(id1);
        autoTextarea(id2);
        //ajax请求  
        AnliAjax();

        txtSub("#lvli");

        
        //完善信息提交
        $("#subApply").on("click",function(e){
        	e.stopPropagation();
        	if(subGoing()){
        		
            	//提交多选项填充到隐藏域
        		checkArr(".industry-box","#hyStr");
        		checkArr(".jintong-box","#jnStr");
        		checkArr(".jineng-box","#gzStr");
        		var dataObj = $("#form_main").serializeArray();
        		console.log(dataObj);
        		return true;
        	}else{
        		console.log("验证错误");
        		return false;
        	}
        });
        
        //案例添加上传头像预览
        $("#user_avatar2").on('change', function(e){
            var files = this.files;
            if(files.length){

                checkFile(this.files , $("#user_avatar_show2") , $("#user_avatar_data2") , "360");
                $("#user_avatar_show2").css("background","#ffffff");
                $(".reCheck-btn").show();
                $("#user_avatar1").css("display","block");
                $("#user_avatar2").css("display","none");
                
            }  
        });
        
        //案例添加上传头像预览2
        $("#user_avatar1").on('change', function(e){
            var files = this.files;
            if(files.length){

                checkFile(this.files , $("#user_avatar_show2") , $("#user_avatar_data2") , "360");
                $("#user_avatar_show2").css("background","#ffffff");
               
            }  
        });
    });