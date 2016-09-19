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
 
 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/sidebar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/form.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/transition.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/modal.min.js"/>"></script> 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/dimmer.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/checkbox.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/api.min.js"/>"></script>
    
    
    
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
     
     
      $form = $('.ui.form');
      
    
     
//       if('${errorUser}' == '') {
    	  
//     	  $('.ui.icon.header > p').text("로그인부터 다시시도해주세요.");
//     	  $('.actions > a').attr("href", "<c:url value='/login'/>");
    	  
//     	  $('.ui.small.basic.modal')
//     	  .modal({ closable  : false})
//     	  .modal('show');		
//       }
      
      
      
//       $('.ui.negative.message')
//       .transition('pulse')
//       ;
      
//       $('.message .close')
//       .on('click', function() {
//     	  $(this)
//          .closest('.message')
//          .transition('fade')
//          ;
//       })
//       ;
    

     
     
     
      
      
      
      
      
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
      $.fn.api.settings.api = {
    		  'send mail' : '<c:url value="/sendAuthMail"/>'
      };
      
      
      $('#resendMailButton').api({
        action: 'send mail',  
        method: 'POST',
        stateContext: $('.ui.large.resendAuthMail.form') ,
        data: {  
        	id: '${errorUser}',
		    email: '${email}'
		},
        
        beforeXHR: function(xhr) {
        	xhr.setRequestHeader (header, token);
        },
        
        onSuccess: function (response) {   
        
        	if(response) {
        		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
            	$('.actions > a').attr("href", "<c:url value='/login'/>");
            	
            	$('.ui.small.basic.modal')
        		.modal({ closable  : false})
        		.modal('show');   
        	
        	} else {
        		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
//             	$('.actions > a').attr("href", "<c:url value='/login'/>");
            	
            	$('.ui.small.basic.modal')
        		.modal({ closable  : false})
        		.modal('show');   
        		
        	}
 
        }
        
        
   
        
        
    
      });
      
      
      
      $form.api({
          action: 'send mail',  
          method: 'POST',
          serializeForm: true,
          stateContext: $('.ui.large.resendAuthMail.form') ,
          data: {  
          	id: '${errorUser}'
  		  },
  		  
  		  beforeSend: function(settings) {
            var isValid = $form.form('is valid');
        
            if(!isValid) {
         	   return false;
            }
           
            return settings; 
          },
          
          beforeXHR: function(xhr) {
          	xhr.setRequestHeader (header, token);
          },
          
          onSuccess: function (response) {   
          
          	if(response) {
          		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
              	$('.actions > a').attr("href", "<c:url value='/login'/>");
              	
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


     
<div class="ui text container">
     
     <div class="ui icon info message">
    	<i class="icon close"></i>
    	<i class="settings icon"></i>
  <div class="content">
    <div class="header">
     	 회원정보
    </div>
  </div>
     </div>	
     
      <div class="ui stacked centered segment">
    

 
		
       <img class="ui centered medium circular image" src="<c:url value="/resources/semantic-ui/assets/images/wireframe/image.png"/>">


 
  

           <div class="ui list">
              <div class="item">   
               <i class="mini asterisk icon"></i>         
                <div class="content">
                  <div class="header">아이디</div>
                  <div class="description">${user.username}</div>
                </div>
              </div>
              <br>
              <div class="item">
                <i class="mini asterisk icon"></i>
                <div class="content">
                  <div class="header">이메일</div>             
                  <div class="description">${user.email}</div>
                </div>
              </div>
              <br>
              <div class="item">
                <i class="mini asterisk icon"></i>
                <div class="content">
                  <div class="header">닉네임</div>             
                  <div class="description">${user.nickname}</div>
                </div>
              </div>
              <br>
              <div class="item">
                <i class="mini asterisk icon"></i>
                <div class="content">
                  <div class="header">권한</div>             
                  <div class="description">
					
					
                     <sec:authentication var="role" property="principal.authorities[0]" />
                      <c:choose>
               			<c:when test="${role == 'ROLE_ADMIN'}">
                		     관리자
               			</c:when>
    		   			<c:when test="${role == 'ROLE_USER'}">
       					      일반
      		   			</c:when>
      		   		 </c:choose>
                 
				  </div>
                </div>
              </div>
              <br>
              <div class="item">
                <i class="mini asterisk icon"></i>
                <div class="content">
                  <div class="header">가입일</div>             
                  <div class="description">${user.registrationDate}</div>
                </div>
              </div>
              <br>
              <div class="item">
                <i class="mini asterisk icon"></i>
                <div class="content">
                  <div class="header">최근 로그인</div>             
                  <div class="description">${user.lastLoginDate}</div>
                </div>
              </div>
            </div>   
           







   
      
<!--     <form class="ui large resendAuthMail form" > -->
       
<!--        <div class="field"> -->
<!--         <label><i class="caret right icon"></i>이메일</label> -->
<!--           <div class="ui left icon input"> -->
<!--             <i class="mail icon"></i> -->
<%--             <input type="text" name="your-email" readonly="" placeholder="${email}"> --%>
<!--           </div> -->
<!--         </div> -->
        
<!--      <div id="resendMailButton" class="ui fluid large blue button">인증메일 재발송</div> -->
       
<!--        <br> -->
     
<!--      	<div class="field"> -->
<!--         <label><i class="caret right icon"></i>이메일</label> -->
<!--           <div class="ui left icon input"> -->
<!--             <i class="mail icon"></i> -->
<!--             <input id="email" type="text" name="email" placeholder="Yourname@yourprovider.com"> -->
<!--           </div> -->
<!--         </div> -->
        
<!--         <div class="field"> -->
<!--         <label><i class="caret right icon"></i>이메일 확인</label> -->
<!--           <div class="ui left icon input"> -->
<!--             <i class="repeat icon"></i> -->
<!--             <input type="text" name="confirm-email" placeholder="Yourname@yourprovider.com"> -->
<!--           </div> -->
<!--         </div> -->
<!--      <div class="ui fluid large submit button">신규 메일주소로 발송</div> -->
<!--      </form> -->
      
<div class="ui vertical three basic buttons">
  <a class="ui button" href="<c:url value="/modifyUserInfo"/>">
   <i class="user icon"></i>
       회원정보 변경
  </a>
  <a class="ui button" href="#modifyUserPassword">
   <i class="privacy icon"></i>
       비밀번호 변경
  </a>
  <a class="ui button" href="#">
  <i class="remove circle icon"></i>
      탈퇴
  </a>
</div>
      
      </div>
      
    
    
</div>




 
            
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

	

</body>
</html>