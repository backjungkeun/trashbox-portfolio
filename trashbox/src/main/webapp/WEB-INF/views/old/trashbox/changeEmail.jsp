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
    <title>resendAuthMail - TrashBox</title>  
    
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/step.min.css"/>">
 
 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/sidebar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/form.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/transition.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/modal.min.js"/>"></script> 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/dimmer.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/checkbox.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/api.min.js"/>"></script>
    
    
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/stylesheets/trashbox-changeEmail.css"/>">  
    
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

        $('.ui.sidebar.menu a.item')
            .on('click', function () {
                $(this)
                    .addClass('active')
                    .siblings()
                    .removeClass('active');
            });

        /* sidebar - end */

    	
     
     
      $form = $('.ui.form');
      
    
     
      if('${checkedPassword}' != 'true') {
    	  
    	  $('.ui.icon.header > p').text("비밀번호 확인.");
    	  $('.actions > a').attr("href", "<c:url value='/modifyUserInfo'/>");
    	  
    	  $('.ui.small.basic.modal')
    	  .modal({ closable  : false})
    	  .modal('show');		
      }
      
      
      
      $('.ui.info.message')
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
    		  'send mail' : '<c:url value="/sendAuthMail"/>'
      };
      
      
      var flag = false;
      
      $form.api({
          action: 'send mail',  
          method: 'POST',
          serializeForm: true,
          stateContext: $('.ui.large.resendAuthMail.form') ,
          data: {  
          	id: '<sec:authentication property="principal.username" />'
  		  },
  		  
  		  beforeSend: function(settings) {
            var isValid = $form.form('is valid');
            var id = '<sec:authentication property="principal.username" />'
            
            
            if(id == '') {
               return false;
            }
            
            if(!isValid) {
         	   return false;
            }
            
            if(isValid && !flag) {
            
             
              $('.ui.small.check.modal')
           	  .modal({ 
           		  closable  : false ,
           		
           		  onApprove : function() {
           			  flag = true;
           			  $form.submit();
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
              	
              	$('.ui.small.basic.modal')
          		.modal({ closable  : false})
          		.modal('show');   
              	
              
          	
          	} else {
          		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
//               	$('.actions > a').attr("href", "<c:url value='/login'/>");
              	
              	$('.ui.small.basic.modal')
          		.modal({ closable  : false})
          		.modal('show');   
          		
          	}
   
          }
    
      
        });
      
      
      
     
      
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
   	  
    
       
      
      $form.form({
    	  
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
      
      
      
      
       
    })
  ;
  </script>
</head>
<body>

	<c:url var="logoutUrl" value="/logout"/>
    <form id="logout-form"action="${logoutUrl}" method="post">
      <sec:csrfInput />
    </form>



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


<!-- Following Menu -->
    <div class="ui fixed inverted menu">
        <a id="left-sidebar-button" class="item">
            <i class="sidebar icon"></i>
        </a>
        <div class="header blue item active">
         		   changeEmail
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

<c:if test="${checkedPassword == true}">  
     
<div class="ui text container">
     
     <div class="ui icon info small message">
        <i class="icon close"></i>
    	<i class="lock icon"></i>
 	   <div class="content">
        <p>이메일 변경</p>
      </div>
     </div>
     
      <div class="ui stacked segment">
    
   
      
    <form class="ui large resendAuthMail form" >
       
     	<div class="field">
        <label><i class="caret right icon"></i>이메일</label>
          <div class="ui left icon input">
            <i class="mail icon"></i>
            <input id="email" type="text" name="email" placeholder="Yourname@yourprovider.com">
          </div>
        </div>
        
        <div class="field">
        <label><i class="caret right icon"></i>이메일 확인</label>
          <div class="ui left icon input">
            <i class="repeat icon"></i>
            <input type="text" name="confirm-email" placeholder="Yourname@yourprovider.com">
          </div>
        </div>
     <div class="ui fluid large submit button">신규 메일주소 변경 후 발송</div>
     </form>
      </div>
       
    
    
</div>


 </c:if>  

 
            
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



<div class="ui small check modal">
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

	

</body>
</html>