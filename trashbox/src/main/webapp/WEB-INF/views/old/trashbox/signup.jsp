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
 
 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/sidebar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/form.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/transition.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/modal.min.js"/>"></script> 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/dimmer.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/checkbox.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/api.min.js"/>"></script>
    
    
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/stylesheets/trashbox-signup.css"/>">  
    
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
    
      $('#terms-info').on('click', function() {
     	  $('.ui.small.terms.modal').modal('show');		

      });
      
     
      
      
      
      
      
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
      $.fn.api.settings.api = {
    		  'create user' : '<c:url value="/registerUserAccount"/>', 
      };
      
      
      $form.api({
        action: 'create user',  
        method: 'POST',
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
      
      
      
      
      
    	
 
      
    	  
      $.fn.form.settings.rules.checkDuplicateId = function(value) {
    	  var result;
    	  
    	  if(!(value === undefined || '' === value || $.isArray(value) && value.length === 0)) {
    		  
    		  
    		  
    		  $.ajax({
    			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
    			  type: "GET",
    			  url: "<c:url value='/checkDuplicateId'/>",
    			  data: { id: value }
    			  
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
      
      $.fn.form.settings.rules.checkDuplicateNickname = function(value) {
    	  var result;
    	  
    	  if(!(value === undefined || '' === value || $.isArray(value) && value.length === 0)) {
    		  
    		  $.ajax({
    			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
    			  type: "GET",
    			  url: "<c:url value='/checkDuplicateNickname'/>",
    			  data: { nickname: value }
    			  
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
              id: {
                identifier  : 'id',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '사용할 아이디를  입력하세요.'
                  },  
                  {
                    type   : 'regExp[/^[가-힣a-z0-9_-]{4,16}$/gi]',
                    prompt : '아이디는 공백, 특수문자 제외  4-16자 이내로 입력하세요.'
                  },
                  {
                    type : 'checkDuplicateId',
                    prompt : '이미 사용중인 아이디입니다.'
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
                      type   : 'regExp[/^[가-힣a-z0-9_-]{3,16}$/gi]',
                      prompt : '닉네임은 공백, 특수문자 제외  3-16자 이내로 입력하세요.'
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
 
        <div class="active teal item">회원가입</div>
        <a id="login-button" class="green item" href="<c:url value="/login"/>">로그인</a>
     </div>
     </sec:authorize>


<!-- Following Menu -->
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


<div id="banner" class="ui inverted vertical masthead center aligned segment">
     
     <div class="ui text container">
     
     
      <div class="ui stacked segment">
<%--     <c:url value="/registerUserAccount?${_csrf.parameterName}=${_csrf.token}" var="signupUrl"/> --%>
<%--     method="POST" enctype="multipart/form-data" action="${signupUrl}" --%>
    
    <form class="ui large form" >
        <div class="field">
        <label><i class="caret right icon"></i>아이디</label>
          <div  class="ui left icon input">
            <i class="user icon"></i>
            <input id="id" type="text" name="id" placeholder="ID">	
         </div>
        </div>
        
        <div class="field">
        <label><i class="caret right icon"></i>닉네임</label>
          <div class="ui left icon input">
            <i class="unhide icon"></i>
            <input id="nickname" type="text" name="nickname" placeholder="Nickname">
          </div>
        </div>
        
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
        
        <div class="field">
        <label><i class="caret right icon"></i>비밀번호</label>
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password">
          </div>
        </div>
        
        <div class="field">
        <label><i class="caret right icon"></i>비밀번호 확인</label>
          <div class="ui left icon input">
            <i class="repeat icon"></i>
            <input type="password" name="confirm-password" placeholder="Password">
          </div>
        </div>
        
        <div class="inline field">
         <div class="ui checkbox">
          <input name="terms" type="checkbox">
          <label> 
            <a id="terms-info" class="ui blue basic label">
             <i class="info icon"></i> 이용약관
            </a>에 동의합니다.
           </label>
         </div>
       </div>
             
        
        <div class="ui fluid large teal submit button">가입</div>
    </form>
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