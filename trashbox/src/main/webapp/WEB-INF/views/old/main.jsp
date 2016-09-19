<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Main - TrashBox</title>  
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery-dateFormat.min.js"/>"></script>
   
    <!-- Semantic-UI Components -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.min.js"/>"></script>
  
	<!-- Animate -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/animate.css"/>">  
	
	<!-- Easing -->
	<script type="text/javascript" src="<c:url value="/resources/vendors/easing.min.js"/>"></script> 
	
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
    
    <!-- font -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/font/hanna.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/font/jejugothic.css"/>">
    
    
    <script type="text/javascript">
        $(document).ready(function () {
        	
//         	/* reflash scrollTop */
//         	$("#trashbox").animate({scrollTop: 0}, 100);
        	
        	$(function () {
        		var token = $("meta[name='_csrf']").attr("content");
        		var header = $("meta[name='_csrf_header']").attr("content");
        		
        		$(document).ajaxSend(function(e, xhr, options) {
        			xhr.setRequestHeader(header, token);
        			xhr.setRequestHeader('X-AJAX-CALL', true);
        			
        		});
        		
        	});
        	
        	
        	$('.right-sidebar-button.item').on('click', function() {
        		
        		$('.right-sidebar-button.item .user.icon')
        		  .transition('remove looping');
        	});
    	
//         	$('.notification-button').on('click', function() {
//         		notify('info');
        		
//         	$('.right-sidebar-button.item .user.icon')
//       		  .transition('set looping')
//       		  .transition({    
//       			  animation  : 'jiggle',
//       			  duration   : '2s'
//       		  })
//       		;
        		
//         	});
        	
//         	function notify(style) {
//         		$('.right-sidebar-button.item') 		
//         		.notify({
//                     title: 'Notification',
//                     text: 'new message!'
                    
//                 }, {
//                     style: 'semantic',
//                     className: style,
//                     arrowShow: false,
//                     position:'bottom right'
// //                     autoHide: false,
// //                     clickToHide: true
                  
//                 });
//             }
        	
        	
  
        	
        
            // introduction animation
            $('#trashbox .introduction').addClass('animated zoomIn');

            // sidebar settings
            $('.ui.sidebar').sidebar({
                dimPage: true,
                transition: 'overlay',
                mobileTransition: 'overlay'
            });

            // create sidebar and attach to menu open
            $('.ui.sidebar.left')
                .sidebar('attach events', '#left-sidebar-button')
                .sidebar('attach events', '.right-sidebar-button.item', 'hide');

            $('.ui.sidebar.right')
                .sidebar('attach events', '.right-sidebar-button.item')
                .sidebar('attach events', '#left-sidebar-button', 'hide');


            $('.ui.sidebar.left')
                .sidebar('attach events', '#second-left-sidebar-button');


            $('.ui.sidebar.right')
                .sidebar('attach events', '.right-sidebar-button.item');


            $('.ui.sidebar.menu a.item')
                .on('click', function () {
                    $(this)
                        .addClass('active')
                        .siblings()
                        .removeClass('active');
                });


            //modal
            $('.ui.small.logout.modal')
                .modal({
                    closable: false,
                    onApprove: function () {
                        $('#logout-form').submit();
                    }
                })

            .modal('attach events', '#logout-button', 'show');



            //tab
//             $('.ajax-tab.meun .item').tab();


            //following bar -visibility
            $('#trashbox')
                .visibility({
                    offset: -10,
                    observeChanges: false,
                    once: false,
                    continuous: false,
                    onTopPassed: function () {
                        requestAnimationFrame(function () {
                            $('.following.bar')
                                .addClass('dark fixed')
                                .find('.menu .header.item')
                                .addClass('red active');

                        });
  
                    },
                    onTopPassedReverse: function () {
                        requestAnimationFrame(function () {
                            $('.following.bar')
                                .removeClass('dark fixed')
                                .find('.menu .header.item')
                                .removeClass('red active');
                        });
                    }
                });

            // banner background change
            $('#trashbox .masthead.zoomed')
                .removeClass('zoomed')
                .addClass('bg');

            // move main segment
            $('#trashbox .masthead.bg .button').on('click', function () {
                $('#trashbox').animate({
                    scrollTop: ($('.ui.vertical.stripe.main.segment').offset().top)
                }, 750);

            });

            
           

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

             //swal("Good job!", "You clicked the button!", "success");
            
            $('.ui.accordion').accordion();
            
            
            
            
            
	        setTimeout(function(){ 
		    	
		    	  // notice segment visibility
		          $('.ui.notice.segment')
		          .visibility({
		            once: true,
		            observeChanges: true,
		            onTopVisible: function() {
		              console.log("ajax-tab notice load");
		              
		              $('#notice-tab-button').click();
// 		              $('.ajax-tab.menu .item.active').each(function() {
// 		            		//console.log($(this)); //
// 		            		$(this).click();
		            
// 		              });
		            }
		          })
		          ;
		    	  
		          $('.ui.event.segment')
		          .visibility({
		            once: true,
		            observeChanges: true,
		            onTopVisible: function() {
		              console.log("ajax-tab event load");
		              
		              $('#event-tab-button').click();
		            }
		          })
		          ;
		          
		          $('.ui.combo.segment')
		          .visibility({
		            once: true,
		            observeChanges: true,
		            onTopVisible: function() {
		              console.log("ajax-tab popular load");
		              
		              $('#popularArticle-tab-button').click();
		            }
		          })
		          ;
		          
		          $('.ui.freeboard.segment')
		          .visibility({
		            once: true,
		            observeChanges: true,
		            onTopVisible: function() {
		              console.log("ajax-tab freeboard load");
		              
		              $('#freeboard-tab-button').click();
		            }
		          })
		          ;
		    
		      }, 1000);
            
	       
	       
            
	        $('.ajax-tab.menu .item')
	         .tab({
	      
	        	 cache: false,	       
	        	 apiSettings: {     		 
			         loadingDuration : 300,
			         
			         beforeSend : function(settings) {
                    	 settings.dataType = 'JSON';
//                     	 settings.data = {
//                     			 limit : 5
//                     	 }

                        
//                          console.log(settings);

//                     	 console.log(settings.urlData.tab);
                    	
                    	 if(settings.urlData.tab == 'newComments') {
                    		 settings.url = '/trashbox/comment/{$tab}';
                    	 } else {
                    		 settings.url = '/trashbox/board/{$tab}';  
                    	 }
                    	 
                    	 
                    	 return settings;
                     },
                     
                     responseAsync : false,
               
                     onResponse : function(myResponse) {
                    	 
                    	 console.log(myResponse.content);
                    	 
                    	 var boardTypeName = myResponse.boardTypeName;
                    	 var content = myResponse.content;
                    	
//                     	 var response = {
//                     		notice : content,
//                     		event  : content,
//                     		popularArticles : content,
//                     		newArticles : content,
//                     		newComments : content
//                     	 };

                         var response = {};
                         response[boardTypeName] = createList(boardTypeName, content);
                    	 
                    	 return response[boardTypeName];
                     }
                     
	        	
// 	        		 mockResponse : function(settings) {
	        			 
// 	        			 var response = {
// 	        					 notice : 'AJAX Tab One',
// 	        					 second : 'AJAX Tab Two',
// 	        					 third  : 'AJAX Tab Three'
	        					 
// 	        			 };
	        			 
// 	        			 console.log(settings);
// 	        			 return response[settings.urlData.tab]; 
// 	        		 },
	         
	         
	        	 },
	        	 context : 'parent',
// 	        	 auto    : true,
// 	        	 path:  '/trashbox/board/',
	        	 
	        	 onRequest : function(tabPath) {
	        		 console.log('tabPath : ' + tabPath);
	        	 }
	        	 
	         });
	        
	        function getCommentCount(articleNoList) {
	        	var result;
	        	$.ajax({
  	  			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
  	  			  type: "POST",
  	  			  url: "<c:url value='/comment/getTotalCountByArticle'/>",
  	  			  data: {articleNoList : articleNoList}
  	  			  
  	  		    }).done(function(data) {
  	  			  console.log(data);
  	  			   result = data.commentCount;
  	  		    });
	        	
	        	return result;
	        }
	        
	        
	        function createList(boardTypeName, articleList) {
				//받아온 정보만큼 list 화면 구성
                
                var articleNoList = [];

                $(articleList).each(function() {
                	articleNoList.push(this.no);
                });
                
                if(articleNoList.length > 0) {
                
                
                var commentCountInfo = getCommentCount(articleNoList);
                
                $(articleList).each(function(i) {
                	var no = $(this).attr('no');
                	if(typeof commentCountInfo[no] !== "undefined") {
                		this.commentCount = commentCountInfo[no];
                	} else {
                		this.commentCount = 0;
                	}
//                 	this.commentCount = commentCountList[i];
                });
                

				var list = $('<div class="ui middle aligned divided list"></div>');
	
				
				$(articleList).each(function() {
					var item = $('<div class="item"></div>'),
					    rightContent = $('<div class="right floated content"></div>'),
					    info = $('<div class="info"></div>'),
					    
					    starNum = $('<span class="num"></span>'),
					    starIcon = $('<i class="star icon"></i>'),
					    commentNum = $('<span class="num"></span>'),
					    commentIcon = $('<i class="comment icon"></i>'),
					    
					    content = $('<div class="content"></div>'),
					    header = $('<div class="header title="x"></div>'),
					    icon = $('<i class="right triangle icon"></i>'),
					    link = $('<a href="#"></a>');
					

					    
					    if(boardTypeName == 'notice' 
					    		|| boardTypeName == 'newComments'
					    		|| boardTypeName == 'newArticles') {
						   info.text($.format.date(this.registrationDate, 'yyyy-MM-dd'));
					   
					    } else {
					       starNum.text(this.recommendCount + '\n');
					       commentNum.text(this.commentCount);
					    }
					   
					    if(boardTypeName == 'newComments') {
					       link.attr('href', '/trashbox/board/detail/' + this.articleNo);
					       link.text(this.content);
					       header.attr('title', this.content);
					   
					    } else {
					       link.attr('href', '/trashbox/board/detail/' + this.no);
					       link.text(this.title);
					       header.attr('title', this.title);
					    }
					   
					   
					 
					    
// 					    date.text($.format.prettyDate(this.registrationDate));
// 					    text.text(this.content);
			
					
					
// 					    avatar = $('<a class="avatar"></a>'),
// 					    img = $('<img>'),
// 					    content = $('<div class="content"></div>'),
// 					    author = $('<a class="author"></a>'),
// 					    metadata = $('<div class="metadata"></div>'),
// 					    date = $('<span class="date"></span>'),
// 					    text = $('<div class="text"></div>');
					
// 					    img.attr('src', '/trashbox/resources/semantic-ui/assets/images/avatar/tom.jpg'); // 확인
// 					    author.text(this.userNo);
// 					    date.text($.format.prettyDate(this.registrationDate));
// 					    text.text(this.content);
			
					   // $.format.prettyDate()
					    	
					    // build
					    header.append(icon, link);
					    content.append(header);
					    
					    if(boardTypeName != 'notice' 
					    		&& boardTypeName != 'newComments'
					    		&& boardTypeName != 'newArticles'){
					       starNum.prepend(starIcon);
						   info.append(starNum);
						   
						   commentNum.prepend(commentIcon);
						   info.append(commentNum);
						}
					    rightContent.append(info);
					    
					    item.append(rightContent, content);
					    list.append(item);
					    
//  					    list.append(comment);
					    
				});
				
                }
				return list;
			}
	        
	        


        });
    </script>
    
    
