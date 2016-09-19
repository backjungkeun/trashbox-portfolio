<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
  <!-- Anonymous right Sidebar Menu  -->
  <sec:authorize access="isAnonymous()">
    <div class="ui vertical inverted sidebar right menu ">
      <div id="user-info-box" class="item"></div>
      <a class="teal item" href="<c:url value="/signup"/>">회원가입</a>
      <a id="login-button" class="green item" href="<c:url value="/login"/>">로그인</a>
    </div>
  </sec:authorize>
	
  <!-- Authenticated right Sidebar Menu  -->
  <sec:authorize access="isAuthenticated()">
   <sec:authentication var="user" property="principal" />
    <div class="ui vertical inverted sidebar right menu ">
      <div id="user-info-box" class="item">
        <div class="ui tiny circular image">
          <img src="<c:url value="/resources/photo_upload_profile/${user.profileImage}"/>">
        </div>
        <div class="ui center aligned container">
          <h2 class="user-id"><sec:authentication property="principal.nickname" /></h2>
         
        </div>
      </div>
      <a class="orange item" href="<c:url value="/userInfo"/>">회원 정보</a>
      <a class="blue item">알림
        <div id="notification-label" class="ui blue label">2</div>
      </a>
      <a class="teal item" href="<c:url value="/messageBox"/>">메시지</a>
      <a class="orange item">스팸
        <div class="ui orange label">3</div>
      </a>
      <a class="violet item" href="<c:url value="/setting"/>">설정</a>
    
      <a id="logout-button" class="red item">로그아웃</a>
    </div>
  </sec:authorize>