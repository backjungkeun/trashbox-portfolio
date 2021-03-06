<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<meta name="noResult" content="${noResults}"/>

<script>
  $(document)
    .ready(function() {

        $('.fixed.inverted.menu')
        .find('.header.item')
        .addClass('olive active')
        .prepend('<i class="cubes icon"></i>');
        
        $('.following.bar')
        .find('.menu .header.item')
        .addClass('olive active')
        .prepend('<i class="cubes icon"></i>');
        
    })
    ;
</script>

<%-- <sec:authentication var="user" property="principal" /> --%>
 
        
        <!-- Article List -->
        <div class="ui vertical stripe article list segment">
          <div class="ui three column relaxed stackable grid container">
            <div class="row">
              <div class="sixteen wide column">

<!--               <h2 class="ui header"> -->
<!--                 <i class="list icon"></i> -->
<%--                                     ${boardType.koName} --%>
<!--               </h2>              -->
              <div class="ui segment">
             
               <c:if test="${noResults}">
                 <br>
                  <i class="huge orange frown icon"></i>
                  <h4 class="ui center aligned header">
                  등록된 게시물이 없습니다.
                  </h4>
                 <br>
                
               </c:if> 
             
               <c:if test="${!noResults}">
                <table class="ui selectable compact unstackable table">
                  <thead class="full-width">
                    <tr>
                      <th class="one wide center aligned no"><span>번호</span></th>
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
                    <c:forEach varStatus="status" items="${boardList}" var="board"> 
                    <tr>
                      <td class="no">${(paginationInfo.totalNum - status.index) - ( (paginationInfo.currentPage - 1)  *  15 ) }</td>
                      <td class="title">
                       <a href="<c:url value="/board/detail/${board.no}"/>">${board.title}</a>
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
                        <span class="left solid"><span>By</span><b><img class="ui avatar image" src="<c:url value="/resources/photo_upload_profile/default-profile.png"/>"><a class="author" data-no="${board.userNo}">${board.userNickname}</a></b></span>
                        <span class="left solid"><span>Views</span><b>${board.hitCount}</b></span>
                       </span>
                      </td>
                      <td class="author">
                      <img class="ui avatar image" src="<c:url value="/resources/photo_upload_profile/default-profile.png"/>">
                      <a class="author" data-no="${board.userNo}">${board.userNickname}</a>
                      
                      
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

<!-- <div class="ui small left floated main menu"> -->
<!--   <a class="item"> -->
<!--     <i class="sidebar icon"></i> -->
<!--     목록 -->
<!--   </a> -->
  
<!-- </div>  -->

<!-- <div class="ui small right floated main menu"> -->
<%--   <a class="item" href="<c:url value="/board/write?category=${boardType.name}"/>"> --%>
<!--     <i class="write icon"></i> -->
<!--     글쓰기 -->
<!--   </a> -->
  
<!-- </div>  -->

</c:if>


<c:url var="writeUrl" value="/board/write"/>
<form action="${writeUrl}" method="post">
  <input type="hidden" name="categoryNo" value="${boardType.no}">
  <button class="ui right floated button" type="submit">
    <i class="write icon"></i>
  글쓰기
  </button>
  <sec:csrfInput />
</form>
 
  
 
 <br>
 <br>
<br>               

<c:if test="${!noResults}">

<%-- <h2>currentPage :: ${currentPage}</h2> --%>
<%-- <h2>totalPageNum :: ${totalPageNum}</h2> --%>
<%-- <h2>start :: ${start}</h2> --%>
<%-- <h2>end :: ${end}</h2> --%>

