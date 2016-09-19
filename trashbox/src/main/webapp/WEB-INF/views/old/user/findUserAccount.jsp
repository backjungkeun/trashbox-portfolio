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
    <title>findUserAccount - TrashBox</title>  
    
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
              
    <!-- User Custom -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/trashbox.css"/>">

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
        
        $('.ui.sidebar.menu a.item')
            .on('click', function () {
                $(this)
                    .addClass('active')
                    .siblings()
                    .removeClass('active');
            });

        /* sidebar - end */

    	
     
     
      $form = $('.ui.form');
      
    
     
//       if('${errorUser}' == '') {
    	  
// //     	  $('.ui.icon.header > p').text("로그인부터 다시시도해주세요.");
// //     	  $('.actions > a').attr("href", "<c:url value='/login'/>");
    	  
//     	  $('.ui.small.basic.modal')
//     	  .modal({ closable  : false})
//     	  .modal('show');		
//       }
      
      
      
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
    

     
     
     
      
      
      
      
      
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
      $.fn.api.settings.api = {
    		  'find id by email' : '<c:url value="/findIdByEmail" />',
    		  'reset password' : '<c:url value="/sendResetPasswordMail"/>'
//     		  'check user' : '<c:url value="/checkUserByIdAndEmail"/>'
    		  
      };
      
      var flagOne = false;
      
      $('#resendMailButton').api({
        action: 'send mail',  
        method: 'POST',
        stateContext: $('.resend.auth.mail.segment') ,
        data: {  
        	id: '${errorUser}',
		    email: '${email}'
		},
		
		beforeSend: function(settings) {
			
// 			if('${errorUser}' == '') {
// 				return false;	
// 			}
		
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
//         		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
//             	$('.actions > a').attr("href", "<c:url value='/login'/>");
            	
//             	$('.ui.small.basic.modal')
//         		.modal({ closable  : false})
//         		.modal('show');   
   
        		swal({
          			title: "E-mail",
          			text: "이메일 보내기가 성공하였습니다.",
          			type: "success",
          			confirmButtonText: "확인",
          			confirmButtonColor: "#21BA45"	
          		}, function() {
          			location.replace("<c:url value='/login'/>");	
          		});

        	
        	} else {
//         		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
// //             	$('.actions > a').attr("href", "<c:url value='/login'/>");
            	
//             	$('.ui.small.basic.modal')
//         		.modal({ closable  : false})
//         		.modal('show');   

        		swal({
          			title: "E-mail",
          			text: "이메일 보내기가 실패하였습니다. 로그인부터 다시 시도해주세요.",
          			type: "error",
          			confirmButtonText: "확인",
          			confirmButtonColor: "#21BA45"	
          		}, function() {
         			location.replace("<c:url value='/login'/>");
          		});
        		
        	}
 
        }
        
        
   
        
        
    
      });
      
      
//       var flagTwo = false;
      
//       $form.api({
//           action: 'send mail',  
//           method: 'POST',
//           serializeForm: true,
//           stateContext: $('.resend.auth.mail.segment') ,
//           data: {  
//           	id: '${errorUser}'
//   		  },
  		  
//   		  beforeSend: function(settings) {
//             var isValid = $form.form('is valid');
            
//             console.log(settings.data.email);
            
// 			if('${errorUser}' == '') {
// 			   return false;	
// 			}
        
//             if(!isValid) {
//          	   return false;
//             }
            
// 			if(!flagTwo) {				
// 				$('.email.final.check.modal .content > p > em').text(settings.data.email);
				
// 				$('.ui.email.final.check.modal')
// 				.modal({
// 					closable  : false,
// 					onApprove : function() {
// 						flagTwo = true;
// 						$form.submit();
// 					}
// 				})
// 				.modal('show');	
				
// 			}
			
// 			if(!flagTwo) {
// 				return flagTwo;	
// 			}
            
           
//             return settings; 
//           },
          
//           beforeXHR: function(xhr) {
//           	xhr.setRequestHeader (header, token);
//           },
          
//           onSuccess: function (response) {   
          
