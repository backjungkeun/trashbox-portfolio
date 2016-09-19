<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

  <script>
  $(document)
    .ready(function() {
    	
    	$('.fixed.inverted.menu')
        .find('.header.item')
        .addClass('orange active')
        .prepend('<i class="info icon"></i>');
        
        $('.following.bar')
        .find('.menu .header.item')
        .addClass('orange active')
        .prepend('<i class="info icon"></i>');
    	
    })
  ;
  </script>

  <sec:authentication var="user" property="principal" />

  <!-- User Info -->
  <div class="ui user info alternate stripe vertical segment">
    <div class="ui center aligned grid container">
      
      <div class="column">
        <h2 class="ui header">
          <i class="circular info icon"></i>
                     회원 정보
        </h2>             
        <div class="ui segment">
          <table class="ui celled striped table">
            <tbody class="center aligned">
              <tr>
                <td class="four wide my header">
                                    프로필 사진
                </td>
                <td class="twelve wide">
                  <img class="ui small circular image" src="<c:url value="/resources/photo_upload_profile/${user.profileImage}"/>">  
                </td>
              </tr>
              <tr>
                <td class="my header">
                                    아이디
                </td>
                <td>${user.username}</td>
              </tr>
              <tr>
                <td class="my header">
                                    닉네임
                </td>
                <td>${user.nickname}</td>
              </tr>
              <tr>
                <td class="my header">
                                    이메일
                </td>
                <td>${user.email}</td>
              </tr>
              <tr>
                <td class="my header">
                                    권한
                </td>
                <td>
                <sec:authentication var="role" property="principal.authorities[0]" />
                 <c:choose>
                   <c:when test="${role == 'ROLE_ADMIN'}">
                                               관리자
                   </c:when>
    		   	   <c:when test="${role == 'ROLE_USER'}">
       			               일반
      		   	   </c:when>
      		   	 </c:choose>
      		   	</td>
      		  </tr>
      		  <tr>
      		    <td class="my header">
                                     가입일
                </td>
                <td>${user.registrationDate}</td>
              </tr>
              <tr>
                <td class="my header">
                                     최근 로그인
                </td>
                <td>${user.lastLoginDate}</td>
              </tr>
            </tbody>
          </table>
          
          <div class="ui four item stackable menu">
            <a class="item" href="<c:url value="/modifyUserInfo"/>">회원정보 변경</a>
            <a class="item" href="<c:url value="/sessionInfo"/>">로그인 관리</a>
            <a class="item" href="<c:url value="/modifyUserPassword"/>">비밀번호 변경</a>
            <a class="item" href="<c:url value="/leave"/>">탈퇴</a>
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


