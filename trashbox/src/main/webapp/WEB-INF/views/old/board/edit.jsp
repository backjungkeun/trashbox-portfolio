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
    
    <!-- Site Properties -->
    <title>article_Edit - TrashBox</title>  
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.serialize-object.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.browser.min.js"/>"></script>
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
    
    <!-- SmartEditor -->   
    <script type="text/javascript" src="<c:url value="/resources/vendors/SE2.8.2.O12056/js/HuskyEZCreator.js"/>" charset="UTF-8"></script>
       
    <!-- User Custom -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/trashbox.css"/>">

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
     
     
      $form = $('.ui.form');
      
      $form.form('set value', 'title', '${article.title}');
      $form.form('set value', 'boardNo', '${article.boardNo}');
      

     
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
    

     
     
     
      
      
      
      
      
//       var token = $("meta[name='_csrf']").attr("content");
//       var header = $("meta[name='_csrf_header']").attr("content");
      
//       $.fn.api.settings.api = {
//     		  'send mail' : '<c:url value="/sendAuthMail"/>'
//       };
      
      
//       $('#resendMailButton').api({
//         action: 'send mail',  
//         method: 'POST',
//         stateContext: $('.ui.large.resendAuthMail.form') ,
//         data: {  
//         	id: '${errorUser}',
// 		    email: '${email}'
// 		},
        
//         beforeXHR: function(xhr) {
//         	xhr.setRequestHeader (header, token);
//         },
        
//         onSuccess: function (response) {   
        
//         	if(response) {
//         		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
//             	$('.actions > a').attr("href", "<c:url value='/login'/>");
            	
//             	$('.ui.small.basic.modal')
//         		.modal({ closable  : false})
//         		.modal('show');   
        	
//         	} else {
//         		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
// //             	$('.actions > a').attr("href", "<c:url value='/login'/>");
            	
//             	$('.ui.small.basic.modal')
//         		.modal({ closable  : false})
//         		.modal('show');   
        		
//         	}
 
//         }
        
        
   
        
        
    
//       });
      
      
      
//       $form.api({
//           action: 'send mail',  
//           method: 'POST',
//           serializeForm: true,
//           stateContext: $('.ui.large.resendAuthMail.form') ,
//           data: {  
//           	id: '${errorUser}'
//   		  },
  		  
//   		  beforeSend: function(settings) {
//             var isValid = $form.form('is valid');
        
//             if(!isValid) {
//          	   return false;
//             }
           
//             return settings; 
//           },
          
//           beforeXHR: function(xhr) {
//           	xhr.setRequestHeader (header, token);
//           },
          
//           onSuccess: function (response) {   
          
//           	if(response) {
//           		$('.ui.icon.header > p').text("e-mail 보내기가 성공하였습니다.");
//               	$('.actions > a').attr("href", "<c:url value='/login'/>");
              	
//               	$('.ui.small.basic.modal')
//           		.modal({ closable  : false})
//           		.modal('show');   
          	
//           	} else {
//           		$('.ui.icon.header > p').text("e-mail 보내기가 실패하였습니다.");
// //               	$('.actions > a').attr("href", "<c:url value='/login'/>");
              	
//               	$('.ui.small.basic.modal')
//           		.modal({ closable  : false})
//           		.modal('show');   
          		
//           	}
   
//           }
    
      
//         });
      
      
      
     
      
//       $.fn.form.settings.rules.checkDuplicateEmail = function(value) {
//     	  var result;
	  
//     	  if(!(value === undefined || '' === value || $.isArray(value) && value.length === 0)) {
    		  
//     		  $.ajax({
//     			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
//     			  type: "GET",
//     			  url: "<c:url value='/checkDuplicateEmail'/>",
//     			  data: { email: value }
    			  
//     		  }).done(function(data) {
//     			  value = (typeof value == 'string') 
//     			        ? value.toLowerCase() 
//     					: value ;
  		          
//     			  data = (typeof data == 'string') 
//     			        ? data.toLowerCase() 
//     			        : data ;
    			  
//   		          result = (value != data);
    			  
//     		  });
    		  
//     	  } 
//     	  return result;	  
//       }
   	  
    
       
      
      $('#frm').form({
    	  
    	  inline: true,
    	  on: blur,
    	  
    	 
    	  fields: {
                
            title: {
                identifier  : 'title',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '제목을  입력하세요.'
                  }
                ]
              },
            content: {
                identifier  : 'content',
                rules: [  
                  {
                    type   : 'empty',
                    prompt : '내용이 비었습니다.'
                  }
                ]
              }
              
          }
      });
  
     
      
      $('.ui.small.logout.modal')
      .modal({
          closable: false,
          onApprove: function () {
              $('#logout-form').submit();
          }
      })

  .modal('attach events', '#logout-button', 'show');
      
      
      $('.ui.dropdown').dropdown();
      
 
      
