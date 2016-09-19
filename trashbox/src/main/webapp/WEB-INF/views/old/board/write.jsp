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
    <title>Write - TrashBox</title>  
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.serialize-object.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.browser.min.js"/>"></script>
<%--     <script type="text/javascript" src="<c:url value="/resources/vendors/migrate.js"/>"></script> --%>
      
    <!-- Semantic-UI Components -->
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.min.css"/>"> --%>
<%--     <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.min.js"/>"></script> --%>
    <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.js"/>"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.css"/>">
    
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/header.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/menu.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/form.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/dropdown.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/button.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/modal.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/sidebar.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/input.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/transition.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/segment.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/icon.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/grid.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/container.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/item.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/site.css"/>"> --%>
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/components/list.css"/>"> --%>

    <!-- Animate -->
     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/animate.css"/>">
    
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

    <!-- font -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/font/hanna.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/font/jejugothic.css"/>">
    
   

    <!-- FileUpload -->
    <!-- @Bootstrap -->
<%--     <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/bootstrap.min.css"/>"> --%>
    <!-- @Generic page styles -->
    <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/style.css"/>">
<!--     @blueimp Gallery styles -->
    <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/blueimp-gallery.min.css"/>">
<!--     @CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/jquery.fileupload.css"/>">
    <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/jquery.fileupload-ui.css"/>">
<!--     @CSS adjustments for browsers with JavaScript disabled -->
    <noscript><link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/jquery.fileupload-noscript.css"/>"></noscript>
    <noscript><link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/jquery.fileupload-ui-noscript.css"/>"></noscript>

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
      
//       var token = $("meta[name='_csrf']").attr("content"),
//           header = $("meta[name='_csrf_header']").attr("content");
     
      
//       $('#frm').api({
//     	  action: $(this).attr('action'),  
//           method: 'POST',
// 		  serializeForm: true,
          
// // 		  data: {  
// //           	articleNo: articleNo
// //           },
          
//           beforeSend: function(settings) {

//   			return settings;
//           },
          
//           beforeXHR: function(xhr) {
//           	xhr.setRequestHeader (header, token);
//           },
      
//           onSuccess: function (response, element, xhr) {
//         	  console.log(response);
        
//           },
          
//           onFailure: function(response, element) {
          	
//           },
          
//           onError:  function(errorMessage, element, xhr) {
          	
