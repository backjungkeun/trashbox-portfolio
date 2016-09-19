<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

        <!-- Article Details -->
        <div class="ui vertical stripe article details segment">
          <div class="ui three column relaxed stackable grid container">
            <div class="row">
              <div class="sixteen wide column">

<!--               <h2 class="ui header"> -->
<!--                 <i class="list icon"></i> -->
<%--                                     ${boardType.koName} --%>
<!--               </h2>  -->

              <div class="ui segment">
              
             <h4 class="my header">
              ${article.title}
             </h4>
             <p class="info">
               <a class="author" data-no="${article.userNo}" >${article.userNickname}</a> 
               
               
               <span class="sum">
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
<!--                   <div class="ui dimmer"> -->
<!--                     <div class="ui text large loader">Loading</div> -->
<!--                   </div> -->
 <div class="ui minimal comments">
 <h4 class="ui dividing header" >Comments [<span>0</span>]</h4>
  <div class="comments">
  <div id="commentsFieldInit" class="ui button" style="display:none;"></div>
<!--   <div class="comment"> -->
<!--     <a class="avatar"> -->
<%--       <img src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>"> --%>
<!--     </a> -->
<!--     <div class="content"> -->
<!--       <a class="author">Matt</a> -->
<!--       <div class="metadata"> -->
<!--         <span class="date">Today at 5:42PM</span> -->
<!--       </div> -->
<!--       <div class="text"> -->
<!--         How artistic! -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!--   <div class="comment"> -->
<!--     <a class="avatar"> -->
<%--      <img src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>"> --%>
<!--     </a> -->
<!--     <div class="content"> -->
<!--       <a class="author">Elliot Fu</a> -->
<!--       <div class="metadata"> -->
<!--         <span class="date">Yesterday at 12:30AM</span> -->
<!--       </div> -->
<!--       <div class="text"> -->
<!--         <p>This has been very useful for my research. Thanks as well!</p> -->
<!--       </div> -->
<!--     </div> -->
    
<!--   </div> -->
<!--   <div class="comment"> -->
<!--     <a class="avatar"> -->
<%--     <img src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>"> --%>
<!--     </a> -->
<!--     <div class="content"> -->
<!--       <a class="author">Joe Henderson</a> -->
<!--       <div class="metadata"> -->
<!--         <span class="date">5 days ago</span> -->
<!--       </div> -->
<!--       <div class="text"> -->
<!--         Dude, this is awesome. Thanks so much -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
  </div>
  <br>
  <br>
 
  
  <div id="commentPagination" class="pagination">
  </div>
  



<br>
<br>
  
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
</div>




                
                
                </div>
                
                
                </div>
                
                </div>
              
              
               <div class="row">
              <div class="sixteen wide column">
              
                <div class="ui segment">
             
                <table class="ui selectable compact unstackable table">
                  <thead class="full-width">
                    <tr>
<!--                       <th class="one wide center aligned no"><span>번호</span></th> -->
                      <th class="nine wide center aligned title"><span>제목</span></th>
                      <th class="three wide aligned author"><span>글쓴이</span></th>
                      <th class="one wide center aligned hit"><span><a href=#>조회</a></span></th>
                      <th class="one wide center aligned recommend"><span><a href=#>추천</a></span></th>
                      <th class="one wide center aligned date"><span><a href=#>날짜</a></span></th>
<!--                       <th class="my header">추천수</th> -->
<!--                       <th class="my header">생성일</th> -->
<!--                       <th class="my header">변경일</th> -->
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
                       
                       
                       
                       <span class="comment num"><span>[3]</span></span>
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
                           <a class="show message modal item">쪽지보내기</a>
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
<%--                       <td>${board.boardNo}</td> --%>                    
<%--                       <td>${board.content}</td> --%>
<%--                       <td>${board.changeDate}</td> --%>
                    </tr>
                    </c:forEach>
                    
                  </tbody>
                </table>

<div class="ui small left floated main menu">
  <a class="item">
    <i class="sidebar icon"></i>
    목록
  </a>
  
</div> 



<script type="text/javascript" src="<c:url value="/resources/vendors/sockjs-1.0.3.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/vendors/stomp.min.js"/>"></script>
<script type="text/javascript">


    var articleNo =  $("meta[name=articleNo]").attr("content");
   
    var socket,
        client;
    
    var recommendNum = '${article.recommendCount}';
    
    function connect() {
    	var wsUrl = '';
    	
//     	if($.browser.mobile) {
//     		wsUrl = 'http://192.168.25.25:9999/trashbox/portfolio';
    	
//     	} else {
//     		wsUrl = 'http://localhost:9999/trashbox/portfolio';
//     	}
    	
    	wsUrl =  location.protocol+'//'+location.host + '/' + location.pathname.split("/")[1] + '/portfolio';
    	
    	socket = new SockJS(wsUrl);
       
    	client = Stomp.over(socket);
    	
    	client.connect({}, function(frame) {
    	    console.log('connected stomp over sockjs');
    	    
    	    var user = frame.headers['user-name'];
    	    
    	    client.subscribe('/topic/article/' + articleNo , function(message) {
    	    	var result = JSON.parse(message.body);
    	    	
    	    	switch (result.eventType) { 
    	    	    case 'recommend': 
//     	    	    	alert("update recommend");
    	    	    	
    	    	    	$('#recommend-button .basic.label').text(result.message);
    	    	    	$('.info .vote > b').text(result.message);
    	    	    	break;
    	    	    	
    	    	    default : alert(result.eventType);
    	    	}
//     	    	alert(message.body);

    	    });
    	   
    	    if(user != null || user != undefined) {
    	    	client.subscribe('/user/queue/privateMessage', function(message) {
    	    		alert(message.body);
    	    	});
    	    }
 
    	    
    	});
    }
    
    connect();
    
</script>



<br>
<br>



                
              
              </div>
            
            </div>
          </div>
           
           
           
           
           
              
                        
            </div>
            
           
          
        </div>