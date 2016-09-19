(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var noResults = getMetaContent('noResults'),
		    token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header');
		
		
      
		$('.ui.dropdown').dropdown();
		
//		$form = $('.ui.form');

		/* modal 관련 */
		$('#search-modal').modal('attach events', '.show.search.modal');
		
		/* form 관련 */
		
		$form = $('.ui.form').not($('.ui.write.form')).not($('#message-send-form'));
		
		$form.form({
			
			inline: true,
			on: blur,
			
			fields: {
				searchQuery: {
					identifier  : 'searchQuery',
	                rules: [
	                  {
	                    type   : 'empty',
	                    prompt : '검색어를  입력하세요.'
	                  }
	                ]
		         }
		    }
		});
		
		
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
			xhr.setRequestHeader('X-AJAX-CALL', true);
			
		});
		
		/* 댓글 개수 가져오기 */
		function getCommentCount(articleNoList) {
			var result;
			
			$.ajax({
				async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
				type: "POST",
				url: $.trashbox.baseUrl + '/comment/getTotalCountByArticle',
				data: {articleNoList : articleNoList}
			
			}).done(function(data) {
//	   	  			  console.log(data);
				result = data.commentCount;
				
			});
			
			return result;
			
		}
		
		/* 유저 기본정보 가져오기*/
		function getUsersDefaultInfo(userNoList) {
			var result;
			$.ajax({
				async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
				type: "POST",
				url: $.trashbox.baseUrl + "/getUserDefaultInfo",
				data: {userNoList : userNoList},
				
				beforeSend: function (xhr){ 
					xhr.setRequestHeader(header, token);
				}
				
			}).done(function(data) {
//	  			  console.log(data);
				result = data.defaultInfoMap;
			});
			
			return result;
		}    		
		
		if(!noResults) {
			
			setTimeout(function() {
				var articleNoList = [];
				
				$('span.comment.num').each(function() {
					var no = $(this).attr('data-no');
					articleNoList.push(no);
					
				});
				
				var commentCountInfo = getCommentCount(articleNoList);
	            
				console.log(commentCountInfo);
				
				$('span.comment.num').each(function(i){
					var no = $(this).attr('data-no');
					
					if(typeof commentCountInfo[no] !== "undefined") {
						$(this).children().text('[' + commentCountInfo[no] + ']');
						
					} 
					
				});
				
			}, 1000);
			
		}
		
		if(!noResults) {
			
			setTimeout(function(){
				var userNoList = [];
		   		 
	            $('a.author').each(function() {
	           	 var no = $(this).attr('data-no');
	           	 
	           	 if($.inArray(no, userNoList) == -1) {
	           		 userNoList.push(no);
	           	 } 
	           	 
	           	
//	            	 console.log(this);
	           	
	            });
	            
//	             console.log(userNoList);
	           
	            var defaultInfoMap = getUsersDefaultInfo(userNoList);
	            
	            console.log(defaultInfoMap);
	           
	           $('table .avatar.image').each(function() {
	        	   var userNo = $(this).next().attr('data-no');
	        	   $(this).attr('src', $.trashbox.baseUrl + '/resources/photo_upload_profile/' + defaultInfoMap[userNo].profileImage);
	        	   
	           });
				
				
			}, 1000);
			
		}
		
		
		$('.pagination a.button')
		 .on('click', function () {
			 $(this)
			    .addClass('active')
			    .siblings()
			    .removeClass('active');
		 });
		   
		
		 
		
	});

	
	
})(jQuery);








