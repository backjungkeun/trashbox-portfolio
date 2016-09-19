<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- left Sidebar Menu -->
  <div class="ui vertical inverted sidebar left menu">
    <div class="item">
      <a class="header" href="<c:url value="/main"/>">TrashBox</a>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="<c:url value="/board/Notice/1"/>">공지사항</a>
        <a class="item" href="<c:url value="/board/Event/1"/>">이벤트</a>
        <a class="item" href="#">출석체크</a>
      </div>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="<c:url value="/board/LectureAndTip/1"/>">강좌 / 팁</a>
        <a class="item" href="<c:url value="/board/QnA/1"/>">질문 / 답변</a>
        <a class="item" href="<c:url value="/board/Free/1"/>">자유</a>
      </div>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="<c:url value="/board/Creative/1"/>">창작</a>
        <a class="item" href="<c:url value="/board/Decorate/1"/>">장식</a>
        <a class="item" href="<c:url value="/board/Car/1"/>">자동차</a>
        <a class="item" href="<c:url value="/board/ElectricAndElectron/1"/>">전기 / 전자</a>
        <a class="item" href="<c:url value="/board/Furnishings/1"/>">가구</a>
        <a class="item" href="<c:url value="/board/Hardware/1"/>">하드웨어</a>
        <a class="item" href="<c:url value="/board/Woodworking/1"/>">목공</a>
        <a class="item" href="<c:url value="/board/Etc/1"/>">기타</a>
      </div>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="<c:url value="/board/BusinessAdvertisement/1"/>">업체광고</a>
      </div>
    </div>
  </div>
  
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
      <a class="teal item" href="<c:url value="/messageBox"/>">메시지</a>
      <a id="logout-button" class="red item">로그아웃</a>
    </div>
  </sec:authorize>