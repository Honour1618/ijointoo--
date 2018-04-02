<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
        <title>爱就投|优选创业导师|让专业发挥价值</title>
    <meta name="description" content="爱就投，让资本带着资源，投向真的有梦想的企业，成就每个人的创富梦想！爱就投，让人类商业文明提前进入共产主义！精品项目，爱就投！"/>
	<meta name="keywords" content="爱就投，私募股权融资，众筹，筹众，股权融资，股权投资，原始股，原始股投资，移动交易平台"/>
	<link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/base.css">
    <style>
        html,body{
            min-width: 320px;
            max-width: 640px;
            margin: 0 auto;
            min-height: 100%;
        }
        html{
            position: relative;

        }
        .page{
            min-width: 320px;
            max-width: 640px;
            margin: 0 auto;
            height: 100%;

        }
       /*ä¸å¤ä¸å±çæåµä¸ï¼è§£å³ä¸å±æ¾ç¤ºèæ¯*/
        .page::before{
            content:" ";
            position:absolute;
            left:0;
            right:0;
            top:0;
            bottom:0;
            background: #226a95;/* é¢è²èªå®ä¹ */
            z-index:-100;/* çªç¶æ³å°ä¸ªæ¸¸æï¼æ¯ç·äººå°±ä¸100å±ããã */
        }
        .clearfix:after{
            display: block;
            width: 0;
            height:0;
            content: "";
            clear: both;
        }

        body{
/*
            position: relative;
            height: 100%;
            box-sizing: border-box;
            background: url("images/teac-bottom-bg_09.png") no-repeat left 0 bottom 0;
            background-size: 100% 100%;*/

            height: 100%;
        }

        .user-img-show .item{
            /*padding: 5px;*/

        }
        .user-img-show img{
            width: 100%;
            height: 100%;
            vertical-align: top;
        }
        .sub-apply{
            width: 200px;
            height: 53px;
            display: block;
            border: none;
            background: url("images/save-btn-bg_03.png") no-repeat left 0 top 0;
            background-size: 100% 100%;
            margin: 27px auto 30px;
/*            position: absolute;
            left: 50%;
            margin-left: -100px;
            bottom: 40px;*/
            animation:helpAnimate 0.5s infinite;
            -webkit-animation:helpAnimate 0.5s infinite;

        }
        .save-box{
            background: #226a95;
            height: 100%;
        }
        .teac-title{
            width: 300px;
            margin: 0 auto;
            height: 88px;
        }
        .teac-title img{
            width: 273px;
            float: right;
           margin-bottom: -55px;
            margin-top: 18px;
        }

        .teac-msg-box{
            margin: 0 auto 0;
            background: rgba(7,193,192,0.8);
            padding:47px 17px 17px 17px;
            box-sizing: border-box;
            min-height: 455px;
            width: 301px;
            z-index: 10;
        }
        .teac-msg-box>dt>img{
            margin-left: -25px;
            width: 135px;
            height: 36px;
            vertical-align: top;
        }

        .al-add{
            width:100%;
            display: block;
/*            text-indent: 1em;
            border: none;
            background: url("images/teac-ipt-bg_03.png") no-repeat left 0 top 0;
            background-size: 100% 100%;
            height: 33.5px;
            margin: 12px auto 0;*/

            text-indent: 7px;
            box-sizing: border-box;
            font-size: 15px;
            color: #333333;
            height: 34px;
            /* margin: 15px auto 15px; */
            border: 3px solid;
            border-radius: 5px;
            -webkit-border-image: url(images/teac-ipt-bg_03.png) 8 8 8 8 stretch stretch;
            -o-border-image: url(images/teac-ipt-bg_03.png) 8 8 8 8 stretch stretch;
            border-image: url(images/teac-ipt-bg_03.png) 8 8 8 8 stretch stretch;
        }
        .al-ms{
            display: block;
            width:100%;
            border: 3px solid;
            border-radius: 5px;
            -webkit-border-image: url(images/anli_13.png) 8 8 8 8 stretch stretch;
            -o-border-image: url(images/anli_13.png) 8 8 8 8 stretch stretch;
            border-image: url(images/anli_13.png) 8 8 8 8 stretch stretch;
            height: 117px;
            margin: 12px auto 0;
            padding: 10px;
            box-sizing: border-box;
            resize: none;
            font-size: 15px;
            color: #333333;
        }
        .user-img-show{
            background: url("images/add-logo_07.png") no-repeat left 0 top 0;
            background-size: 100% 100%;
            width: 91px;
            min-height: 91px;
            margin: 0 auto 25px;
            border: 3px solid;
            -webkit-border-image: url(images/add-anli-logo_07.png) 5 5 5 5 repeat;
            -o-border-image: url(images/add-anli-logo_07.png)   5 5 5 5   repeat;
            border-image: url(images/add-anli-logo_07.png)  5 5 5 5   repeat;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }
        .boxBg{
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            z-index: -1;

        }
        .teac-msg-box>dd>.user_acatar_btn{
            display: block;
            width: 91px;
            height: 91px;
            margin: 0 auto -91px;
            color: #666;
            opacity: 0;

        }
        .back-btn{
            display: block;
            position: absolute;
            left: 12px;
            top:13px;
            width: 58px;
            height: 55px;
            background: none;
        }
        .back-btn>img{
            width: 100%;
        }
        /*inputè¾å¥æç¤º*/
        .input-prompt{
            text-align: right;
            color: #226a95;
            margin-bottom: 6px;
            line-height: 22px;
            height: 22px;
        }
        .input-prompt>span{
            line-height: 22px;
            height: 22px;
        }
        @keyframes helpAnimate
        {
            0% {
                transform:rotate(2deg);
                -ms-transform:rotate(2deg); 	/* IE 9 */
                -moz-transform:rotate(2deg); 	/* Firefox */
                -webkit-transform:rotate(2deg); /* Safari å Chrome */
                -o-transform:rotate(2deg);
            }
            50%  {
                transform:rotate(-2deg);
                -ms-transform:rotate(-2deg); 	/* IE 9 */
                -moz-transform:rotate(-2deg); 	/* Firefox */
                -webkit-transform:rotate(-2deg); /* Safari å Chrome */
                -o-transform:rotate(-2deg);
            }
            100%{
                transform:rotate(2deg);
                -ms-transform:rotate(2deg); 	/* IE 9 */
                -moz-transform:rotate(2deg); 	/* Firefox */
                -webkit-transform:rotate(2deg); /* Safari å Chrome */
                -o-transform:rotate(2deg);
            }
        }

        @-webkit-keyframes helpAnimate /* Safari and Chrome */
        {
            0% {
                transform:rotate(2deg);
                -ms-transform:rotate(2deg); 	/* IE 9 */
                -moz-transform:rotate(2deg); 	/* Firefox */
                -webkit-transform:rotate(2deg); /* Safari å Chrome */
                -o-transform:rotate(2deg);
            }
            50%{
                transform:rotate(-2deg);
                -ms-transform:rotate(-2deg); 	/* IE 9 */
                -moz-transform:rotate(-2deg); 	/* Firefox */
                -webkit-transform:rotate(-2deg); /* Safari å Chrome */
                -o-transform:rotate(-2deg);
            }
            100%{
                transform:rotate(2deg);
                -ms-transform:rotate(2deg); 	/* IE 9 */
                -moz-transform:rotate(2deg); 	/* Firefox */
                -webkit-transform:rotate(2deg); /* Safari å Chrome */
                -o-transform:rotate(2deg);
            }
        }
    </style>
    <script src="js/jquery-2.2.0.min.js"></script>
    <script src="js/exif.js"></script>
