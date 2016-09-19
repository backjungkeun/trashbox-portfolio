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
    	
    })
  ;
  </script>


  <sec:authentication var="user" property="principal" />

  <!-- Modify User Password -->
  <div class="ui modify user password alternate stripe vertical segment">
    <div class="ui center aligned grid container">
      <div class="column">
      
      <c:choose>
        
        <c:when test="${checkedPassword}">
          <form id="password-change-form" class="ui large form">
            <h2 class="ui header">
              <i class="circular protect icon"></i>
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
        

<script type="text/javascript" src="<c:url value="/resources/javascript/user/modifyUserPassword.js"/>"></script>  