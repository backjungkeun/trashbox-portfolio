(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var 
		    token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header');
      
    	
    	
    	$('.show-user-info').api({
	    	  action: 'get userDefaultInfo',  
	          method: 'POST',
	          serializeForm: true,
	          data: {  
// 	        	receiverNickname : clickUserNickname
// 	          	receiverNo : receiverNo
	          },
	          
	          beforeSend: function(settings) {
	        	var no = $(this).attr('data-no');
	        	  console.log(settings);
	        	  console.log(no);
	        	  
	        	  if(no == '') {
	        		  return false;
	        	  }
	        	  
	        	  var userNoList = [];
	        	  userNoList.push(no);
	        	  
	        	  settings.data.userNoList = userNoList;
	        		  
	  			return settings;
	          },
	          
	          beforeXHR: function(xhr) {
	          	xhr.setRequestHeader (header, token);
	          },
	      
	          onSuccess: function (response, element, xhr) {

	        	  var resultModal = $('#show-user-info-modal');
	        	      user = response.defaultInfoMap[element.attr('data-no')];
	        	  
	        	  resultModal.find('img').attr('src', '/resources/photo_upload_profile/' + user.profileImage);  
	        	 
                          if(!user.enabled){
                          resultModal.children('.header').append('<h5 class="ui red header">탈퇴한 회원입니다.</h5>');
                          } else {
                          $('#show-user-info-modal').children('.header').find('.red').remove();
                          }
                          
                          resultModal.find('.description .nickname.item .description').text(user.nickname);
                          resultModal.find('.description .registrationDate.item .description').text($.format.date(user.registrationDate, 'yyyy-MM-dd'));
	        	          resultModal.find('.description .lastLoginDate.item .description').text($.format.date(user.lastLoginDate, 'yyyy-MM-dd'));
	        	  
	        	  
	        	  
//	        	  var list = $('<div class="ui relaxed divided list"/>'),
//	        	      item = $('<div class="item"/>'),
//	        	      icon = $('<i class="chevron right middle aligned icon"></i>'),
//	        	      content = $('<div class="content"/>'),
//	        	      header = $('<h3 class="header"></h3>'),
//	        	      description = $('<div class="description"/>');
	        	  
	        	  
	        	      
	        	 
	        	  
	        	  $('#show-user-info-modal').modal('show');
	        	  
	        	  console.log(element);
	        	  console.log(response.defaultInfoMap[element.attr('data-no')]);
	        	  
//	        	  /* 0=실패   1=성공*/
//	        	  
//	        	  switch(response) {
//	        	  
//	        	  case 0 : 
//	        		  
//	        		  swal({
//	        			  title: "쪽지",
//	        			  text: "쪽지 발송에 실패하였습니다.",
//	        			  type: "error",           
//	        			  confirmButtonText: "확인",
//	        			  confirmButtonColor: "#21BA45"             		 
//	        		  }, function() {
//	        			  location.reload();
//	        		  });
//	        		  
//	        		  break;
//				   
//				   case 1 :
//					   
//					   swal({
//		    			   title: "쪽지",
//		    			   text: "쪽지가 성공적으로 발송되었습니다.",
//		    			   type: "success",
//		    			   confirmButtonText: "확인",
//		    			   confirmButtonColor: "#21BA45"
//		     
//		    		   });   		   
//
//					   break;
//				    	  
//	        	  }
	        
	          },
	          
	          onFailure: function(response, element) {
	          	
	          },
	          
	          onError:  function(errorMessage, element, xhr) {
	          	
	          }
	          
	    	  
	      });
    	
    	
	      $('.find-write-articles').on('click', function() {
	    	  var nick = $(this).attr('data-nick');
	    	  
	    	  $('#searchForm :input[name="searchTarget"]').val('nickname');
	    	  $('#searchForm :input[name="searchQuery"]').val(nick);
	    	  $('#searchForm').submit();
	      });

		
		
	});

	
	
})(jQuery);








