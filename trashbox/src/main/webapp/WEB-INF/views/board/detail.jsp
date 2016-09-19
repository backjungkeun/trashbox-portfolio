<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

	<meta name="boardTypeName" content="${boardType.name}"/>
	<meta name="articleNo" content="${article.no}"/>
	<meta name="articleAuthorNo" content="${article.userNo}"/>

  <!--     @blueimp Gallery styles -->
    <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/blueimp-gallery.min.css"/>">
  
  <script>
  $(document)
    .ready(function() {
    	$("#trashbox").animate({scrollTop: 0}, 100);
 
        $('.fixed.inverted.menu')
        .find('.header.item')
        .addClass('olive active')
        .prepend('<i class="cube icon"></i>');
        
        $('.following.bar')
        .find('.menu .header.item')
        .addClass('olive active')
        .prepend('<i class="cube icon"></i>');
    })
  ;
  </script>

  <sec:authentication var="user" property="principal" />

  <!-- Article Details -->
  <div class="ui vertical stripe article details segment">
    <div class="ui three column relaxed stackable grid container">
      
      <div class="row">
        <div class="sixteen wide column">
          <div class="ui segment">
            <h4 class="my header">
              ${article.title}
            </h4>
            <p class="info">
              <span style="float:left;">
                <img class="ui avatar image" src="<c:url value="/resources/photo_upload_profile/default-profile.png"/>">
                <a class="author" data-no="${article.userNo}" >${article.userNickname}</a> 
              </span>
              <span class="sum" style="margin-top: 0.5em;">
                <span class="read">조회 <b>${article.hitCount}</b></span>
                <span class="vote">추천 <b>${article.recommendCount}</b></span>
                <span class="date">작성일 <b><fmt:formatDate value="${article.registrationDate}" pattern="yyyy.MM.dd"/></b></span> 
              </span>
            </p>
            <br> 
            <br>
            <div class="article body">
              ${article.content}
            </div>
            <div class="article footer">
            <br>
            <br>
            <div id="recommend-button" class="ui labeled button" tabindex="0">
              <div class="ui red button">
                <i class="heart icon"></i>
              </div>
              <div class="ui basic red left pointing label">
                ${article.recommendCount}
              </div>
            </div>
            <br>
            <br>
            
            <!-- 게시물 옵션 버튼  -->
            <sec:authorize access="isAuthenticated() and (hasRole('ADMIN') or ${article.userNo} == principal.no)">
              <form class="ui article option form" method="POST">
                <div class="ui teal right floated buttons">
                  <div id="post_option_button" class="ui button"><i class="setting icon"></i>Option</div>
                    <div class="ui combo top right pointing dropdown icon button">
                      <i class="dropdown icon"></i>
                      <div class="menu">
                        <div class="item" data-value="edit"><i class="edit icon"></i> Edit</div>
                        <div class="item" data-value="remove"><i class="delete icon"></i> Remove</div>
                        <div class="item" data-value="hide"><i class="hide icon"></i> Hide</div>
                      </div>
                    </div>
                </div>
                <sec:csrfInput/>
              </form>
              <br>
              <br>
            </sec:authorize>
          
            </div>
          </div>
        </div>
      </div>  
              
      <div class="row">
        <div class="sixteen wide column">
          <div class="ui comments segment">
            <div class="ui minimal comments">
              <h4 class="ui dividing header" >댓글 [<span>0</span>]</h4>
              <div class="comments">
                <div id="commentsFieldInit" class="ui button" style="display:none;"></div>
              </div>
              <br>
              <br>
              <div id="commentPagination" class="pagination">
              </div>
              <br>
              <br>
              <!-- 로그인 시 -->
              <sec:authorize access="isAuthenticated()">
                <form id="reply" class="ui reply form">
                  <input type="hidden" name="articleNo" value="${article.no}">
                  <input type="hidden" name="userNo" value="${user.no}">
                  <div class="field">
                    <textarea name="content" cols="5" rows="2" style="margin-top: 0px; margin-bottom: 0px; height: 70px; resize:none;"></textarea>
                  </div>
                  <div class="ui right floated blue labeled submit icon button">
                    <i class="icon edit"></i> Add Reply
                  </div>
                  <br>
                  <br>
                </form>
              </sec:authorize>
              <!-- 비로그인 시 -->
              <sec:authorize access="isAnonymous()">
                <form class="ui reply form">
                  <div class="field disabled">
                    <textarea name="content" cols="5" rows="2" style="margin-top: 0px; margin-bottom: 0px; height: 70px; resize:none;"></textarea>
                  </div>
                  <a class="ui right floated blue labeled submit icon button" href="<c:url value="/login"/>">
                    <i class="icon edit"></i> Add Reply
                  </a>
                  <br>
                  <br>
                </form>
              </sec:authorize>
            </div>
          </div>
        </div>
      </div>
      
      <c:if test="${fn:length(attachFiles) > 0}">
      
      <!-- 첨부파일  -->
      <div class="row">
        <div class="sixteen wide column">
          <div class="ui attachfiles segment">
            <h4 class="ui dividing aligned left header">
              <i class="file icon"></i>
              <div class="content"> 
                              파일첨부 [<span>${fn:length(attachFiles)}</span>]
              </div>
            </h4>
          
            <table id="file-table" class="ui compact striped definition table">
              <tbody class="files">
                <c:forEach varStatus="status" items="${attachFiles}" var="file">
                <tr>
                  <td class="no collapsing center aligned">
                    ${status.index + 1}
                  </td>
                  <td class="preview center aligned">
                    <c:set var="fileType" value="${fn:split(file.type, '/')[0]}" /> 
                    
                    <c:choose >
                      <c:when test="${fileType eq 'image'}">
                          <a href="/trashbox/resources/file_upload/${file.saveName}" title="${file.originName}" download="${file.originName}" data-gallery=""><img src="/trashbox/resources/file_upload/${file.saveName}" style="max-width:80px;max-height:80px;"></a>
                      </c:when>
                      <c:when test="${fileType eq 'video'}">
                          비디오
                      </c:when>
                      <c:when test="${fileType eq 'text'}">
                          텍스트      
                      </c:when>
                      <c:otherwise>
                        <i class="large file icon"></i>
                      </c:otherwise>
                    </c:choose>
                 
                  </td>
                  <td class="name">
                  
                     <c:choose >
                      <c:when test="${fileType eq 'image'}">
                          <a href="/trashbox/resources/file_upload/${file.saveName}" title="${file.originName}" download="${file.originName}" data-gallery="">${file.originName}</a>
                      </c:when>
                      <c:when test="${fileType eq 'video'}">
                          비디오
                      </c:when>
                      <c:when test="${fileType eq 'text'}">
                          텍스트      
                      </c:when>
                      <c:otherwise>
                          <a href="/trashbox/resources/file_upload/${file.saveName}" title="${file.originName}" download>${file.originName}</a>
                      </c:otherwise>
                    </c:choose>
                    
                    
                  </td>
                  <td class="size">
                    ${file.size}
                  </td>
                </tr>
                </c:forEach>
                
              </tbody>
            </table>
          
          </div>
        </div>
      </div>
              
      </c:if>        
      
            
      <div class="row">
        <div class="sixteen wide column">
          <div class="ui segment">
            <table class="ui selectable compact unstackable table">
              <thead class="full-width">
                <tr>
                  <th class="nine wide center aligned title"><span>제목</span></th>
                  <th class="three wide aligned author"><span>글쓴이</span></th>
                  <th class="one wide center aligned hit"><span><a href=#>조회</a></span></th>
                  <th class="one wide center aligned recommend"><span><a href=#>추천</a></span></th>
                  <th class="one wide center aligned date"><span><a href=#>날짜</a></span></th>
                </tr>
              </thead>
              <tbody class="collapsing">
              <c:forEach varStatus="status" items="${list}" var="board">
                <c:choose>
                  <c:when test="${article.no == board.no}">
                    <tr class="active">
                  </c:when>
                  <c:otherwise>
                    <tr>
                  </c:otherwise>
                </c:choose>
                  
                  <td class="title">
   
                <c:choose>
                  <c:when test="${(listSize - status.index) == 5}">
                    <i class="angle double up icon"></i>
                  </c:when>
                  <c:when test="${(listSize - status.index) == 4}">
                    <i class="angle up icon"></i>
                  </c:when>
                  <c:when test="${(listSize - status.index) == 3}">
                    <i class="asterisk icon"></i>
                  </c:when>
                  <c:when test="${(listSize - status.index) == 2}">
                    <i class="angle down icon"></i>
                  </c:when>
                  <c:when test="${(listSize - status.index) == 1}">
                    <i class="angle double down icon"></i>
                  </c:when>
                </c:choose>
                       
                <c:choose>
                  <c:when test="${article.no == board.no}">
                    <b>${board.title}</b>
                  </c:when>
                  <c:otherwise>
                    <a href="<c:url value="/board/detail/${board.no}"/>">${board.title}</a>
                  </c:otherwise> 
                </c:choose>
                       
                <span class="comment num" data-no="${board.no}"><span></span></span>
                <c:if test="${board.hasImage == true}">
                   <img src="<c:url value="/resources/assets/images/icons/image.gif"/>" alt="image" title="image">
                </c:if>                
                <c:if test="${board.hasFile == true}">
                   <img src="<c:url value="/resources/assets/images/icons/file.gif"/>" alt="file" title="file">
                </c:if>
                
                <br>
                <span class="small info">
                  <span><span>Date</span><b><fmt:formatDate value="${board.registrationDate}" pattern="yyyy.MM.dd"/></b></span>
                  <span class="left solid"><span>By</span><b><img class="ui avatar image" src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>"> <a class="author" data-no="${board.userNo}">${board.userNickname}</a></b></span>
                  <span class="left solid"><span>Views</span><b>${board.hitCount}</b></span>
                </span>
                </td>
                
                <td class="author">
                  <img class="ui avatar image" src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>">
                  <a class="author" data-no="${board.userNo}">${board.userNickname}</a>
                  <div class="ui custom popup bottom left transition hidden">
                    <div class="column" style="padding: 0!important;">
                      <div class="ui link list">
                        <a class="item">작성글</a>
                        <sec:authorize access="isAuthenticated()">
                        <a class="item">회원정보</a>
                        <a class="show-message-modal item">쪽지보내기</a>
                       </sec:authorize>
                      </div>
                    </div>
                  </div>
                </td>
                
                <td class="hit">${board.hitCount}</td>
                <td class="recommend">${board.recommendCount}</td>
                <td class="date">
                  <fmt:formatDate value="${board.registrationDate}" pattern="yyyy.MM.dd"/>
                </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            
            <div class="ui small left floated main menu">
              <a class="item" href='<c:url value="/board/${boardType.name}/1" />'>
                <i class="sidebar icon"></i>
                                  목록
              </a>
            </div>
            <br>
            <br>
          </div>
        </div>
      </div>
           
      
    </div>
  </div>
  
  <!-- Modals -->
  
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

  <!-- user nickname click modal -->
  <div id="user-click-modal" class="ui small modal">
    <i class="close icon"></i>
    <div class="header">
      User Click Modal
    </div>
    <div class="content">
    
      <div class="ui link list">
        <a class="find-write-articles item">작성글 (${boardType.koName})</a>
        <sec:authorize access="isAuthenticated()">
        <a class="show-user-info item">회원정보</a>
        <a class="show-message-modal item">쪽지보내기</a>
        </sec:authorize>
      </div>
      
    </div>
  </div>

  <!-- Message  -->
  <div id="send-message-modal" class="ui small modal">
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
  
  
  <!-- User Info -->
 <div id="show-user-info-modal" class="ui standard modal">
    <div class="header">
      User Info
    </div>
    <div class="image content">
      <div class="ui medium image">
        <img class="ui centered image" src="<c:url value="/resources/photo_upload_profile/default-profile.png"/>">
      </div>
      <div class="description">