</head>
<body>
<div class="page">
    <div class="teac-title clearfix"><img src="images/anliadd_03.png" alt="æ¡ä¾æ·»å " ></div>
    <dl class="teac-msg-box">
        <dd >
            <input type="file" id="user_avatar" class="user_acatar_btn" accept="image" >
            <div id="user_avatar_show" class="user-img-show"></div>
        </dd>
        <dt><img src="images/anli-title_07.png" alt="æ¡ä¾åç§°"></dt>
        <dd><input type="text" class="al-add" maxlength="16"><p class="input-prompt"><span>0</span>/16</p></dd>
        <dt><img src="images/anli-title_10.png" alt="æ¡ä¾æè¿°"></dt>
        <dd><textarea  class="al-ms" maxlength="256"></textarea><p class="input-prompt"><span>0</span>/256</p></dd>

    </dl>
    <img src="images/teac-bottom-bg_09.png" alt="åºé¨èæ¯" class="boxBg">
    <a href="##" class="back-btn"><img src="images/back-btn-bg_03.png" alt="è¿å"></a>
    <button id="subApply" class="sub-apply"></button>
</div>
</body>
<script>
    /*å­ç¬¦é¿åº¦å®æ¶å±ç¤º*/
    function strnum(inputName,num) {
        $(inputName).on("input propertychange",function () {
            console.log("è¿æ¥äº");
            var len=$(this).val().length;
            if(len<=num){
                $(this).next(".input-prompt").children("span").text(len);
            }else{
                return;
            }

        })
    }

    strnum(".al-add",16);
    strnum(".al-ms",256);
    //ä¸ä¼ å¤´åé¢è§
    document.getElementById("user_avatar").addEventListener('change', function(e){
        var files = this.files;

        if(files.length){
            checkFile(this.files , $("#user_avatar_show") , $("#user_avatar_data") , "360");
        }
        autoHeight()
    });


    //æ£éªå¾çæäº¤
    function checkFile(files , showObj , dataObj , nowSize){
        if( showObj != undefined ){
            showObj.html("").show();
        }

        if (files.length != 0) {
            //è·åæä»¶å¹¶ç¨FileReaderè¿è¡è¯»å
            var html = '';

            var orientation = 0;
            EXIF.getData(files[0],function(){
                orientation=EXIF.getTag(this,'Orientation');
            });

            var reader = new FileReader();
            if(!/image\/\w+/.test(files[0].type)){
                showObj.html("è¯·ç¡®ä¿æä»¶ä¸ºå¾åç±»å");
                return false;
            }

            reader.onload = function(e) {
                getImgData(this.result,orientation,function(data){
                    //è¿éå¯ä»¥ä½¿ç¨æ ¡æ­£åçå¾çdataäº
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

    //å¾çåç¼©
    function getImgData(dataURL,dir,callback , nowSize){

        img = new Image(),
            degree=0;
        img.onload = function() {
            var degree=0,drawWidth,drawHeight,width,height;
            drawWidth=this.naturalWidth;
            drawHeight=this.naturalHeight;
            //ä»¥ä¸æ¹åä¸ä¸å¾çå¤§å°
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

            //å¤æ­å¾çæ¹åï¼éç½®canvaså¤§å°ï¼ç¡®å®æè½¬è§åº¦
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
            //ä½¿ç¨canvasæè½¬æ ¡æ­£
            context.fillStyle = "#fff";
            context.fillRect(0, 0, canvas.width, canvas.height);
            context.rotate(degree*Math.PI/180);
            context.drawImage(this,0,0,drawWidth,drawHeight);
            //è¿åæ ¡æ­£å¾ç
            callback(canvas.toDataURL("image/jpeg",1));

        };
        img.src = dataURL;
    }
</script>
</html>