(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var boardTypeName = getMetaContent('boardTypeName'),
		    articleNo = getMetaContent('articleNo'),
		    articleAuthorNo = getMetaContent('articleAuthorNo'),
		    token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header'),
            currentUserNo = checkCurrentUser();
      
//		$(document).ajaxSend(function(e, xhr, options) {
//			xhr.setRequestHeader(header, token);
//			xhr.setRequestHeader('X-AJAX-CALL', true);
//			
//		});
		
//		$form = $('.ui.form');
		
		$.fn.api.settings.api = {
				  'add comment'            : $.trashbox.baseUrl + '/comment/add',
				  'remove comment'         : $.trashbox.baseUrl + '/comment/remove',
				  'list comment'           : $.trashbox.baseUrl + '/comment/list',
				  'update recommend count' : $.trashbox.baseUrl + '/board/ajax/updateRecommendCount'
	    };
		

		/* reply form */
		$('#reply').form({
			inline: true,
			on: blur,
			
			fields: {
				content: {
					identifier  : 'content',
					rules: [
					        { 
					          type   : 'empty',
					          prompt : '비었습니다.' 
					        },
					        {
					        	type   : 'maxLength[200]',
					        	prompt : '최대 200.'
					        }
					       ]
		                 }    
		            }
		});
		
		
		$('.combo.dropdown')
        .dropdown({
          action: 'combo',
          onChange: function(value) {
        	  if(value != '') {
            	  $('#post_option_button').attr('data-action', value);
              } 
          }
        });
		
		$('#post_option_button').on('click', function() { 
    		postOptionUrlSupporter();
    	});
		
		
		function postOptionUrlSupporter() {
			var value = $('#post_option_button').attr('data-action');
			
			if(!(value == null) && !(value == undefined)) { //boardTypeName + '/' +
				var postOptionUrl = $.trashbox.baseUrl + '/board/' +  value + '/' + articleNo ;
			
				$('.ui.article.option.form').attr('action', postOptionUrl);
				$('.ui.article.option.form').submit();
			}	
		}
		
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
		
        function checkCurrentUser() {
        	var result;
        	$.ajax({
        		  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
	  			  type: "POST",
	  			  url: $.trashbox.baseUrl + "/checkUser",
	  			  data: {},

	  			  beforeSend: function (xhr){ 
	  				xhr.setRequestHeader(header, token);
	  			  }
        		
        	}).done(function(data) {
        		result = data.user;
        	});
        	
        	return result;
        }
		
		function createComments(comments) {
		
			 var userNoList = [];

             $(comments).each(function() {
            	 userNoList.push(this.userNo);
             });
             
            if(userNoList.length > 0) {
            	
            	var defaultInfoMap = getUsersDefaultInfo(userNoList);
 
             
             console.log(defaultInfoMap);
//             $(comments).each(function(i){
//             	this.nickname = defaultInfoList[i];
//             });
			
			//받아온 정보만큼 comment 화면 구성
			$(comments).each(function() {
				var comment = $('<div class="comment"></div>'),
				    avatar = $('<a class="avatar"></a>'),
				    img = $('<img>'),
				    content = $('<div class="content"></div>'),
				    author = $('<a class="author"></a>'),
				    metadata = $('<div class="metadata"></div>'),
				    date = $('<span class="date"></span>'),
				    text = $('<div class="text"></div>');
				
				var leafIcon = $('<i class="green leaf icon"></i>');
				
				
				
				var actions = $('<div class="actions"></div>'),
//				    reply = $('<a class="reply">Reply</a>'),
//				    edit = $('<a class="edit">Edit</a>'),
				    remove = $('<a class="remove">Remove</a>');

				
				author.attr('data-no', this.userNo);
				// 유저 닉네임 클릭 시에 모달 관련 이벤트
		    	author.on('click', function(){
		    		var no = $(this).attr('data-no'),
		    		    nickname = $(this).text();
		    		
		    		$('#user-click-modal .header').text(nickname);
		    		
		    		$('#user-click-modal .content .list .item').each(function() {
		    			$(this).attr({
		    				'data-no': no,
		    				'data-nick': nickname
		    			});
		    	        
		    		});
		    		
		    		$('#user-click-modal').modal('show');
		    		
//		    		$('#user-click-modal').attr('data-no', no);
		    		
		    	});
				   
				
				
				    img.attr('src', '/trashbox/resources/photo_upload_profile/' + defaultInfoMap[this.userNo].profileImage); // 확인
				   
				    author.text(defaultInfoMap[this.userNo].nickname);
				   
				    if(this.userNo == articleAuthorNo) {
				    	author.prepend(leafIcon);
				    	
				    }
				    
				   
				    
				    remove.attr('data-no', this.no);
				    date.text($.format.prettyDate(this.registrationDate));
				    text.text(this.content);
		
				   // $.format.prettyDate()
				    
				    if(currentUserNo == this.userNo) {
//				    	actions.append(reply, edit, remove);
				    	actions.append(remove);
				    } else if (currentUserNo > 0) {
//				    	actions.append(reply);
				    	
				    }
				   
				    
				    // build
				    metadata.append(date);
				    
				    content.append(author, metadata, text, actions);
				    
				    avatar.append(img);
				    comment.append(avatar, content);
				    
				    $('.ui.minimal.comments .comments').append(comment);
				    
			});
			
			$('a.remove').each(function() {
			    $(this).on('click', function() {
			    	
//			    	
			    	$('.ui.comment.check.modal .positive.button').attr('data-no', $(this).attr('data-no'));
			    	$('.ui.comment.check.modal')
			    	.modal({ 
            		  closable  : false ,
            		
            		  onApprove : function() {
            			 
            	      }
            		  
            	  })
			    	.modal('show');
			    }); 
			});
			
            }
		}

		
		function createCommentsPagination(element, paginationInfo) {
			
			$('.minimal.comments .header > span').text(paginationInfo.totalNum); // comment 총 개수
			
			$commentPagination = element;
			
			$commentPagination.each(function() {
				  $(this).empty();
				  
				  /* 현재 페이지 번호가 1이 아니고 , 현재 페이지 번호가 총 페이지 번호보다 작거나 같다면 prev버튼을 보여줌*/
				  if(paginationInfo.currentPage != 1 
						  && paginationInfo.currentPage <= paginationInfo.totalPageNum) {
					 
					  var prevButton = $('<div class="ui compact icon basic button"></div>'),
					      prevButtonIcon = $('<i class="left chevron icon"></i>');
					  
					  prevButton.append(prevButtonIcon);
					  prevButton.append(' Prev');
					  prevButton.attr('data-page', paginationInfo.currentPage -1);
					  
					  $commentPagination.append(prevButton);
				  }
				  
				  /* 첫번째 페이지로 가는 버튼 */
			      if(paginationInfo.start != 1 && paginationInfo.start > 3) {
			    	 
			    	  var firstPageButton = $('<div class="ui compact icon basic button" title="처음으로"></div>');
			    	 
			    	  firstPageButton.append('<b>1</b>');
			    	  firstPageButton.attr('data-page', 1);
			    	  $commentPagination.append(firstPageButton);
			    	  
			    	  if(paginationInfo.start > 6) {
//			    		  var pageWarpButton = $('<div class="ui compact icon basic first button disabled">..</div>');
			    		  
			    		  /* 워프 기능 */
					      var warpButton = $('<div class="ui bottom left pointing dropdown compact icon basic button"></div>'),
					          warpInput = $('<input type="hidden" name="filters">'),
					          warpSpan = $('<span class="text">..</span>'),
					          warpMenu = $('<div class="menu"></div>'),
					          warpHeader = $('<div class="header"><i class="rocket icon"></i>Warp</div>'),
					          warpScrollingMenu = $('<div class="scrolling menu"></div>');
			    		  
			    		  for(var i=2; i< paginationInfo.start; i++) {
			    			  var warpItem = $('<div class="item">' + i + '</div>');  
			    			  warpItem.attr('data-page', i);
			    			  warpScrollingMenu.append(warpItem);
			    		  }
			    		  
			    		 
					      warpMenu.append(warpHeader, warpScrollingMenu);
					      warpButton.append(warpInput, warpSpan, warpMenu);
					      
			    		  $commentPagination.append(warpButton);	
			    		  $(warpButton).dropdown();
			    		  
			    		  
			    	  }
			    	  
			      }
				  
				  /* 현재보고 있는 페이지 버튼은 다르게*/
					  for(var i=paginationInfo.start; i< paginationInfo.end+1; i++) {
						  var currentButton = $('<div class="ui compact icon basic button active" style="cursor: default;"></div>'),
						      numberButton = $('<div class="ui compact icon basic button"></div>');
						  
						  if(paginationInfo.currentPage == i) {
							  currentButton.append('<b>' + i + '</b>');
							  $commentPagination.append(currentButton);
						  
						  } else {
							  numberButton.attr('data-page', i);
							  numberButton.append(i);
							  $commentPagination.append(numberButton); 
						  }
						
					  }
				  
			      /* 마지막 페이지로 가는 버튼 */
			      if(paginationInfo.end != paginationInfo.totalPageNum) {
			    	 
			    	  if(paginationInfo.currentPage < paginationInfo.totalPageNum -5) {
//			    		  var pageWarpButton = $('<div class="ui compact icon basic last button disabled">..</div>');
//			    		  $commentPagination.append(pageWarpButton);
			    		  
			    		  /* 워프 기능 */
					      var warpButton = $('<div class="ui bottom left pointing dropdown compact icon basic button"></div>'),
					          warpInput = $('<input type="hidden" name="filters">'),
					          warpSpan = $('<span class="text">..</span>'),
					          warpMenu = $('<div class="menu"></div>'),
					          warpHeader = $('<div class="header"><i class="rocket icon"></i>Warp</div>'),
					          warpScrollingMenu = $('<div class="scrolling menu"></div>');
			    		  
			    		  for(var i=paginationInfo.end+1; i< paginationInfo.totalPageNum; i++) {
			    			  var warpItem = $('<div class="item">' + i + '</div>');  
			    			  warpItem.attr('data-page', i);
			    			  warpScrollingMenu.append(warpItem);
			    		  }
			    		  
			    		 
					      warpMenu.append(warpHeader, warpScrollingMenu);
					      warpButton.append(warpInput, warpSpan, warpMenu);
					      
			    		  $commentPagination.append(warpButton);	
			    		  $(warpButton).dropdown();
			    		  
			    	  }
			    	  
			    	  var lastPageButton = $('<div class="ui compact icon basic button" title="마지막으로"></div>');
			    	 
			    	  lastPageButton.append('<b>'+ paginationInfo.totalPageNum + '</b>');
			    	  lastPageButton.attr('data-page', paginationInfo.totalPageNum);
			    	  $commentPagination.append(lastPageButton);
			    	  
			      }
					  
					  /* 총 페이지 번호가 1이 아니고 , 현재 페이지 번호가 총 페이지 번호보다 작다면 next버튼을 보여줌*/
					  if(paginationInfo.totalPageNum != 1 
							  && paginationInfo.currentPage < paginationInfo.totalPageNum) {
						 
						  var nextButton = $('<div class="ui compact icon basic button"></div>'),
						      nextButtonIcon = $('<i class="right chevron icon"></i>');
						  
						  nextButton.append(' Next');
						  nextButton.append(nextButtonIcon);
						  nextButton.attr('data-page', paginationInfo.currentPage +1);
						  
						  $commentPagination.append(nextButton);
					  }
				

					
			});
			
		}




		function recommendResult(response) {
			  /* 0 = 로그인 에러
			   * 1 = 성공 
			   * 2 = 이미 추천함
			   * 3 = 에러
			   */
			
			
			
			
			console.log(response);
			
			   switch(response.result) {
			   
			   case 0 :
				   
				   swal({
					   title: "추천",
					   text: "로그인 후 추천 가능합니다. 로그인 하시겠습니까?",
					   type: "warning",
					   showCancelButton: true,
					   confirmButtonText: "확인",
					   confirmButtonColor: "#21BA45",
					   closeOnConfirm: false
					  
					   
				   }, function(isConfirm) {
					   console.log(isConfirm);
					   if(isConfirm) {
						   //OK
						   location.href =  
							   $.trashbox.baseUrl + '/login';
					   } else {
						   //Cancel
						   $('#recommend-button').api('destroy');
						   $('#recommend-button').on('click', function() {
		  				   swal({
		  					   title: "추천",
		  					   text: "로그인 후 추천 가능합니다. 로그인 하시겠습니까?",
		  					   type: "warning",
		  					   showCancelButton: true,
		  					   confirmButtonText: "확인",
		  					   confirmButtonColor: "#21BA45",
		  					   closeOnConfirm: false
		  					 
		  				   }, function() {
		  					   location.href =  
		  						 $.trashbox.baseUrl + '/login';
		  				   });
		               }); 
					   }
					   
				   });
				   
				   break;
			    	  
			   case 1 : 
				   
				   swal({
					   title: "추천",
		             text: "추천 하였습니다.",
		             type: "success",           
		             confirmButtonText: "확인",
		             confirmButtonColor: "#21BA45"
		         }, function() {
//		         	 location.reload();
		        	// $('#recommend-button').addClass('disabled');
		        	 $('#recommend-button').api('destroy');
		        	 $('#recommend-button').on('click', function() {
		        		 swal({
		        			 title: "추천",
		            		 text: "이미 추천한 게시물입니다.",
		            		 type: "error",           
		            		 confirmButtonText: "확인",
		            		 confirmButtonColor: "#21BA45"             		 
		        		 });
		        	 });
		         });
				   
				   break;
			    	  
			   case 2 :
				   
				   swal({
					   title: "추천",
					   text: "이미 추천한 게시물입니다.",
					   type: "error",           
					   confirmButtonText: "확인",
					   confirmButtonColor: "#21BA45"
					   
				   }, function() {
//			     	 location.reload();
		           // $('#recommend-button').addClass('disabled');
		           $('#recommend-button').api('destroy');
		           $('#recommend-button').on('click', function() {
		          	 swal({
		          		 title: "추천",
		           		 text: "이미 추천한 게시물입니다.",
		           		 type: "error",           
		           		 confirmButtonText: "확인",
		           		 confirmButtonColor: "#21BA45"
		          	 });
		           }); 
				   });
				   
				   break;
			    	  
			   default :
				   
				   swal({
					   title: "추천",
					   text: "추천 실패하였습니다. 잠시 후 다시 시도 해주세요",
					   type: "error",
					   confirmButtonText: "확인",
					   confirmButtonColor: "#21BA45"
					   
				   }, function() {
					   location.reload();
				   });

			   }
		}
		
		
		function scrollTopComment() {
			var target =  $('.ui.minimal.comments');
			$('#trashbox').animate({
				scrollTop: (target.offset().top - 70)
			}, 550);
		}
		
		
		
		 $('#reply').api({
		        action: 'add comment',  
		        method: 'POST',
//		         stateContext: $('.ui.large.resendAuthMail.form') ,
//		         data: {  
//		         	userNo: '${user.no}'
//		 		    email: '${email}'
//		 		},
				serializeForm: true,
				beforeSend: function(settings) {
					var isValid = $(this).form('is valid');
					
					if(!isValid) {
						return false;
					}
					
					return settings;
				},
		        
		        beforeXHR: function(xhr) {
		        	xhr.setRequestHeader (header, token);
		        },
		        
		        onSuccess: function (response, element, xhr) {
		        	//response = List<Comment>
		        	console.log(response);
		        
		        	$('.ui.minimal.comments > h3 > span').text(response.paginationInfo.totalCommentNum);
		        	
		        	//comment 삭제
		            $('.ui.minimal.comments .comment').each(function() {
		            	$(this).remove();
		            });

		            
		            createComments(response.comments);
		      
		        	
		        	  var $commentPagination = $('#commentPagination');
		          	  
		        	  createCommentsPagination($commentPagination, response.paginationInfo);
		        	  makePaginationApiEvent();  
		        	

		            $('#reply').form('reset');
		        	scrollTopComment();
		        	
		        	
		        },
		        
		        onFailure: function(response, element) {
		        	
		        },
		        
		        onError:  function(errorMessage, element, xhr) {
		        	
		        }
		        
		      });
		 
		 
		 
		 $('.comment.check.modal .positive.button').api({
		        action: 'remove comment',  
		        method: 'POST',
//		         stateContext: $('.ui.large.resendAuthMail.form') ,
		        data: {  
		        	articleNo: articleNo,
		        	userNo: currentUserNo
		 		},
//				serializeForm: true,
				beforeSend: function(settings) {
//					var isValid = $(this).form('is valid');
//					
//					if(!isValid) {
//						return false;
//					}
					
					settings.data.no = $(this).attr('data-no');
					
					
					return settings;
				},
		        
		        beforeXHR: function(xhr) {
		        	xhr.setRequestHeader (header, token);
		        },
		        
		        onSuccess: function (response, element, xhr) {
		        	//response = List<Comment>
		        	console.log(response);
		        
		        	if(response.result) { // 성공시
		        		
		        		$('.ui.minimal.comments > h3 > span').text(response.paginationInfo.totalCommentNum);
		        		
		        		//comment 삭제
		        		$('.ui.minimal.comments .comment').each(function() {
		        			$(this).remove();
		        		});
		        		
		        		
		        		
		        		
		        		createComments(response.comments);
		        		
		        		
		        		var $commentPagination = $('#commentPagination');
		        		
		        		createCommentsPagination($commentPagination, response.paginationInfo);
		        		makePaginationApiEvent();  
		        		
		        		
		        		$('#reply').form('reset');
		        		scrollTopComment();
		        	
		        	} else { // 실패시
		        		
		        		 swal({
		        			 title: "error",
		            		 text: response.cause ,
		            		 type: "error",           
		            		 confirmButtonText: "확인",
		            		 confirmButtonColor: "#21BA45"             		 
		        		 });
		        		
		        	}
		        	
		        	
		        	
		        },
		        
		        onFailure: function(response, element) {
		        	
		        },
		        
		        onError:  function(errorMessage, element, xhr) {
		        	
		        }
		        
		      });
		      
		      function makePaginationApiEvent() {
		    	  
		    	//pagination button
		          $('.pagination .compact.icon.basic.button:not(.active), .ui.dropdown.compact.icon.basic.button .item:not(.active)')
		                 .not('.ui.dropdown.compact.icon.basic.button').api({
		        	   	  
		        	  action: 'list comment',  
		              method: 'GET',
		              data: {  
		                 articleNo: articleNo
		              },
		              
//		              stateContext: $('.ui.comments.segment .dimmer'),
		              loadingDuration: 300,
//		              className: {
//		            	  loading : 'active'
//		              },
		             

		      		beforeSend: function(settings) {
//		       			var isValid = $(this).form('is valid');
		      		
		      			 console.log($(this).attr('data-page'));
		      			
		                if(settings.data.pageNum == null) {
		                	settings.data.pageNum = 1;
		                }
		                
		                var page = $(this).attr('data-page');
		                
		                if(page != null) {
		                	settings.data.pageNum = page;
		                }
		                
		      			
		      			return settings;
		      		},
		              
		              beforeXHR: function(xhr) {
		              	xhr.setRequestHeader (header, token);
		              },
		              
		              onSuccess: function (response, element, xhr) {
		              	//response = List<Comment>
		              	console.log(response);
		              
		              	$('.ui.minimal.comments > h3 > span').text(response.paginationInfo.totalCommentNum);
		              	
		              	  //comment 삭제
		                  $('.ui.minimal.comments .comment').each(function() {
		                  	$(this).remove();
		                  });

		              	  //받아온 정보만큼 comment 화면 구성
		                  createComments(response.comments);
		              	
		                  console.log(response.paginationInfo);
		                	
		              	  var $commentPagination = $('#commentPagination');
		              	  
		              	  createCommentsPagination($commentPagination, response.paginationInfo);
		              	  makePaginationApiEvent();
		              	  
//		               	  $('#reply').form('reset');
		              	  scrollTopComment();
		              	  
		              	  var notifyTitle = '['+ response.paginationInfo.currentPage +']';
		              	  
		              	  if(response.paginationInfo.currentPage == 1) {
		              		  
		              		notifyTitle = '첫';
		              		  
		              	  } else if(response.paginationInfo.currentPage == response.paginationInfo.totalPageNum) {
		              		notifyTitle = '마지막';
		              	  } 
		              	  
	    	    		  $.notify({
	    	    	            title: notifyTitle,
	    	    	            text: '페이지입니다.'
	    	    	            
	    	    	        }, {
	    	    	            style: 'semantic',
	    	    	            className: 'black',
	    	    	            arrowShow: false,
	    	    	            position:'bottom right',
	    	    	            autoHideDelay: 1000,
//	    	    	             autoHide: false,
//	    	    	             clickToHide: true
	    	    	          
	    	    	      });
		              	  
		              	  
		              	
		              },
		              
		              onFailure: function(response, element) {
		              	
		              },
		              
		              onError:  function(errorMessage, element, xhr) {
		              	
		              } 
		        	  
		          });
		    	  
		      }
		    
		      
		      setTimeout(function(){ 
		    	
		    	  // visibility
		       //   $('.ui.three.column.relaxed.stackable.grid.container')
		          $('.pusher')
		          .visibility({
		            once: true,
		            observeChanges: true,
		            onTopPassed: function() {
		              console.log("comments visit");
		              $('#commentsFieldInit').click();
		            }
		          })
		          ;
		    
		      }, 1000);
		      
		      // Comments Field Init
		      $('#commentsFieldInit').api({
		    	  action: 'list comment',  
		          method: 'GET',
		          data: {  
		          	articleNo: articleNo
		          },
		          
		          beforeSend: function(settings) {

		            if(settings.data.pageNum == null) {
		            	settings.data.pageNum = 1;
		            }
		 
		  			return settings;
		          },
		          
		          beforeXHR: function(xhr) {
		          	xhr.setRequestHeader (header, token);
		          },
		      
		          onSuccess: function (response, element, xhr) {
		          	//response = List<Comment>
		          	console.log(response);
		          	
		          	$('.ui.minimal.comments > h3 > span').text(response.paginationInfo.totalCommentNum);
		          
		          	//받아온 정보만큼 comment 화면 구성
		          	createComments(response.comments);
		          	
		          	var $commentPagination = $('#commentPagination');
		          	
		          	createCommentsPagination($commentPagination, response.paginationInfo);
		          	makePaginationApiEvent();  
		          	
		          	  
		          },
		          
		          onFailure: function(response, element) {
		          	
		          },
		          
		          onError:  function(errorMessage, element, xhr) {
		          	
		          }
		          
		    	  
		      });
		      
		      
		      $('#recommend-button').api({
		    	  action: 'update recommend count',  
		          method: 'POST',
		          data: {  
		          	articleNo: articleNo
		          },
		          
		          beforeSend: function(settings) {

		  			return settings;
		          },
		          
		          beforeXHR: function(xhr) {
		          	xhr.setRequestHeader (header, token);
		          },
		      
		          onSuccess: function (response, element, xhr) {
		        	  recommendResult(response);
		        
		          },
		          
		          onFailure: function(response, element) {
		          	
		          },
		          
		          onError:  function(errorMessage, element, xhr) {
		          	
		          }
		          
		    	  
		      });
		      
		      /* 댓글 개수 가져오기 */
				function getCommentCount(articleNoList) {
					var result;
					
					$.ajax({
						async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
						type: "POST",
						url: $.trashbox.baseUrl + '/comment/getTotalCountByArticle',
						data: {articleNoList : articleNoList},
						beforeSend: function (xhr){ 
			  			   xhr.setRequestHeader(header, token);
			  			}
					
					}).done(function(data) {
//			   	  			  console.log(data);
						result = data.commentCount;
						
					});
					
					return result;
					
				}
				
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
//			  			  console.log(data);
		    		  result = data.defaultInfoMap;
		    		  
		    	  });
		    	  
		    	  return result;
		    	  
		      }    			      
		      
		      
		      setTimeout(function(){
					var userNoList = [];
			   		 
		            $('a.author').each(function() {
		           	 var no = $(this).attr('data-no');
		           	 
		           	 if($.inArray(no, userNoList) == -1) {
		           		 userNoList.push(no);
		           	 } 
		           	 
		           	
//		            	 console.log(this);
		           	
		            });
		            
//		             console.log(userNoList);
		           
		            var defaultInfoMap = getUsersDefaultInfo(userNoList);
		            
		            console.log(defaultInfoMap);
		           
		            $('a.author').each(function() {
		            	
		            	if($(this).prev().hasClass('avatar')) {
		            		var userNo = $(this).attr('data-no');
		            		$(this).prev().attr('src', $.trashbox.baseUrl + '/resources/photo_upload_profile/' + defaultInfoMap[userNo].profileImage);
		            	}
		            	
		            });
		            
//		           $('table img').each(function() {
//		        	   var userNo = $(this).next().attr('data-no');
//		        	   $(this).attr('src', $.trashbox.baseUrl + '/resources/photo_upload_profile/' + defaultInfoMap[userNo].profileImage);
//		        	   
//		           });
					
					
				}, 1000);		   
		
		

		
	});

	
	
})(jQuery);








