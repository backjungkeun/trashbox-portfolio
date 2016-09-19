(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header');
      
		// form settings
		$nicknameUpdateForm = $('#nickname-update-form');
		$emailChangeForm = $('#email-change-form');
		$profilePhotoUploadForm = $('#profile-photo-upload-form');
	    
		$form = $('.ui.form').not($nicknameUpdateForm).not($emailChangeForm).not($profilePhotoUploadForm);
		

		// 닉네임 
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
	    
	    
	    // 이메일
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
		      

	    $nicknameUpdateForm.form({
	    	  
	    	  inline: true,
	    	  on: blur,
	    	  
	    	 
	    	  fields: {
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
	                }
	              
	          }
	      });
	    
	    $emailChangeForm.form({
	    	  
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
	    
	    // 닉네임 api
	    var nicknameLastCheck = false;
	      
	      $nicknameUpdateForm.api({
	        action: 'update nickname',  
	        method: 'POST',
	        serializeForm: true,
	        data: {},
	        stateContext: $('.modify.user.info.segment'),
	        
	       
	        beforeXHR: function(xhr) {
	        	xhr.setRequestHeader (header, token);
	        	xhr.setRequestHeader ('X-AJAX-CALL', true);
	        },
	        
	        beforeSend: function(settings) {
	           var isValid = $nicknameUpdateForm.form('is valid');
	       
	           
	           if(!isValid) {
	        	   return false;
	           }
	           
	           if(isValid && !nicknameLastCheck) {
	        	   
	        	   $('.ui.nickname.final.check.modal')
	            	  .modal({ 
	            		  closable  : false ,
	            		
	            		  onApprove : function() {
	            			
	            			  nicknameLastCheck = true;
	            			  $nicknameUpdateForm.submit();
	            	      }
	            		  
	            	  })
	            	  .modal('show');
	        	   
	           }
	           
	           if(!nicknameLastCheck) {
	        	   return nicknameLastCheck;
	           }
	          
	           return settings; 
	        },
	        
	        onSuccess: function (response) {   
	        
	        	if(response == 1) {
	        		
	        		swal({
	                     title: "닉네임 변경",
	                     text: "닉네임이 성공적으로 변경되었습니다.",
	                     type: "success",           
	                     confirmButtonText: "확인",
	                     confirmButtonColor: "#21BA45"
	                 }, function() {
	                	 location.reload();
	                 });
	        		 
				
	        	} else {
	        		
	        		swal({
	        	          title: "닉네임 변경",
	        	          text: "닉네임 변경이 실패하였습니다.",
	        	          type: "error",           
	        	          confirmButtonText: "확인",
	        	          confirmButtonColor: "#21BA45"
	        	      }, function() {
	        	     	 location.reload();
	        	      });
	        		
	        	}
	 
	        },
	        
	        onFailure: function(response, element) {
	        	
	        	swal({
	        		title: "닉네임 변경",
	        		text: "닉네임 변경이 실패하였습니다. 다시 로그인 해주세요",
	        		type: "error",   
	        		confirmButtonText: "확인",
	        		confirmButtonColor: "#21BA45"
	        		
	        	}, function() {
	        		location.reload();

	        	});
	          	
	        }

	      });
	      
	      // 이메일 api
	      var emailLastCheck = false;
	      
	      $emailChangeForm.api({
	          action: 'send mail',  
	          method: 'POST',
	          serializeForm: true,
	          stateContext: $('.modify.user.info.segment'), 
//	          data: {  
//	          	id: '<sec:authentication property="principal.username" />'
//	  		  },
	  		  
	  		  beforeSend: function(settings) {
	            var isValid = $emailChangeForm.form('is valid');
	            var id = settings.data.id;
	            
	            	
	            
	            if(id == '') {
	               return false;
	            }
	            
	            if(!isValid) {
	         	   return false;
	            }
	            
	            
	            if(isValid && !emailLastCheck) {
	            
	             
	              $('.ui.email.final.check.modal')
	           	  .modal({ 
	           		  closable  : false ,
	           		
	           		  onApprove : function(event) {
	           			  emailLastCheck = true;
	           			  $emailChangeForm.submit();
	           	      }
	           		  
	           	  })
	           	  .modal('show');	
	    
	              
	            }
	            
	            if(!emailLastCheck) {
	           	   return emailLastCheck;
	             }
	           
	            return settings; 
	          },
	          
	          beforeXHR: function(xhr) {
	          	xhr.setRequestHeader (header, token);
	          },
	          
	          onSuccess: function (response) {   
	          
	          	if(response) {
	          		
	          		swal({
	          			title: "이메일 변경",
	          			text: "이메일이 성공적으로 변경되었습니다.",
	          			type: "success",
	          			confirmButtonText: "확인",
	          			confirmButtonColor: "#21BA45"	
	          		}, function() {
	          			location.href= $.trashbox.baseUrl + '/logout';	
	          		});
	          		
	          	} else {

	          		swal({
	      	          title: "이메일 변경",
	      	          text: "이메일 변경이 실패하였습니다.",
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
	     
	     
	     // 닉네임 변경 라벨 팝업
	     $('.ui.nickname.change.label')
	     .popup({
	       setFluidWidth : true,
	       position : 'bottom center',
	       target : '.ui.nickname.change.label',
	       popup : $('.nickname.popup'),
	       on    : 'click',
	       onHide : function() {
	    	   $nicknameUpdateForm.form('clear');
	       }
	     })
	     
	   ;
	     
	     // 이메일 변경 라벨 팝업  
	     $('.ui.email.change.label')
	     .popup({
	       position : 'bottom center',
	       target : '.ui.email.change.label',
	       popup : $('.email.popup'),
	       on    : 'click',
	       onHide : function() {
	    	   $emailChangeForm.form('clear');
	       }
	     })
	     
	   ;
	     
	     // 이미지 dimmer 효과
	     $('.table .image')
	     .dimmer({
	       on: 'hover'
	     })
	   ;
	     
	     
	     // 프로필 변경 라벨 클릭시 모달 이벤트
	     $('.ui.profile.photo.change.basic.label').on('click', function() {
	    	 
	    	 $('.ui.profile.photo.change.modal')
	    	 .modal({ 
	    		 closable  : false ,
	    		 observeChanges : true,
	    		 onApprove : function() {
	    			 
	                var data = new FormData();
	                $.each($('#uploadInputBox')[0].files, function(i, file) {
	                	data.append('filedata', file);
	                });
	                
	                data.append("userProfileInfo", $("#userProfileInfo").val());
//	                 data.append("test3", $("textarea[name=test3]").text());
	                
	                $.ajax({
	                	
	                	url: $.trashbox.baseUrl + '/uploadProfilePhoto',
	                	type: 'POST',
	                	dataType: 'text',
	                	data: data,
	                	// cache: false,
	                	processData: false,
	                	contentType: false,
	                	
	                	beforeSend : function(xhr){
	                        xhr.setRequestHeader(header, token); 
	                        
	                        if(!$('#userProfileInfo').val()) {
	                        	return false;
	                        }
	                    },
	                    
	                	success: function(data, textStatus, jqXHR) {
	                  		
	                		if(data) {
	                			
	                			swal({
	                      			title: "프로필 사진 변경",
	                      			text: "사진이 성공적으로 변경되었습니다.",
	                      			type: "success",
	                      			confirmButtonText: "확인",
	                      			confirmButtonColor: "#21BA45"	
	                      		}, function() {
	                      			 location.reload();	
	                      		});
	                		
	                		} else {
	                			
	                			swal({
	                    	          title: "프로필 사진 변경",
	                    	          text: "사진 변경이 실패하였습니다.",
	                    	          type: "error",           
	                    	          confirmButtonText: "확인",
	                    	          confirmButtonColor: "#21BA45"
	                    	          
	                      		}, function() {
	                    	        	  location.reload();
	                      		});
	                			
	                		}
	                		
	                		
	                	}, 
	                	
	                	error: function(jqXHR, textStatus, errorThrown) {
	                		
	                		swal({
	              	          title: "프로필 사진 변경",
	              	          text: "사진 변경이 실패하였습니다.",
	              	          type: "error",           
	              	          confirmButtonText: "확인",
	              	          confirmButtonColor: "#21BA45"
	              	          
	                		}, function() {
	              	        	  location.reload();
	                		});
	                		
	                	}
	                	
	                });
	    		        

	   	         },
	   	         onDeny: function() {
	   	        	 $('#uploadPreview').empty();
	   	        	 $('#uploadPreview').removeClass('croppie-container');
	   	        	 
	   	        	 $('table img').each(function() {
	   	        		$(this)
	   	        		  .clone()
	   	        		  .attr('class','ui small centered circular image')
	   	        		  .appendTo($('#uploadPreview'));
	   	        		
	   	        		
	   	        	 });
	   	        	 
	   	        	$('.profile.photo.change.modal .positive.button').addClass('disabled');
	   	        	 
	   	         }
	    	 })
	    	 .modal('show');
	    	 
	     });
	     
	     
	     // 파일 이름 적당히 자르기
	     /**
	      * 참조 - attach_photo.js
		  * 화면 목록에 적당하게 이름을 잘라서 표시.
		  * @param {Object} sName 파일명
		  * @param {Object} nMaxLng 최대 길이
		  */
	     function cuttingNameByLength (sName, nMaxLng) {
	    	 var sTemp, nIndex;
	    	 
	    	 if(sName.length > nMaxLng){
	    		 nIndex = sName.indexOf(".");
		 			
	    		 sTemp = sName.substring(0, 12) + " ... " + sName.substring((nIndex - 8), sName.length) ;
	    		 
	    	 } else {
	    		 sTemp = sName;
	    		 
	    	 }
	    	 
	    	 return sTemp;
	    	 
	     }
	     
	     /**
		  * 이미지 첨부 하였을 때  미리보기 만들어 줌.
		  * @param {Object} file 파일
		  */  
	     //var url = window.URL || window.webkitURL; // alternate use

	     function readImage(file) {
	    	 var reader = new FileReader();
			 var image  = new Image();
			 
			 reader.readAsDataURL(file);  
			 reader.onload = function(_file) {
				 image.src    = _file.target.result;              // url.createObjectURL(file);
			     image.onload = function() {
			    	 var w = this.width,
			    	     h = this.height,
			    	     t = file.type,                           // ext only: // file.type.split('/')[1],
			             n = cuttingNameByLength(file.name, 30),
			             s = ~~(file.size/1024) +'KB';
			            
//	 		            $('#imageWidth').val(this.width);
			            
//	 		            $('#uploadPreview')
//	 		            .empty()
//	 		            .append('<img src="'+ this.src +'" style="width: 100%; max-width:' + w + 'px;"><p class="dsc">' + n + '<br>' + w +' x ' + h + '<br>' + s + '<br>' + t + '<br></p><br>'); //'+n+' 
			 
//	 		            console.log(this.src);
			            $('#uploadPreview').empty();
			            $('#uploadPreview').append('<div id="lastPreviewButton" class="ui last preview button">미리보기</div>');
			            createCroppie(this.src);
			            
			            $('#uploadPreview').append('<p class="dsc">' + n + '<br>' + w +' x ' + h + '<br>' + s + '<br>' + t + '<br></p><br>');
			  };
			        
			  //'<p class="dsc" id="info">' + w +' x ' + h + '<br>' + s + '<br>' + t + '<br></p>'
			  image.onerror= function() {
				  alert('Invalid file type: '+ file.type);
			  };
			  
		   };
			    
		 }
	     
	     /* 이미지 파일 첨부 시 실행  */
	     
	     $('#uploadInputBox').on('change', function() {
	    	 if(this.disabled) return alert('File upload not supported!');
	    	 var F = this.files;
	    	 if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i] );
	     });	     
		      
	     /* Custom 버튼 클릭시  uploadInputBox 클릭    */
	     $('.ui.attach.file.primary.button').on('click', function() {
	    	 $('.profile.photo.change.modal .positive.button').addClass('disabled');
	    	 $('#uploadInputBox').click();
	     });	  
	     
	     function createCroppie(url) {
				var basic = $('#uploadPreview').croppie({
					viewport: {
						width: 200,
						height: 200
//						type: 'circle'
					},
				    
					boundary: {
				        height: 300
				    }
				});
				
				basic.croppie('bind', {
					url: url				
				});	
				
//	 			$('#xxxbutton').on('click', function() {
//	 				basic.croppie('result', 'html').then(function (resp) {
//	 					popupResult({
//	 						html: resp.outerHTML
//	 					});
//	 				});
//	 			});
				
				$('#lastPreviewButton').on('click', function(ev) {
					
					basic.croppie('result', 'canvas').then(function (resp) {
						popupResult({
							src: resp
						});
						
						var dataUrl = resp.substring(resp.indexOf("iVBOR"));
						
//	 					console.log(dataUrl);
						
						$('#userProfileInfo').val(dataUrl);
						
					});
					

				});
				

			}
	     
	     function popupResult(result) {
				
				console.table(result);
				var html;
				if (result.html) {
					html = result.html;
				}
				if (result.src) {
					html = '<img src="' + result.src + '" />';
				}
				swal({
					title: '',
					html: true,
					text: html,
					allowOutsideClick: true,
					confirmButtonText: "확인",
          	        confirmButtonColor: "#21BA45"
				},
				function() {
					
					$('.profile.photo.change.modal .positive.button').removeClass('disabled');
					
					//profile photo change positive button
				});
//	 			setTimeout(function(){
//	 				$('.sweet-alert').css('margin', function() {
//	 					var top = -1 * ($(this).height() / 2),
//	 						left = -1 * ($(this).width() / 2);

//	 					return top + 'px 0 0 ' + left + 'px';
//	 				});
//	 			}, 1);
			}
		
		
		
	});

	
	
})(jQuery);








