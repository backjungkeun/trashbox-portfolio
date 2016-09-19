<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Standard Meta -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	
	<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	
	<meta name="boardTypeName" content="${boardType.name}"/>
	<meta name="articleNo" content="${article.no}"/>
	<meta name="articleAuthorNo" content="${article.userNo}"/>
    
    <!-- Site Properties -->
    <title>Detail - TrashBox</title>  
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.serialize-object.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.browser.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery-dateFormat.min.js"/>"></script>
    
    
<%--     <script type="text/javascript" src="<c:url value="/resources/vendors/migrate.js"/>"></script> --%>
      
    <!-- Semantic-UI Components -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.min.js"/>"></script>

	<!-- Animsition -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/animsition/animsition.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/animsition/animsition.min.js"/>"></script>

    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/sweetalert/sweetalert.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/sweetalert/sweetalert.min.js"/>"></script>
     
    <!-- Notifyjs -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/notifyjs/dist/styles/semantic-ui/notify-semantic.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/notifyjs/dist/notify.js"/>"></script>
       
       
    <!-- User Custom -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/trashbox.css"/>">
    

</head>
<body id="trashbox">
  

  <script>
  $(document)
    .ready(function() {
    	$("#trashbox").animate({scrollTop: 0}, 100);
    	
    	
//     	$('.comment.page.info.modal')
//     	.modal('show');

    	

    })
  ;
  </script>

  <sec:authentication var="user" property="principal" />

  <!-- left Sidebar Menu -->
  <div class="ui vertical inverted sidebar left menu">
    <div class="item">
      <a class="header" href="<c:url value="/main"/>">TrashBox</a>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="<c:url value="/board/notice/1"/>">공지사항</a>
        <a class="item" href="<c:url value="/board/event/1"/>">이벤트</a>
        <a class="item" href="#">출석체크</a>
      </div>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="#">강좌 / 팁</a>
        <a class="item" href="#">질문 / 답변</a>
        <a class="item" href="#">자유</a>
      </div>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="#">창작</a>
        <a class="item" href="#">장식</a>
        <a class="item" href="#">자동차</a>
        <a class="item" href="#">전기 / 전자</a>
        <a class="item" href="#">가구</a>
        <a class="item" href="#">하드웨어</a>
        <a class="item" href="#">목공</a>
        <a class="item" href="#">기타 공예</a>
      </div>
    </div>
    <div class="item">
      <div class="menu">
        <a class="item" href="#">업체</a>
      </div>
    </div>
  </div>

  <!-- Anonymous right Sidebar Menu  -->
  <sec:authorize access="isAnonymous()">
    <div class="ui vertical inverted sidebar right menu ">
      <div id="user-info-box" class="item"></div>
      <a class="active teal item" href="<c:url value="/signup"/>">회원가입</a>
      <a class="green item" href="<c:url value="/login"/>">로그인</a>
    </div>
  </sec:authorize>

  <!-- Authenticated right Sidebar Menu  -->
  <sec:authorize access="isAuthenticated()">
    <div class="ui vertical inverted sidebar right accordion menu ">
      <div id="user-info-box" class="item">
        <div class="ui tiny circular image">
          <img src="<c:url value="/resources/photo_upload_profile/${user.profileImage}"/>">
        </div>
        <div class="ui center aligned container">
          <h2>${user.nickname}</h2>
         
     
        </div>
      </div>
      
      <a class="orange item active" href="<c:url value="/userInfo"/>">회원정보</a>
      <a class="item" href="#">스크랩</a>
      <a class="item" href="#">친구</a>
      <a class="blue item">알림 <div class="ui blue label">2</div></a>
      <a class="teal item">메시지<div class="ui teal label">22</div></a>
      <a class="orange item">스팸<div class="ui orange label">3</div></a>
      <a id="logout-button" class="red item">로그아웃<i class="sign out icon"></i></a>
     
      
     
     
      
      
      
    </div>
  </sec:authorize>
 
  <!-- Small Following Menu -->
  <div class="ui fixed inverted menu">
    <a id="left-sidebar-button" class="item">
      <i class="sidebar icon"></i>
    </a>
    <div class="header orange item active">
             ${boardType.koName}
    </div>
    <div class="right menu">
      <a class="item" href="#search">
        <i class="search icon"></i>
      </a>
      <a id="right-sidebar-button" class="item">
        <i class="user icon"></i>
      </a>
    </div>
  </div>

  <!-- Page Contents -->
  <div class="pusher">
    <div class="animsition">
      <div class="full height">

        <!-- Large Following Menu  -->
        <div class="following bar dark fixed animated fadeInDown">
          <div class="ui container">
            <div class="ui large menu inverted">
              <a id="second-left-sidebar-button" class="item">
                <i class="sidebar icon"></i>
              </a>
              <div class="header orange item active">${boardType.koName}
              </div>
              <div class="right menu inverted">
