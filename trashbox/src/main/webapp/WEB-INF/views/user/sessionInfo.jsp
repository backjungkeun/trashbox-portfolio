<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


  <script>
  $(document)
    .ready(function() {
    	
    	$('.fixed.inverted.menu')
        .find('.header.item')
        .addClass('orange active')
        .prepend('<i class="protect icon"></i>');
        
        $('.following.bar')
        .find('.menu .header.item')
        .addClass('orange active')
        .prepend('<i class="protect icon"></i>');
    	
    	$form = $('.ui.form');
    	
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
    	
    	$('.ui.negative.message')
    	.transition('pulse');
    	
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

  <sec:authentication var="user" property="principal" />
  
  <!-- Login Session Info -->
  <div class="ui login session info alternate stripe vertical segment">
    <div class="ui center aligned grid container">
      <div class="column">
    
       <c:choose>
         <c:when test="${checkedPassword}">
           <h2 class="ui header">
             <i class="circular protect icon"></i>
                           로그인 관리
           </h2> 
           <div class="ui segment">
           <br>
             <table class="ui celled striped table">
               <thead class="center aligned">
                 <tr>
                   <th class="my header">로그인 IP</th>
                   <th class="my header">최근 접속일시</th>  
                   <th class="my header">관리</th>
                 </tr>
               </thead>
               <tbody>
                 <tr>
                   <td>${currentSession.ip}</td>
                   <td>${currentSession.lastActivity}</td>
                   <td>현재 사용중</td>
                 </tr>
                <c:forEach var="userDetail" items="${userSessionData}">
                 <tr>
                   <td>${userDetail.ip}</td>
                   <td>${userDetail.lastActivity}</td>
                   <td><a href="<c:url value="/logoutSession?sessionId=${userDetail.sessionId}"/>">로그아웃</a></td>
                 </tr>
                </c:forEach>
               </tbody>
             </table>
           </div>
         </c:when>
              
         <c:otherwise>
           <c:url value="/loginProcess" var="loginUrl"/>
           <form class="ui large passwordCheck form" method="POST" action="${loginUrl}" >
             <h2 class="ui header">
               <i class="circular privacy icon"></i>
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
             <div class="ui fluid large orange submit button">재확인</div>
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

