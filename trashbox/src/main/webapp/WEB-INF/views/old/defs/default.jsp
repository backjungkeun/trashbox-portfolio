<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

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
	
	<tiles:insertAttribute name="meta" />
    
    <!-- Site Properties -->
    <title><tiles:insertAttribute name="title"/></title>
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.serialize-object.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.browser.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery-dateFormat.min.js"/>"></script>
   
    <!-- Semantic-UI Components -->
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.min.css"/>"> --%>
<%--     <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.min.js"/>"></script> --%>
  
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.js"/>"></script>
  
  
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
    <script type="text/javascript" src="<c:url value="/resources/vendors/notifyjs/dist/styles/semantic-ui/notify-semantic.js"/>"></script>
    
    <!-- User Custom -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/trashbox.css"/>">
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/trashbox-font-rule.css"/>"> --%>
    <!-- font -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/font/hanna.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/font/jejugothic.css"/>">
    
   
    
    <script type="text/javascript">
        $(document).ready(function () {
        	

	        
	        


        });
    </script>
    
    
</head>
  
<body id="trashbox">
  
  <tiles:insertAttribute name="left-sidebar-menu" />
  <tiles:insertAttribute name="right-sidebar-menu" />
  

  <!-- Page Contents -->
  <div class="pusher">
  
  <div class="animsition">
      <div class="full height">
      
        <tiles:insertAttribute name="small-following-menu" />
       
        <tiles:insertAttribute name="large-following-menu" />
        
        <tiles:insertAttribute name="masthead" />
        
        <tiles:insertAttribute name="body" />
    
      </div> 
      <!-- full height end -->   
    
      <!-- footer -->
      <tiles:insertAttribute name="footer"/>
      
  </div>
  <!-- animistion end-->
  
  </div>
  <!-- pusher end -->
  
  <tiles:insertAttribute name="logout-modal"/>
   
  
  
  
  <sec:authorize access="isAuthenticated()">
  <!-- websocket 연결 -->
  <script type="text/javascript" src="<c:url value="/resources/vendors/sockjs-1.0.3.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/resources/vendors/stomp.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/resources/javascript/websocket.js"/>"></script>
  </sec:authorize>
  
  <script type="text/javascript" src="<c:url value="/resources/javascript/common.js"/>"></script>
  <tiles:insertAttribute name="script" />
   
</body>
</html>