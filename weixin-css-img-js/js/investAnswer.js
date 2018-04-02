$(function(){
	
	/*投资答疑-问答展示开始*/
	var answerCon=$('.answerCon');
	var quesTitle=$('.ques_title');
	var answerT=$('.answer_t');

	quesTitle.click(function(event) {
		var $father=$(this).parent();
		if ($father.hasClass('current')) {

			$father.removeClass('current')
		}else{

			$father.addClass('current');
			$father.siblings('quesTitle').remove('current');
		}
	});	
	
	
	/*投资答疑-问答展示结束*/
})
