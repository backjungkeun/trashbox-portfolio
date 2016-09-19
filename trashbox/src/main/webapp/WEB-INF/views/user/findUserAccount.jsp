<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


  <script>
  $(document)
    .ready(function() {
    	
    	$('.fixed.inverted.menu')
    	  .find('.header.item')
          .addClass('blue active')
          .prepend('<i class="search icon"></i>');
          
        $('.following.bar')
          .find('.menu .header.item')
          .addClass('blue active')
          .prepend('<i class="search icon"></i>');    	
       
    })
  ;
  </script>

  <!-- findUserAccount -->
  <div class="ui find user account alternate stripe vertical segment">
    <div class="ui center aligned grid container">
      <div class="column">
      
        <form id="find-id-form" class="ui form" onsubmit="return false;">
          <h2 class="ui header">
            <i class="circular user icon"></i>
                         아이디  찾기
          </h2>
          <div class="field">
            <label>가입 이메일</label>
            <div class="ui left icon large input">
              <i class="mail icon"></i>
              <input class="my-email" type="text" name="email" placeholder="E-mail">
            </div>
          </div>
          <div class="ui fluid large teal button">찾기</div>                 
          <br>
        </form>
        
        <br/>
        <br/>
        
        <form id="reset-password-form" class="ui form" onsubmit="return false;">
          <h2 class="ui header">
            <i class="circular lock icon"></i>
                          비밀번호 찾기
          </h2>
          <div class="field">
            <label>아이디</label> 
            <div class="ui left icon large input">
              <i class="user icon"></i>
              <input id="id" type="text" name="id" placeholder="ID">
            </div>
          </div>
          <div class="field">
            <label>가입 이메일</label>
            <div class="ui left icon large input">
              <i class="mail icon"></i>
              <input class="my-email" type="text" name="email" placeholder="E-mail">
            </div>
          </div>
          <div class="ui fluid large blue button">발송</div>                 
        </form>
        
      </div>
    </div>
  </div>         
        
  

<script type="text/javascript" src="<c:url value="/resources/javascript/user/findUserAccount.js"/>"></script>