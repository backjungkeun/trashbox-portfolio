<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- Croppie -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/croppie/croppie.css"/>">
<script type="text/javascript" src="<c:url value="/resources/vendors/croppie/croppie.min.js"/>"></script>   
              
<style type="text/css">
    #lastPreviewButton {
           position: absolute;
           bottom: 0;
           left: 0;
           margin-left: calc(50% - 48px);
           margin-bottom: 1em;
    }
</style>
<script>
 $(document)
   .ready(function() {
    
	$('.fixed.inverted.menu')
    .find('.header.item')
    .addClass('orange active')
    .text('회원정보 변경')
    .prepend('<i class="protect icon"></i>');
    
    $('.following.bar')
    .find('.menu .header.item')
    .addClass('orange active')
    .text('회원정보 변경')
    .prepend('<i class="protect icon"></i>');
    
   })
 ;
</script> 

  <sec:authentication var="user" property="principal" />

  <!-- Modify User Info -->
  <div class="ui modify user info alternate stripe vertical segment">
    <div class="ui center aligned grid container">
      <div class="column">
      
      <c:choose>
      
        <c:when test="${checkedPassword}">
          <h2 class="ui header">
            <i class="circular protect icon"></i>
                        회원정보 변경
          </h2>
          <div class="ui segment">
            <table class="ui celled striped table">
              <tbody class="center aligned">
                <tr>
                  <td class="four wide my header">
                                       프로필 사진
                  </td>
                  <td class="twelve wide">
                    <div class="ui circular image">
                      <div class="ui dimmer">
                        <div class="content">
                          <div class="center">
                            <a class="ui profile photo change basic label">
                              <i class="edit icon"></i>변경
                            </a>
                          </div>
                        </div>
                      </div>
                      <img class="ui small circular image" src="<c:url value="/resources/photo_upload_profile/${user.profileImage}"/>">
                    </div>
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
                  <td>
                    <a class="ui nickname change basic label">
                      <i class="edit icon"></i>${user.nickname}
                    </a>
                  </td>
                </tr>
                <tr>
                  <td class="my header">
                                      이메일
                  </td>
                  <td>
                    <a class="ui email change basic label">
                      <i class="edit icon"></i>${user.email}
                    </a>
                  </td>
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
                  
            <div class="ui nickname popup bottom center transition hidden">
              <form id="nickname-update-form" class="ui form">
                <div class="field">
                  <div class="ui left icon input">
                    <i class="unhide icon"></i>
                    <input id="nickname" type="text" name="nickname" placeholder="Nickname" maxlength="10">
                  </div>
                </div>
                <div class="ui fluid blue submit button">변경</div>
              </form>
            </div>
                  
            <div class="ui email popup bottom center transition hidden">
              <form id="email-change-form" class="ui form">
                <input type="hidden" name="id" value="${user.username}"/>

                <div class="field">
                  <div class="ui left icon input">
                    <i class="mail icon"></i>
                    <input id="email" type="text" name="email" placeholder="E-mail">
                  </div>
                </div>
                <div class="field">
                  <div class="ui left icon input">
                    <i class="repeat icon"></i>
                    <input type="text" name="confirm-email" placeholder="(Repeat) E-mail">
                  </div>
                </div>
                <div class="ui fluid teal submit button">변경</div>
              </form>
            </div>
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
  

  <!-- Profile Photo Change Modal -->
  <div class="ui small profile photo change modal">
    <div class="header">
            프로필 사진 변경
    </div>
    <div class="content">
    
      <form id="profile-photo-upload-form" class="ui form" method="POST" enctype="multipart/form-data">
        <div class="ui center aligned segment">
			<div id="uploadPreview">
			  <img class="ui small centered circular image" src="<c:url value="/resources/photo_upload_profile/${user.profileImage}"/>">
			</div>
			
			<input type="file" class="upload" id="uploadInputBox" name="Filedata" style="display: none;"/>
			<input type="hidden" id="userProfileInfo" name="userProfileInfo"/>
        </div>
      </form>
    </div>
    <div class="actions">
      <div class="ui small attach file primary button">
                            파일첨부
      </div>   
<!--       <div id="lastPreviewButton" class="ui last preview button"> -->
<!--                미리보기 -->
<!--       </div> -->
      
      <div class="ui negative button">
               취소
      </div>
      <div class="ui positive right labeled icon button disabled">
               확인
        <i class="checkmark icon"></i>
      </div>
    </div>
  </div> 

<script type="text/javascript" src="<c:url value="/resources/javascript/user/modifyUserInfo.js"/>"></script>
