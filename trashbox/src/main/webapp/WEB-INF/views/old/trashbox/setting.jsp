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
 
 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/sidebar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/form.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/transition.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/modal.min.js"/>"></script> 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/dimmer.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/checkbox.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/api.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/dropdown.min.js"/>"></script>
    
    
    
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
    

     
     
     
      
      
      
      
      
//       var token = $("meta[name='_csrf']").attr("content");
//       var header = $("meta[name='_csrf_header']").attr("content");
      
//       $.fn.api.settings.api = {
//     		  'send mail' : '<c:url value="/sendAuthMail"/>'
//       };
      
      
//       $('#resendMailButton').api({
//         action: 'send mail',  
//         method: 'POST',
//         stateContext: $('.ui.large.resendAuthMail.form') ,
//         data: {  
//         	id: '${errorUser}',
// 		    email: '${email}'
// 		},
        
//         beforeXHR: function(xhr) {
//         	xhr.setRequestHeader (header, token);
//         },
        
//         onSuccess: function (response) {   
        
//         	if(response) {
//         		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
//             	$('.actions > a').attr("href", "<c:url value='/login'/>");
            	
//             	$('.ui.small.basic.modal')
//         		.modal({ closable  : false})
//         		.modal('show');   
        	
//         	} else {
//         		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
// //             	$('.actions > a').attr("href", "<c:url value='/login'/>");
            	
//             	$('.ui.small.basic.modal')
//         		.modal({ closable  : false})
//         		.modal('show');   
        		
//         	}
 
//         }
        
        
   
        
        
    
//       });
      
      
      
//       $form.api({
//           action: 'send mail',  
//           method: 'POST',
//           serializeForm: true,
//           stateContext: $('.ui.large.resendAuthMail.form') ,
//           data: {  
//           	id: '${errorUser}'
//   		  },
  		  
//   		  beforeSend: function(settings) {
//             var isValid = $form.form('is valid');
        
//             if(!isValid) {
//          	   return false;
//             }
           
//             return settings; 
//           },
          
//           beforeXHR: function(xhr) {
//           	xhr.setRequestHeader (header, token);
//           },
          
//           onSuccess: function (response) {   
          
//           	if(response) {
//           		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
//               	$('.actions > a').attr("href", "<c:url value='/login'/>");
              	
//               	$('.ui.small.basic.modal')
//           		.modal({ closable  : false})
//           		.modal('show');   
          	
//           	} else {
//           		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
// //               	$('.actions > a').attr("href", "<c:url value='/login'/>");
              	
