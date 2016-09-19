<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Standard Meta -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	
	<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
    
    <!-- Site Properties -->
    <title>ModifyUserInfo - TrashBox</title>  
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.serialize-object.min.js"/>"></script>
      
    <!-- Semantic-UI Components -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.min.js"/>"></script>
    

	<!-- Animsition -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/animsition/animsition.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/animsition/animsition.min.js"/>"></script>

    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/sweetalert/sweetalert.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/sweetalert/sweetalert.min.js"/>"></script>
    
    <!-- Croppie -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/croppie/croppie.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/croppie/croppie.min.js"/>"></script>   
              
    <!-- User Custom -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/trashbox.css"/>">
  <style type="text/css">
    #lastPreviewButton {
           position: absolute;
           bottom: 0;
           left: 0;
           margin-left: calc(50% - 48px);
           margin-bottom: 1em;
    }
    
 
  </style>
  <script>
  $(document)
    .ready(function() {
    	// page loading 
        $('.animsition').animsition({
            inClass: 'fade-in',
            outClass: 'fade-out',
            inDuration: 1500,
            outDuration: 800,
            linkElement: '.animsition-link',
            // e.g. linkElement: 'a:not([target="_blank"]):not([href^=#])'
            loading: true,
            loadingParentElement: 'body', //animsition wrapper element
            loadingClass: 'animsition-loading',
            loadingInner: '', // e.g '<img src="loading.svg" />'
            timeout: false,
            timeoutCountdown: 5000,
            onLoadEvent: true,
            browser: ['animation-duration', '-webkit-animation-duration'],
            // "browser" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
            // The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
            overlay: false,
            overlayClass: 'animsition-overlay-slide',
            overlayParentElement: 'body',
            transition: function (url) {
                window.location.href = url;
            }
        });

    	
    	 /* sidebar - start */

        // sidebar settings
        $('.ui.sidebar').sidebar({
            dimPage: true,
            transition: 'overlay',
            mobileTransition: 'overlay'
        });

        // create sidebar and attach to menu open
        $('.ui.sidebar.left')
            .sidebar('attach events', '#left-sidebar-button')
            .sidebar('attach events', '#right-sidebar-button', 'hide');

        $('.ui.sidebar.right')
            .sidebar('attach events', '#right-sidebar-button')
            .sidebar('attach events', '#left-sidebar-button', 'hide');
   
        $('.ui.sidebar.left')
            .sidebar('attach events', '#second-left-sidebar-button');
        
        $('.ui.sidebar.right')
            .sidebar('attach events', '#second-right-sidebar-button');        
        
        $('.ui.buttons > a')
            .on('click', function () {
                $(this)
                    .addClass('active')
                    .siblings()
                    .removeClass('active');
            });

        /* sidebar - end */
        
         /* modal - start */
        

    	$('.ui.buttons a.item')
                    .on('click', function () {
                        $(this)
                            .addClass('active')
                            .siblings()
                            .removeClass('active');
                    });
         
      
      
      $nicknameUpdateForm = $('#nickname-update-form');
      $emailChangeForm = $('#email-change-form');
      $profilePhotoUploadForm = $('#profile-photo-upload-form');
      
      $form = $('.ui.form').not($nicknameUpdateForm).not($emailChangeForm).not($profilePhotoUploadForm);
      
  	    
//       $.fn.form.settings.rules.checkDuplicateNickname = function(value) {
//     	  var result = false;
    	  
//     	  if(!(value === undefined || '' === value || $.isArray(value) && value.length === 0)) {
    		  
//     		  $.ajax({
//     			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
//     			  type: "GET",
//     			  url: "<c:url value='/checkDuplicateNickname'/>",
//     			  data: { nickname: value }
    			  
//     		  }).done(function(data) {
    			  
//     		      if(data === 0) {
//     		    	  result = true;
//     		      }
    			
//     		  });
    		  
//     	  }   
//     	  return result;	  
//       }
      
//       $.fn.form.settings.rules.checkDuplicateEmail = function(value) {
//     	  var result;
	  
//     	  if(!(value === undefined || '' === value || $.isArray(value) && value.length === 0)) {
    		  
//     		  $.ajax({
//     			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
//     			  type: "GET",
//     			  url: "<c:url value='/checkDuplicateEmail'/>",
//     			  data: { email: value }
    			  
//     		  }).done(function(data) {
//     			  value = (typeof value == 'string') 
//     			        ? value.toLowerCase() 
//     					: value ;
  		          
//     			  data = (typeof data == 'string') 
//     			        ? data.toLowerCase() 
//     			        : data ;
    			  
//   		          result = (value != data);
    			  
//     		  });
    		  
//     	  } 
//     	  return result;	  
//       }
       
       
     var $nicknameFlag = false;
    
    $('#nickname').on('blur', function() {
    	var value = $(this).val();
    	var nicknameRegExp = /^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]{2,10}$/gi;
    	
    	if(value != '' && nicknameRegExp.test(value)) {
    		
    		$.ajax({
    			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
    			  type: "GET",
    			  url: "<c:url value='/checkDuplicateNickname'/>",
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
    
    
    var $emailFlag = false;
    
    $('#email').on('blur', function() {
    	var value = $(this).val();	
    	var emailRegExp = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    	
    	if(value != '' && emailRegExp.test(value)) {
    		
    		$.ajax({
    			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
    			  type: "GET",
    			  url: "<c:url value='/checkDuplicateEmail'/>",
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

     
      
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
      $.fn.api.settings.api = {
    		  'update nickname' : '<c:url value="/updateNickname"/>',
    		  'send mail' : '<c:url value="/sendAuthMail"/>'
      };
      
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
      
      
      
      
	  var emailLastCheck = false;
      
      $emailChangeForm.api({
          action: 'send mail',  
          method: 'POST',
          serializeForm: true,
          stateContext: $('.modify.user.info.segment'), 
          data: {  
          	id: '<sec:authentication property="principal.username" />'
  		  },
  		  
  		  beforeSend: function(settings) {
            var isValid = $emailChangeForm.form('is valid');
            var id = '<sec:authentication property="principal.username" />'
            
            
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
          			location.href="<c:url value='/logout'/>";	
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
     
     $('.ui.small.logout.modal')
     .modal({
         closable: false,
         onApprove: function () {
             $('#logout-form').submit();
         }
     })
     .modal('attach events', '#logout-button', 'show');
     
     
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
     
     $('.table .image')
     .dimmer({
       on: 'hover'
     })
   ;
     
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
//                 data.append("test3", $("textarea[name=test3]").text());
                
                $.ajax({
                	
                	url: '<c:url value="/uploadProfilePhoto"/>',
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
   	        	 
   	         }
    	 })
    	 .modal('show');
    	 
     });
     
     
     
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
		            
// 		            $('#imageWidth').val(this.width);
		            
// 		            $('#uploadPreview')
// 		            .empty()
// 		            .append('<img src="'+ this.src +'" style="width: 100%; max-width:' + w + 'px;"><p class="dsc">' + n + '<br>' + w +' x ' + h + '<br>' + s + '<br>' + t + '<br></p><br>'); //'+n+' 
		 
// 		            console.log(this.src);
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
			$('#uploadInputBox').click();
		});	
		
		function createCroppie(url) {
			var basic = $('#uploadPreview').croppie({
				viewport: {
					width: 200,
					height: 200,
					type: 'circle'
				},
			    
				boundary: {
			        height: 300
			    }
			});
			
			basic.croppie('bind', {
				url: url				
			});	
			
// 			$('#xxxbutton').on('click', function() {
// 				basic.croppie('result', 'html').then(function (resp) {
// 					popupResult({
// 						html: resp.outerHTML
// 					});
// 				});
// 			});
			
			$('#lastPreviewButton').on('click', function(ev) {
				
				basic.croppie('result', 'canvas').then(function (resp) {
					popupResult({
						src: resp
					});
					
					var dataUrl = resp.substring(resp.indexOf("iVBOR"));
					
// 					console.log(dataUrl);
					
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
				allowOutsideClick: true
			});
// 			setTimeout(function(){
// 				$('.sweet-alert').css('margin', function() {
// 					var top = -1 * ($(this).height() / 2),
// 						left = -1 * ($(this).width() / 2);

// 					return top + 'px 0 0 ' + left + 'px';
// 				});
// 			}, 1);
		}

		
		
     
     
     
     
     
      
       
    })
  ;
  </script>
</head>
<body id="trashbox">

  <sec:authentication var="user" property="principal" />

  <!-- left Sidebar Menu -->
  <div class="ui vertical inverted sidebar left menu">
    <div class="item">
      <a class="header" href="<c:url value="/main"/>">TrashBox</a>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="#">공지사항</a>
        <a class="item" href="#">이벤트</a>
        <a class="item" href="#">출석체크</a>
      </div>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="#">강좌 / 팁</a>
        <a class="item" href="#">질문 / 답변</a>
        <a class="item" href="#">자유</a>
      </div>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="#">창작</a>
        <a class="item" href="#">장식</a>
        <a class="item" href="#">자동차</a>
        <a class="item" href="#">전기 / 전자</a>
        <a class="item" href="#">가구</a>
        <a class="item" href="#">하드웨어</a>
        <a class="item" href="#">목공</a>
        <a class="item" href="#">기타 공예</a>
      </div>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="#">업체</a>
      </div>
    </div>
  </div>

  <!-- Anonymous right Sidebar Menu  -->
  <sec:authorize access="isAnonymous()">
    <div class="ui vertical inverted sidebar right menu ">
      <div id="user-info-box" class="item"></div>
      <a class="active teal item" href="<c:url value="/signup"/>">회원가입</a>
      <a class="green item" href="<c:url value="/login"/>">로그인</a>
    </div>
  </sec:authorize>

  <!-- Authenticated right Sidebar Menu  -->
  <sec:authorize access="isAuthenticated()">
    <div class="ui vertical inverted sidebar right menu ">
      <div id="user-info-box" class="item">
        <div class="ui tiny circular image">
          <img src="<c:url value="/resources/photo_upload_profile/${user.profileImage}"/>">
        </div>
        <div class="ui center aligned container">
          <h2>${user.nickname}</h2>
         
     
        </div>
      </div>
      
      <a class="orange item active" href="<c:url value="/userInfo"/>">회원정보</a>
      <a class="item" href="#">스크랩</a>
      <a class="item" href="#">친구</a>
      <a class="blue item">알림 <div class="ui blue label">2</div></a>
      <a class="teal item">메시지<div class="ui teal label">22</div></a>
      <a class="orange item">스팸<div class="ui orange label">3</div></a>
      <a id="logout-button" class="red item">로그아웃<i class="sign out icon"></i></a>
        
    </div>
  </sec:authorize>
 
  <!-- Small Following Menu -->
  <div class="ui fixed inverted menu">
    <a id="left-sidebar-button" class="item">
      <i class="sidebar icon"></i>
    </a>
    <div class="header orange item active">
             회원정보 변경
    </div>
    <div class="right menu">
      <a class="item" href="#search">
        <i class="search icon"></i>
      </a>
      <a id="right-sidebar-button" class="item">
        <i class="user icon"></i>
      </a>
    </div>
  </div>

  <!-- Page Contents -->
  <div class="pusher">
    <div class="animsition">
      <div class="full height">

        <!-- Large Following Menu  -->
        <div class="following bar dark fixed animated fadeInDown">
          <div class="ui container">
            <div class="ui large menu inverted">
              <a id="second-left-sidebar-button" class="item">
                <i class="sidebar icon"></i>
              </a>
              <div class="header orange item active">회원정보 변경
              </div>
              <div class="right menu inverted">
                <a class="item" href="#search">
                  <i class="search icon"></i>
                </a>
                <a id="second-right-sidebar-button" class="item">
                  <i class="user icon"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Modify User Info -->
        <div class="ui modify user info alternate stripe vertical segment">
          <div class="ui center aligned grid container">
            <div class="column">
            
            <c:choose>
            
              <c:when test="${checkedPassword}">
                <h2 class="ui header">
                  <i class="protect icon"></i>
                                       회원정보 변경
                </h2>               
                <div class="ui segment">
                  <table class="ui celled striped table">
                    <tbody class="center aligned">
                      <tr>
                        <td class="four wide my header">
                                                      프로필 사진
                        </td>
                        <td class="twelve wide">
                          <div class="ui circular image">
                            <div class="ui dimmer">
                              <div class="content">
                                <div class="center">
                                  <a class="ui profile photo change basic label">
                                    <i class="edit icon"></i>변경
                                  </a>
                                </div>
                              </div>
                            </div>
                            <img class="ui small circular image" src="<c:url value="/resources/photo_upload_profile/${user.profileImage}"/>">
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="my header">
                                                      아이디
                        </td>
                        <td>${user.username}</td>
                      </tr>
                      <tr>
                        <td class="my header">
                                                       닉네임 
                        </td>
                        <td>
                          <a class="ui nickname change basic label">
                            <i class="edit icon"></i>${user.nickname}
                          </a>
                        </td>                  
                      </tr>
                      <tr>
                        <td class="my header">
                                                      이메일
                        </td>
                        <td>
                          <a class="ui email change basic label">
                            <i class="edit icon"></i>${user.email}
                          </a>                        
                        </td>                     
                      </tr>
                    <tr>
                      <td class="my header">
                                                    권한
                      </td>
                      <td>
                      <sec:authentication var="role" property="principal.authorities[0]" />
                        <c:choose>
               			  <c:when test="${role == 'ROLE_ADMIN'}">
                		       관리자
               			  </c:when>
    		   			  <c:when test="${role == 'ROLE_USER'}">
       					       일반
      		   			  </c:when>
      		   		    </c:choose>
      		   		  </td>
      		   		</tr>
      		   		<tr>
      		   		  <td class="my header">
                                                    가입일
                      </td>
                      <td>${user.registrationDate}</td>
                    </tr>
                    <tr>
                      <td class="my header">
                                                    최근 로그인
                      </td>
                      <td>${user.lastLoginDate}</td>
                    </tr>                                           
                    </tbody>
                  </table>
                  
<!--                   <div class="ui four item stackable menu"> -->
<%--                     <a class="item active" href="<c:url value="/modifyUserInfo"/>">회원정보 변경</a> --%>
<!--                     <a class="item" >로그인 관리</a> -->
<%--                     <a class="item" href="<c:url value="/modifyUserPassword"/>">비밀번호 변경</a> --%>
<!--                     <a class="item" >탈퇴</a> -->
<!--                   </div> -->
                  
                  <div class="ui nickname popup bottom center transition hidden">
                    <form id="nickname-update-form" class="ui form">
                      <div class="field">
                        <div class="ui left icon input">
                          <i class="unhide icon"></i>
                          <input id="nickname" type="text" name="nickname" placeholder="Nickname" maxlength="10">
                        </div>
                      </div>
                      <div class="ui fluid blue submit button">변경</div>
                    </form>
                  </div>
                  
                  <div class="ui email popup bottom center transition hidden">
                    <form id="email-change-form" class="ui form">
                      <div class="field">
                        <div class="ui left icon input">
                          <i class="mail icon"></i>
                          <input id="email" type="text" name="email" placeholder="E-mail">
                        </div>
                      </div>
                      <div class="field">
                        <div class="ui left icon input">
                          <i class="repeat icon"></i>
                          <input type="text" name="confirm-email" placeholder="(Repeat) E-mail">
                        </div>
                      </div>
                      <div class="ui fluid teal submit button">변경</div>
                    </form>
                  </div>
                </div>
              </c:when>

              <c:otherwise>
                <c:url value="/loginProcess" var="loginUrl"/>
                <form class="ui large passwordCheck form" method="POST" action="${loginUrl}" >
                  <h2 class="ui header">
                    <i class="privacy icon"></i>
                                              비밀번호 재확인
                  </h2>
                  <div class="field">
                    <label><i class="caret right icon"></i>아이디</label>
                    <div class="ui left icon disabled input">
                      <i class="user icon"></i>
                      <input type="text" name="id" value="${user.username}">
                    </div>
                  </div>
                  <div class="field">
                    <label><i class="caret right icon"></i>비밀번호</label>
                    <div class="ui left icon input">
                      <i class="lock icon"></i>
                      <input type="password" name="password" >
                    </div>
                  </div>
                  <div class="ui fluid large submit button">비밀번호 재확인</div>
                  <sec:csrfInput />
                  
                  <c:if test="${not empty error}">
                    <div class="ui negative message">
                      <i class="icon close"></i>
                      <p>비밀번호가 일치하지 않습니다.</p>
                    </div>
                  </c:if>
                </form>
              </c:otherwise>

            </c:choose>        
                  
            </div>
          </div>
        </div>            
        

      </div> 
      <!-- full height end -->   
    
      <!-- footer -->
      <div class="ui inverted vertical footer segment">
        <div class="ui container">
          <div class="ui stackable inverted divided equal height stackable grid">
            <div class="three wide column">
              <h4 class="ui inverted header">About</h4>
              <div class="ui inverted link list">
                <a href="#" class="item">Sitemap</a>
                <a href="#" class="item">Contact Us</a>
                <a href="#" class="item">Religious Ceremonies</a>
                <a href="#" class="item">Gazebo Plans</a>
              </div>
            </div>
            <div class="three wide column">
              <h4 class="ui inverted header">Services</h4>
              <div class="ui inverted link list">
                <a href="#" class="item">Banana Pre-Order</a>
                <a href="#" class="item">DNA FAQ</a>
                <a href="#" class="item">How To Access</a>
                <a href="#" class="item">Favorite X-Men</a>
              </div>
            </div>
            <div class="seven wide column">
              <h4 class="ui inverted header">Footer Header</h4>
              <p>Extra space for a call to action inside the footer that could help re-engage users.</p>
            </div>
          </div>
        </div>
      </div> 
      
    </div>
    <!-- animistion end-->
  </div>
  <!-- pusher end -->

  <sec:authorize access="isAuthenticated()">
  
  <c:url var="logoutUrl" value="/logout"/>
  <form id="logout-form"action="${logoutUrl}" method="post">
    <sec:csrfInput />
  </form>
  
  <!-- logout modal -->
  <div class="ui small logout modal">
    <div class="header">
            로그아웃
    </div>
    <div class="content">
      <p>정말 로그아웃 하시겠습니까?</p>
    </div>
    <div class="actions">
      <div class="ui negative button">
                취소
      </div>
      <div class="ui positive right labeled icon button">
                확인
       <i class="checkmark icon"></i>
      </div>
    </div>
  </div>
  
  </sec:authorize>  
 

 
         

<!-- <div class="ui small basic modal"> -->
<!--     <div class="ui icon header"> -->
<!--       <i class="child icon"></i> -->
<!--             <p></p>        -->
<!--     </div> -->
<!--     <div class="actions"> -->
<!--       <a class="ui green ok inverted button"> -->
<!--     	<i class="checkmark icon"></i> -->
<!--        	 확인    -->
<!--       </a> -->
<!--     </div> -->
<!-- </div> -->


  <!-- Nickname Change Final Check Modal -->
  <div class="ui small nickname final check modal">
    <div class="header">
            알림
    </div>
    <div class="content">
      <p>정말 닉네임을 변경하시겠습니까?</p>
    </div>
    <div class="actions">
      <div class="ui negative button">
               취소
      </div>
      <div class="ui positive right labeled icon button">
               확인
        <i class="checkmark icon"></i>
      </div>
    </div>
  </div> 

  <!-- Nickname Change Result Modal -->
<!--   <div class="ui small nickname change result modal"> -->
<!--     <h2 class="ui center aligned icon header"> -->
<!--       <i class="inverted green circular check icon"></i> -->
<!--     </h2> -->
<!--     <h2 class="ui center aligned header"> -->
<!--              닉네임 변경 -->
<!--     </h2>  -->
<!--     <div class="content"> -->
<!--       <p>닉네임이 성공적으로 변경되었습니다.</p> -->
<!--     </div> -->
<!--     <div class="actions"> -->
<%--       <a class="ui positive right labeled icon button" href="<c:url value="/modifyUserInfo"/>"> --%>
<!--     	<i class="checkmark icon"></i> -->
<!--        	 확인    -->
<!--       </a> -->
<!--     </div> -->
<!--   </div> -->

  <!-- Email Change Final Check Modal -->
  <div class="ui small email final check modal">
    <div class="header">
            알림
    </div>
    <div class="content">
      <p>이메일 변경 시 기존의 이메일이 변경되며, 신규 메일로 인증메일을 보냅니다.</p>
    </div>
    <div class="actions">
      <div class="ui negative button">
               취소
      </div>
      <div class="ui positive right labeled icon button">
               확인
        <i class="checkmark icon"></i>
      </div>
    </div>
  </div> 
  
  <!-- Email Change Result Modal -->
<!--   <div id="email-result-modal" class="ui small email change result modal"> -->
<!--     <div class="ui icon header"> -->
<!--       <i class="child icon"></i> -->
<!--       <p></p> -->
<!--     </div> -->
<!--     <div class="actions"> -->
<!--       <a class="ui green ok inverted button"> -->
<!--     	<i class="checkmark icon"></i> -->
<!--        	 확인    -->
<!--       </a> -->
<!--     </div> -->
<!--   </div> -->

  <!-- Profile Photo Change Modal -->
  <div class="ui small profile photo change modal">
    <div class="header">
            프로필 사진 변경
    </div>
    <div class="content">
    
      <form id="profile-photo-upload-form" class="ui form" method="POST" enctype="multipart/form-data">
        <div class="ui center aligned segment">
			<div id="uploadPreview">
			  <img class="ui small centered circular image" src="<c:url value="/resources/photo_upload_profile/${user.profileImage}"/>">
			</div>
			
			<input type="file" class="upload" id="uploadInputBox" name="Filedata" style="display: none;"/>
			<input type="hidden" id="userProfileInfo" name="userProfileInfo"/>
        </div>
      </form>
    </div>
    <div class="actions">
      <div class="ui small attach file primary button">
                            파일첨부
      </div>
      
<!--       <div id="lastPreviewButton" class="ui last preview button"> -->
<!--                미리보기 -->
<!--       </div> -->
      
      <div class="ui negative button">
               취소
      </div>
      <div class="ui positive right labeled icon button">
               확인
        <i class="checkmark icon"></i>
      </div>
    </div>
  </div> 

	

</body>
</html>