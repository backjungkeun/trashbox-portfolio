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
    <title>Message Box - TrashBox</title>  
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.serialize-object.min.js"/>"></script>
      
    <!-- Semantic-UI Components -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.min.js"/>"></script>

	<!-- Animsition -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/animsition/animsition.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/animsition/animsition.min.js"/>"></script>

    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/sweetalert/sweetalert.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/sweetalert/sweetalert.min.js"/>"></script>
              
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
         
      
      
      $leaveForm = $('#leave-form');
      
      $form = $('.ui.form').not($leaveForm);
      
      $leaveForm.form({
    	  inline: true,
    	  on: blur,
    	  
    	  fields: {

              terms: {
                  identifier  : 'terms',
                  rules: [
                    {
                      type   : 'checked',
                      prompt : '동의 하여야합니다.'
                    }
                  ]
                }
    	 
          }
      });
      
      $form.form({
    	  
    	  inline: true,
    	  on: blur,
    	  
    	 
    	  fields: {
    		      
            password: {
                identifier  : 'password',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '비어있습니다.'
                  }
                ]
              }
              
          }
      });

     
      
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      
      $.fn.api.settings.api = {
    		  'user leave' : '<c:url value="/leaveUser"/>'		  
      };
      
      var leaveFlag = false;
      
      $leaveForm.api({
        action: 'user leave',  
        method: 'GET',

       // stateContext: $('#nickname-update-button'),
        
       
        beforeXHR: function(xhr) {
        	xhr.setRequestHeader (header, token);
        },
        
        beforeSend: function(settings) {
           var isValid = $leaveForm.form('is valid');
       
           
           if(!isValid) {
        	   return false;
           }
           
           if(isValid && !leaveFlag) {
        	   
        	   $('.ui.leave.final.check.modal')
            	  .modal({ 
            		  closable  : false ,
            		
            		  onApprove : function() {
            			
            			  leaveFlag = true;
            			  $leaveForm.submit();
            	      }
            		  
            	  })
            	  .modal('show');
        	   
           }
           
           if(!leaveFlag) {
        	   return leaveFlag;
           }
          
           return settings; 
        },
        
        onSuccess: function (response) {   
        
        	if(response == 1) {
        		
        		swal({
                     title: "탈퇴",
                     text: "성공적으로 탈퇴 되었습니다.",
                     type: "success",           
                     confirmButtonText: "확인",
                     confirmButtonColor: "#21BA45"
                 }, function() {
                	 location.replace('<c:url value="/main"/>');
                 });
        		 
			
        	} else {
        		
        		swal({
        	          title: "탈퇴",
        	          text: "실패하였습니다. 다시 시도해주세요.",
        	          type: "error",           
        	          confirmButtonText: "확인",
        	          confirmButtonColor: "#21BA45"
        	      }, function() {
        	     	 location.reload();
        	      });
        		
        	}
 
        }
        
        
      });
      
      
      

    
       
      
      
      
      $('.ui.negative.message')
      .transition('pulse')
     ;
     
     $('.message .close')
     .on('click', function() {
       $(this)
         .closest('.message')
         .transition('fade')
       ;
     })
   ;
     
     $('.ui.small.logout.modal')
     .modal({
         closable: false,
         onApprove: function () {
             $('#logout-form').submit();
         }
     })
     .modal('attach events', '#logout-button', 'show');
     
      $('.coupled.modal')
         .modal({closable: false, allowMultiple: false});
   
      $('a.content').on('click', function() {
    	 $('.coupled.message.modal').modal('show');
      });
      
      $('#send-message-modal').modal('attach events', '.coupled.message.modal .green.button', 'show');
    
      $('.pointing.menu .item')
      .tab({
        cache: false,
        // faking API request
        apiSettings: {
          loadingDuration : 300,
          mockResponse    : function(settings) {
            var response = {
              receive  : 'AJAX Tab One',
              second : 'AJAX Tab Two',
              third  : 'AJAX Tab Three'
            };
            return response[settings.urlData.tab];
          }
        },
        context : 'parent',
        auto    : true,
        path    : '/'
      })
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
        <a class="item" href="#">공지사항</a>
        <a class="item" href="#">이벤트</a>
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
    <div class="ui vertical inverted sidebar right menu ">
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
            Message Box
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
              <div class="header orange item active">Message Box
              </div>
              <div class="right menu inverted">
                <a class="item" href="#search">
                  <i class="search icon"></i>
                </a>
                <a id="second-right-sidebar-button" class="item">
                  <i class="user icon"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
        
        <!-- User Message -->
        <div class="ui user message box alternate stripe vertical segment">
          <div class="ui container">
            <div class="column">
            
                <h2 class="ui header">
                  <i class="inbox icon"></i>
                                       Message Box
                </h2>               
                <div class="ui segment">
                
                <div class="ui pointing secondary menu">
                  <a class="item active" data-tab="receive">Receive</a>
                  <a class="item" data-tab="second">Second</a>
                  <a class="item" data-tab="third">Third</a>
                </div>
                
                <div class="ui tab segment active" data-tab="receive">
                           
                  <table class="ui selectable celled table">
                    <thead class="full-width">
                      <tr>
                        <th></th>
                        <th>Sender</th>
                        <th>Content</th>
                        <th>Registration Date</th>
                        <th>Checked</th>
                      </tr>
                    </thead>
  <tbody>
    <tr>
      <td class="collapsing">
        <div class="ui fitted slider checkbox">
          <input type="checkbox"> <label></label>
        </div>
      </td>
      <td>John Lilki</td>
      <td><a class="content" style="cursor: pointer;">jhlilk22@yahoo.com</a></td>
      <td>September 14, 2013</td>
      <td>
        <i class="large green checkmark icon"></i>
      </td>
    </tr>
    <tr>
      <td class="collapsing">
        <div class="ui fitted slider checkbox">
          <input type="checkbox"> <label></label>
        </div>
      </td>
      <td>Jamie Harington</td>
      <td><a class="content" style="cursor: pointer;">sdkfadsf sdakfasdfk dasfasdf..</a></td>
      <td>January 11, 2014</td>
      <td>
        <i class="large green checkmark icon"></i>
      </td>
    </tr>
    <tr>
      <td class="collapsing">
        <div class="ui fitted slider checkbox">
          <input type="checkbox"> <label></label>
        </div>
      </td>
      <td>Jill Lewis</td>
      <td><a class="content" style="cursor: pointer;">jilsewris22@yahoo.com</a></td>
      <td>May 11, 2014</td>
      <td>
       <i class="large red close icon"></i>
      </td>
    </tr>
    <tr>
      <td class="collapsing">
        <div class="ui fitted slider checkbox">
          <input type="checkbox"> <label></label>
        </div>
      </td>
      <td>Jill Lewis</td>
      <td><a class="content" style="cursor: pointer;">jilsewris22@yahoo.com</a></td>
      <td>May 11, 2014</td>
      <td>
       <i class="large red close icon"></i>
      </td>
    </tr>
    <tr>
      <td class="collapsing">
        <div class="ui fitted slider checkbox">
          <input type="checkbox"> <label></label>
        </div>
      </td>
      <td>Jill Lewis</td>
      <td><a class="content" style="cursor: pointer;">jilsewris22@yahoo.com</a></td>
      <td>May 11, 2014</td>
      <td>
       <i class="large red close icon"></i>
      </td>
    </tr>
  </tbody>
  <tfoot class="full-width">
    <tr>
      <th></th>
      <th colspan="4">
        <div class="ui right floated small primary labeled icon button">
          <i class="user icon"></i> Add User
        </div>
        <div class="ui small  button">
          Approve
        </div>
        <div class="ui small  disabled button">
          Approve All
        </div>
      </th>
    </tr>
  </tfoot>