</head>
  
<body id="trashbox">

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
        <a class="item" href="<c:url value="/board/freeboard/1"/>">자유</a>
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
      <a class="teal item" href="<c:url value="/signup"/>">회원가입</a>
      <a id="login-button" class="green item" href="<c:url value="/login"/>">로그인</a>
    </div>
  </sec:authorize>
	
  <!-- Authenticated right Sidebar Menu  -->
  <sec:authorize access="isAuthenticated()">
   <sec:authentication var="user" property="principal" />
    <div class="ui vertical inverted sidebar right menu ">
      <div id="user-info-box" class="item">
        <div class="ui tiny circular image">
          <img src="<c:url value="/resources/photo_upload_profile/${user.profileImage}"/>">
        </div>
        <div class="ui center aligned container">
          <h2 class="ui inverted header"><sec:authentication property="principal.nickname" /></h2>
         
        </div>
      </div>
      <a class="blue item">알림
        <div id="notification-label" class="ui blue label">2</div>
      </a>
      <a class="teal item" href="<c:url value="/messageBox"/>">메시지</a>
      <a class="orange item">스팸
        <div class="ui orange label">3</div>
      </a>
      <a class="violet item" href="<c:url value="/setting"/>">설정</a>
      <a class="orange item" href="<c:url value="/userInfo"/>">회원 정보</a>
      <a id="logout-button" class="red item">로그아웃</a>
    </div>
  </sec:authorize>
  
  <!-- Small Following Menu -->
  <div class="ui fixed inverted menu">
    <a id="left-sidebar-button" class="item">
      <i class="sidebar icon"></i>
    </a>
    <div class="header red item active">
      Trash Box
    </div>
    <div class="right menu">
      <a class="notification-button item" >
        <i class="search icon"></i>
      </a>
      <a class="right-sidebar-button item">
        <i class="user icon"></i>
      </a>
    </div>
  </div>

  <!-- Page Contents -->
  <div class="pusher">
    <div class="animsition">
      <div class="full height">
      
        <!-- Large Following Menu  -->
        <div class="following bar animated fadeInDown">
          <div class="ui container">
            <div class="ui large menu inverted">
              <a id="second-left-sidebar-button" class="item">
                <i class="sidebar icon"></i>
              </a>
              <div class="header item ">Main
              </div>
              <div class="right menu inverted">
                <a class="notification-button item">
                  <i class="search icon"></i>
                </a>
                <a class="right-sidebar-button item">
                  <i class="user icon"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Masthead  -->
        <div class="ui vertical masthead center aligned segment zoomed">
          <div class="ui container">
            <div class="introduction">
              <h1 class="ui inverted header">
                <span class="main header">
                 TRASH BOX
                </span>
                <span class="sub header">
                 Do it yourself
                </span>
              </h1>
              <div class="ui hidden divider"></div>
            </div>
          </div>
          <a class="ui inverted circular basic icon button">
            <i class="big angle double down icon"></i>
          </a>
        </div>
        
        <!-- Main -->
        <div class="ui vertical stripe main segment">
          <div class="ui three column relaxed stackable grid container">
            <div class="row">
              <div class="eight wide column">
                <div class="ui notice segment">
                  
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="notice-tab-button" class="item active" data-tab="notice">Notice</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/notice/1"/>">more</a>
                      </div>
                    </div>
                  </div>
                  
                  <div class="ui tab segment active" data-tab="notice">
               
                     <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
               
                  </div>
                </div>
                
                <div class="ui event segment">
               
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="event-tab-button" class="item active" data-tab="event">Event</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/event/1"/>">more</a>
                      </div>
                    </div>
                  </div>
                  
                  <div class="ui tab segment active" data-tab="event">
               
                     <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
               
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui combo segment">
          
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="popularArticle-tab-button" class="item active" data-tab="popularArticles">인기글</a>
                    <a class="item" data-tab="newArticles">최신글</a>
                    <a class="item" data-tab="newComments">최신댓글</a>
                  </div>
           
                  <div class="ui tab segment active" data-tab="popularArticles">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    <br/>
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
               
                  
  
                  </div>
                  
                  <div class="ui tab segment" data-tab="newArticles">
                    
                  </div>
                  
                  <div class="ui tab segment" data-tab="newComments">
                    
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="eight wide column">
                <div class="ui freeboard segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="freeboard-tab-button" class="item active" data-tab="freeboard">자유</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/freeboard/1"/>">more</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="freeboard">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui segment">
                  <div class="ui pointing secondary menu">
                    <a class="item active" data-tab="free">free</a>
                    <div class="right menu">
                      <div class="item"><a href=#>more</a></div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="free">
                    <div class="ui celled list">
                      <div class="item">
                        <div class="right floated content">
                          <div class="info">
                            <span class="num">
                              <i class="comments icon"></i>137
                            </span>
                          </div>
                        </div>
                        <div class="content">
                          <div class="header">
                            <i class="right triangle icon"></i>
                            <a href="#">DN3 LGT용 HDVOICE 테스트용 (처음이신분은 절대 사용하지 마세요)</a>
                          </div>
                        </div>
                      </div>                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          <div class="row">
              <div class="eight wide column">
                <div class="ui segment">
                  <div class="ui pointing secondary menu">
                    <a class="item active" data-tab="free">free</a>
                    <div class="right menu">
                      <div class="item"><a href=#>more</a></div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="free">
                    <div class="ui celled list">
                      <div class="item">
                        <div class="right floated content">
                          <div class="info">
                            <span class="num">
                              <i class="comments icon"></i>137
                            </span>
                          </div>
                        </div>
                        <div class="content">
                          <div class="header">
                            <i class="right triangle icon"></i>
                            <a href="#">DN3 LGT용 HDVOICE 테스트용 (처음이신분은 절대 사용하지 마세요)</a>
                          </div>
                        </div>
                      </div>                    
                    </div>
                  </div>
                </div>
              </div>
              <div class="eight wide column">
                <div class="ui segment">
                  <div class="ui pointing secondary menu">
                    <a class="item active" data-tab="free">free</a>
                    <div class="right menu">
                      <div class="item"><a href=#>more</a></div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="free">
                    <div class="ui celled list">
                      <div class="item">
                        <div class="right floated content">
                          <div class="info">
                            <span class="num">
                              <i class="comments icon"></i>137
                            </span>
                          </div>
                        </div>
                        <div class="content">
                          <div class="header">
                            <i class="right triangle icon"></i>
                            <a href="#">DN3 LGT용 HDVOICE 테스트용 (처음이신분은 절대 사용하지 마세요)</a>
                          </div>
                        </div>
                      </div>                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          <div class="row">
            <div class="sixteen wide column">
              <div class="ui segment">
                <h2 class="ui dividing header">Types<a class="anchor" id="types"></a></h2>
                <div class="ui six doubling link cards">
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Main End -->
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
   
  <!-- Notifyjs -->
  <script type="text/javascript" src="<c:url value="/resources/vendors/notifyjs/dist/styles/semantic-ui/notify-semantic.js"/>"></script>
  
  <script type="text/javascript" src="<c:url value="/resources/vendors/sockjs-1.0.3.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/resources/vendors/stomp.min.js"/>"></script>
  
  <!-- websocket 연결 -->
  <sec:authorize access="isAuthenticated()">
  <script type="text/javascript" src="<c:url value="/resources/javascript/websocket.js"/>"></script>
  </sec:authorize>
   
</body>
</html>