if($.browser.chrome) {
	console.log('Chrome ' + $.browser.version );
	$('#browser-info > span').text('Chrome ' + $.browser.version);

} else if($.browser.msie) {
	console.log('IE '+ $.browser.version );
	$('#browser-info > span').text('IE ' + $.browser.version);

} else if($.browser.msedge) {
	console.log('Edge ' + $.browser.version);
	$('#browser-info > span').text('Edge ' + $.browser.version);
	
} else if($.browser.mozilla) {
	console.log($.browser.version);
}
  
  console.log(navigator.userAgent);
  console.log(navigator.appVersion);
  

//   function subInit() {
// 	//전역변수선언
// 	    var editor_object = [];
// 	    var ctx = getContextPath();
	     
// 	    console.log(ctx);
// 	    nhn.husky.EZCreator.createInIFrame({
// 	        oAppRef: editor_object,
// 	        elPlaceHolder: "smarteditor",
// 	        sSkinURI: ctx + "/smarteditor/SmartEditor2Skin.html", 
// 	        htParams : {
// 	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
// 	            bUseToolbar : true,             
// 	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
// 	            bUseVerticalResizer : true,     
// 	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
// 	            bUseModeChanger : true, 
// 	        }
// 	    });
	     
// 	    //전송버튼 클릭이벤트
// 	    $("#savebutton").click(function(){
// 	        //id가 smarteditor인 textarea에 에디터에서 대입
// 	        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	         
// 	        // 이부분에 에디터 validation 검증
	         
// 	        //폼 submit
// 	        $("#frm").submit();
// 	    })


// 	    function getContextPath() {
// 	    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
// 	    }
// 	}
  
//   $( window ).resize(function() {
// 		 var height = $('.se2_input_area.husky_seditor_editing_area_container').height();
// 		  console.log(height);
//   });
  
//   console.log('#smart_editor2' + $('.ui.sement').width());
  
//    $('iframe').load(function(){    //iframe이 모두 load된후 제어
// 	    $(this).contents().find('body');
// 	});
   
//    console.log($('iframe').contents().find('#smart_editor2'));
       
       
     // 전역 변수
	 var oEditors = [];

	 // 스마트에디터 프레임 생성
	 nhn.husky.EZCreator.createInIFrame({

	 oAppRef: oEditors,

	 elPlaceHolder: "smarteditor", //textarea에서 지정한 id와 일치해야 합니다.

	 sSkinURI: "<c:url value='/resources/vendors/SE2.8.2.O12056/SmartEditor2Skin.html'/>",

	 fCreator: "createSEditor2",
	 
	 htParams : {
		 // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		 bUseToolbar : true,
		 // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		 bUseVerticalResizer : true,
		 // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		 bUseModeChanger : true,
		 
	 }
	 
	 });
	 
	 //전송버튼
	 $("#savebutton").click(function(){
		 //id가 smarteditor인 textarea에 에디터에서 대입
		 oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		 //폼 submit
		 $("#frm").submit();

	 });
	 
	 
// 	 $('#se2_iframe').load(function() {
// 		 alert('se2_iframe load');
// 	 });
// 	var xxxd = $('#se2_iframe').contents().find('p').text('안녕하세요');
       
//     console.log(xxxd);
       
    })
  ;
  </script>
  
  
  

</head>
<body id="trashbox">

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
          <img src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>">
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
             글수정
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
              <div class="header orange item active">글수정
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
        
        
        <!-- Article Edit -->
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
               <a class="author" data-title="Elliot Fu" data-content="Elliot has been a member since July 2012">${article.userNickname}</a> 
               <span class="sum">
                 <span class="read">조회 <b>${article.hitCount}</b></span>
                 <span class="vote">추천 <b>${article.recommendCount}</b></span>
                 <span class="date">날짜 <b><fmt:formatDate value="${article.registrationDate}" pattern="yyyy.MM.dd"/></b></span> 
               </span>
             </p>
             
             <br>
             <br>
             
             
             <div class="article body">
             <%-- enctype="multipart/form-data" / ${_csrf.parameterName}=${_csrf.token} --%>
            <c:url value="/board/edit/do" var="ArticleEditUrl"/>
            <form class="ui form" id="frm" method="POST" action="${ArticleEditUrl}" style="outline: none;">
              
              <input type="hidden" name="no" value="${article.no}" />
              <input type="hidden" name="userNo" value="${article.userNo}" />
           
           
              <div class="fields">

              <div class="four wide field">
              <label>카테고리</label>
                <div class="ui fluid category selection dropdown">
                  <input type="hidden" name="boardNo">
                  <i class="dropdown icon"></i>
                  <div class="default text">Select Category</div>
                    <div class="menu">
                     <c:forEach items="${boardTypeList}" var="boardType">
                       <div class="item" data-value="${boardType.no}" data-type="${boardType.name}">${boardType.koName}</div>
                     </c:forEach>
                    
                      
                    </div>
                </div>
              </div>
              
              <div class="twelve wide field">
               <label>제목</label>
                    <input type="text" name="title" placeholder="title">
              </div>
            
              </div>
           
           