<!--                 <a class="item" href="#search"> -->
<!--                   <i class="search icon"></i> -->
<!--                 </a> -->
                <div id="browser-info" class="item">
<%--                   <img id="browser-image" class="ui avatar image" src="<c:url value="/resources/assets/images/browser/chrome.png"/>"> --%>
                  <span>browser</span>
                </div>
                <a id="second-right-sidebar-button" class="item">
                  <i class="user icon"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
        
        
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

<!--     <div class="ui labeled button" tabindex="0"> -->
<!--       <div class="ui blue button"> -->
<!--         <i class="thumbs outline up icon"></i> -->
<!--       </div> -->
<!--       <div class="ui basic left pointing blue label"> -->
<!--         3 -->
<!--       </div> -->
<!--     </div>     -->
<!--     <div class="ui labeled button" tabindex="0"> -->
<!--       <div class="ui red button"> -->
<!--         <i class="thumbs outline down icon"></i> -->
<!--       </div> -->
<!--       <div class="ui basic red left pointing label"> -->
<!--         -3 -->
<!--       </div> -->
<!--     </div> -->
    
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





<!-- <div class="ui small right floated main menu"> -->
<!--   <a class="item"> -->
<!--     <i class="write icon"></i> -->
<!--     글쓰기 -->
<!--   </a> -->
<!-- </div>  -->
 
              
<button id="connect">connect</button>
<button id="disconnect" disabled="">disconnect</button>
<input type="text" id="message">
<textarea id="messages" style="width: 100%; height: 200px;" readonly=""></textarea>
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
    
 
    $(function () {
        $('#connect').click(function () {
            connect();
            $(this).attr('disabled', true);
            $('#disconnect').removeAttr('disabled');
        });
 
        $('#disconnect').click(function () {
            disconnect();
            $(this).attr('disabled', true);
            $('#connect').removeAttr('disabled');
        });
        
//         $('#send').click(function () {
//         	client.send('/app/getTotalCommentNum', {}, '${article.no}');
        	
// //         	client.send('/app/getTotalRecommendNum', {}, '${article.no}');
        
        	
        	
//         });
 
        $('#message').keydown(event, function () {
            if (event.keyCode === 13) {
            	var inputValue = $(this).val();
            	
            	var data = {
            		value : inputValue	
            	}; 
            	
            	client.send('/app/getTotalCommentNum', {}, JSON.stringify(data));
//             	client.send('/app/getTotalRecommendNum', {}, '${article.no}');
            	
            	$(this).val('');
            }
        });
    });
    
    
//     $(function () {
//     	connect();
    	
//     	setInterval(function() {	
//     		client.send('/app/getTotalCommentNum', {}, '${article.no}');
//             client.send('/app/getTotalRecommendNum', {}, '${article.no}');
//         }, 5000);
    	
    	
//     });
    
    
</script>