//           	if(response) {
// //           		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
// //               	$('.actions > a').attr("href", "<c:url value='/login'/>");
              	
// //               	$('.ui.small.basic.modal')
// //           		.modal({ closable  : false})
// //           		.modal('show');  

//         		swal({
//           			title: "E-mail",
//           			text: "이메일 보내기가 성공하였습니다.",
//           			type: "success",
//           			confirmButtonText: "확인",
//           			confirmButtonColor: "#21BA45"	
//           		}, function() {
//           			location.replace("<c:url value='/login'/>");	
//           		});
          	
//           	} else {
// //           		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
// // //               	$('.actions > a').attr("href", "<c:url value='/login'/>");
              	
// //               	$('.ui.small.basic.modal')
// //           		.modal({ closable  : false})
// //           		.modal('show');   

//         		swal({
//           			title: "E-mail",
//           			text: "이메일 보내기가 실패하였습니다. 로그인부터 다시 시도해주세요.",
//           			type: "error",
//           			confirmButtonText: "확인",
//           			confirmButtonColor: "#21BA45"	
//           		}, function() {
//          			location.replace("<c:url value='/login'/>");
//           		});
          		
//           	}
   
//           }
    
      
//         });
      
      
      
     
      
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
   	  
//     var $emailFlag = false;
    
//     $('input.my-email').on('blur', function() {
    	
//     	var value = $(this).val();	
//     	var emailRegExp = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    	
//     	if(value != '' && emailRegExp.test(value)) {
    		
//     		$.ajax({
//     			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
//     			  type: "GET",
//     			  url: "<c:url value='/checkDuplicateEmail'/>",
//     			  data: { email: value }
    			  
//     		  }).done(function(data) {

//     		      if(data === 0) {
//     		    	  $emailFlag = false;
    		    	  
//     		      } else {
//     		    	  $emailFlag = true;
//     		      }
    			
//     		  });
//     		 console.log('$emailFlag :: ' + $emailFlag);
    		 
//     	}
    	
    	
//     });


//     $.fn.form.settings.rules.checkDuplicateEmail = function(value) {
//     	return $emailFlag; 	
//     }

    
    
    $('#find-id-form .button').api({
    	action: 'find id by email', 
    	method: 'POST',
    	serializeForm: true,
    	stateContext: $('.find.user.account.segment'),
    	loadingDuration: 2000,

//         data: {  
//         	email: '${errorUser}'
//         },
        
        beforeSend: function(settings) {
        	var isValid = $('#find-id-form').form('is valid');
        	console.log(settings.data.email);	
        	
        	console.log(settings.stateContext);
        	
//         	if(!$emailFlag) {
//         		return false;
//         	}
        	
//         	if('${errorUser}' == '') {
//         		return false;	
//         	}
        	
        	if(!isValid) {
        		return false;
        	}
        	
//         	if(!flagTwo) {	
//         		$('.email.final.check.modal .content > p > em').text(settings.data.email);
			
// 			$('.ui.email.final.check.modal')
// 			.modal({
// 				closable  : false,
// 				onApprove : function() {
// 					flagTwo = true;
// 					$form.submit();
// 				}
// 			})
// 			.modal('show');	
			
// 		}
		
// 		if(!flagTwo) {
// 			return flagTwo;	
// 		}
       
      
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
     			location.replace("<c:url value='/login'/>");	
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
			  url: "<c:url value='/checkUserByIdAndEmail'/>",
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
//     	loadingDuration: 2000,

//         data: {  
//         	email: '${errorUser}'
//         },
        
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
//                  closeOnConfirm: false,
//                  closeOnCancel: false
              
        		}, function(isConfirm) {
        			
        			if(isConfirm) {
        				$lastCheckPasswordRest = true;
                        $('#reset-password-form .button').click();
//                        location.replace("<c:url value='/login'/>");
                       
        			} else {
        				$lastCheckPasswordRest = false;
        			}
        			
        			
        		});
            	
            	
//             	return false;
            
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
            	
//         	if(!checkFlag) {
//         		return false;
//         	} 
        	
//         	return settings; 
        
        	
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
//         			showLoaderOnConfirm: true,
//         			cancelButtonText: "취소"
//                  closeOnConfirm: false,
//                  closeOnCancel: false
              
        		}, function() {

                   location.replace("<c:url value='/login'/>");
                   
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
//                   {
//                     type : 'checkDuplicateEmail',
//                     prompt : '해당 되는 메일로 가입된 계정이 없습니다.'
//                   }
                ]
              }
          
            
        }
    });
    
    // form button 연결
    
