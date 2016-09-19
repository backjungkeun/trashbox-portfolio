<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

  <script>
  $(document)
    .ready(function() {	
    	
        $('.fixed.inverted.menu')
        .find('.header.item')
        .addClass('green active')
        .prepend('<i class="sign in icon"></i>');
        
        $('.following.bar')
        .find('.menu .header.item')
        .addClass('green active')
        .prepend('<i class="sign in icon"></i>');
    	  	   
    })
  ;
  </script>

  <!-- Login -->
  <div class="ui login alternate stripe vertical segment">
    <div class="ui center aligned grid container">
      <div class="column">
        
        <c:url value="/loginProcess" var="loginUrl"/>
        <form class="ui form" method="POST" action="${loginUrl}">
          <h2 class="ui header">
            <i class="circular sign in icon"></i>
                        로그인
          </h2>
          <div class="field">
            <label>아이디</label> 
            <div  class="ui left icon large input">
              <i class="user icon"></i>
              <input id="id" type="text" name="id" placeholder="ID">
            </div>
          </div>
          <div class="field">
            <label>비밀번호</label>
            <div class="ui left icon large input">
              <i class="lock icon"></i>
              <input type="password" name="password" placeholder="Password">
            </div>
          </div> 
          <br>             
          <div class="inline field">
            <div class="ui checkbox">
              <input type="checkbox" name="rememberMe">
              <label><em>로그인 상태 유지</em></label>
            </div>
          </div> 
          <div class="ui fluid large green submit button">로그인</div>
          <sec:csrfInput />
               
          <c:if test="${not empty error}"> 
            <div class="ui negative message">
              <i class="icon close"></i>
              <c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Bad credentials'}">
                <p>아이디/비밀번호가 일치하지 않습니다.</p>
              </c:if>
              <c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message eq '유효하지 않은 사용자입니다.'}"> <%--User is disabled --%>
                <p>탈퇴된 계정입니다.</p>
              </c:if>
              <c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Update fail'}">
                <p>다시 시도 해주세요.</p>
              </c:if>
            </div>
          </c:if>
        </form>
        
        <h5 class="ui header">
          <a href="<c:url value="/findUserAccount"/>">아이디/비밀번호 찾기</a>
        </h5>
           
<%--  <a href="<c:url value="/naverLogin"/>"> --%>
<%--    <img src="<c:url value="/resources/assets/images/login_button/2014_Login_with_NAVER_button_png/네이버 아이디로 로그인_완성형_Green.PNG"/>" style="max-width:250px; margin-left:auto; margin-right:auto;"> --%>
<!--  </a> -->
      </div>
    </div>
  </div>

<script type="text/javascript" src="<c:url value="/resources/javascript/user/login.js"/>"></script>  