<br>
<br>



                
              
              </div>
            
            </div>
          </div>
           
           
           
           
           
              
                        
            </div>
            
           
          
        </div>
            
     

      </div> 
      <!-- full height end -->   
    
      <!-- footer -->
      <div class="ui inverted vertical footer segment">
        <div class="ui container">
          <div class="ui stackable inverted divided equal height stackable grid">
            <div class="three wide column">
              <h4 class="ui inverted header">About</h4>
              <div class="ui inverted link list">
                <a href="#" class="item">Sitemap</a>
                <a href="#" class="item">Contact Us</a>
                <a href="#" class="item">Religious Ceremonies</a>
                <a href="#" class="item">Gazebo Plans</a>
              </div>
            </div>
            <div class="three wide column">
              <h4 class="ui inverted header">Services</h4>
              <div class="ui inverted link list">
                <a href="#" class="item">Banana Pre-Order</a>
                <a href="#" class="item">DNA FAQ</a>
                <a href="#" class="item">How To Access</a>
                <a href="#" class="item">Favorite X-Men</a>
              </div>
            </div>
            <div class="seven wide column">
              <h4 class="ui inverted header">Footer Header</h4>
              <p>Extra space for a call to action inside the footer that could help re-engage users.</p>
            </div>
          </div>
        </div>
      </div> 
      
    </div>
    <!-- animistion end-->
  </div>
  <!-- pusher end -->

  <sec:authorize access="isAuthenticated()">
  
  <c:url var="logoutUrl" value="/logout"/>
  <form id="logout-form" action="${logoutUrl}" method="post">
    <sec:csrfInput />
  </form>
  
  <!-- logout modal -->
  <div class="ui small logout modal">
    <div class="header">
            로그아웃
    </div>
    <div class="content">
      <p>정말 로그아웃 하시겠습니까?</p>
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
  
  
  </sec:authorize>  
        

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


<div class="ui user info modal" >
    <div class="header">
      User Info
    </div>
    <div class="image content">
      <div class="ui medium circular image">
        <img src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>">
      </div>
      <div class="description">
        <div class="ui header">Default Profile Image</div>
        <p>We've found the following <a href="https://www.gravatar.com" target="_blank">gravatar</a> image associated with your e-mail address.</p>
        <p>Is it okay to use this photo?</p>
        
        <table class="ui definition table">
      <thead>
        <tr>
          <th>Class Name</th>
          <th>Size</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>가입일</td>
          <td>35px</td>
        </tr>
        <tr>
          <td>Tiny</td>
          <td>80px</td>
        </tr>
        <tr>
          <td>Small</td>
          <td>150px</td>
        </tr>
        <tr>
          <td>Medium</td>
          <td>300px</td>
        </tr>
        <tr>
          <td>Large</td>
          <td>450px</td>
        </tr>
        <tr>
          <td>Big</td>
          <td>600px</td>
        </tr>
        <tr>
          <td>Huge</td>
          <td>800px</td>
        </tr>
        <tr>
          <td>Massive</td>
          <td>960px</td>
        </tr>
      </tbody>
    </table>
        
      </div>
    </div>
    <div class="actions">
      <div class="ui black deny button">
        Nope
      </div>
      <div class="ui positive right labeled icon button">
        Yep, that's me
        <i class="checkmark icon"></i>
      </div>
    </div>
  </div>

<!-- Message  -->

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
  
   <div class="ui article author popup bottom left transition hidden">
                 <div class="column">
<!--                   <h4 class="ui header">Fabrics</h4> -->
                  <div class="ui link list">
                    
                    <a class="item">작성글</a>
                    
                    <sec:authorize access="isAuthenticated()">
                    <a class="item">회원정보</a>
                    <a class="show message modal item">쪽지보내기</a>
                    </sec:authorize>
                  
                  </div>
                 </div>
    </div>
  
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


<!-- Notifyjs -->
<script type="text/javascript" src="<c:url value="/resources/vendors/notifyjs/dist/styles/semantic-ui/notify-semantic.js"/>"></script>
  

<script type="text/javascript" src="<c:url value="/resources/javascript/common.js"/>"></script>


<script type="text/javascript" src="<c:url value="/resources/javascript/message.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/board/detail.js"/>"></script>
	

</body>
</html>