//               	$('.ui.small.basic.modal')
//           		.modal({ closable  : false})
//           		.modal('show');   
          		
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

     
     
     
     
      
      
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
      $.fn.api.settings.api = {
    		  'update nickname' : '<c:url value="/updateNickname"/>', 
      };
      
      
      $('.ui.nickname.update.large.form').api({
        action: 'update nickname',  
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
        
        	if(response == 1) {
        		
        		$('.ui.small.test.modal').modal('refresh').modal('hide');
        		
        		$('.ui.small.check.test.modal')
        		.modal({ closable  : false})
        		.modal('show');   
        	}
 
        }
        
        
      });






   	  
    
       
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
       
      
      $form.form({
    	  
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
                },     
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
     
     $("#testButton").on('click', function() {
    	 var phoneNum = $(".ui.large.userInfoChange.form").form('get values');
    	 console.log(phoneNum);
     });
     
     $("#testButton2").on('click', function() {
    	 
    	 $('.ui.small.test.modal')
		.modal({ 
			closable  : false,
			allowMultiple: false
		})
		.modal('show'); 
    	 
    	
    	 
    	 
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




     <c:url value="/changeUserInfo" var="changeUserInfo"/>
	  <form class="ui large userInfoChange form" method="POST" action="${changeUserInfo}" >
       
       
       <div class="field">
        <label><i class="caret right icon"></i>아이디</label>
          <div class="ui left icon disabled input">
            <i class="user icon"></i>
            <input type="text" name="id" readonly="readonly" placeholder="${user.username}">
          </div>
        </div>
        
     	<div class="field">
        <label><i class="caret right icon"></i>이메일 - <a href="<c:url value="/changeEmail"/>"><i class="edit icon"></i></a></label>
          <div class="ui left icon disabled input">
            <i class="mail icon"></i>
            <input type="text" name="email" readonly="readonly" placeholder="${user.email}">
          </div>
        </div>
        
       <div class="field">
        <label><i class="caret right icon"></i>닉네임</label>
          <div class="ui left icon input">
            <i class="unhide icon"></i>
            <input id="nickname" type="text" name="nickname" value="${user.nickname}">
          </div>
        </div>
        
        
      <h4 class="ui dividing header">Shipping Information</h4>
      
       
        
     <div class="field">
      <label>성별</label>
      <select class="ui gender dropdown" name="gender">
        <option value="">(성별)</option>
        <option value="male">남자</option>
        <option value="female">여자</option>
      </select>
    </div>
        
      <div class="sixteen wide field">
        <label for="phone">휴대폰번호</label>
        <div class="three wide fields">
   		    <div class="field">
              <select class="ui fluid dropdown selection" name="phone[]">
        		<option value="">(xxx)</option>
        		<option value="010">010</option>
        		<option value="011">011</option>
        		<option value="016">016</option>
        		<option value="017">017</option>
        		<option value="018">018</option>
        		<option value="019">019</option>
      		  </select>
   			</div>
   			 
    		<div class="field">
    		  <input type="text" name="phone[]" maxlength="4" placeholder="xxxx">
            </div>
            <div class="field">
              <input type="text" name="phone[]" maxlength="4" placeholder="xxxx">
            </div>
        </div>
      </div>  
      
      
      <div class="sixteen wide field">
        <label for="birthdate">생년월일</label>
        <div class="three wide fields">
   		    <div class="field">
              <select class="ui fluid birthdate year dropdown selection" name="birthdate[]">
        		<option value="">(년)</option>
        		<option value="2014">2014</option>
        		<option value="2013">2013</option>
        		<option value="2012">2012</option>
        		<option value="2011">2011</option>
        		<option value="2010">2010</option>
        		<option value="2009">2009</option>
        		<option value="2008">2008</option>
        		<option value="2007">2007</option>
        		<option value="2006">2006</option>
        		<option value="2005">2005</option>
        		<option value="2004">2004</option>
        		<option value="2003">2003</option>
        		<option value="2002">2002</option>
        		<option value="2001">2001</option>
        		<option value="2000">2000</option>
        		<option value="1999">1999</option>
        		<option value="1998">1998</option>
        		<option value="1997">1997</option>
        		<option value="1996">1996</option>
        		<option value="1995">1995</option>
        		<option value="1994">1994</option>
        		<option value="1993">1993</option>
        		<option value="1992">1992</option>
        		<option value="1991">1991</option>
        		<option value="1990">1990</option>
        		<option value="1989">1989</option>
        		<option value="1988">1988</option>
        		<option value="1987">1987</option>
        		<option value="1986">1986</option>
        		<option value="1985">1985</option>
        		<option value="1984">1984</option>
        		<option value="1983">1983</option>
        		<option value="1982">1982</option>
        		<option value="1981">1981</option>
        		<option value="1980">1980</option>
        		<option value="1979">1979</option>
        		<option value="1978">1978</option>
        		<option value="1977">1977</option>
        		<option value="1976">1976</option>
        		<option value="1975">1975</option>
        		<option value="1974">1974</option>
        		<option value="1973">1973</option>
        		<option value="1972">1972</option>
        		<option value="1971">1971</option>
        		<option value="1970">1970</option>
        		<option value="1969">1969</option>
        		<option value="1968">1968</option>
        		<option value="1967">1967</option>
        		<option value="1966">1966</option>
        		<option value="1965">1965</option>
        		<option value="1964">1964</option>
        		<option value="1963">1963</option>
        		<option value="1962">1962</option>
        		<option value="1961">1961</option>
        		<option value="1960">1960</option>
        		<option value="1959">1959</option>
        		<option value="1958">1958</option>
        		<option value="1957">1957</option>
        		<option value="1956">1956</option>
        		<option value="1955">1955</option>
        		<option value="1954">1954</option>
        		<option value="1953">1953</option>
        		<option value="1952">1952</option>
        		<option value="1951">1951</option>
        		<option value="1950">1950</option>
        		<option value="1949">1949</option>
        		<option value="1948">1948</option>
        		<option value="1947">1947</option>
        		<option value="1946">1946</option>
        		<option value="1945">1945</option>
        		<option value="1944">1944</option>
        		<option value="1943">1943</option>
        		<option value="1942">1942</option>
        		<option value="1941">1941</option>
        		<option value="1940">1940</option>
        		<option value="1939">1939</option>
        		<option value="1938">1938</option>
        		<option value="1937">1937</option>
        		<option value="1936">1936</option>
        		<option value="1935">1935</option>
        		<option value="1934">1934</option>
        		<option value="1933">1933</option>
        		<option value="1932">1932</option>
        		<option value="1931">1931</option>
        		<option value="1930">1930</option>
        		<option value="1929">1929</option>
        		<option value="1928">1928</option>
        		<option value="1927">1927</option>
        		<option value="1926">1926</option>
        		<option value="1925">1925</option>
        		<option value="1924">1924</option>
        		<option value="1923">1923</option>
        		<option value="1922">1922</option>
        		<option value="1921">1921</option>
        		<option value="1920">1920</option>
        		<option value="1919">1919</option>
        		<option value="1918">1918</option>
        		<option value="1917">1917</option>
        		<option value="1916">1916</option>
        		
      		  </select>
   			</div>
   			
   			<div class="field">
              <select class="ui fluid birthdate month dropdown selection" name="birthdate[]">
        		<option value="">(월)</option>
        		<option value="1">1</option>
        		<option value="2">2</option>
        		<option value="3">3</option>
        		<option value="4">4</option>
        		<option value="5">5</option>
        		<option value="6">6</option>
        		<option value="7">7</option>
        		<option value="8">8</option>
        		<option value="9">9</option>
        		<option value="10">10</option>
        		<option value="11">11</option>
        		<option value="12">12</option>
      		  </select>
   			</div> 
    		
            <div class="field">
              <select class="ui fluid birthdate day dropdown selection" name="birthdate[]">
        		<option value="">(일)</option>
        		<option value="1">1</option>
        		<option value="2">2</option>
        		<option value="3">3</option>
        		<option value="4">4</option>
        		<option value="5">5</option>
        		<option value="6">6</option>
        		<option value="7">7</option>
        		<option value="8">8</option>
        		<option value="9">9</option>
        		<option value="10">10</option>
        		<option value="11">11</option>
        		<option value="12">12</option>
        		<option value="13">13</option>
        		<option value="14">14</option>
        		<option value="15">15</option>
        		<option value="16">16</option>
        		<option value="17">17</option>
        		<option value="18">18</option>
        		<option value="19">19</option>
        		<option value="20">20</option>
        		<option value="21">21</option>
        		<option value="22">22</option>
        		<option value="23">23</option>
        		<option value="24">24</option>
        		<option value="25">25</option>
        		<option value="26">26</option>
        		<option value="27">27</option>
        		<option value="28">28</option>
        		<option value="29">29</option>
        		<option value="30">30</option>
        		<option value="31">31</option>
      		  </select>
   			</div>
        </div>
      </div> 
      
      <div class="field">
    <label>자기소개</label>
    <textarea name="minLength" cols="5"></textarea>
  </div>
      
        
        
        <div id="testButton" class="ui fluid large button">비밀번호 재확인</div>
        
        <div id="testButton2" class="ui fluid large button">test</div>
        <sec:csrfInput />
     </form>









 
  

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
            <p></p>       
    </div>
    <div class="actions">
      <a class="ui green ok inverted button">
    	<i class="checkmark icon"></i>
       	 확인   
      </a>
    </div>
</div>




<div class="ui small test modal">
   <i class="close icon"></i>
<!--     <div class="ui icon header"> -->
<!--       <i class="child icon"></i> -->
      
<!--             <p></p>        -->
<!--     </div> -->
    <div class="content">
    
    
    
    
    
    <form class="ui nickname update large form" >
        <div class="field">
        <label><i class="caret right icon"></i>닉네임</label>
          <div class="ui left icon input">
            <i class="unhide icon"></i>
            <input id="nickname" type="text" name="nickname" placeholder="Nickname">
          </div>
        </div>
         
        <div class="ui fluid large teal submit button">변경</div>
    </form>
    
    
    
    
    
    
    
    
    
    </div>
    
</div>


	

</body>
</html>