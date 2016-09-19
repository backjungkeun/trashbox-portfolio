<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

  <script>
  $(document)
    .ready(function() {	
    	
        $('.fixed.inverted.menu')
        .find('.header.item')
        .addClass('red active')
        .prepend('<i class="warning sign icon"></i>');
        
        $('.following.bar')
        .find('.menu .header.item')
        .addClass('red active')
        .prepend('<i class="warning sign icon"></i>');
    	
        $('#leave-form .back.button')
        .on('click', function(){
        	location.replace($.trashbox.baseUrl + '/userInfo');
        });
        
    })
  ;
  </script>

  <sec:authentication var="user" property="principal" />
  
  <!-- User Leave -->
  <div class="ui user leave alternate stripe vertical segment">
    <div class="ui center aligned grid container">
      <div class="column">
      
      <c:choose>
        <c:when test="${checkedPassword}">
          <h2 class="ui header">
            <i class="circular warning sign icon"></i>
                        탈퇴 안내
          </h2>               
          <div class="ui segment">
            <h3 class="ui red header">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h3>
            <p>사용하고 계신 아이디 <em>(${user.username})</em>는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
            <p>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
            <p>탈퇴 후에도 등록한 게시물은 그대로 남아 있습니다.</p>
            <p>게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.</p>
            <p>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.</p>
            <p>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</p>
            <p>탈퇴 후에는 아이디 ${user.username} 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.</p>
            <p>남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</p>
                
            <form id="leave-form" class="ui form">
              <br>
              <div class="inline field">
                <div class="ui checkbox">
                  <input name="terms" type="checkbox">
                  <label><em style="color:red;">안내 사항을 모두 확인하였으며, 이에 동의합니다.</em></label>
                </div>
              </div>
              <br>
              <div class="ui two buttons">
                <div class="ui large red submit button">탈퇴</div>
                <div class="ui large basic black back button">취소</div>
<%--                 <div class="ui large basic back button" onclick="location.replace('<c:url value="/userInfo"/>')">취소</div> --%>
              </div>            
            </form>
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
        
    
 
  <!-- Leave Final Check Modal -->
  <div class="ui small leave final check modal">
    <div class="header">
            알림
    </div>
    <div class="content">
      <p>정말 탈퇴 하시겠습니까?</p>
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

<script type="text/javascript" src="<c:url value="/resources/javascript/user/leave.js"/>"></script>
