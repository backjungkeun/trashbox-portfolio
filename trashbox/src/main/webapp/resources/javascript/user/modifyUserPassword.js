(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header');
      
	    $.fn.api.settings.api = {
	    		'change password' : $.trashbox.baseUrl + '/changePassword'
	    };
		
		// form settings
	    $passwordChangeForm = $('#password-change-form');
	    
		$form = $('.ui.form').not($passwordChangeForm);
		
		$passwordChangeForm.form({
			
			inline: true,
			on: blur,
			
			fields: {
		               
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
		          }
		          
			}
		});
		
		$form.form({
			
			inline: true,
			on: blur,
			
			fields: {
	    		      
	            password: {
	                identifier  : 'password',
	                rules: [
	                  {
	                    type   : 'empty',
	                    prompt : '비어있습니다.'
	                  }
	                ]
	              }
	              
	          }
		});
		
		$passwordChangeForm.api({
	          action: 'change password',  
	          method: 'POST',
	          serializeForm: true,
	          data: {},
	          stateContext: $('.ui.modify.user.password.alternate.stripe.segment'),
	          
	         
	          beforeXHR: function(xhr) {
	          	xhr.setRequestHeader (header, token);
	          },
	          
	          beforeSend: function(settings) {
	             var isValid = $passwordChangeForm.form('is valid');
	         
	             
	             if(!isValid) {
	          	   return false;
	             }
	            
	             return settings; 
	          },
	          
	          onSuccess: function (response) {   
	          
	          	if(response == 1) {
	          		
	          		$('.ui.small.check.test.modal')
	          		.modal({ closable  : false})
	          		.modal('show');   
	          		
	          		
	          		$passwordChangeForm.form('clear');
	          		
	              	 swal({
	                     title: "비밀번호 변경",
	                     text: "비밀번호가 성공적으로 변경되었습니다.",
	                     type: "success",           
	                     confirmButtonText: "확인",
	                     confirmButtonColor: "#21BA45"
	                 }, function() {
	                	 location.replace($.trashbox.baseUrl + '/userInfo');
	                 });
	          		
	  			
	          	} else {
	             	
	          		swal({
	                     title: "비밀번호 변경",
	                     text: "비밀번호 변경이 실패하였습니다.",
	                     type: "error",           
	                     confirmButtonText: "확인",
	                     confirmButtonColor: "#21BA45"
	                 }, function() {
	                	 location.reload();
	                 });
	          		
	          	}
	   
	          }
	          
		});

		
		      
	      
	      // 메시지 트렌지션 체크
	      $('.ui.negative.message')
	      .transition('pulse')
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








