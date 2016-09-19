<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


	<meta name="errorUser" content="${errorUser}"/>
	<meta name="email" content="${email}"/>

  <script>
  $(document)
    .ready(function() {

        $('.fixed.inverted.menu')
        .find('.header.item')
        .addClass('blue active')
        .prepend('<i class="mail icon"></i>');
        
        $('.following.bar')
        .find('.menu .header.item')
        .addClass('blue active')
        .prepend('<i class="mail icon"></i>');  
    	
        
        
      if('${errorUser}' == '') {
    	  
//     	  $('.ui.icon.header > p').text("로그인부터 다시시도해주세요.");
//     	  $('.actions > a').attr("href", "<c:url value='/login'/>");
    	  
    	  $('.ui.small.basic.modal')
    	  .modal({ closable  : false})
    	  .modal('show');		
      }
      
      
      
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
    

       
    })
  ;
  </script>

  <!-- ResendAuthMail -->
  <div class="ui resend auth mail alternate stripe vertical segment">
    <div class="ui center aligned grid container">
      
      <div class="column">
       <c:if test="${not empty errorUser}">  
        <form class="ui resendAuthMail form" >
          <div class="ui icon negative small message">
            <i class="icon close"></i>
            <i class="lock icon"></i>
            <div class="content">
              <p>이메일 인증이 완료되지 않은 계정입니다.</p>
            </div>
          </div>
          <h2 class="ui header">
            <i class="mail icon"></i>
                        인증메일 재발송
          </h2>                                  
          <div class="field">
            <label>기존 이메일</label>
            <div class="ui left icon large input">
              <i class="mail icon"></i>
              <input type="text" name="your-email" readonly="" placeholder="${email}">
            </div>
          </div>
          <div id="resendMailButton" class="ui fluid large blue button">재발송</div>
          <br>
          <div class="field">
            <label>신규 이메일</label>
            <div class="ui left icon large input">
              <i class="mail icon"></i>
              <input id="email" type="text" name="email" placeholder="E-mail">
            </div>
          </div>
          <div class="field">
            <div class="ui left icon large input">
              <i class="repeat icon"></i>
              <input type="text" name="confirm-email" placeholder="(Repeat) E-mail">
            </div>
          </div>
          <div class="ui fluid large submit button">발송</div>                 
        </form>
       </c:if> 
      </div>
      
    </div>
  </div>         
        
     
  <!-- Email Send Final Check Modal -->
  <div class="ui small email final check modal">
    <div class="header">
            알림
    </div>
    <div class="content">
      <p><em>${email}</em> 에 이메일을 보내겠습니까?</p>
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
  
  <div class="ui small basic modal">
    <div class="ui icon header">
      <i class="child icon"></i>
      <p>로그인부터 다시 시도해주세요.</p>
    </div>
    <div class="actions">
      <a class="ui green ok inverted button" href="<c:url value='/login'/>">
    	<i class="checkmark icon"></i>
       	 확인   
      </a>
    </div>
  </div>

<script type="text/javascript" src="<c:url value="/resources/javascript/user/resendAuthMail.js"/>"></script>