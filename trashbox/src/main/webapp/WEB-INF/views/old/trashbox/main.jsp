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
    
    <!-- Site Properties -->
    <title>Main - TrashBox</title>  
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/javascript/library/jquery.min.js"/>"></script>
   
    <!-- Semantic-UI Components -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/reset.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/site.min.css"/>">
   
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/container.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/grid.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/header.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/image.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/menu.min.css"/>">
   
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/divider.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/segment.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/button.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/list.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/icon.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/sidebar.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/transition.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/label.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/modal.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/dimmer.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/dist/components/message.min.css"/>">
    
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/sidebar.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/modal.min.js"/>"></script> 
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/dimmer.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/semantic-ui/dist/components/transition.min.js"/>"></script>
  
	<!-- User Custom -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/semantic-ui/stylesheets/trashbox.css"/>">  
    <sec:authorize access="isAuthenticated()"> 
    	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/javascript/trashbox.js"/>"></script> 
    </sec:authorize> 
    <sec:authorize access="isAnonymous()">
    	<script type="text/javascript" src="<c:url value="/resources/semantic-ui/javascript/trashbox-anonymous.js"/>"></script> 
    </sec:authorize>
</head>
  
<body>


<div class="ui small error modal">
  <i class="close icon"></i>
  <div class="header">${errorMSG}</div>
  <div class="content">
    <div class="ui icon warning message">
    <i class="huge icons">
  		<i class="big red dont icon"></i>
  		<i class="frown icon"></i>
   </i>
  		<div class="content">
    		<div class="header">
     		 	 접근 불가
   		    </div>
    	   <p></p>
  		</div>
	</div>
  </div>
</div>
	
	
	<sec:authorize access="isAuthenticated()">
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
    
    <c:url var="logoutUrl" value="/logout"/>
	<form id="logout-form"action="${logoutUrl}" method="post">
	 <sec:csrfInput />
	</form>
    </sec:authorize>

	<!-- left Sidebar Menu -->
    <div class="ui vertical inverted sidebar left menu ">
        <a class="active red item" href="<c:url value="/main"/>">메인</a>
        <a class="item" href="<c:url value="/pageTest"/>">boardtest</a>
        <a class="item">Company</a>
        <a class="item">Careers</a>
        <a class="teal item">Inbox</a>
        <a class="orange item">Spam</a>
        <a class="violet item">Updates</a>
    </div>

    <!-- Anonymous right Sidebar Menu  -->
    <sec:authorize access="isAnonymous()">
    <div class="ui vertical inverted sidebar right menu ">
       <div id="user-info-box" class="item">
            <div class="ui tiny circular image">
                <img src="<c:url value="/resources/semantic-ui/assets/images/wireframe/image.png"/>">
            </div>

            <div class="ui center aligned container">
                <h2>Anonymous</h2>

                <!--<h4>-</h4>-->
            </div>
        </div>
 
        <a class="teal item" href="<c:url value="/signup"/>">회원가입</a>
        <a id="login-button" class="green item" href="<c:url value="/login"/>">로그인</a>
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
            	
                <h2><sec:authentication property="principal.nickname" /></h2>

				<h4><sec:authentication property="principal.no" /></h4>
                <h4><sec:authentication property="principal.email" /></h4>
            </div>
        </div>
        <a class="blue item">
            	알림
            <div class="ui blue label">2</div>
        </a>
        <a class="teal item">
            	메시지
            <div class="ui teal label">22</div>
        </a>
        <a class="orange item">
            	스팸
            <div class="ui orange label">3</div>
        </a>
        <a class="violet item" href="<c:url value="/setting"/>">설정</a>
        <a class="orange item" href="<c:url value="/userInfo"/>">회원정보</a>
        <a id="logout-button" class="red item">로그아웃</a>
    </div>
    </sec:authorize>
    
    <!-- Following Menu -->
    <div class="ui fixed inverted menu">
        <a id="left-sidebar-button" class="item">
            <i class="sidebar icon"></i>
        </a>
        <div class="header red item active">
            Trash Box
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

        <div id="banner" class="ui inverted vertical masthead center aligned segment">
            <div class="ui text container">
                <h1 class="ui inverted header">Trash Box.</h1>
                <h2>Do it yourself</h2>
            </div>
        </div>


        <div class="ui vertical stripe segment">
            <div class="ui middle aligned stackable grid container">
                <div class="row">
                    <div class="eight wide column">
                        <h3 class="ui header">We Help Companies and Companions</h3>
                        <p>We can give your company superpowers to do things that they never thought possible. Let us delight your customers and empower your needs...through pure data analytics.</p>
                        <h3 class="ui header">We Make Bananas That Can Dance</h3>
                        <p>Yes that's right, you thought it was the stuff of dreams, but even bananas can be bioengineered.</p>
                    </div>
                    <div class="six wide right floated column">
                        <img src="<c:url value="/resources/semantic-ui/assets/images/wireframe/white-image.png"/>" class="ui large bordered rounded image">
                    </div>
                </div>
                <div class="row">
                    <div class="center aligned column">
                        <a class="ui huge button">Check Them Out</a>
                    </div>
                </div>
            </div>
        </div>


        <div class="ui vertical stripe quote segment"> 
            <div class="ui equal width stackable internally celled grid">
                <div class="center aligned row">
                    <div class="column">
                        <h3>"What a Company"</h3>
                        <p>That is what they all say about us</p>
                    </div>
                    <div class="column">
                        <h3>"I shouldn't have gone with their competitor."</h3>
                        <p>
                            <img src="<c:url value="/resources/semantic-ui/assets/images/avatar/nan.jpg"/>" class="ui avatar image"> <b>Nan</b> Chief Fun Officer Acme Toys
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="ui vertical stripe segment">
            <div class="ui text container">
                <h3 class="ui header">Breaking The Grid, Grabs Your Attention</h3>
                <p>Instead of focusing on content creation and hard work, we have learned how to master the art of doing nothing by providing massive amounts of whitespace and generic content that can seem massive, monolithic and worth your attention.</p>
                <a class="ui large button">Read More</a>
                <h4 class="ui horizontal header divider">
        <a href="#">Case Studies</a>
      </h4>
                <h3 class="ui header">Did We Tell You About Our Bananas?</h3>
                <p>Yes I know you probably disregarded the earlier boasts as non-sequitor filler content, but its really true. It took years of gene splicing and combinatory DNA research, but our bananas can really dance.</p>
                <a class="ui large button">I'm Still Quite Interested</a>
            </div>
        </div>


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
    
    

</body>
</html>