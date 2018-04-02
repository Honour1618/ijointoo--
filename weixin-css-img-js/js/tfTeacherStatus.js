/*  (function (doc, win) {
        var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
                var clientWidth = docEl.clientWidth;
                if (!clientWidth) return;
                if(clientWidth>=640){
                    docEl.style.fontSize = '100px';
                }else{
                    docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
                }
            };

        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);*/

    /*通用弹窗-----------------------------------------------------------------------------------*/

    function alertDS(str,eleName){
        $(".common_mask").show();
        $(eleName).show();
        $(eleName+" span").html(str);
        $(".btn-close").on("click",function () {
            $(".common_mask").hide();
            $(eleName).hide();
        });
    };
    $("#dsCenter").on("click",function(){
        /*alertDS("你还未进行导师认证，只有/i9tou/PtlTf!rccIndex.action?eqType=mb通过导师审核才能竞标项目哦！","#alertJd");*/
    	window.location.href=webroot+"/PtlTf!rccIndex.action?eqType=mb";
    });
    
    $("#backBtn").on("click",function(){
    	 window.history.back();
    });
    
    $(".btn__go").on("click",function(){
    	window.location.href=webroot+"/PtlTf!selfCompleting.action?eqType=mb";
    });
    $(".logout__btn").on("click",function(e){
    	e.stopPropagation();
    	alertDS("退出登录","#alertExit");
    	$("#exitBtn").on("click",function(e){
    		e.stopPropagation();
        	$.ajax({
        	    type: "POST", //用POST方式传输
        	    dataType: "json", //数据格式:JSON
        	    url: webroot + "/PtlPortal!logout.action", //目标地址
        	    data: { "nosession": true},//session 未登录ajax 请求有效
        	    error: function (XMLHttpRequest, textStatus, errorThrown) {},
        	    success: function (msg){ 
        	    	submitBool = false;
            		if(msg.result=='9')
            		{
            			alert("失败");
            			return;
            		}
            		else
            		{	
            			window.location.href=webroot+"/PtlMobile!index.action";
            		}

            	},
        	    error:function (msg){ 
        			alert(msg);
        	    }
        	});
    	});

    });