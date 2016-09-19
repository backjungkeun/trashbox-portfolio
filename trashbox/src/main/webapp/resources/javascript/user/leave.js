(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header');
      
		// form settings
		$leaveForm = $('#leave-form');
	    $form = $('.ui.form').not($leaveForm);
	    
	
	    $leaveForm.form({
	    	inline: true,
	    	on: blur,
	    	
	        fields: {
	        	terms: {
	        		identifier  : 'terms',
	        		rules: [
	                    {
	                      type   : 'checked',
	                      prompt : '동의 하여야합니다.'
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
	    
	    
	    var leaveFlag = false;
	      
	      $leaveForm.api({
	        action: 'user leave',  
	        method: 'GET',

	       // stateContext: $('#nickname-update-button'),
	        
	       
	        beforeXHR: function(xhr) {
	        	xhr.setRequestHeader (header, token);
	        },
	        
	        beforeSend: function(settings) {
	           var isValid = $leaveForm.form('is valid');
	       
	           
	           if(!isValid) {
	        	   return false;
	           }
	           
	           if(isValid && !leaveFlag) {
	        	   
	        	   $('.ui.leave.final.check.modal')
	            	  .modal({ 
	            		  closable  : false ,
	            		
	            		  onApprove : function() {
	            			
	            			  leaveFlag = true;
	            			  $leaveForm.submit();
	            	      }
	            		  
	            	  })
	            	  .modal('show');
	        	   
	           }
	           
	           if(!leaveFlag) {
	        	   return leaveFlag;
	           }
	          
	           return settings; 
	        },
	        
	        onSuccess: function (response) {   
	        
	        	if(response == 1) {
	        		
	        		swal({
	                     title: "탈퇴",
	                     text: "성공적으로 탈퇴 되었습니다.",
	                     type: "success",           
	                     confirmButtonText: "확인",
	                     confirmButtonColor: "#21BA45"
	                 }, function() {
	                	 location.replace($.trashbox.baseUrl + '/main');
	                 });
	        		 
				
	        	} else {
	        		
	        		swal({
	        	          title: "탈퇴",
	        	          text: "실패하였습니다. 다시 시도해주세요.",
	        	          type: "error",           
	        	          confirmButtonText: "확인",
	        	          confirmButtonColor: "#21BA45"
	        	      }, function() {
	        	     	 location.reload();
	        	      });
	        		
	        	}
	 
	        }
	        
	        
	      });

	    
		
		
		
	});

	
	
})(jQuery);








