<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



  <sec:authentication var="user" property="principal" />
 
        
        <!-- Search Article List -->
        <div class="ui vertical stripe article list segment">
          <div class="ui three column relaxed stackable grid container">
            <div class="row">
              <div class="sixteen wide column">

              <h2 class="ui header">
                <i class="search icon"></i>
                             검색어 : ${searchQuery}
              </h2>             
              <div class="ui segment">
                
               <c:if test="${noResults}">
                 <br>
                  <i class="huge orange frown icon"></i>
                  <h4 class="ui center aligned header">
                  검색 결과가 없습니다.
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

                </c:if>

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

<%-- <h2>currentPage :: ${currentPage}</h2> --%>
<%-- <h2>totalPageNum :: ${totalPageNum}</h2> --%>
<%-- <h2>start :: ${start}</h2> --%>
<%-- <h2>end :: ${end}</h2> --%>


<c:if test="${!noResults}">
<div class="pagination">
  

  <c:if test="${paginationInfo.currentPage != 1  && paginationInfo.currentPage <= paginationInfo.totalPageNum}">
    <a data-value="${paginationInfo.currentPage-1}" class="ui compact icon basic button" title="이전페이지 ">
      <i class="left chevron icon"></i>
      Prev
    </a>
  </c:if>

  <c:if test="${paginationInfo.start != 1 && paginationInfo.start > 3}">
    <a data-value="1" class="ui compact icon basic button" title="처음으로">
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
      <a data-value="${i}" class="item">${i}</a>
     </c:forEach>
    </div>
  </div>
</div>     

    </c:if>
  </c:if>
  
  <c:forEach var="i" begin="${paginationInfo.start}" end="${paginationInfo.end}">
    <c:choose>
      <c:when test="${i == paginationInfo.currentPage || i == 0}">
         <div class="ui compact icon basic button active" style="cursor: default;"><b>${i}</b></div>
      </c:when>
      <c:otherwise>
         <a data-value="${i}" class="ui compact icon basic button">${i}</a>
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
      <a data-value="${i}" class="item">${i}</a>
     </c:forEach>
    </div>
  </div>
</div> 
           
 
    </c:if>
    <a data-value="${paginationInfo.totalPageNum}" class="ui compact icon basic button" title="마지막으로">
    <b>${paginationInfo.totalPageNum}</b>
    </a>  
  </c:if>
    
  <c:if test="${paginationInfo.totalPageNum != 1 && paginationInfo.currentPage < paginationInfo.totalPageNum}">
    <a data-value="${paginationInfo.currentPage+1}" class="ui compact icon basic button" title="다음페이지 ">
      Next
      <i class="right chevron icon"></i>   
    </a>  
  </c:if>
  

</div>
</c:if>


<br>
<br>


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


             <div class="ui custom popup bottom left transition hidden">
                 <div class="column">
<!--                   <h4 class="ui header">Fabrics</h4> -->
                  <div class="ui link list" style="padding:0;">
                    
                    <a class="item">작성글</a>
                    
                    <sec:authorize access="isAuthenticated()">
                    <a class="item">회원정보</a>
                    <a class="show message modal item">쪽지보내기</a>
                    </sec:authorize>
                  
                  </div>
                 </div>
             </div>



  <div id="send-message-modal" class="ui small modal">
    <i class="close icon"></i>
    <div class="header">
      Send Message
    </div>
    <div class="content">
      <form id="message-send-form" class="ui form">
        <h4 class="ui dividing header">To</h4>
        <input class="receiver no" name="receiverNo" type="hidden">
        <div class="field">
          <label>Message</label>
          <textarea name="content"  style="resize:none;"></textarea>
        </div>
       
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
  



<script type="text/javascript" src="<c:url value="/resources/javascript/message.js"/>"></script>	
<script type="text/javascript" src="<c:url value="/resources/javascript/userInfo.js"/>"></script>

 <script>
  $(document)
    .ready(function() {
    	
    	// page loading 
        $('.animsition').animsition({
            inClass: 'fade-in',
            outClass: 'fade-out',
            inDuration: 1500,
            outDuration: 800,
            linkElement: '.animsition-link',
            // e.g. linkElement: 'a:not([target="_blank"]):not([href^=#])'
            loading: true,
            loadingParentElement: 'body', //animsition wrapper element
            loadingClass: 'animsition-loading',
            loadingInner: '', // e.g '<img src="loading.svg" />'
            timeout: false,
            timeoutCountdown: 5000,
            onLoadEvent: true,
            browser: ['animation-duration', '-webkit-animation-duration'],
            // "browser" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
            // The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
            overlay: false,
            overlayClass: 'animsition-overlay-slide',
            overlayParentElement: 'body',
            transition: function (url) {
                window.location.href = url;
            }
        });
    	
    	 /* sidebar - start */

        // sidebar settings
        $('.ui.sidebar').sidebar({
            dimPage: true,
            transition: 'overlay',
            mobileTransition: 'overlay'
        });

        // create sidebar and attach to menu open
        $('.ui.sidebar.left')
            .sidebar('attach events', '#left-sidebar-button')
            .sidebar('attach events', '#right-sidebar-button', 'hide');

        $('.ui.sidebar.right')
            .sidebar('attach events', '#right-sidebar-button')
            .sidebar('attach events', '#left-sidebar-button', 'hide');
        
        $('.ui.sidebar.left')
            .sidebar('attach events', '#second-left-sidebar-button');
        
        $('.ui.sidebar.right')
            .sidebar('attach events', '#second-right-sidebar-button');
    
    

        $('.ui.buttons > a')
            .on('click', function () {
                $(this)
                    .addClass('active')
                    .siblings()
                    .removeClass('active');
            });

        /* sidebar - end */
        
         /* modal - start */
        

    	$('.ui.buttons a.item')
                    .on('click', function () {
                        $(this)
                            .addClass('active')
                            .siblings()
                            .removeClass('active');
                    });
     
     
      $form = $('.ui.form').not($('#message-send-form'));
      
    
     
//       if('${errorUser}' == '') {
    	  
//     	  $('.ui.icon.header > p').text("로그인부터 다시시도해주세요.");
//     	  $('.actions > a').attr("href", "<c:url value='/login'/>");
    	  
//     	  $('.ui.small.basic.modal')
//     	  .modal({ closable  : false})
//     	  .modal('show');		
//       }
      
      
      
//       $('.ui.negative.message')
//       .transition('pulse')
//       ;
      
//       $('.message .close')
//       .on('click', function() {
//     	  $(this)
//          .closest('.message')
//          .transition('fade')
//          ;
//       })
//       ;
    

     
     
     
      
      
      
      
      
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
     
      
      
     
       
      
      $form.form({
    	  
    	  inline: true,
    	  on: blur,
    	  
    	 
    	  fields: {
                
            searchQuery: {
                identifier  : 'searchQuery',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '검색어를  입력하세요.'
                  }
                ]
              }
              
          }
      });
  
     
      
