(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header');
      
    	$(function () {
    		
    		$(document).ajaxSend(function(e, xhr, options) {
    			xhr.setRequestHeader(header, token);
    			xhr.setRequestHeader('X-AJAX-CALL', true);
    			
    		});
    		
    	});
		
		
		$.fn.api.settings.api = {
	    		  'remove messages' : $.trashbox.baseUrl + '/removeMessages' ,
	    		  'check message'   : $.trashbox.baseUrl + '/checkMessage' ,
	    		  'save message'    : $.trashbox.baseUrl + '/saveMessage' ,
	    		  'send message'    : $.trashbox.baseUrl + '/sendMessage' 
	    };
		
		
	    $('.coupled.modal')
	         .modal({closable: false, allowMultiple: false});
		
		/* REMOVE */
		$('.coupled.message.modal .actions .red.button').api({
	        action: 'remove messages',  
	        method: 'POST',

	        data: {},
	        // stateContext: $('#nickname-update-button'),
	        
	       
	        beforeXHR: function(xhr) {
	        	xhr.setRequestHeader (header, token);
	        	xhr.setRequestHeader ('X-AJAX-CALL', true);
	        },
	        
	        beforeSend: function(settings) {
	        	
	            var messageNoList = [],
	        	    messageNo = $(this).attr('data-no');
	        	
	        	messageNoList.push(messageNo);
	        	
	        	settings.data.messageNoList = messageNoList;

	           return settings; 
	        },
	        
	        onSuccess: function (response) {   
	        
	        	if(response.result) {
	        		
	        		
	        		console.log(response.removeMessagesNo);
	        		//[90]
	        		

	        		var removeNoList = response.removeMessagesNo;
	        		
//	         		swal({
//	                      title: "탈퇴",
//	                      text: "성공적으로 탈퇴 되었습니다.",
//	                      type: "success",           
//	                      confirmButtonText: "확인",
//	                      confirmButtonColor: "#21BA45"
//	                  }, function() {
//	                 	 location.replace('<c:url value="/main"/>');
//	                  });
	        		$('.result.modal .content p').text('메시지 ' + removeNoList.length + '건이 삭제 되었습니다.'); 
				    $('.result.modal').modal('show');
				    
				    $('.tab.active .child.checkbox input').each(function() {
		        		
				    	var messageNo = $(this).attr('value');
				    	
				    	if($.inArray(parseInt(messageNo), removeNoList) !== -1) {
				    	
				    		$(this).closest('tr').remove();
		        		
		        		}
		
				    });
				
	        	} else {
	        		
//	         		swal({
//	         	          title: "탈퇴",
//	         	          text: "실패하였습니다. 다시 시도해주세요.",
//	         	          type: "error",           
//	         	          confirmButtonText: "확인",
//	         	          confirmButtonColor: "#21BA45"
//	         	      }, function() {
//	         	     	 location.reload();
//	         	      });
	        		
	        	}
	 
	        }
	        
	        
	    });
		
		
	      $('.ajax-tab.menu .item')
	      .tab({
	   
	     	 cache: false,	       
	     	 apiSettings: {     		 
			         loadingDuration : 300,
			         
			         beforeSend : function(settings) {
	             	 settings.dataType = 'JSON';
//	              	 settings.data = {
//	              			 limit : 5
//	              	 }

	                 
//	                   console.log(settings);

//	              	 console.log(settings.urlData.tab);
	             	
	             	settings.url = $.trashbox.baseUrl + '/message/{$tab}';
	             	
//	              	 if(settings.urlData.tab == 'newComments') {
//	              		 settings.url = '/trashbox/comment/{$tab}';
//	              	 } else {
//	              		 settings.url = '/trashbox/board/{$tab}';  
//	              	 }
	             	 
	             	 
	             	 return settings;
	              },
	              
	              responseAsync : false,
	        
	              onResponse : function(myResponse) {
	             	 
	             	 console.log(myResponse.result);
	             	 
	             	 var tabPath = myResponse.query;
	             	 var result = myResponse.result;
	             	
//	              	 var response = {
//	              		notice : content,
//	              		event  : content,
//	              		popularArticles : content,
//	              		newArticles : content,
//	              		newComments : content
//	              	 };

	                  var response = {};
	                  response[tabPath] = createTable(myResponse.result, tabPath);
	                	  
	                	  //tabPath + ' ::: ' + result;
	             	 

	                  
	             	 return response[tabPath];
	              }
	              
	     	
//		        		 mockResponse : function(settings) {
	     			 
//		        			 var response = {
//		        					 notice : 'AJAX Tab One',
//		        					 second : 'AJAX Tab Two',
//		        					 third  : 'AJAX Tab Three'
	     					 
//		        			 };
	     			 
//		        			 console.log(settings);
//		        			 return response[settings.urlData.tab]; 
//		        		 },
	      
	      
	     	 },
	     	 context : 'parent',
//		        	 auto    : true,
//		        	 path:  '/trashbox/board/',
	     	 
	     	 onRequest : function(tabPath) {
	     		 console.log('tabPath : ' + tabPath);
	     		 
	     	    var button_save = $('<div class="ui blue button">저장</div>');
	     		
	     	    var hasSaveButton = $('.coupled.message.modal .actions').has('.ui.blue.button').length == 0 ? false : true;
	     		 
	     		console.log(hasSaveButton); 
	     		
	     		
	     	    
	     		switch(tabPath) {
	     		  
	     		  case 'receive': 
	     			  if(!hasSaveButton) {
	     				 
	     				 ajaxMessageSave(button_save);
	     				 $('.coupled.message.modal .actions').prepend(button_save);
	     			  }
	     			  break;
	     			  
	     		  case 'send':
	     			 if(hasSaveButton) {
	     				$('.coupled.message.modal .actions .blue.button').remove();
	     			 }
	     			 break;
	     			  
	     		  case 'save':
	      			 if(hasSaveButton) {
	      				$('.coupled.message.modal .actions .blue.button').remove();
	     			 }
	     			 break;
	     		
	     		}
	     		
	     		
	     	 }
	     	 
	      });
	      
	      function ajaxMessageSave(saveButton) {
	    	  
	    	  saveButton.api({
			        action: 'save message',  
			        method: 'POST',
			        
			        data: {},

			       // stateContext: $('#nickname-update-button'),
			        
			       
			        beforeXHR: function(xhr) {
			        	xhr.setRequestHeader (header, token);
			        	xhr.setRequestHeader ('X-AJAX-CALL', true);
			        },
			        
			        beforeSend: function(settings) {
			        	
//	 		        	var checked = $(this).closest('tr').find('.checked').children().hasClass('checkmark');
			        	
//	 		        	if(checked) {
//	 		        		return false;
//	 		        	}
			        	
			        	settings.data.messageNo = $(this).attr('data-no');
			        
			          
			           return settings; 
			        },
			        
			        onSuccess: function (response, elements) {   
			        
//	 		        var	checked = 'large green checkmark icon',
//	 		    	    unChecked = 'large red close icon';
			        	
			        	if(response.result) {
			        		
			        		console.log("메시지 저장 성공");
			        		
			        		$('.result.modal .content p').text('메시지가 저장 되었습니다.'); 
						    $('.result.modal').modal('show');
			        		
						    var saveMessageNo = $(this).attr('data-no');
						    
						    $('.tab.active .child.checkbox input').each(function() {
				        		
						    	var messageNo = $(this).attr('value');
						    	
						    	if(parseInt(messageNo) == saveMessageNo) {
						    	
						    		$(this).closest('tr').remove();
				        		
				        		}
				
						    });
						
			        	} else {
			        		
			        		console.log("메시지 저장 실패");
			        		
			        		$('.result.modal .content p').text('메시지가 저장 실패.'); 
						    $('.result.modal').modal('show');

			        		
			        	}
			 
			        }
			        
			        
			      });
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
//		  			  console.log(data);
		  			   result = data.defaultInfoMap;
		  		    });
	      	
	      	return result;
	      }
	      
	      
	      
	      
	      function createTable(messages, tabPath) {
	    	
	    	  if(messages.length == 0) {
	    		  var empty = $('<br>' 
	    				  +'<h1 class="ui center aligned icon header">' 
	    				  +'<i class="circular inbox icon"></i>'
	    				  +'</h1>'
	    				  +'<br>');
	    		
	    		  return empty;
	    	  }
	    	  
	    	  var userNoList = [];

	          switch(tabPath) {
	     	     case 'receive':  
	     	    	       
	     	    	  $(messages).each(function() {
	     	    		 userNoList.push(this.senderNo);   
	     	    	  });   
	     	    	  break;
	     		  
	     	     case 'send':
	     	    	 
	    	    	  $(messages).each(function() {
	    	    		  userNoList.push(this.receiverNo);
	      	    	  });     	    	  
	    	    	  break;
	     	   
	     	     case 'save':
	     	    	 
	    	    	  $(messages).each(function() {
	      	    		 userNoList.push(this.senderNo);   
	      	    	  });
	     	    	 
	     	    	 break;
	     	    
	     	     default:
	     	    	
	     	  }        	  
	        
	   
	    	  
	          if(userNoList.length > 0) { 
	        	  console.log(userNoList);
	        	  
	        	  var defaultInfoMap = getUsersDefaultInfo(userNoList);

	        	  console.log(defaultInfoMap);
	        	  
	        	  //parts 1
	        	  
	        	  var table = $('<table class="ui selectable table"/>'),
//	     	      thead ,
	        
	    	      tbody = $('<tbody/>');
	    	 
	        	  // parts thead
	        	  
	        	  var thead = $('<thead class="full-width" />'),
	    	          thead_tr = $('<tr />'),
	    	          thead_checkBox = $('<th></th>'),
	    	    
	    	          div_checkBox = $('<div class="ui fitted master checkbox"><input type="checkbox"> <label></label></div>'),
	    	          thead_remove = $('<th style="width: 54px;"></th>'),
	    	          button_remove = $('<button type="button" class="ui basic icon button delete">'
	                                  + '<i class="trash icon"></i>'
	                                  + '</button>'),
	    	      
	    	          thead_name = $('<th>Sender</th>'),
	    	          thead_content = $('<th>내용</th>'),
	    	          thead_registDate = $('<th>날짜</th>'),
	    	          thead_checked = $('<th>확인</th>');
	    	  
                      button_remove.api({
                    	  action: 'remove messages', 
                    	  method: 'POST',

                    	  data: {},
	    	              // stateContext: $('#nickname-update-button'),
	    	       
                    	  beforeXHR: function(xhr) {
                    		  xhr.setRequestHeader (header, token);
                    		  xhr.setRequestHeader ('X-AJAX-CALL', true);
                    	  },
	    	        
                    	  beforeSend: function(settings) {
	    	        	
                    		  var messageNoList = [];

	    	        	
//	     	        	console.log($(this).closest('table').children('tbody').find('.checkbox').checkbox('is checked'));
	    	        	
                    		  $(this).closest('table').children('tbody').find('.checkbox.checked input').each(function() {
	    	        		   
                    			  var checkedMessageNo = $(this).attr('value');
                    			  messageNoList.push(checkedMessageNo);
                    			  
                    		  });
                    		  
                    		  settings.data.messageNoList = messageNoList;
	    	        	
                    		  if(messageNoList.length < 1) {
                    			  return false;
                    			  
                    		  }
                    		  return settings; 
                    		  
                    	  },
                    	  
                    	  onSuccess: function (response) {   
                    		  if(response.result) {
                    			  console.log(response.removeMessagesNo);
                    			  //[90, 89, 88]
                    			  var removeNoList = response.removeMessagesNo;
                    			  
                    			  $('.result.modal .content p').text('메시지 ' + removeNoList.length + '건이 삭제 되었습니다.');
                    			  $('.result.modal').modal('show');
                    			  
                    			  $('.tab.active .child.checkbox input').each(function() {
                    				  
                    				  var messageNo = $(this).attr('value');
                    				  
                    				  if($.inArray(parseInt(messageNo), removeNoList) !== -1) {
                    					  $(this).closest('tr').remove();
                    				  }
                    				  
                    			  });
                    			  
                    			  $('.tab.active .master.checkbox').checkbox('uncheck');
                    			  
                    		  } else {
                    			  
                    		  }
                    		  
                    	  }
                    	  
                      });
                      
                      div_checkBox.checkbox({
                    	  // check all children
                    	  onChecked: function() {
                    		  var $childCheckbox = $(this).closest('table').children('tbody').find('.checkbox');
		    	    
                    		  $childCheckbox.checkbox('check');
                    		  
                    	  },
                    	  // uncheck all children
                    	  onUnchecked: function() {
                    		  var $childCheckbox = $(this).closest('table').children('tbody').find('.checkbox');
		    	    	
                    		  $childCheckbox.checkbox('uncheck');
                    		  
                    	  }
                    	  
                      });
	    	 
	    	 
//	     	 thead_checkBox.append(div_checkBox);
	    	
//	     	 thead_tr.append(thead_checkBox, thead_name, thead_content, thead_registDate, thead_checked);
	    	 
//	     	 thead.append(thead_tr);
	    	 
	    	
                      switch(tabPath) {
                      
                         case 'receive': 
                        	 thead_checkBox.append(div_checkBox);
                        	 thead_remove.append(button_remove);
	  	    	
                        	 thead_name.text('보낸사람');
	  	    	             thead_registDate.text('받은 날짜');
	  	    	             thead_tr.append(thead_checkBox, thead_remove, thead_name, thead_content, thead_registDate, thead_checked);
		     	             thead.append(thead_tr);
		     	             
		     	             break;
	  		  
	  	                 case 'send':
	  	                	 thead_checkBox.append(div_checkBox);
	  	                	 thead_remove.append(button_remove);
	  	                	 
	  	                	 thead_name.text('받는사람');
	  	                	 thead_registDate.text('발송 날짜');
	  	                	 thead_tr.append(thead_checkBox, thead_remove, thead_name, thead_content, thead_registDate, thead_checked);
	  	    	             thead.append(thead_tr);
	 	    	  
	 	
	 	              	     break;
	 	              	     
	  	                 case 'save':
	  	                	 thead_checkBox.append(div_checkBox);
	  	                	 thead_remove.append(button_remove);
	  	                	 
	  	                	 thead_name.text('보낸사람');
	  	                	 thead_registDate.text('받은 날짜');
	  	                	 thead_tr.append(thead_checkBox, thead_remove, thead_name, thead_content, thead_registDate, thead_checked);
	  	                	 thead.append(thead_tr);
	  	    	 
	  	                	 break;
	  	                	 
                      }   
	    	  
	    	  
//	     	   var tr =  $('<tr/>'),
//	     	       td_checkBox =  $('<td class="collapsing">'
//	     	    	        + '<div class="ui fitted slider checkbox">'
//	     	    	        + '<input type="checkbox"> <label></label>'
//	     	    	        + '</div> '
//	     	    	        + '</td>'),
//	     	       td_name = $('<td>John Lilki</td>'),
//	     	       td_content = $('<td></td>'),
//	     	       a_content = $('<a class="content" style="cursor: pointer;">jhlilk22@yahoo.com</a>'),
//	     	       td_date = $('<td>September 14, 2013</td>'),
//	     	       td_checked = $('<td><i class="large green checkmark icon"></i></td>'),
//	     	       td_unChecked = $('<td><i class="large red close icon"></i></td>');
	    		   
	    	   
	    	   $(messages).each(function() {
	    		   
	    		   //parts 2
	    		   var tr =  $('<tr/>'),
	    	       td_checkBox =  $('<td class="collapsing" />'),
	    	       
	    	       div_checkBox = $('<div class="ui fitted child checkbox">'
	   	    	        + '<input type="checkbox" name="messageNo[]" value="' + this.no + '"> <label></label>'
		    	        + '</div>'),
		    	        
		    	   td_remove = $('<td></td>'),
	    	      
	    	       td_name = $('<td></td>'),
	    	    		    
	    	       td_content = $('<td style="max-width: 220px; overflow: hidden; text-overflow: ellipsis;"></td>'),
	    	       a_content = $('<a class="content" style="cursor: pointer; white-space: nowrap;">'
	    	                + this.content
	    	                +'</a>'),
	    	                
	    	       td_date = $('<td>' + $.format.date(this.registrationDate, 'yyyy/MM/dd (HH:mm)') + '</td>'),
	    	       td_checked = $('<td class="checked"><i class="large green checkmark icon"></i></td>'),
	    	       td_unChecked = $('<td class="checked"><i class="large red close icon"></i></td>');
	    		   
	    		   //checkBox event
	    		   div_checkBox.checkbox({
	    			    // Fire on load to set parent value
	    			    fireOnInit : true,
	    			    // Change parent state on each child checkbox change
	    			    onChange   : function() {
	    			    	
//	     			    	console.log($(this).closest('tbody').find('.checkbox'));
//	                      console.log($(this).closest('table').children('thead').find('.checkbox'));
	    			    	
	    			      var
	    			        $parentCheckbox = $(this).closest('table').children('thead').find('.checkbox'),
	    			        $checkbox       = $(this).closest('tbody').find('.checkbox'),
	    			        allChecked      = true,
	    			        allUnchecked    = true
	    			      ;
	    			      // check to see if all other siblings are checked or unchecked
	    			      $checkbox.each(function() {
	    			        if( $(this).checkbox('is checked') ) {
	    			          allUnchecked = false;
	    			        }
	    			        else {
	    			          allChecked = false;
	    			        }
	    			      });
	    			      // set parent checkbox state, but dont trigger its onChange callback
	    			      if(allChecked) {
	    			        $parentCheckbox.checkbox('set checked');
	    			      }
	    			      else if(allUnchecked) {
	    			        $parentCheckbox.checkbox('set unchecked');
	    			      }
	    			      else {
	    			        $parentCheckbox.checkbox('set indeterminate');
	    			      }
	    			    },
	    			    
	    			    onChecked: function() {
	    			    	$(this).closest('tr').addClass('active');
	    			    },
	    			    
	    			    onUnchecked: function() {
	    			    	$(this).closest('tr').removeClass('active');
	    			    }
	    		   
	    		   
	    		   
	    			  })
	    			;

	    		   
	    		   // build
	    		   td_checkBox.append(div_checkBox);
	    		   
	    		   td_checkBox.appendTo(tr);
	    		   
//	     		   console.log(tabPath);
	    		   
	    	       switch(tabPath) {
	         	     case 'receive':  
	         	            	td_name.text(defaultInfoMap[this.senderNo].nickname);
	         	            	td_name.attr('data-no', this.senderNo);
	         	    	        break;
	         		  
	         	     case 'send':
	         	    	        td_name.text(defaultInfoMap[this.receiverNo].nickname);
	         	    	        td_name.attr('data-no', this.receiverNo);
	         	    	        break;
	         	   
	         	     case 'save':
	         	    	        td_name.text(defaultInfoMap[this.senderNo].nickname);
	         	    	       td_name.attr('data-no', this.senderNo);
	         	    	        break;
	         	     
	         	     default:
	         	    	
	         	  }   
	    		   
	    	       td_remove.appendTo(tr);
	    		   td_name.appendTo(tr);
	    		   
	    		 
	    		   a_content.attr('data-no', this.no);
	    		   
	    		   a_content.on('click', function() {
	    			   
	    			   var userNo = $(this).parent().prev().attr('data-no');
	    			       content = $(this).text(),
	    			       nickname = $(this).parent().prev().text();
	    			   
	    			   $('.coupled.message.modal .content').text(content);  
	    		       $('.coupled.message.modal .ui.header').text(nickname);
	    		       
	    		       $('.coupled.message.modal .actions .red.button').attr('data-no', $(this).attr('data-no'));
	    		       
	    		       $('.coupled.message.modal .actions .show-message-modal.button')
	    		       .attr({
	    		    	   'data-no' : userNo,
	    		    	   'data-nick' : nickname
	    		       })
	    		       
//	     		       $('#message-send-form .header').text('To : ' + nickname);
	    		       
	    		       if(tabPath == 'receive') {
	    		    	   $('.coupled.message.modal .actions .blue.button').attr('data-no', $(this).attr('data-no'));
	    		       }
	    		       
	    			   $('.coupled.message.modal').modal('show');
	    		   
	    		   });
	    		   
	    		   // 메시지 확인 api 받은 메시지창에서만 만들어줌
	    		   if(tabPath == 'receive') {

	    			    a_content.api({
	    		        action: 'check message',  
	    		        method: 'POST',
	    		        
	    		        data: {},

	    		       // stateContext: $('#nickname-update-button'),
	    		        
	    		       
	    		        beforeXHR: function(xhr) {
	    		        	xhr.setRequestHeader (header, token);
	    		        	xhr.setRequestHeader ('X-AJAX-CALL', true);
	    		        },
	    		        
	    		        beforeSend: function(settings) {
	    		        	
	    		        	var checked = $(this).closest('tr').find('.checked').children().hasClass('checkmark');
	    		        	
	    		        	if(checked) {
	    		        		return false;
	    		        	}
	    		        	
	    		        	settings.data.messageNo = $(this).attr('data-no');
	    		        
	    		          
	    		           return settings; 
	    		        },
	    		        
	    		        onSuccess: function (response, elements) {   
	    		        
	    		        var	checked = 'large green checkmark icon',
	    		    	    unChecked = 'large red close icon';
	    		        	
	    		        	if(response.result) {
	    		        		
	    		        		console.log("메시지 확인 성공");
	    		        		
	                            $(elements).closest('tr').find('.checked').children().attr('class', checked);
	    		        		 
	    					
	    		        	} else {
	    		        		
	    		        		console.log("메시지 확인 실패");

	    		        		
	    		        	}
	    		 
	    		        }
	    		        
	    		        
	    		      });
	    			   
	    		   } 
	    		   
	    		   td_content.append(a_content);
	    		   
	    		   td_content.appendTo(tr);
	    		   td_date.appendTo(tr);
	    		   
//	     		   console.log('checked :: ' + this.checked + ' , No:: ' + this.no);
	    		   
	    		   if(this.checked) {
	    			   td_checked.appendTo(tr);
	    		   } else {
	    			   td_unChecked.appendTo(tr);
	    			   
	    		   }
	    		   
	    		  
	    		   
	    		   tbody.append(tr);
	    		   
	    	   });
	    	   
	    	   
	    	   
	    	   table.append(thead);
	    	   table.append(tbody);
	    	   
	           
	    	   return table;
	    	  
	    	  
	      }
	      
	      
	      } 
	      
	      
	      $('#send-message-modal')
    	  .modal({
    		  closable  : false ,
    		  onApprove : function() {
    			 $('#message-send-form').submit();
    		  },
    		  onDeny : messageFormClear,
    		  onHide : messageFormClear
    	  })
    	  .modal('attach events', '.show-message-modal', 'show');
   	 
    	// 메시지 보내는 모달창 띄우기 (userNo , userNick 모달창에 넘겨줌);
    	$('.show-message-modal').on('click', function() {
    	
    		var no = $(this).attr('data-no'),
    		    nickname = $(this).attr('data-nick');
    		
    		$('#message-send-form .receiver.no').attr('value', no);
    		$('#message-send-form .ui.dividing.header').text('To : ' + nickname);
    		
    		
    		
    	});
    	
    	
    	function messageFormClear() {
    		$('#message-send-form').form('clear');
    	}
    
    	
    	$('#message-send-form').api({
	    	  action: 'send message',  
	          method: 'POST',
	          serializeForm: true,
	          data: {  
// 	        	receiverNickname : clickUserNickname
// 	          	receiverNo : receiverNo
	          },
	          
	          beforeSend: function(settings) {
	        	  
	  			return settings;
	          },
	          
	          beforeXHR: function(xhr) {
	          	xhr.setRequestHeader (header, token);
	          },
	      
	          onSuccess: function (response, element, xhr) {

	        	  /* 0=실패   1=성공*/
	        	  
	        	  switch(response) {
	        	  
	        	  case 0 : 
	        		  
	        		  swal({
	        			  title: "쪽지",
	        			  text: "쪽지 발송에 실패하였습니다.",
	        			  type: "error",           
	        			  confirmButtonText: "확인",
	        			  confirmButtonColor: "#21BA45"             		 
	        		  }, function() {
	        			  location.reload();
	        		  });
	        		  
	        		  break;
				   
				   case 1 :
					   
					   swal({
		    			   title: "쪽지",
		    			   text: "쪽지가 성공적으로 발송되었습니다.",
		    			   type: "success",
		    			   confirmButtonText: "확인",
		    			   confirmButtonColor: "#21BA45"
		     
		    		   });   		   

					   break;
				    	  
	        	  }
	        
	          },
	          
	          onFailure: function(response, element) {
	          	
	          },
	          
	          onError:  function(errorMessage, element, xhr) {
	          	
	          }
	          
	    	  
	      });
	    
		
		
		
	});

	
	
})(jQuery);








