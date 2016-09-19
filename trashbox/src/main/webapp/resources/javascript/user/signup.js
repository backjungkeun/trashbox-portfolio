(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header');
      
		
		$.fn.api.settings.api = {
	    		  'create user' : $.trashbox.baseUrl + '/registerUserAccount', 
	    };
		
		// form settings
	    $form = $('.ui.form')
		
	    $form.api({
	        action: 'create user',  
	        method: 'POST',
	        stateContext: $('.signup.segment'),
	        serializeForm: true,
	        data: {},
	        
	        beforeXHR: function(xhr) {
	        	xhr.setRequestHeader (header, token);
	        },
	        
	        beforeSend: function(settings) {
	           var isValid = $form.form('is valid');
	           
	           if(!isValid) {
	        	   return false;
	           }
	          
	           return settings; 
	        },
	        
	        onSuccess: function (response) {   
	        
	        	if(response) {
	        		$('.ui.basic.signup.success.modal')
	        		.modal({ closable  : false})
	        		.modal('show');   
	        	}
	 
	        }  
	    });
	    
	    // ID CHECK
	    var $idFlag = false;
	    
	    $('#id').on('blur', function() {
	    	var value = $(this).val();
	    	var idRegExp = /^[a-z0-9]{5,20}$/;
	    	
	    	if(value != '' && idRegExp.test(value)) {
	    		
	    			$.ajax({
	    	  			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
	    	  			  type: "GET",
	    	  			  url: $.trashbox.baseUrl + '/checkDuplicateId',
	    	  			  data: { id: value }
	    	  			  
	    	  		  }).done(function(data) {
	    	  			  
	    	  		      if(data === 0) {
	    	  		    	  $idFlag = true;
	    	  		    	  
	    	  		      } else {
	    	  		    	  $idFlag = false;
	    	  		      }
	    	  			
	    	  		  });
	    	  		
	    	 		 console.log('$idFlag :: ' + $idFlag);			 
	    	}
	    	
	    });
	    
	    $.fn.form.settings.rules.checkDuplicateId = function(value) {
	    	  return $idFlag;	  
	    }
	    
	    
	    // NICKNAME CHECK
	    var $nicknameFlag = false;
	    
	    $('#nickname').on('blur', function() {
	    	var value = $(this).val();
	    	var nicknameRegExp = /^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]{2,10}$/gi;
	    	
	    	if(value != '' && nicknameRegExp.test(value)) {
	    		
	    		$.ajax({
	    			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
	    			  type: "GET",
	    			  url: $.trashbox.baseUrl + '/checkDuplicateNickname',
	    			  data: { nickname: value }
	    			  
	    		  }).done(function(data) {

	    		      if(data === 0) {
	    		    	  $nicknameFlag = true;
	    		    	  
	    		      } else {
	    		    	  $nicknameFlag = false;
	    		      }
	    			
	    		  });

	    		 console.log('$nicknameFlag :: ' + $nicknameFlag);
	    	}
	    	
	    });


	    $.fn.form.settings.rules.checkDuplicateNickname = function(value) {
	    	return $nicknameFlag; 	
	    }
	    
	    
	    // EMAIL CHECK
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
	              id: {
	                identifier  : 'id',
	                rules: [
	                  {
	                    type   : 'empty',
	                    prompt : '사용할 아이디를  입력하세요.'
	                  },  
	                  {
	                    type   : 'regExp[/^[a-z0-9]{5,20}$/]',
	                    prompt : "5~20자의 영문 소문자, 숫자만 사용 가능합니다."
	                  },
	                  {
	                	type   : 'checkDuplicateId',
	                	prompt : "중복된 아이디입니다."
	                  }
	                ]
	              },  
	            nickname: {
	                  identifier  : 'nickname',
	                  rules: [
	                    {
	                      type   : 'empty',
	                      prompt : '사용할 닉네임를  입력하세요.'
	                    },  
	                    {
	                      type   : 'regExp[/^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]{2,10}$/gi]',
	                      prompt : '닉네임은 공백, 특수문자 제외  2-10자 이내로 입력하세요.'
	                    },
	                    {
	                       type : 'checkDuplicateNickname',
	                       prompt : '이미 사용중인 닉네임입니다.'
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
	              },
	            confirmPassword: {
	                identifier  : 'confirm-password',
	                rules: [
	                  {
	                    type   : 'match[password]',
	                    prompt : '비밀번호가 일치하지 않습니다.'
	                  }
	                ]
	              },
	              
	            terms: {
	                  identifier: 'terms',
	                  rules: [
	                    {
	                      type   : 'checked',
	                      prompt : '이용약관에 동의하셔야합니다.'
	                    }
	                  ]
	                }
	              
	          }
	    });
	    
	    $('#terms-info').on('click', function() {
	    	$('.ui.small.terms.modal').modal('show');		
	    });
	    
	    
	    
		
		
	});
})(jQuery);