<div class="pagination">
  
  
<%--    <c:if test="${start-1 != 0 }"> --%>
<%--     <a href="<c:url value="/board/${boardType.name}/${start-1}"/>" class="ui compact icon basic button"> --%>
<!--       <i class="caret left icon"></i> -->
<!--     </a> -->
<%--   </c:if> --%>

  <c:if test="${paginationInfo.currentPage != 1  && paginationInfo.currentPage <= paginationInfo.totalPageNum}">
    <a href="<c:url value="/board/${boardType.name}/${paginationInfo.currentPage-1}"/>" class="ui compact icon basic button" title="이전페이지 ">
      <i class="left chevron icon"></i>
      Prev
    </a>
  </c:if>

  <c:if test="${paginationInfo.start != 1 && paginationInfo.start > 3}">
    <a href="<c:url value="/board/${boardType.name}/1"/>" class="ui compact icon basic button" title="처음으로">
     <b>1</b>
    </a>
    <c:if test="${paginationInfo.start > 6}">
    
 <div class="ui bottom left pointing dropdown compact icon basic button">
  <input type="hidden" name="filters">
  <span class="text">..</span>
  <div class="menu">
    <div class="header">
      <i class="rocket icon"></i>
      Warp 
    </div>
    <div class="scrolling menu">
     <c:forEach var="i" begin="2" end="${paginationInfo.start-1}">
      <a href="<c:url value="/board/${boardType.name}/${i}"/>" class="item">${i}</a>
     </c:forEach>
    </div>
  </div>
</div>     

    </c:if>
  </c:if>
  
  <c:forEach var="i" begin="${paginationInfo.start}" end="${paginationInfo.end}">
    <c:choose>
      <c:when test="${i == paginationInfo.currentPage}">
         <div class="ui compact icon basic button active" style="cursor: default;"><b>${i}</b></div>
      </c:when>
      <c:otherwise>
         <a href="<c:url value="/board/${boardType.name}/${i}"/>" class="ui compact icon basic button">${i}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>

  <c:if test="${paginationInfo.end != paginationInfo.totalPageNum}">
    <c:if test="${paginationInfo.currentPage < paginationInfo.totalPageNum -5}">
      
       <div class="ui bottom left pointing dropdown compact icon basic button">
  <input type="hidden" name="filters">
  <span class="text">..</span>
  <div class="menu">
    <div class="header">
      <i class="rocket icon"></i>
      Warp 
    </div>
    <div class="scrolling menu">
     <c:forEach var="i" begin="${paginationInfo.end+1}" end="${paginationInfo.totalPageNum-1}">
      <a href="<c:url value="/board/${boardType.name}/${i}"/>" class="item">${i}</a>
     </c:forEach>
    </div>
  </div>
</div> 
           
 
    </c:if>
    <a href="<c:url value="/board/${boardType.name}/${paginationInfo.totalPageNum}"/>" class="ui compact icon basic button" title="마지막으로">
    <b>${paginationInfo.totalPageNum}</b>
    </a>  
  </c:if>
    
  <c:if test="${paginationInfo.totalPageNum != 1 && paginationInfo.currentPage < paginationInfo.totalPageNum}">
    <a href="<c:url value="/board/${boardType.name}/${paginationInfo.currentPage+1}"/>" class="ui compact icon basic button" title="다음페이지 ">
      Next
      <i class="right chevron icon"></i>   
    </a>  
  </c:if>
  
<%--   <c:if test="${end % 5 == 0 && totalPageNum > end}"> --%>
<%--     <a href="<c:url value="/board/${boardType.name}/${end+1}"/>" class="ui compact icon basic button"> --%>
<!--       <i class="caret right icon"></i> -->
<!--     </a> -->
<%--   </c:if> --%>
  


  
<%--   <c:if test="${start-1 == 0}">  --%>
   
<%--   </c:if> --%>
  
<%--   <c:if test="${start-1 != 0 }"> --%>
<%--     <a href="<c:url value="/board/${boardType.name}/${start-1}"/>" class="ui compact icon basic button"> --%>
<!--       <i class="left chevron icon"></i> -->
<!--       Prev -->
<!--     </a> -->
<%--   </c:if> --%>
  
<%--   <c:forEach var="i" begin="${start}" end="${end}"> --%>
<%--     <c:choose> --%>
<%--       <c:when test="${i == currentPage}"> --%>
<%--          <div class="ui compact icon basic button active" style="cursor: default;">${i}</div> --%>
<%--       </c:when> --%>
<%--       <c:otherwise> --%>
<%--          <a href="<c:url value="/board/${boardType.name}/${i}"/>" class="ui compact icon basic button">${i}</a> --%>
<%--       </c:otherwise> --%>
<%--     </c:choose> --%>
   
<%--   </c:forEach> --%>
  