//     $('#find-id-form .button').on('click', function() {
    	
//     	$(this).form('submit');
//     });
    
 
    
//     $('#find-password-form .button').on('click', function() {
//     	$(this).form('submit');
//     });

      
      
      
      
       
    })
  ;
  </script>
</head>
<body id="trashbox">


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

  <!-- Small Following Menu -->
  <div class="ui fixed inverted menu">
    <a id="left-sidebar-button" class="item">
      <i class="sidebar icon"></i>
    </a>
    <div class="header orange item active">
      아이디 / 비밀번호 찾기
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
              <div class="header orange item active">아이디/비밀번호 찾기
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
        
        <!-- findUserAccount -->
        <div class="ui find user account alternate stripe vertical segment">
          <div class="ui center aligned grid container">
            <div class="column">
 
<%--                <c:if test="${not empty errorUser}">   --%>
  

                 <form id="find-id-form" class="ui form" onsubmit="return false;">
<!--                   <div class="ui icon negative small message"> -->
<!--                     <i class="icon close"></i> -->
<!--                     <i class="lock icon"></i> -->
<!--                     <div class="content"> -->
<!--                       <p>이메일 인증이 완료되지 않은 계정입니다.</p> -->
<!--                     </div> -->
<!--                   </div> -->
                  <h2 class="ui header">
                    <i class="search icon"></i>
                                              아이디  찾기
                  </h2>                                  
                  <div class="field">
                    <label>가입 이메일</label>
                    <div class="ui left icon large input">
                      <i class="mail icon"></i>
                      <input class="my-email" type="text" name="email" placeholder="E-mail">
                    </div>
                  </div>
                  <div class="ui fluid large button">찾기</div>                 
                  <br>
                  
                      
                  
                </form>
                
                <br/>
                <br/>	
  
                <form id="reset-password-form" class="ui form" onsubmit="return false;">
<!--                   <div class="ui icon negative small message"> -->
<!--                     <i class="icon close"></i> -->
<!--                     <i class="lock icon"></i> -->
<!--                     <div class="content"> -->
<!--                       <p>이메일 인증이 완료되지 않은 계정입니다.</p> -->
<!--                     </div> -->
<!--                   </div> -->
                  
                  <h2 class="ui header">
                    <i class="mail icon"></i>
                                              비밀번호 찾기
                  </h2>
                   <div class="field">
                    <label>아이디</label> 
                    <div class="ui left icon large input">
                      <i class="user icon"></i>
                      <input id="id" type="text" name="id" placeholder="ID">
                    </div>
                  </div>
                  <div class="field">
                    <label>가입 이메일</label>
                    <div class="ui left icon large input">
                      <i class="mail icon"></i>
                      <input class="my-email" type="text" name="email" placeholder="E-mail">
                    </div>
                  </div>
                  <div class="ui fluid large button">발송</div>                 
                  
                </form>

<%--                </c:if>  --%>

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

  <!-- Email Send Final Check Modal -->
  <div class="ui small email final check modal">
    <div class="header">
            알림
    </div>
    <div class="content">
      <p><em>${email}</em> 에 이메일을 보내겠습니까?</p>
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
  
  <div class="ui small basic modal">
    <div class="ui icon header">
      <i class="child icon"></i>
      <p>로그인부터 다시 시도해주세요.</p>
    </div>
    <div class="actions">
      <a class="ui green ok inverted button" href="<c:url value='/login'/>">
    	<i class="checkmark icon"></i>
       	 확인   
      </a>
    </div>
  </div>

	

</body>
</html>