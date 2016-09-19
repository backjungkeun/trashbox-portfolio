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
    <title>MyPage - TrashBox</title>  
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/javascript/library/jquery.min.js"/>"></script>
    
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/assets/library/jquery.serialize-object.min.js"/>"></script>
    
    <!-- Semantic-UI Components -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/reset.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/site.min.css"/>">

    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/container.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/grid.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/header.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/image.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/menu.min.css"/>">

	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/sidebar.min.css"/>">   
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/divider.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/segment.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/form.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/input.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/button.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/list.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/message.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/icon.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/transition.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/label.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/modal.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/dimmer.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/checkbox.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/item.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/dropdown.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/accordion.min.css"/>">
 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/sidebar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/form.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/transition.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/modal.min.js"/>"></script> 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/dimmer.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/checkbox.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/api.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/dropdown.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/accordion.min.js"/>"></script>    
    
    
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/stylesheets/trashbox-userInfo.css"/>">  
    
  <script>
  $(document)
    .ready(function() {
    	
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
     
     
     
      
      $('.ui.dropdown')
      	.dropdown()
      ;
      
      
      $('.ui.gender.dropdown')
    	.dropdown('set selected', 'male');
     
      $('.ui.birthdate.year.dropdown')
  	    .dropdown('set selected', '1989');
      
      $('.ui.birthdate.month.dropdown')
	    .dropdown('set selected', '4');
      
      $('.ui.birthdate.day.dropdown')
	    .dropdown('set selected', '10');
      
      
      
      
      $nicknameUpdateForm = $('#nickname-update-form');
      $emailChangeForm = $('#email-change-form');
      $passwordChangeForm = $('#password-change-form');
      
      $form = $('.ui.form').not($nicknameUpdateForm).not($emailChangeForm).not($passwordChangeForm);
      
  	    
      $.fn.form.settings.rules.checkDuplicateNickname = function(value) {
    	  var result = false;
    	  
    	  if(!(value === undefined || '' === value || $.isArray(value) && value.length === 0)) {
    		  
    		  $.ajax({
    			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
    			  type: "GET",
    			  url: "<c:url value='/checkDuplicateNickname'/>",
    			  data: { nickname: value }
    			  
    		  }).done(function(data) {
    			  
    		      if(data === 0) {
    		    	  result = true;
    		      }
    			
    		  });
    		  
    	  }   
    	  return result;	  
      }
      
      $.fn.form.settings.rules.checkDuplicateEmail = function(value) {
    	  var result;
	  
    	  if(!(value === undefined || '' === value || $.isArray(value) && value.length === 0)) {
    		  
    		  $.ajax({
    			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
    			  type: "GET",
    			  url: "<c:url value='/checkDuplicateEmail'/>",
    			  data: { email: value }
    			  
    		  }).done(function(data) {
    			  value = (typeof value == 'string') 
    			        ? value.toLowerCase() 
    					: value ;
  		          
    			  data = (typeof data == 'string') 
    			        ? data.toLowerCase() 
    			        : data ;
    			  
  		          result = (value != data);
    			  
    		  });
    		  
    	  } 
    	  return result;	  
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
                      type   : 'regExp[/^[가-힣a-z0-9_-]{3,16}$/gi]',
                      prompt : '닉네임은 공백, 특수문자 제외  3-16자 이내로 입력하세요.'
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


        
        $('.ui.accordion').accordion({
        	onChange:  function() {
        		$nicknameUpdateForm.form('clear');
        		$emailChangeForm.form('clear');
        		$passwordChangeForm.form('clear');
        	}
        });
        
        
   
        
     
     
      
      
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
      $.fn.api.settings.api = {
    		  'update nickname' : '<c:url value="/updateNickname"/>',
    		  'send mail' : '<c:url value="/sendAuthMail"/>',
    		  'change password' : '<c:url value="/changePassword"/>'
      };
      
      
      $nicknameUpdateForm.api({
        action: 'update nickname',  
        method: 'POST',
        serializeForm: true,
        data: {},
       // stateContext: $('#nickname-update-button'),
        
       
        beforeXHR: function(xhr) {
        	xhr.setRequestHeader (header, token);
        },
        
        beforeSend: function(settings) {
           var isValid = $nicknameUpdateForm.form('is valid');
       
           
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
        		
        		
        		$nicknameUpdateForm.form('clear');
        		
			
        	} else {
        		window.alert('실패');
        	}
 
        }
        
        
      });
      
      
      
	  var flag = false;
      
      $emailChangeForm.api({
          action: 'send mail',  
          method: 'POST',
          serializeForm: true,
          stateContext: $emailChangeForm ,
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
            
            if(isValid && !flag) {
            
             
              $('#email-check-modal')
           	  .modal({ 
           		  closable  : false ,
           		
           		  onApprove : function() {
           			  flag = true;
           			  $emailChangeForm.submit();
           	      }
           		  
           	  })
           	  .modal('show');	
            	
              if(!flag) {
            	  return flag;
              }
              
            }
           
            return settings; 
          },
          
          beforeXHR: function(xhr) {
          	xhr.setRequestHeader (header, token);
          },
          
          onSuccess: function (response) {   
          
          	if(response) {
          		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
              	$('.actions > a').attr("href", "<c:url value='/logout'/>");
              	
              	$('#email-result-modal')
          		.modal({ closable  : false})
          		.modal('show');   
              	
              
          	
          	} else {
          		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
//               	$('.actions > a').attr("href", "<c:url value='/login'/>");
              	
              	$('#email-result-modal')
          		.modal({ closable  : false})
          		.modal('show');   
          		
          	}
   
          }
    
      
        });
      
      
      
      
      $passwordChangeForm.api({
          action: 'change password',  
          method: 'POST',
          serializeForm: true,
          data: {},
         // stateContext: $('#nickname-update-button'),
          
         
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
          		
  			
          	} else {
          		window.alert('실패');
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
     
//      $("#testButton").on('click', function() {
//     	 var phoneNum = $(".ui.large.userInfoChange.form").form('get values');
//     	 console.log(phoneNum);
//      });
     
//      $("#testButton2").on('click', function() {
    	 
//     	 $('.ui.small.test.modal')
// 		.modal({ 
// 			closable  : false,
// 			allowMultiple: false
// 		})
// 		.modal('show'); 
    	 
    	
    	 
    	 
//     	 $('.coupled.modal')
//     	  .modal({
//     	    allowMultiple: false
//     	  })
//     	;
//     	// attach events to buttons
//     	$('.second.modal')
//     	  .modal('attach events', '.first.modal .button')
//     	;
//     	// show first now
//     	$('.first.modal')
//     	  .modal('show')
//     	;
    	 
    	
//      });
     
     
     
      
       
    })
  ;
  </script>
</head>
<body>


<sec:authorize access="isAuthenticated()">
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
    
    <c:url var="logoutUrl" value="/logout"/>
	<form id="logout-form"action="${logoutUrl}" method="post">
	 <sec:csrfInput />
	</form>
</sec:authorize>



<!-- left Sidebar Menu -->
    <div class="ui vertical inverted sidebar left menu ">
        <a class="active red item" href="<c:url value="/main"/>">메인</a>
        <a class="item" href="<c:url value="/pageTest"/>">boardTest</a>
        <a class="item">Company</a>
        <a class="item">Careers</a>
        <a class="teal item">Inbox</a>
        <a class="orange item">Spam</a>
        <a class="violet item">Updates</a>
    </div>

    <!-- Anonymous right Sidebar Menu  -->
    <sec:authorize access="isAnonymous()">
    <div class="ui vertical inverted sidebar right menu ">
       <div id="user-info-box" class="item">
            <div class="ui tiny circular image">
                <img src="<c:url value="/resources/semantic-ui/assets/images/wireframe/image.png"/>">
            </div>

            <div class="ui center aligned container">
                <h2>Anonymous</h2>

                <!--<h4>-</h4>-->
            </div>
        </div>
 
        <a class="teal item" href="<c:url value="/signup"/>">회원가입</a>
        <a id="login-button" class="green item" href="<c:url value="/login"/>">로그인</a>
     </div>
     </sec:authorize>
     
     <!-- Authenticated right Sidebar Menu  -->
     <sec:authorize access="isAuthenticated()">
     <div class="ui vertical inverted sidebar right menu ">
       <div id="user-info-box" class="item">
            <div class="ui tiny circular image">
                <img src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>">
            </div>

            <div class="ui center aligned container">
            	<sec:authentication var="user" property="principal" />
                <h2>${user.nickname}</h2>
               
                <h4>${user.email}</h4>
               
                
            </div>
        </div>
        <a class="blue item">
            	알림
            <div class="ui blue label">2</div>
        </a>
        <a class="teal item">
            	메시지
            <div class="ui teal label">22</div>
        </a>
        <a class="orange item">
            	스팸
            <div class="ui orange label">3</div>
        </a>
        <a class="violet item">옵션</a>
        <a class="orange item" href="<c:url value="/userInfo"/>">회원정보</a>
        <a id="logout-button" class="red item">로그아웃</a>
    </div>
    </sec:authorize>


<!-- Following Menu -->
    <div class="ui fixed inverted menu">
        <a id="left-sidebar-button" class="item">
            <i class="sidebar icon"></i>
        </a>
        <div class="header orange item active">
         		   userInfo
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



<div id="banner" class="ui inverted vertical masthead center aligned segment">

<c:choose>
	<c:when test="${checkedPassword == true}">
	
	
	<div class="ui text container">
     
     <div class="ui icon info message">
    	<i class="icon close"></i>
    	<i class="settings icon"></i>
  <div class="content">
    <div class="header">
     	 회원정보 변경
    </div>
  </div>
     </div>	
     
      <div class="ui stacked centered segment">
    
<h4 class="ui dividing header">Shipping Information</h4>
 
		
       <img class="ui centered medium circular image" src="<c:url value="/resources/semantic-ui/assets/images/wireframe/image.png"/>">

	<br>


     <div class="ui styled accordion">
  <div class="title">
    <i class="dropdown icon"></i>
         닉네임 변경
  </div>
  <div class="content">
  
   <div class="ui stacked segment">
    <form id="nickname-update-form" class="ui large form" >
        <div class="field">
          <div class="ui left icon input">
            <i class="unhide icon"></i>
            <input id="nickname" type="text" name="nickname" placeholder="${user.nickname}">
          </div>
        </div>
         
        <div id="nickname-update-button" class="ui fluid large teal submit button">변경</div>
    </form>
    </div>
  </div>
  <div class="title">
    <i class="dropdown icon"></i>
         이메일 변경 
  </div>
  <div class="content">
    
    <div class="ui stacked segment">
    <form id="email-change-form" class="ui large form" >
 
     	<div class="field">
        
          <div class="ui left icon input">
            <i class="mail icon"></i>
            <input id="email" type="text" name="email" placeholder="${user.email}">
          </div>
        </div>
        
        <div class="field">
       
          <div class="ui left icon input">
            <i class="repeat icon"></i>
            <input type="text" name="confirm-email" >
          </div>
        </div>
     <div class="ui fluid large teal submit button">신규 메일주소 변경 후 발송</div>
     </form>
     </div>
    
  </div>
  <div class="title">
    <i class="dropdown icon"></i>
         비밀번호 변경
  </div>
  <div class="content">
    
    <div class="ui stacked segment">
    <form id="password-change-form" class="ui large form" >
 
     	<div class="field">
        
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" >
          </div>
        </div>
        
        <div class="field">
       
          <div class="ui left icon input">
            <i class="repeat icon"></i>
            <input type="password" name="confirm-password" >
          </div>
        </div>
     <div class="ui fluid large teal submit button">비밀번호 변경</div>
     </form>
     </div>
    
  </div>
</div>



      
      </div>
      
    
    
</div>
	
	
	
	
	 
	</c:when>
	<c:otherwise>
	
	
	
		<div class="ui text container">
     
     <div class="ui icon info message">
    	<i class="icon close"></i>
    	<i class="privacy icon"></i>
  <div class="content">
    <div class="header">
     	 비밀번호 재확인
    </div>
  </div>
     </div>	
     
      <div class="ui stacked centered segment">
	 
	  <c:url value="/loginProcess" var="loginUrl"/>
	  <form class="ui large passwordCheck form" method="POST" action="${loginUrl}" >
       
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
     </form>
	
	</div>
	
	
	<c:if test="${not empty error}"> 

    <div class="ui negative message">
    	<i class="icon close"></i>
    	
 		 <p>비밀번호가 일치하지 않습니다.</p>
 		
    </div>
    </c:if>
	
	
</div>	
	
	</c:otherwise>
</c:choose>
     





 
            
</div>

 
        
 <div class="ui inverted vertical footer segment">
            <div class="ui container">
                <div class="ui stackable inverted divided equal stackable grid">
                    
                    <div class="seven wide column">
                        <h4 class="ui inverted header">Footer Header</h4>
                        <p>Extra space for a call to action inside the footer that could help re-engage users.</p>
                    </div>
                </div>
            </div>
</div>       



</div>




<div class="ui small basic modal">
    <div class="ui icon header">
      <i class="child icon"></i>
            <p></p>       
    </div>
    <div class="actions">
      <a class="ui green ok inverted button">
    	<i class="checkmark icon"></i>
       	 확인   
      </a>
    </div>
</div>



<div class="ui small check test modal">
    <div class="ui icon header">
      <i class="child icon"></i>
            <p>닉네임 변경 성공</p>       
    </div>
    <div class="actions">
      <a class="ui green ok inverted button" href="<c:url value="/modifyUserInfo"/>">
    	<i class="checkmark icon"></i>
       	 확인   
      </a>
    </div>
</div>


<div id="email-check-modal" class="ui small modal">
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

<div id="email-result-modal" class="ui small basic modal">
    <div class="ui icon header">
      <i class="child icon"></i>
            <p></p>       
    </div>
    <div class="actions">
      <a class="ui green ok inverted button">
    	<i class="checkmark icon"></i>
       	 확인   
      </a>
    </div>
</div>





	

</body>
</html>