<%--   <c:if test="${end % 5 == 0 && totalPageNum > end}"> --%>
<%--     <a href="<c:url value="/board/${boardType.name}/${end+1}"/>" class="ui compact icon basic button"> --%>
<!--       Next -->
<!--       <i class="right chevron icon"></i>    -->
<!--     </a> -->
<%--   </c:if> --%>
  
<%--   <c:if test="${end % 5 != 0 && end == totalPageNum }"> --%>
<%--   </c:if> --%>
  

</div>



<br>
<br>


<%-- <c:url var="searchUrl" value="/board/search"/> --%>
<%-- <form action="${searchUrl}" method="post"> --%>
<%-- <input type="hidden" name="boardTypeName" value="${boardType.name}"> --%>
<!-- <input type="hidden" name="page" value="1"> -->
<!-- <div class="ui small floating labeled icon bottom left pointing dropdown basic button" style="margin-bottom: 1em;"> -->
<!--    <input type="hidden" name="searchTarget" value="title_content"> -->
<!--    <i class="filter icon"></i> -->
<!--    <span class="text">검색</span> -->
<!--    <div class="menu">  -->
<!--      <div class="item" data-value="title_content" >제목+내용</div> -->
<!--      <div class="item" data-value="title">제목</div>  -->
<!--      <div class="item" data-value="content">내용</div> -->

<!--      <div class="item" data-value="nickname">닉네임</div> -->
<!--    </div> -->
<!-- </div> -->
<!-- <div class="ui small action input"> -->
<!--   <input type="text" name="searchQuery" placeholder="Search..."> -->
  
<!--    <button class="ui basic icon button" type="submit"> -->
<!--     <i class="search icon"></i> -->
<!--   </button> -->
<!-- </div> -->
<%-- <sec:csrfInput/> --%>
<!-- </form> -->

<c:url var="searchUrl" value="/board/search"/>
<form id="searchForm" action="${searchUrl}" method="post" class="ui form" style="width: 60%;margin-left: auto;margin-right: auto;">
<input type="hidden" name="boardTypeName" value="${boardType.name}">
<input type="hidden" name="page" value="1">

<div class="field">
<div class="ui small floating labeled icon bottom left pointing dropdown basic button" >
   <input type="hidden" name="searchTarget" value="title_content">
   <i class="filter icon"></i>
   <span class="text">검색</span>
   <div class="menu"> 
     <div class="item" data-value="title_content" >제목+내용</div>
     <div class="item" data-value="title">제목</div> 
     <div class="item" data-value="content">내용</div>
<!--      <div class="item" data-value="comment">댓글</div> -->
     <div class="item" data-value="nickname">닉네임</div>
   </div>
</div>
</div>
<div class="field" style="max-width: 250px;margin-left: auto;margin-right: auto;">
<div class="ui small action input">
  <input type="text" name="searchQuery" placeholder="검색..." style="width:80%!important;">
  
   <button class="ui basic icon button" type="submit">
    <i class="search icon"></i>
  </button>
</div>
</div>



<sec:csrfInput/>
</form>
	

                  
                   
  </c:if>                              
         
              </div>            
            </div>
            
            </div>
          </div>
          
        </div>
            
        
        
        
