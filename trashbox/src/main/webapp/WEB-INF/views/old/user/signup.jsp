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
    <title>SignUp - TrashBox</title>  
    
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

      $('#terms-info').on('click', function() {
     	  $('.ui.small.terms.modal').modal('show');		

      });
     
      
      $form = $('.ui.form');
  
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
      $.fn.api.settings.api = {
    		  'create user' : '<c:url value="/registerUserAccount"/>', 
      };
      
      
      $form.api({
        action: 'create user',  
        method: 'POST',
        stateContext: $('.signup.segment'),
        serializeForm: true,
        data: {},
        
        beforeXHR: function(xhr) {
        	xhr.setRequestHeader (header, token);
        },
        
        beforeSend: function(settings) {
           var isValid = $form.form('is valid');
           
           if(!isValid) {
        	   return false;
           }
          
           return settings; 
        },
        
        onSuccess: function (response) {   
        
        	if(response) {
        		$('.ui.basic.signup.success.modal')
        		.modal({ closable  : false})
        		.modal('show');   
        	}
 
        }

      });
      
      

//   $.fn.form.settings.rules.checkDuplicateId = function(value) {
//     	  var result;
    	  
//     	  if(!(value === undefined || '' === value || $.isArray(value) && value.length === 0)) {
    		 
//     		  $.ajax({
//     			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
//     			  type: "GET",
//     			  url: "<c:url value='/checkDuplicateId'/>",
//     			  data: { id: value }
    			  
//     		  }).done(function(data) {
    			  
//     			  if(data === 0) {
//     		    	  result = true;
//     		      }
    			
//     		  });
    		  
//     	  }   
//     	  return result;	  
//       }
        
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

    var $idFlag = false;
    
    $('#id').on('blur', function() {
    	var value = $(this).val();
    	var idRegExp = /^[a-z0-9]{5,20}$/;
    	
    	if(value != '' && idRegExp.test(value)) {
    		
    			$.ajax({
    	  			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
    	  			  type: "GET",
    	  			  url: "<c:url value='/checkDuplicateId'/>",
    	  			  data: { id: value }
    	  			  
    	  		  }).done(function(data) {
    	  			  
    	  		      if(data === 0) {
    	  		    	  $idFlag = true;
    	  		    	  
    	  		      } else {
    	  		    	  $idFlag = false;
    	  		      }
    	  			
    	  		  });
    	  		
    	 		 console.log('$idFlag :: ' + $idFlag);	
    		}
    

   		 
    	});
    
    $.fn.form.settings.rules.checkDuplicateId = function(value) {
    	  return $idFlag;	  
    }

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


   
      $form.form({
    	  
    	  inline: true,
    	  on: blur,
    	  
    	 
    	  fields: {
              id: {
                identifier  : 'id',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '사용할 아이디를  입력하세요.'
                  },  
                  {
                    type   : 'regExp[/^[a-z0-9]{5,20}$/]',
                    prompt : "5~20자의 영문 소문자, 숫자만 사용 가능합니다."
                  },
                  {
                	type   : 'checkDuplicateId',
                	prompt : "중복된 아이디입니다."
                  }
                ]
              },  
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
              },
            confirmPassword: {
                identifier  : 'confirm-password',
                rules: [
                  {
                    type   : 'match[password]',
                    prompt : '비밀번호가 일치하지 않습니다.'
                  }
                ]
              },
              
            terms: {
                  identifier: 'terms',
                  rules: [
                    {
                      type   : 'checked',
                      prompt : '이용약관에 동의하셔야합니다.'
                    }
                  ]
                }
              
          }
      });
    
  
       
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
    <div class="header teal item active">
             회원가입
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
              <div class="header teal item active">회원가입
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
        
        
        <!-- SignUp -->
        <div class="ui signup alternate stripe vertical segment">
          <div class="ui center aligned grid container">
            <div class="column">
              
              <form class="ui form" >
                <h2 class="ui header">
                  <i class="edit icon"></i>
                                           회원가입
                </h2>
                <div class="field">
                  <label>아이디</label> 
                  <div class="ui left icon large input">
                    <i class="user icon"></i>
                    <input id="id" type="text" name="id" placeholder="ID">
                  </div>
                </div>
                <div class="field">
                  <label>닉네임</label>
                  <div class="ui left icon large input">
                    <i class="unhide icon"></i>
                    <input id="nickname" type="text" name="nickname" placeholder="Nickname" maxlength="10">
                  </div>
                </div>
                <div class="field">
                  <label>이메일</label>
                  <div class="ui left icon large input">
                    <i class="mail icon"></i>
                    <input id="email" type="text" name="email" placeholder="E-mail">
                  </div>
                </div>
                <div class="field">
                  <div class="ui left icon large input">
                    <i class="repeat icon"></i>
                    <input type="text" name="confirm-email" placeholder="(Repeat) E-mail">
                  </div>
                </div>
                <div class="field">
                    <label>비밀번호</label>
                    <div class="ui left icon large input">
                      <i class="lock icon"></i>
                      <input type="password" name="password" placeholder="Password">
                    </div>
                </div>
                <div class="field">
                  <div class="ui left icon large input">
                    <i class="repeat icon"></i>
                    <input type="password" name="confirm-password" placeholder="(Repeat) Password">
                  </div>
                </div>
                <br>
                <div class="inline field">
                  <div class="ui checkbox">
                    <input name="terms" type="checkbox">
                    <label><a id="terms-info" style="cursor: pointer;">이용약관</a>에 동의합니다.</label>
                  </div>
                </div>
                
                <div class="ui large teal submit button">가입</div>
                <div class="ui large reset button">리셋</div>
               
              </form>
              
               <h5 class="ui header">
                <a href="<c:url value="/findUserAccount"/>">아이디/비밀번호 찾기</a>
               </h5>
    
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
  


