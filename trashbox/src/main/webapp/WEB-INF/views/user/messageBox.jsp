<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

  <script>
  $(document)
    .ready(function() {
    
        $('.fixed.inverted.menu')
        .find('.header.item')
        .addClass('teal active');
        
        $('.following.bar')
        .find('.menu .header.item')
        .addClass('teal active');     
      
        setTimeout(function() {
        	$('.ajax-tab.menu').children().first().click();
        	
        }, 1000);
        
       
    })
  ;
  </script>

  <sec:authentication var="user" property="principal" />

  <!-- User Message Box -->
  <div class="ui user messageBox alternate stripe vertical segment" style="padding-top:5em;">
    <div class="ui container">
    
      <div class="column">
        <h2 class="ui header" style="color: #4D4D4D;">
          <i class="circular archive icon"></i>
                메세지함
        </h2>               
        <div class="ui segment">
          <div class="ui pointing secondary stackable ajax-tab menu">
            <a class="item active" data-tab="receive">받은메세지</a>
            <a class="item" data-tab="send">보낸메세지</a>
            <a class="item" data-tab="save">저장한메세지</a>
          </div>
          
          <div class="ui tab active" data-tab="receive">
           <br>
            <h1 class="ui center aligned icon header">
              <i class="circular inbox icon"></i>
            </h1>
           <br>
          </div>
          <div class="ui tab" data-tab="send">
           <br>
            <h1 class="ui center aligned icon header">
              <i class="circular inbox icon"></i>
            </h1>
           <br>
          </div>
          <div class="ui tab" data-tab="save">
           <br>
            <h1 class="ui center aligned icon header">
              <i class="circular inbox icon"></i>
            </h1>
           <br>
          </div>
        </div>             
      </div>
    
    </div>
  </div>            
        

    


  <!-- Result Modal -->
  <div class="ui small result modal">
    <div class="header">
            알림
    </div>
    <div class="content">
      <p>content</p>
    </div>
    <div class="actions">
      <div class="ui positive right labeled icon button">
               확인
        <i class="checkmark icon"></i>
      </div>
    </div>
  </div> 
  
  
  
  <div class="ui small coupled message modal">
    <i class="close icon" style="color: rgba(0,0,0,.87)!important;"></i>
<!--     <div class="header"> -->
<!--       Message -->
      
<!--     </div> -->
    
    <h3 class="ui header">
  ${user.nickname}
  <div class="sub header">May 11, 2014</div>
</h3>
    <div class="content">
      
        
       
    </div>
    <div class="actions">
<!--       <div class="ui blue button">Save</div> -->
      <div class="ui red button">삭제</div>
       <div class="ui show-message-modal black basic right labeled icon button">
               메시지 보내기
        <i class="send icon"></i>
      </div>
<!--       <div id="message-send-button" class="ui green button">Send</div> -->
    </div>
  </div>


  <div id="send-message-modal" class="ui small coupled modal">
    <i class="close icon"></i>
    <div class="header">
      메세지 보내기
    </div>
    <div class="content">
      <form id="message-send-form" class="ui form">
        <h4 class="ui dividing header">To</h4>
        <input class="receiver no" name="receiverNo" type="hidden">
        <div class="field">
<!--           <label>Message</label> -->
          <textarea name="content"  style="resize:none;"></textarea>
        </div>
       
      </form>
    </div>
    <div class="actions">
      <div class="ui negative button">취소</div>
       <div class="ui positive right labeled icon button">
               전송
        <i class="checkmark icon"></i>
      </div>
<!--       <div id="message-send-button" class="ui green button">Send</div> -->
    </div>
  </div>

 
<%-- <script type="text/javascript" src="<c:url value="/resources/javascript/message.js"/>"></script> --%>
<script type="text/javascript" src="<c:url value="/resources/javascript/user/messageBox.js"/>"></script>  