<!--           <div class="ui center aligned grid container"> -->
<!--             <div class="column"> -->
              
            
<!--               <div class="ui list"> -->
<!--                 <h2 class="ui header">회원 정보</h2>  -->
<!--                 <div class="item"> -->
<!--                   <i class="mini asterisk icon"></i> -->
<!--                   <div class="content"> -->
<!--                     <div class="header">프로필 사진</div> -->
<!--                     <br> -->
<!--                     <div class="ui small circular image"> -->
<%--                       <img src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>"> --%>
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                   <i class="mini asterisk icon"></i> -->
<!--                   <div class="content"> -->
<!--                     <div class="header">아이디</div> -->
<%--                     <div class="description">${user.username}</div> --%>
<!--                   </div> -->
<!--                 </div> -->
<!--                 <br> -->
<!--                 <div class="item"> -->
<!--                   <i class="mini asterisk icon"></i> -->
<!--                   <div class="content"> -->
<!--                     <div class="header">이메일</div>              -->
<%--                     <div class="description">${user.email}</div> --%>
<!--                   </div> -->
<!--                 </div> -->
<!--                 <br> -->
<!--                 <div class="item"> -->
<!--                   <i class="mini asterisk icon"></i> -->
<!--                   <div class="content"> -->
<!--                     <div class="header">닉네임</div>              -->
<%--                     <div class="description">${user.nickname}</div> --%>
<!--                   </div> -->
<!--                 </div> -->
<!--                 <br> -->
<!--                 <div class="item"> -->
<!--                   <i class="mini asterisk icon"></i> -->
<!--                   <div class="content"> -->
<!--                     <div class="header">권한</div>              -->
<!--                     <div class="description"> -->
<%--                      <sec:authentication var="role" property="principal.authorities[0]" /> --%>
<%--                       <c:choose> --%>
<%--                			<c:when test="${role == 'ROLE_ADMIN'}"> --%>
<!--                 		     관리자 -->
<%--                			</c:when> --%>
<%--     		   			<c:when test="${role == 'ROLE_USER'}"> --%>
<!--        					      일반 -->
<%--       		   			</c:when> --%>
<%--       		   		 </c:choose> --%>
<!-- 				    </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <br> -->
<!--                 <div class="item"> -->
<!--                   <i class="mini asterisk icon"></i> -->
<!--                   <div class="content"> -->
<!--                     <div class="header">가입일</div>              -->
<%--                     <div class="description">${user.registrationDate}</div> --%>
<!--                   </div> -->
<!--                 </div> -->
<!--                 <br> -->
<!--                 <div class="item"> -->
<!--                   <i class="mini asterisk icon"></i> -->
<!--                   <div class="content"> -->
<!--                     <div class="header">최근 로그인</div>              -->
<%--                     <div class="description">${user.lastLoginDate}</div> --%>
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
              
<!--               <div class="ui vertical three basic buttons"> -->
<%--                 <a class="ui button" href="<c:url value="/modifyUserInfo"/>"> --%>
<!--                   <i class="user icon"></i>회원정보 변경 -->
<!--                 </a> -->
<!--                 <a class="ui button" href="#modifyUserPassword"> -->
<!--                   <i class="privacy icon"></i>비밀번호 변경 -->
<!--                 </a> -->
<!--                 <a class="ui button" href="#"> -->
<!--                   <i class="remove circle icon"></i>탈퇴 -->
<!--                 </a> -->
<!--               </div> -->
            
<!--             </div> -->
<!--           </div> -->
  
            
       

      

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


<div id="search-modal" class="ui small modal">
    <i class="close icon"></i>
    <div class="header">
      Search
    </div>
    <div class="content">
      <c:url var="searchUrl" value="/board/search"/>
<form action="${searchUrl}" method="post">
<input type="hidden" name="boardTypeName" value="${boardType.name}">
<input type="hidden" name="page" value="1">



<div class="ui small floating labeled icon bottom left pointing dropdown basic button" style="margin-bottom: 1em;">
   <input type="hidden" name="searchTarget" value="title_content">
   <i class="filter icon"></i>
   <span class="text">검색</span>
   <div class="menu"> 
     <div class="item" data-value="title_content" >제목+내용</div>
     <div class="item" data-value="title">제목</div> 
     <div class="item" data-value="content">내용</div>
<!--      <div class="item" data-value="comment">댓글</div> -->
     <div class="item" data-value="nickname">닉네임</div>
   </div>
</div>



<div class="ui small action input">
  <input type="text" name="searchQuery" placeholder="Search...">
  
   <button class="ui basic icon button" type="submit">
    <i class="search icon"></i>
  </button>
</div>



<sec:csrfInput/>
</form>
    </div>
    <div class="actions">
      <div class="ui negative button">Cancel</div>
       <div class="ui positive right labeled icon button">
               Send
        <i class="checkmark icon"></i>
      </div>
<!--       <div id="message-send-button" class="ui green button">Send</div> -->
    </div>
  </div>







<script type="text/javascript" src="<c:url value="/resources/javascript/message.js"/>"></script>	
<script type="text/javascript" src="<c:url value="/resources/javascript/userInfo.js"/>"></script>	
<script type="text/javascript" src="<c:url value="/resources/javascript/board/list.js"/>"></script>
	

 