</table>
                 
                </div>
                <div class="ui tab segment" data-tab="second">
                  <h3 class="ui header">AJAX Tab Two</h3>
                 
                </div>
                <div class="ui tab segment" data-tab="third">
                  <h3 class="ui header">AJAX Tab Three</h3>
               
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
 

 
         

<!-- <div class="ui small basic modal"> -->
<!--     <div class="ui icon header"> -->
<!--       <i class="child icon"></i> -->
<!--             <p></p>        -->
<!--     </div> -->
<!--     <div class="actions"> -->
<!--       <a class="ui green ok inverted button"> -->
<!--     	<i class="checkmark icon"></i> -->
<!--        	 확인    -->
<!--       </a> -->
<!--     </div> -->
<!-- </div> -->


  <!-- Leave Final Check Modal -->
  <div class="ui small leave final check modal">
    <div class="header">
            알림
    </div>
    <div class="content">
      <p>정말 탈퇴 하시겠습니까?</p>
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
      
        <p>사용하고 계신 아이디 는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
                  <p>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
                  <p>탈퇴 후에도 등록한 게시물은 그대로 남아 있습니다.</p>
                  <p>게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.</p>
                  <p>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.</p>
                  <p>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</p>
                  <p>탈퇴 후에는 아이디 ${user.username} 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.</p>
                  <p>남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</p>
       
    </div>
    <div class="actions">
      <div class="ui blue button">Save</div>
      <div class="ui red button">Remove</div>
       <div class="ui green right labeled icon button">
               Send
        <i class="checkmark icon"></i>
      </div>
<!--       <div id="message-send-button" class="ui green button">Send</div> -->
    </div>
  </div>


  <div id="send-message-modal" class="ui small coupled modal">
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
	

</body>
</html>