<!--         <div class="ui header">nickname</div> -->
         
                <div class="ui relaxed divided list">
	        	  <div class="nickname item">
	        	    <i class="chevron right middle aligned icon"></i>
	        	    <div class="content">
	        	      <h3 class="header">닉네임</h3>
	        	      <div class="description"></div>
	        	    </div>
	        	  </div>
	        	  <div class="registrationDate item">
	        	    <i class="chevron right middle aligned icon"></i>
	        	    <div class="content">
	        	      <h3 class="header">가입일</h3>
	        	      <div class="description"></div>
	        	    </div>
	        	  </div>
	        	  <div class="lastLoginDate item">
	        	    <i class="chevron right middle aligned icon"></i>
	        	    <div class="content">
	                  <h3 class="header">최근 로그인</h3>
	        	      <div class="description"></div>
	        	    </div>
	        	  </div>
	        	</div>
      </div>
    </div>
    <div class="actions">
      <div class="ui black deny button">
        x
      </div>
<!--       <div class="ui positive right labeled icon button"> -->
<!--         Yep, that's me -->
<!--         <i class="checkmark icon"></i> -->
<!--       </div> -->
    </div>
  </div>  
  

<!-- Search form --> 
<c:url var="searchUrl" value="/board/search"/>
<form id="searchForm" action="${searchUrl}" method="post">
<input type="hidden" name="boardTypeName" value="${boardType.name}">
<input type="hidden" name="page" value="1">
<input type="hidden" name="searchTarget" value="nickname">
<input type="hidden" name="searchQuery" >
<sec:csrfInput/>
</form>   
  
  
<!--    <div class="ui article author popup bottom left transition hidden"> -->
<!--                  <div class="column"> -->

