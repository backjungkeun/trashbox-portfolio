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
    <title>verifyResult - TrashBox  ${isPasswordReset} </title>  
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.min.js"/>"></script>
      
    <!-- Semantic-UI Components -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.min.js"/>"></script>

    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/sweetalert/sweetalert.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/sweetalert/sweetalert.min.js"/>"></script>
              
    <!-- User Custom -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/trashbox-full-height.css"/>">
    
    <script>
    $(document)
       .ready(function() {
    	
    	    
    	    	
    		/* 1. 유효하지 않은 요청입니다.
    		 * 2. 만료된 키입니다. 다시 발급 받아주세요.
    		 * 3. 이미 인증이 완료 되었습니다.
    		 * 4. 유효하지 않은 요청입니다. 메일 인증을 다시 시도 해주세요.
    		 * 5. 인증에 성공하였습니다.
    		 * 6. 인증에 실패하였습니다. */  

    		switch ('${verifyResult}') {
        	    
        	   case '1':
        		   swal({
        			   title: "E-mail 인증",
        			   text: "유효하지 않은 요청입니다.",
        			   type: "error",
        			   confirmButtonText: "확인",
        			   confirmButtonColor: "#21BA45"
         
        		   }, function() {
        			   location.replace("<c:url value='/login'/>");   
        		   });
        		   break;
        	   
        	   case '2':
        		   swal({
        			   title: "E-mail 인증",
        			   text: "만료된 키입니다. 다시 발급 받아주세요.",
        			   type: "error",
        			   confirmButtonText: "확인",
        			   confirmButtonColor: "#21BA45"
         
        		   }, function() {
        			   location.replace("<c:url value='/login'/>");   
        		   });
        		   break;
        		   
        	   case '3':
        		   
        		   if('${newPassword}' != '') {
        			   swal({
            			   title: "이메일 확인/비밀번호 재설정",
            			   text: "임시비밀번호 : ${newPassword}",
            			   type: "success",
            			   confirmButtonText: "로그인",
            			   confirmButtonColor: "#21BA45"
             
            		   }, function() {
            			   location.replace("<c:url value='/login'/>");   
            		   });
        		   
        		   } else {
        			   swal({
            			   title: "E-mail 인증",
            			   text: "이미 인증이 완료 되었습니다.",
            			   type: "success",
            			   confirmButtonText: "확인",
            			   confirmButtonColor: "#21BA45"
             
            		   }, function() {
            			   location.replace("<c:url value='/login'/>");   
            		   });
        		   }
        			   
        		   
        		   
        		   break;
        	   
        	   case '4':
        		   swal({
        			   title: "E-mail 인증",
        			   text: "유효하지 않은 요청입니다. 메일 인증을 다시 시도 해주세요.",
        			   type: "error",
        			   confirmButtonText: "확인",
        			   confirmButtonColor: "#21BA45"
         
        		   }, function() {
        			   location.replace("<c:url value='/login'/>");   
        		   });    		   
        		   break;
        		   
        	   case '5':
        		   
        		   if('${newPassword}' != '') {
        			   
        			   swal({
        	 			   title: "비밀번호 재설정 성공",
        	 			   text: "${newPassword}",
        	 			   type: "success",
        	 			   confirmButtonText: "확인",
        	 			   confirmButtonColor: "#21BA45"
        	  
        	 		    }, function() {
        	 			   location.replace("<c:url value='/login'/>");   
        	 		    });  
        			   
        		   } else {
        			   swal({
            			   title: "E-mail 인증",
            			   text: "인증에 성공하였습니다.",
            			   type: "success",
            			   confirmButtonText: "확인",
            			   confirmButtonColor: "#21BA45"
             
            		   }, function() {
            			   location.replace("<c:url value='/login'/>");   
            		   });  
        		   }
        		   
        		   
        		   break;
        	   
        	   case '6':
        		   swal({
        			   title: "E-mail 인증",
        			   text: "인증에 실패하였습니다.",
        			   type: "error",
        			   confirmButtonText: "확인",
        			   confirmButtonColor: "#21BA45"
         
        		   }, function() {
        			   location.replace("<c:url value='/login'/>");   
        		   });  
        		   break;
        		   
        	   default:
        		   swal({
        			   title: "E-mail 인증",
        			   text: "유효하지 않은 요청입니다.",
        			   type: "error",
        			   confirmButtonText: "확인",
        			   confirmButtonColor: "#21BA45"
         
        		   }, function() {
        			   location.replace("<c:url value='/login'/>");   
        		   });
        	   
    		}
  

       
    })
  ;
  </script>
</head>
<body id="trashbox">



</body>
</html>