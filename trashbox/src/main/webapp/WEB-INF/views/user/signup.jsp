<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

  
  <script>
  $(document)
    .ready(function() {
    
    	 $('.fixed.inverted.menu')
         .find('.header.item')
         .addClass('teal active')
         .prepend('<i class="edit icon"></i>');
         
         $('.following.bar')
         .find('.menu .header.item')
         .addClass('teal active')
         .prepend('<i class="edit icon"></i>');      
        
    })
   ;
  </script>
  
  <!-- SignUp -->
  <div class="ui signup alternate stripe vertical segment">
    <div class="ui center aligned grid container">
    
      <div class="column">
        <form class="ui form" >
          <h2 class="ui header">
            <i class="circular edit icon"></i>
                        회원가입
          </h2>
          <div class="field">
            <label>아이디</label> 
            <div class="ui left icon large input">
              <i class="user icon"></i>
              <input id="id" type="text" name="id" placeholder="ID">
            </div>
          </div>
          <div class="field">
            <label>닉네임</label>
            <div class="ui left icon large input">
              <i class="unhide icon"></i>
              <input id="nickname" type="text" name="nickname" placeholder="Nickname" maxlength="10">
            </div>
          </div>
          <div class="field">
            <label>이메일</label>
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
          <div class="field">
            <label>비밀번호</label>
            <div class="ui left icon large input">
              <i class="lock icon"></i>
              <input type="password" name="password" placeholder="Password">
            </div>
          </div>
          <div class="field">
            <div class="ui left icon large input">
              <i class="repeat icon"></i>
              <input type="password" name="confirm-password" placeholder="(Repeat) Password">
            </div>
          </div>
          <br>
          <div class="inline field">
            <div class="ui checkbox">
              <input name="terms" type="checkbox">
              <label><a id="terms-info" style="cursor: pointer;">이용약관</a><em>에 동의합니다.</em></label>
            </div>
          </div>
          
          <div class="ui two buttons">
            <div class="ui large teal submit button">가입</div>
            <div class="ui large reset button">리셋</div>
          </div>     
        </form>
        
        <h5 class="ui header">
          <a href="<c:url value="/findUserAccount"/>">아이디/비밀번호 찾기</a>
        </h5>
      </div>
          
    </div>
  </div>
             
        

<!-- terms modal -->
<div class="ui small terms modal">
  <i class="close icon"></i>
  <div class="header">
    <div class="ui blue basic label"><i class="info icon"></i> 이용약관</div>
  </div>
  <div class="content">
    <div class="description">
       
       <div class="ui list">
       <div id="red-item" class="item">
   	    <i class="warning circle icon"></i>
   	   	  이메일 주소를 바르게 입력바랍니다.
   	   	</div>
   	    <div class="item">
   	    <i class="right triangle icon"></i>
   	   	 가입 후 이메일 주소로 인증 메일이 발송됩니다.
   	   	</div>
   	   	<div class="item">
   	    <i class="right triangle icon"></i>
   	   	 메일 주소는 비밀번호 변경, 찾기 등에 사용됩니다.
   	   	</div>
  	   </div> 
  	   
  	  <div class="ui inverted divider"></div>
  	  
    
       <div class="ui list">
       <div id="red-item" class="item">
   	    <i class="warning circle icon"></i>
   	   	 다음과 같은 경우 제재를 받을 수 있습니다.
   	   	</div>
   	   	
  		<div class="item"><i class="right triangle icon"></i>불쾌한 내용이 포함된 글을 작성하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>같은 내용을 반복 게시(도배)하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>고의로 회원간의 분란을 조장하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>타 회원이나 운영진을 사칭하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>타인의 계정을 도용하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>관리자의 허가 없이 상업적인 활동을 하는 경우</div>
  		<div class="item"><i class="right triangle icon"></i>스팸(성인광고 등)성 게시물을 작성하는 경우</div>
  	   </div> 
      
      <div class="ui inverted divider"></div>
      
      <p>운영진은 회원이 비정상적으로 서비스를 이용한다고 판단되는 경우 경중에 따라 적절한 제재를 가할 수 있습니다.</p>
    </div>
  </div> 
</div>


<div class="ui small basic signup success modal">
    <div class="ui icon header">
      <i class="child icon"></i>
            <p> 회원가입이 완료되었습니다. </p>
            <p> 이메일을 꼭 확인해주세요.</p>           
    </div>
    <div class="actions">
      <a class="ui green ok inverted button" href="<c:url value="/main"/>">
    	<i class="checkmark icon"></i>
       	 확인   
      </a>
    </div>
</div>

	
<script type="text/javascript" src="<c:url value="/resources/javascript/user/signup.js"/>"></script>