/*
 * 创始人简介
 * 
 */

$(function(){
	
	menu_rightBar_defaultFun();
	
	//点击提交项目信息
	$("#btnLogin").bind("click" , function(e){
		
		if($("#userAvatar").val() == "" && featureImgUrl == ""){//个人风采照片
			$("#userAvatar").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			return;
		}
		
		if($("#compName").val() == ""){//自我介绍
			$("#compName").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			return;
		}
		
		//提交
		var formMain = document.getElementById("ajaxForm");
		formMain.submit();
		
	});
	
	// 上传图片预览
	document.getElementById("userAvatar").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#user_avatar_show") , $("#user_avatar_data"));
        }
    });
	
});

//限制输入字数
/*function LimitTextArea(field){ 
	maxlimit=512; 
	if(field.value.length > maxlimit){
		field.value = field.value.substring(0, maxlimit);
		$(".compNameL").css("color","#f74a3d");
	}else{
		$(".compNameL").css("color","#bbb");
	}
}*/
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

//检验图片提交
function checkFile(files , showObj , dataObj){

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
        	obj.html("请确保文件为图像类型");
            return false;
        }
        
        reader.onload = function(e) {
        	getImgData(this.result,orientation,function(data){
                //这里可以使用校正后的图片data了 
        		
        		if( dataObj != undefined ){
        			dataObj.val(data);
        		}
        		html = '<div class="item"><img src="'+data+'" alt="img"></div>';
        		if( showObj != undefined ){
        			showObj.html(html);
        		}
    
            }); 
        };
        reader.readAsDataURL(files[0]);
    }
}
		
//图片压缩
function getImgData(dataURL,dir,callback){
	
    img = new Image(),
    degree=0;
    img.onload = function() {
    	var degree=0,drawWidth,drawHeight,width,height;
        drawWidth=this.naturalWidth;
        drawHeight=this.naturalHeight;
        //以下改变一下图片大小
        var nowSize = 640;
        var maxSide = Math.max(drawWidth, drawHeight);
        if (maxSide > nowSize) {
            var minSide = Math.min(drawWidth, drawHeight);
            minSide = minSide / maxSide * nowSize;
            maxSide = nowSize;
            if (drawWidth > drawHeight) {
                drawWidth = maxSide;
                drawHeight = minSide;
            } else {
                drawWidth = minSide;
                drawHeight = maxSide;
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
        context.rotate(degree*Math.PI/180);
        context.drawImage(this,0,0,drawWidth,drawHeight);
        //返回校正图片
        callback(canvas.toDataURL("image/jpeg",1));

    };
    img.src = dataURL;
}