//           }
          
    	  
//       });
    
       
      
      $('#frm').form({
    	  
    	  inline: true,
    	  on: blur,
    	  
    	 
    	  fields: {
            
    		category: {
    			identifier : 'boardNo',
    			rules: [
    			    { 
    			      type : 'empty', 
    			      prompt : 'empty boardNo'
    			    }
    			  ]
    		},
    		  
            title: {
                identifier  : 'title',
                rules: [
                  {
                    type   : 'empty',
                    prompt : 'empty title.'
                  } 
                ]
              },
            content: {
                identifier  : 'content',
                rules: [  
                  {
                    type   : 'empty',
                    prompt : 'empty content'
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
      
   
      
  	$('.category.dropdown')
    .dropdown({
      onChange: function(value, text , $selectedItem) {
    	 
    	  var boardTypeName = $selectedItem.attr('data-type');
    	  
    	  $('#frm').form('set value', 'boardTypeName', boardTypeName);
    	
    	  console.log(value);
    	  console.log($selectedItem);
//     	  if(value != '') {
//         	  $('#post_option_button').attr('data-action', value);
//           } 
      }
    })
    .dropdown('set selected', '${defaultCategory}');
     
 
  	
      
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
		 
		
		 
		 for(var i=0; i<$.uploadSuccessFiles.length; i++) {
			 var name = $('<input type="hidden" name="file-name[]" value="' + $.uploadSuccessFiles[i].name + '" />'),
			     saveName = $('<input type="hidden" name="file-saveName[]" value="' + $.uploadSuccessFiles[i].saveName + '" />'),
			     size = $('<input type="hidden" name="file-size[]" value="' + $.uploadSuccessFiles[i].size + '" />');
			
			 $('#frm').append(name, saveName, size);
		 }
		 
		 //폼 submit
		 $("#frm").submit();

	 });
	 
	 // grobal progress hide
     $('#grobal-progress')
       .transition('hide')
     ;
	 
	 
     
       
       
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
        <a class="item" href="#Advertisement">업체</a>
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
             글쓰기
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
              <div class="header orange item active">글쓰기
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
<!--              <h4 class="my header"> -->
<%--               ${article.title} --%>
<!--              </h4> -->
<!--              <p class="info"> -->
<%--                <a class="author" data-title="Elliot Fu" data-content="Elliot has been a member since July 2012">${article.userNickname}</a>  --%>
<!--                <span class="sum"> -->
<%--                  <span class="read">조회 <b>${article.hitCount}</b></span> --%>
<%--                  <span class="vote">추천 <b>${article.recommendCount}</b></span> --%>
<%--                  <span class="date">날짜 <b><fmt:formatDate value="${article.registrationDate}" pattern="yyyy.MM.dd"/></b></span>  --%>
<!--                </span> -->
<!--              </p> -->
             
<!--              <br> -->
<!--              <br> -->
             
             
             <div class="article body">
             
             <%-- enctype="multipart/form-data" / ${_csrf.parameterName}=${_csrf.token}--%>
            <c:url value="/board/write/do" var="ArticleWriteUrl"/>
            <form class="ui large form" id="frm" method="POST" action="${ArticleWriteUrl}">
              
<%--               <input type="hidden" name="boardNo" value="${boardType.no}" /> --%>
              <input type="hidden" name="boardTypeName" />
              <input type="hidden" name="userNo" value="${user.no}" />
           
              <div class="two fields">

              <div class="four wide field">
              <h3 class="ui header"><span style="color:red;">* </span>카테고리</h3>
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
              
              <br>
              
              <div class="twelve wide field">
               <h3 class="ui header"><span style="color:red;">* </span>제목</h3>
                    <input type="text" name="title" placeholder="제목을 입력해주세요.">
              </div>
            
              </div>
              
          <br>

           
<!--               <div class="field"> -->
<!--                 <label>제목</label> -->
<!--                 <div class="ui fluid small input"> -->
<!--                  <input type="text" name="title" placeholder="Enter ..">               -->
<!--                 </div> -->
<!--               </div> -->
              
              <div class="field">
                <h3 class="ui header"><span style="color:red;">* </span>내용</h3>
                <textarea rows="2" name="content" id="smarteditor" rows="10" cols="100" style="width:100%; min-width: 270px!important; height:412px;"></textarea>
              
              </div>
              
              <br>
             
<!--              <input type="button" id="savebutton" value="서버전송" /> -->
             <sec:csrfInput/>
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
              
                <div class="ui attach file segment" style="text-align:left;">
  
 <!-- The file upload form used as target for the file upload widget -->
    <form id="fileupload" class="ui form" action="/" method="POST" enctype="multipart/form-data">
        <!-- Redirect browsers with JavaScript disabled to the origin page -->
<!--        <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript>-->
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="field">
               <h3 class="ui header">첨부파일</h3>
                
        </div>
        
        <div class="fileupload-buttonbar">
           
           <!-- The fileinput-button span is used to style the file input field as button -->
           <table class="ui striped unstackable table">
             <thead>
               <tr class="center aligned">
                 <th class="check">
                   <div id="master-checkbox" class="ui master checkbox">
                     <input type="checkbox" name="removeAll" class="toggle">
                     <label></label>   
                   </div>
                 </th>
                 <th>
                   <button class="ui green icon button fileinput-button">
                    <i class="add circle icon"></i>
                    <input type="file" name="files[]" multiple>
                   </button>
                 </th>
                 <th>
                   <button type="submit" class="ui blue icon button start">
                    <i class="upload icon"></i>
                   </button>
                 </th>
                 <th>
                   <button type="reset" class="ui yellow icon button cancel">
                    <i class="remove icon"></i>
                   </button>
                 </th>
                 <th>
                   <button type="button" class="ui red icon button delete">
                    <i class="trash icon"></i>
                   </button>
                 </th>
               </tr>
             </thead>
           </table>

           
           </div> 
            
               
            <!-- The global file processing state -->
            <span class="fileupload-process"></span>

            <!-- The global progress state -->
            <div id="grobal-progress" class="fileupload-progress fade" >
                <!-- The global progress bar -->
<!--                 <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100"> -->
<!--                     <div class="progress-bar progress-bar-success" style="width:0%;"></div> -->
<!--                 </div> -->
                
                <div class="ui indicating progress" role="progressbar" data-value="1" data-total="20">
                  <div class="bar">
                    <div class="progress"></div>
                  </div>
                </div>
                
                <!-- The extended global progress state -->
                <h4 class="ui orange header progress-extended">&nbsp;</h4>
            </div>
       
        <!-- The table listing the files available for upload/download -->
        <table id="file-table" role="presentation" class="ui compact striped definition table" ><tbody class="files"></tbody></table>
        
        
    </form>
    
     </div>
            
            </div>
          </div>
    

<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload animated bounceInLeft">
        <td class="check collapsing center aligned">
           <div class="ui disabled checkbox">
             <input type="checkbox" disabled="disabled">
             <label></label>
           </div>
        </td>
        <td class="preview center aligned">
          
        </td>
        <td class="name">
            {%=file.name%}
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            
            <div class="ui indicating progress" role="progressbar" data-value="1" data-total="20">
              <div class="bar">
                <div class="progress"></div>
              </div>
            </div>
    
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="ui icon blue button start" disabled>
                    <i class="upload icon"></i>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="ui icon yellow button cancel">
                    <i class="remove circle icon"></i>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td class="check collapsing center aligned">
            {% if (file.deleteUrl) { %}
                <div class="ui child checkbox">
                  <input type="checkbox" name="delete" value="1" class="toggle">
                  <label></label>   
                </div>
            {% } %}
        </td>
        <td class="preview center aligned">

                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}" style="width:80px;"></a>
                {% } %}
        </td>
        <td class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
           
            {% if (file.error) { %}
                <div><div class="ui small red label">Error</div> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="ui red icon button delete"  data-name="{%=file.name%}" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}?saveName={%=file.saveName%}&${_csrf.parameterName}=${_csrf.token}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="trash icon"></i>
                </button>
            {% } else { %}
                <button class="ui icon yellow button cancel">
                    <i class="remove circle icon"></i>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>


<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/vendor/jquery.ui.widget.js"/>"></script>

<!-- The Templates plugin is included to render the upload/download listings -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/tmpl.min.js"/>"></script>

<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/load-image.all.min.js"/>"></script>

<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/canvas-to-blob.min.js"/>"></script>

<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<!--<script src="js/test/semantic.min.js"></script> -->
<%-- <script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/bootstrap.min.js"/>"></script> --%>

<!-- blueimp Gallery script -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/jquery.blueimp-gallery.min.js"/>"></script>

<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.iframe-transport.js"/>"></script>

<!-- The basic File Upload plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload.js"/>"></script>

<!-- The File Upload processing plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-process.js"/>"></script>

<!-- The File Upload image preview & resize plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-image.js"/>"></script>

<!-- The File Upload audio preview plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-audio.js"/>"></script>

<!-- The File Upload video preview plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-video.js"/>"></script>

<!-- The File Upload validation plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-validate.js"/>"></script>

<!-- The File Upload user interface plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-ui.js"/>"></script>

<!-- The main application script -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/main.js"/>"></script>

<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
                
              
             
           
           
           
           
           
              
                        
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



	

</body>
</html>