<!--               <div class="field"> -->
<!--                 <label>제목</label> -->
<!--                 <div class="ui fluid small input"> -->
<%--                  <input type="text" name="title" placeholder="${article.title}" >               --%>
<!--                 </div> -->
<!--               </div> -->
              
              <div class="field">
                <label>내용</label>
                <textarea rows="2" name="content" id="smarteditor" rows="10" cols="100" style="width:100%; min-width: 270px!important; height:412px;">
                ${article.content}
                </textarea>
              
              </div>
              
              <br>
             <sec:csrfInput/>
<!--              <input type="button" id="savebutton" value="서버전송" /> -->
            </form>
            
            
            
 
 
 </div>
 
  <div class="article footer">

<!--     <a class="ui large basic blue label"><i class="thumbs outline up icon"></i>3</a> -->
<!--     <a class="ui large basic red label"><i class="thumbs outline down icon"></i>-3</a> -->
    
    
    
<!--     <div class="ui large labels"> -->
<!--       <a class="ui blue basic label"> -->
<!--         <i class="thumbs outline up icon"></i> -->
<!--          3 -->
<!--       </a> -->
<!--       <a class="ui red basic label"> -->
<!--         <i class="thumbs outline down icon"></i> -->
<!--          -3 -->
<!--       </a> -->
<!--     </div> -->

 

    

    





<button id="savebutton" class="ui teal right floated right labeled icon button">
  <i class="write icon"></i>
  Save
</button>

  
<!-- <div class="ui teal right floated right labeled icon top right pointing dropdown button"> -->
<!--    <i class="setting icon"></i> -->
<!--   <span class="text">Save</span> -->
<!--   <div class="menu"> -->
    
<!--     <div class="item"><i class="edit icon"></i> Edit Post</div> -->
<!--     <div class="item"><i class="delete icon"></i> Remove Post</div> -->
<!--     <div class="item"><i class="hide icon"></i> Hide Post</div> -->
    
<!--   </div> -->
<!-- </div> -->


    <br>
    <br>
    
  
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
                    
                    <c:forEach items="${list}" var="board"> 
                    <tr>
                      <td class="no">${board.no}</td>
                      <td class="title"><a href="#">${board.title}</a>
                       <span class="comment num"><span>[3]</span></span>
                       <br> 
                       <span class="small info">
                        <span><span>Date</span><b><fmt:formatDate value="${board.registrationDate}" pattern="yyyy.MM.dd"/></b></span>
                        <span class="left solid"><span>By</span><b><img class="ui avatar image" src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>"><a href="#">${board.userNickname}</a></b></span>
                        <span class="left solid"><span>Views</span><b>${board.hitCount}</b></span>
                       </span>
                      </td>
                      <td class="author">
                      <img class="ui avatar image" src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>">
                      ${board.userNickname}
                      
                      
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
 
 <br>
 <br>
<br>               


<div class="pagination">
  <a href="#" class="ui compact icon basic button">
    <i class="left chevron icon"></i>
    Prev
  </a>
  <a href="#" class="ui compact icon basic button">
   5
  </a>	
  <a href="#" class="ui compact icon basic button">
   6
  </a>	  
  <a href="#" class="ui compact icon basic button">
   7
  </a>	  
  <a href="#" class="ui compact icon basic button">
   8
  </a>	
  <a href="#" class="ui compact icon basic button">
   9
  </a>	  
  <a href="#" class="ui compact icon basic button">
   10
  </a>	  
  <a href="#" class="ui compact icon basic button">
   11
  </a>
  <a href="#" class="ui compact icon basic button">
   12
  </a>	  
  <a href="#" class="ui compact icon basic button">
   13
  </a>	  
  <a href="#" class="ui compact icon basic button">
   14
  </a>	  
  <a href="#" class="ui compact icon basic button">
   36
  </a>	  
  <a href="#" class="ui compact icon basic button">
    Next
    <i class="right chevron icon"></i>   
  </a>
</div>

<br>
<br>



<div class="ui small floating labeled icon bottom left pointing dropdown basic button">
   <input type="hidden" name="searchTarget" value="title_content">
   <i class="filter icon"></i>
   <span class="text">검색</span>
   <div class="menu"> 
     <div class="item" data-value="title_content">제목+내용</div>
     <div class="item" data-value="title">제목</div> 
     <div class="item" data-value="content">내용</div>
     <div class="item" data-value="comment">댓글</div>
     <div class="item" data-value="nickname">닉네임</div>
   </div>
</div>
<div class="ui small action input">
  <input type="text" placeholder="Search...">
  
   <button class="ui basic icon button" type="button">
    <i class="search icon"></i>
  </button>
</div>
                
              
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
  <form id="logout-form"action="${logoutUrl}" method="post">
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






	

</body>
</html>