(function ($) {
	$(function () {
		
	      $('.ui.form')
	        .form({
	          fields: {
	            id: {
	              identifier  : 'id',
	              rules: [
	                {
	                  type   : 'empty',
	                  prompt : '아이디를 입력하세요'
	                }
	              ]
	            },
	            password: {
	              identifier  : 'password',
	              rules: [
	                {
	                  type   : 'empty',
	                  prompt : '비밀번호를 입력하세요'
	                },
	                {
	                  type   : 'minLength[4]',
	                  prompt : '비밀번호는 최소 4자입니다.'
	                }
	              ]
	            }
	          },
	          
	          inline: true
	        
	        
	          
	        })
	      ;
	      
	      
	      $('.ui.negative.message')
	       .transition('jiggle')
	      ;
	      
	      $('.message .close')
	       .on('click', function() {
	         $(this)
	           .closest('.message')
	           .transition('fade')
	         ;
	       })
	      ;

	    
		
		
		
	});
})(jQuery);








