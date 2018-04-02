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


    //上传头像预览
    document.getElementById("user_avatar").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#user_avatar_show") , $("#user_avatar_data") , "360");
       
        }

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