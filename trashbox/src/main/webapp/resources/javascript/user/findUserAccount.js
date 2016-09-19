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
	    		  'find id by email' : $.trashbox.baseUrl + '/findIdByEmail',
	    		  'reset password' : $.trashbox.baseUrl + '/sendResetPasswordMail'
//	     		  'check user' : '<c:url value="/checkUserByIdAndEmail"/>'
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
				
//	 			if('${errorUser}' == '') {
//	 				return false;	
//	 			}
			
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
	    
	    $('#find-id-form .button').api({
	    	action: 'find id by email', 
	    	method: 'POST',
	    	serializeForm: true,
	    	stateContext: $('.find.user.account.segment'),
	    	loadingDuration: 2000,

//	         data: {  
//	         	email: '${errorUser}'
//	         },
	        
	        beforeSend: function(settings) {
	        	var isValid = $('#find-id-form').form('is valid');
	        	console.log(settings.data.email);	
	        	
	        	console.log(settings.stateContext);
	        	

	        	if(!isValid) {
	        		return false;
	        	}
	        	
	        	return settings; 	
	        },
	        
	        beforeXHR: function(xhr) {
	        	xhr.setRequestHeader (header, token);
	        },
	        
	        onSuccess: function (response) { 
	        	console.log(response)
	        	
	        	if(response.result) {
	        		
	        		swal({
	        			title: "아이디 찾기",
	        			text: response.id,
	        			type: "success",
	        			confirmButtonText: "확인",
	        			confirmButtonColor: "#21BA45"	
	        				
	        		}, function() {
	        			location.replace($.trashbox.baseUrl + '/login');
	        			
	        		});
	        		
	        	} else {
	        		
	        		swal({
	        			title: "아이디 찾기",
	        			text: "해당 되는 메일로 가입된 계정이 없습니다.",
	        			type: "error",
	        			confirmButtonText: "확인",
	        			confirmButtonColor: "#21BA45"		
	        		});
	        		
	        	}
	        	
	        }
	        
	    });
	    
	    function checkUserByIdAndEmail(id, email) {
	    	var result = false;
	    	
	    	$.ajax({
				  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
				  type: "POST",
				  url: $.trashbox.baseUrl + '/checkUserByIdAndEmail',
				  data: {
					  id : id,
					  email : email
			      },
				  beforeSend: function (xhr){ 
					  xhr.setRequestHeader(header, token);
		  		  }
			      
	    	}).done(function(data) {
	    		result = data.result;
	    		
	    	});
	    	
	    	return result;
	    }
	    
	    var $lastCheckPasswordRest = false;
	    
	    $('#reset-password-form .button').api({
	    	action: 'reset password', 
	    	method: 'POST',
	    	serializeForm: true,
	    	stateContext: $('.find.user.account.segment'),
//	     	loadingDuration: 2000,

//	         data: {  
//	         	email: '${errorUser}'
//	         },
	        
	        beforeSend: function(settings) {
	        	var isValid = $('#reset-password-form').form('is valid');
	    	
	        	if(!isValid) {
	        		return false;
	        	}
	        	
	        	var id = settings.data.id;
	            var email = settings.data.email;
	        	
	            var checkFlag = checkUserByIdAndEmail(id, email);
	            
	            if(checkFlag) {
	            	console.log('checkFlag :: ' + checkFlag);
	            	
	        		swal({
	        			title: "비밀번호 찾기",
	        			text: '비밀번호 재설정 확인 이메일을 보내겠습니까?',
	        			type: "warning",
	        			showCancelButton: true,
	        			confirmButtonText: "확인",
	        			confirmButtonColor: "#21BA45",
	        			showLoaderOnConfirm: true,
	        			cancelButtonText: "취소"
//	                  closeOnConfirm: false,
//	                  closeOnCancel: false
	              
	        		}, function(isConfirm) {
	        			
	        			if(isConfirm) {
	        				$lastCheckPasswordRest = true;
	                        $('#reset-password-form .button').click();
//	                        location.replace("<c:url value='/login'/>");
	                       
	        			} else {
	        				$lastCheckPasswordRest = false;
	        			}
	        			
	        			
	        		});
	            	
	            	
//	             	return false;
	            
	            } else {
	            	console.log('checkFlag :: ' + checkFlag);
	            	
	            	swal({
	        			title: "비밀번호 찾기",
	        			text: "일치하는 계정이 없습니다.",
	        			type: "error",
	        			confirmButtonText: "확인",
	        			confirmButtonColor: "#21BA45"	
	        			
	        		});
	            	
	            	return false;
	            }
	            
	            if(!$lastCheckPasswordRest) {
	            	return false;
	            }
	            	
//	         	if(!checkFlag) {
//	         		return false;
//	         	} 
	        	
//	         	return settings; 
	        
	        	
	        },
	        
	        beforeXHR: function(xhr) {
	        	xhr.setRequestHeader (header, token);
	        },
	        
	        onSuccess: function (response) {   
	        	console.log(response)
	        	
	        	$lastCheckPasswordRest = false;
	        	
	        	if(response.result) {
	        		
	        		swal({
	        			title: "비밀번호 재설정",
	        			text: '비밀번호 재설정 이메일을 발송하였습니다.',
	        			type: "success",
	        			confirmButtonText: "확인",
	        			confirmButtonColor: "#21BA45"
//	         			showLoaderOnConfirm: true,
//	         			cancelButtonText: "취소"
//	                  closeOnConfirm: false,
//	                  closeOnCancel: false
	              
	        		}, function() {

	                   location.replace($.trashbox.baseUrl + '/login');
	                   
	        		});
	    
	        	} else {
	        		
	        		swal({
	        			title: "비밀번호 찾기",
	        			text: "일치하는 계정이 없습니다.",
	        			type: "error",
	        			confirmButtonText: "확인",
	        			confirmButtonColor: "#21BA45"	
	        			
	        		});
	     		
	     	}

	     }

	 
	   });
	    
	    
	    
	    $form.form({
	  	  
	  	  inline: true,
	   	  on: blur,

	  	 
	  	  fields: {
	          
	  		  id: {
	              identifier  : 'id',
	              rules: [
	                {
	                  type   : 'empty',
	                  prompt : '아이디를  입력하세요.'
	                },  
	                {
	                  type   : 'regExp[/^[a-z0-9]{5,20}$/]',
	                  prompt : "5~20자의 영문 소문자, 숫자만 사용 가능합니다."
	                }
	              ]
	            },
	            
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
	                  }        
//	                   {
//	                     type : 'checkDuplicateEmail',
//	                     prompt : '해당 되는 메일로 가입된 계정이 없습니다.'
//	                   }
	                ]
	              }
	          
	            
	        }
	    });
	
	    
		
	});

	
	
})(jQuery);








