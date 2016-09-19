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
    
    <!-- Site Properties -->
    <title>Login - TrashBox</title>  
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/javascript/library/jquery.min.js"/>"></script>
    
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
    
    
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/modal.min.js"/>"></script> 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/dimmer.min.js"/>"></script>
    
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/sidebar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/form.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/transition.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/checkbox.min.js"/>"></script>
  
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/stylesheets/trashbox-login.css"/>">  
    
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
    	
      $('.ui.form')
        .form({
          fields: {
            id: {
              identifier  : 'id',
              rules: [
                {
                  type   : 'empty',
                  prompt : '아이디를 입력하세요'
                }
              ]
            },
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
            }
          },
          
          inline: true,
          on: 'blur'
          
        })
      ;
        
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
        
    })
  ;
  </script>
</head>
<body>





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
 
        <a class="teal item"  href="<c:url value="/signup"/>">회원가입</a>
        <a id="login-button" class="active green item" href="<c:url value="/login"/>">로그인</a>
     </div>
     </sec:authorize>


<!-- Following Menu -->
    <div class="ui fixed inverted menu">
        <a id="left-sidebar-button" class="item">
            <i class="sidebar icon"></i>
        </a>
        <div class="header green item active">
         		   로그인
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
     
     
      <div class="ui stacked segment">
    <c:url value="/loginProcess" var="loginUrl"/>
    <form class="ui large form" method="POST" action="${loginUrl}">
     
        <div class="field">
          <label>아이디</label>
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="id" placeholder="ID">
          </div>
        </div>
        <div class="field">
         <label>비밀번호</label>
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password">
          </div>
        </div>
        <div class="inline field">
         <div class="ui checkbox">
          <input type="checkbox" name="rememberMe">
           <label> 
                            로그인 상태 유지
           </label>
         </div>
       </div>
        <div class="ui fluid large green submit button">로그인</div>
      
	 <sec:csrfInput />
    </form>
    
    
    </div>
    
    <div class="ui info message ">
  		 <i class="icon help"></i>
  		<a href="#">아이디/비밀번호 찾기 </a>	
    </div>
    
    <c:if test="${not empty error}"> 

    <div class="ui negative message">
    	<i class="icon close"></i>
    	<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Bad credentials'}">
 		 <p>아이디/비밀번호가 일치하지 않습니다.</p>
 		</c:if>
 		<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'User is disabled'}">
 		 <p>탈퇴된 계정입니다.</p>
 		</c:if>
 		
    </div>
    </c:if>
    
      
   
                
    </div>
        
       
</div>

 </div>
        
      









	

</body>
</html>