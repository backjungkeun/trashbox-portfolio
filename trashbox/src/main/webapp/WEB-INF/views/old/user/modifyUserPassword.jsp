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
     
     
     
         
      
      
      $passwordChangeForm = $('#password-change-form');
      
      $form = $('.ui.form').not($passwordChangeForm);
      
 
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
  
      
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
      $.fn.api.settings.api = {
    		  'change password' : '<c:url value="/changePassword"/>'
      };
          
      
      $passwordChangeForm.api({
          action: 'change password',  
          method: 'POST',
          serializeForm: true,
          data: {},
          stateContext: $('.ui.modify.user.password.alternate.stripe.segment'),
          
         
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
          		
              	 swal({
                     title: "비밀번호 변경",
                     text: "비밀번호가 성공적으로 변경되었습니다.",
                     type: "success",           
                     confirmButtonText: "확인",
                     confirmButtonColor: "#21BA45"
                 }, function() {
                	 location.replace('<c:url value="/userInfo"/>');
                 });
          		
  			
          	} else {
             	
          		swal({
                     title: "비밀번호 변경",
                     text: "비밀번호 변경이 실패하였습니다.",
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
          <img src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>">
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
             비밀번호 변경
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
              <div class="header orange item active">비밀번호 변경
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
        
        <!-- Modify User Password -->
        <div class="ui modify user password alternate stripe vertical segment">
          <div class="ui center aligned grid container">
            <div class="column">
            
            <c:choose>
              <c:when test="${checkedPassword}">
                <form id="password-change-form" class="ui large form">
                  <h2 class="ui header">
                    <i class="protect icon"></i>
                                           비밀번호 변경
                  </h2>
                  <div class="field">
                    <div class="ui left icon input">
                      <i class="lock icon"></i>
                      <input type="password" name="password" placeholder="Password">
                    </div>
                  </div>
                  <div class="field">
                    <div class="ui left icon input">
                      <i class="repeat icon"></i>
                      <input type="password" name="confirm-password" placeholder="(Repeat) Password">
                    </div>
                  </div>
                  <div class="ui fluid large teal submit button">변경</div>
                </form>

<!-- <div class="ui accordion"> -->
<!--   <div class="title"> -->
<!--     <i class="dropdown icon"></i> -->
<!--          닉네임 변경 -->
<!--   </div> -->
<!--   <div class="content"> -->
  
   
<!--     <form id="nickname-update-form" class="ui large form" > -->
<!--         <div class="field"> -->
<!--           <div class="ui left icon input"> -->
<!--             <i class="unhide icon"></i> -->
<%--             <input id="nickname" type="text" name="nickname" placeholder="${user.nickname}"> --%>
<!--           </div> -->
<!--         </div> -->
         
<!--         <div id="nickname-update-button" class="ui fluid large teal submit button">변경</div> -->
<!--     </form> -->
    
<!--   </div> -->
<!--   <div class="title"> -->
<!--     <i class="dropdown icon"></i> -->
<!--          이메일 변경  -->
<!--   </div> -->
<!--   <div class="content"> -->
    
    
<!--     <form id="email-change-form" class="ui large form" > -->
 
<!--      	<div class="field"> -->
        
<!--           <div class="ui left icon input"> -->
<!--             <i class="mail icon"></i> -->
<%--             <input id="email" type="text" name="email" placeholder="${user.email}"> --%>
<!--           </div> -->
<!--         </div> -->
        
<!--         <div class="field"> -->
       
<!--           <div class="ui left icon input"> -->
<!--             <i class="repeat icon"></i> -->
<!--             <input type="text" name="confirm-email" > -->
<!--           </div> -->
<!--         </div> -->
<!--      <div class="ui fluid large teal submit button">신규 메일주소 변경 후 발송</div> -->
<!--      </form> -->
     
    
<!--   </div> -->
<!--   <div class="title"> -->
<!--     <i class="dropdown icon"></i> -->
<!--          비밀번호 변경 -->
<!--   </div> -->
<!--   <div class="content"> -->
    
    
<!--     <form id="password-change-form" class="ui large form" > -->
 
<!--      	<div class="field"> -->
        
<!--           <div class="ui left icon input"> -->
<!--             <i class="lock icon"></i> -->
<!--             <input type="password" name="password" > -->
<!--           </div> -->
<!--         </div> -->
        
<!--         <div class="field"> -->
       
<!--           <div class="ui left icon input"> -->
<!--             <i class="repeat icon"></i> -->
<!--             <input type="password" name="confirm-password" > -->
<!--           </div> -->
<!--         </div> -->
<!--      <div class="ui fluid large teal submit button">비밀번호 변경</div> -->
<!--      </form> -->
     
    
<!--   </div> -->
<!-- </div> -->

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


	

</body>
</html>