(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header'),
            errorUser = getMetaContent('errorUser'),
            email = getMetaContent('email');
      
	    $.fn.api.settings.api = {
	    		'send mail' : $.trashbox.baseUrl + '/sendAuthMail'
	    };
		
		// form settings
	    $form = $('.ui.form');
	    
	    
	    var flagOne = false;
	    
	    $('#resendMailButton').api({
	        action: 'send mail',  
	        method: 'POST',
	        stateContext: $('.resend.auth.mail.segment') ,
	        data: {  
	        	id: errorUser,
			    email: email
			},
			
			beforeSend: function(settings) {
				
				if(errorUser == null || email == null) {
					return false;	
				}
			
				if(!flagOne) {
					
					$('.ui.email.final.check.modal')
					.modal({
						closable  : false,
						onApprove : function() {
							flagOne = true;
							$('#resendMailButton').click();
						}
					})
					.modal('show');	
					
				}
				
				if(!flagOne) {
					return flagOne;	
				}

				
				return settings;			
			},
	        
	        beforeXHR: function(xhr) {
	        	xhr.setRequestHeader (header, token);
	        },
	        
	        onSuccess: function (response) {   
	        
	        	if(response) {
//	         		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
//	             	$('.actions > a').attr("href", "<c:url value='/login'/>");
	            	
//	             	$('.ui.small.basic.modal')
//	         		.modal({ closable  : false})
//	         		.modal('show');   
	   
	        		swal({
	          			title: "E-mail",
	          			text: "이메일 보내기가 성공하였습니다.",
	          			type: "success",
	          			confirmButtonText: "확인",
	          			confirmButtonColor: "#21BA45"	
	          		}, function() {
	          			location.replace($.trashbox.baseUrl + '/login');	
	          		});

	        	
	        	} else {
//	         		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
	// //             	$('.actions > a').attr("href", "<c:url value='/login'/>");
	            	
//	             	$('.ui.small.basic.modal')
//	         		.modal({ closable  : false})
//	         		.modal('show');   

	        		swal({
	          			title: "E-mail",
	          			text: "이메일 보내기가 실패하였습니다. 로그인부터 다시 시도해주세요.",
	          			type: "error",
	          			confirmButtonText: "확인",
	          			confirmButtonColor: "#21BA45"	
	          		}, function() {
	         			location.replace($.trashbox.baseUrl + '/login');
	          		});
	        		
	        	}
	 
	        }
	        
	    });
	    
	    var flagTwo = false;
	      
	      $form.api({
	          action: 'send mail',  
	          method: 'POST',
	          serializeForm: true,
	          stateContext: $('.resend.auth.mail.segment') ,
	          data: {  
	          	id: errorUser
	  		  },
	  		  
	  		  beforeSend: function(settings) {
	            var isValid = $form.form('is valid');
	            
	            console.log(settings.data.email);
	            
				if(errorUser == null) {
				   return false;	
				}
	        
	            if(!isValid) {
	         	   return false;
	            }
	            
				if(!flagTwo) {				
					$('.email.final.check.modal .content > p > em').text(settings.data.email);
					
					$('.ui.email.final.check.modal')
					.modal({
						closable  : false,
						onApprove : function() {
							flagTwo = true;
							$form.submit();
						}
					})
					.modal('show');	
					
				}
				
				if(!flagTwo) {
					return flagTwo;	
				}
	            
	           
	            return settings; 
	          },
	          
	          beforeXHR: function(xhr) {
	          	xhr.setRequestHeader (header, token);
	          },
	          
	          onSuccess: function (response) {   
	          
	          	if(response) {
//	           		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
//	               	$('.actions > a').attr("href", "<c:url value='/login'/>");
	              	
//	               	$('.ui.small.basic.modal')
//	           		.modal({ closable  : false})
//	           		.modal('show');  

	        		swal({
	          			title: "E-mail",
	          			text: "이메일 보내기가 성공하였습니다.",
	          			type: "success",
	          			confirmButtonText: "확인",
	          			confirmButtonColor: "#21BA45"	
	          		}, function() {
	          			location.replace($.trashbox.baseUrl + '/login');	
	          		});
	          	
	          	} else {
//	           		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
	// //               	$('.actions > a').attr("href", "<c:url value='/login'/>");
	              	
//	               	$('.ui.small.basic.modal')
//	           		.modal({ closable  : false})
//	           		.modal('show');   

	        		swal({
	          			title: "E-mail",
	          			text: "이메일 보내기가 실패하였습니다. 로그인부터 다시 시도해주세요.",
	          			type: "error",
	          			confirmButtonText: "확인",
	          			confirmButtonColor: "#21BA45"	
	          		}, function() {
	         			location.replace($.trashbox.baseUrl + '/login');
	          		});
	          		
	          	}
	   
	          }
	          
	      });
	      
	      
	      var $emailFlag = false;
	      
	      $('#email').on('blur', function() {
	      	var value = $(this).val();	
	      	var emailRegExp = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
	      	
	      	if(value != '' && emailRegExp.test(value)) {
	      		
	      		$.ajax({
	      			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
	      			  type: "GET",
	      			  url: $.trashbox.baseUrl + '/checkDuplicateEmail',
	      			  data: { email: value }
	      			  
	      		  }).done(function(data) {

	      		      if(data === 0) {
	      		    	  $emailFlag = true;
	      		    	  
	      		      } else {
	      		    	  $emailFlag = false;
	      		      }
	      			
	      		  });
	      		 console.log('$emailFlag :: ' + $emailFlag);
	      		 
	      	}
	      	
	      });


	      $.fn.form.settings.rules.checkDuplicateEmail = function(value) {
	      	return $emailFlag; 	
	      }
	      
	      $form.form({
	    	  
	    	  inline: true,
	    	  on: blur,
	    	  
	    	 
	    	  fields: {
	                
	            email: {
	                identifier  : 'email',
	                rules: [
	                  {
	                    type   : 'empty',
	                    prompt : '이메일을  입력하세요.'
	                  },
	                  
	                  {
	                    type   : 'email',
	                    prompt : '이메일 형식이 올바르지 않습니다.'
	                  },             
	                  {
	                    type : 'checkDuplicateEmail',
	                    prompt : '이미 사용중인 이메일입니다.'
	                  }
	                ]
	              },
	            confirmEmail: {
	                identifier  : 'confirm-email',
	                rules: [  
	                  {
	                    type   : 'match[email]',
	                    prompt : '이메일이 일치하지 않습니다.'
	                  }
	                ]
	              }
	              
	          }
	      });
	
	    
		
	});

	
	
})(jQuery);