<!--                   <div class="ui link list"> -->
                    
<!--                     <a class="item">작성글</a> -->
                    
<%--                     <sec:authorize access="isAuthenticated()"> --%>
<!--                     <a class="show-user-info item">회원정보</a> -->
<!--                     <a class="show-message-modal item">쪽지보내기</a> -->
<%--                     </sec:authorize> --%>
                  
<!--                   </div> -->
<!--                  </div> -->
<!--     </div> -->
  
  <!-- Comment Remove Check Modal -->
  <div class="ui small comment check modal">
    <div class="header">
            알림
    </div>
    <div class="content">
      <p>정말 삭제 하시겠습니까?</p>
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
  
  <!-- Comment Page-number Info Modal -->
  <div class="ui small basic comment page info modal">
    <div class="ui icon header">
      <i class="archive icon"></i>
      Archive Old Messages
    </div>
    <div class="content">
      <p>Your inbox is getting full, would you like us to enable automatic archiving of old messages?</p>
    </div>
    <div class="actions">
      <div class="ui red basic cancel inverted button">
        <i class="remove icon"></i>
        No
      </div>
      <div class="ui green ok inverted button">
        <i class="checkmark icon"></i>
        Yes
      </div>
    </div>
  </div>


<!-- The blueimp Gallery widget -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>

<!-- blueimp Gallery script -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/jquery.blueimp-gallery.min.js"/>"></script>


<!-- Notifyjs -->
<script type="text/javascript" src="<c:url value="/resources/vendors/notifyjs/dist/styles/semantic-ui/notify-semantic.js"/>"></script>
  




<script type="text/javascript" src="<c:url value="/resources/javascript/message.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/userInfo.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/board/detail.js"/>"></script>
	