//       $('.ui.small.logout.modal')
//       .modal({
//           closable: false,
//           onApprove: function () {
//               $('#logout-form').submit();
//           }
//       })

//   .modal('attach events', '#logout-button', 'show');
      
      
      $('#searchForm .dropdown').dropdown('set value', '${searchTarget}');
      $('#searchForm').form('set value', 'searchQuery', '${searchQuery}');
      
      $('.ui.dropdown').dropdown();
      
      $('.pagination a.button')
      .on('click', function () {
          $(this)
              .addClass('active')
              .siblings()
              .removeClass('active');
      });

      
//       $(window).resize(function() {
//       	var width = $('#trashbox .stripe.article .segment').width();
//       	console.log(width);
      	
      	
//       	$('#trashbox .stripe.article .segment > table').css("width", width + 2 + "px");
//       });

      
      
//       $('.combo.dropdown')
//       .dropdown({
//         action: 'combo',
//         onChange: function(value, text, $selectedItem) {
    
//       	  if(value != '') {
//           	  $('#post_option_button').attr('data-action', value);
//             }
         
//         }
//       })
//     ;


        	$(function () {
        		var token = $("meta[name='_csrf']").attr("content");
        		var header = $("meta[name='_csrf_header']").attr("content");
        		
        		$(document).ajaxSend(function(e, xhr, options) {
        			xhr.setRequestHeader(header, token);
        			xhr.setRequestHeader('X-AJAX-CALL', true);
        			
        		});
        		
        	});


        function getCommentCount(articleNoList) {
	        var result;
	        $.ajax({
  	  			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
  	  			  type: "POST",
  	  			  url: "<c:url value='/comment/getTotalCountByArticle'/>",
  	  			  data: {articleNoList : articleNoList}
  	  			  
	        }).done(function(data) {
//   	  			  console.log(data);
  	  			   result = data.commentCount;
  	  		});
	        
	        return result;
	    }
      
        if('!${noResults}') {
        
        setTimeout(function() {
        	
        	  var articleNoList = [];

              $('span.comment.num').each(function() {
            	  var no = $(this).attr('data-no');
            	  articleNoList.push(no);
              });
              
              var commentCountInfo = getCommentCount(articleNoList);
              
              
              $('span.comment.num').each(function(i){
            	  var no = $(this).attr('data-no');
            	  
            	  if(typeof commentCountInfo[no] !== "undefined") {
            		  $(this).children().text('[' + commentCountInfo[no] + ']');
            	  } 

              });

        }, 1000);
        
      
        }




        function getUsersDefaultInfo(userNoList) {
        	var result;
        	$.ajax({
	  			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
	  			  type: "POST",
	  			  url: $.trashbox.baseUrl + "/getUserDefaultInfo",
	  			  data: {userNoList : userNoList},

	  			  beforeSend: function (xhr){ 
	  				xhr.setRequestHeader(header, token);
	  			  }
	  			  
	  		    }).done(function(data) {
//	  			  console.log(data);
	  			   result = data.defaultInfoMap;
	  		    });
        	
        	return result;
        }    
        
        if('!${noResults}') {
        
        setTimeout(function() {
        	
        	var userNoList = [];
   		 
            $('a.author').each(function() {
           	 var no = $(this).attr('data-no');
           	 
           	 if($.inArray(no, userNoList) == -1) {
           		 userNoList.push(no);
           	 } 
           	 
           	
//            	 console.log(this);
           	
            });
            
//             console.log(userNoList);
           
            var defaultInfoMap = getUsersDefaultInfo(userNoList);
            
            console.log(defaultInfoMap);
           
           $('table img').each(function() {
        	   var userNo = $(this).next().attr('data-no');
        	   $(this).attr('src', $.trashbox.baseUrl + '/resources/photo_upload_profile/' + defaultInfoMap[userNo].profileImage);
        	   
           });
           
        	
        }, 1000);

        }
        
        // pagenation 
        
        $('.pagination a.button').on('click', function() {
        	
        	var page = $(this).attr('data-value');
        	$('#searchForm :input[name="page"]').val(page);
            $('#searchForm').submit();
        });
        
    })
  ;
  </script>