<!-- terms modal -->
<div class="ui small terms modal">
  <i class="close icon"></i>
  <div class="header">
    <div class="ui blue basic label"><i class="info icon"></i> 이용약관</div>
  </div>
  <div class="content">
    <div class="description">
       
       <div class="ui list">
       <div id="red-item" class="item">
   	    <i class="warning circle icon"></i>
   	   	  이메일 주소를 바르게 입력바랍니다.
   	   	</div>
   	    <div class="item">
   	    <i class="right triangle icon"></i>
   	   	 가입 후 이메일 주소로 인증 메일이 발송됩니다.
   	   	</div>
   	   	<div class="item">
   	    <i class="right triangle icon"></i>
   	   	 메일 주소는 비밀번호 변경, 찾기 등에 사용됩니다.
   	   	</div>
  	   </div> 
  	   
  	  <div class="ui inverted divider"></div>
  	  
    
       <div class="ui list">
       <div id="red-item" class="item">
   	    <i class="warning circle icon"></i>
   	   	 다음과 같은 경우 제재를 받을 수 있습니다.
   	   	</div>
   	   	
  		<div class="item"><i class="right triangle icon"></i>불쾌한 내용이 포함된 글을 작성하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>같은 내용을 반복 게시(도배)하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>고의로 회원간의 분란을 조장하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>타 회원이나 운영진을 사칭하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>타인의 계정을 도용하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>관리자의 허가 없이 상업적인 활동을 하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>스팸(성인광고 등)성 게시물을 작성하는 경우</div>
  	   </div> 
      
      <div class="ui inverted divider"></div>
      
      <p>운영진은 회원이 비정상적으로 서비스를 이용한다고 판단되는 경우 경중에 따라 적절한 제재를 가할 수 있습니다.</p>
    </div>
  </div> 
</div>


<div class="ui small basic signup success modal">
    <div class="ui icon header">
      <i class="child icon"></i>
            <p> 회원가입이 완료되었습니다. </p>
            <p> 이메일을 꼭 확인해주세요.</p>           
    </div>
    <div class="actions">
      <a class="ui green ok inverted button" href="<c:url value="/main"/>">
    	<i class="checkmark icon"></i>
       	 확인   
      </a>
    </div>
</div>

	

</body>
</html>