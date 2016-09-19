<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>
 
<script type="text/javascript">
         

      switch('${module}') {
        
      case 'authorize':  
    	  location.href=
       	   "https://nid.naver.com/oauth2.0/authorize?"
       			+ "client_id=${clientID}" 
       			+ "&response_type=code"
       			+ "&redirect_uri=${callbackURL}" 
   				+ "&state=${_csrf.token}";
      
   		  break;
   		  
      case 'token':
    	  location.href=
    		  "https://nid.naver.com/oauth2.0/token?"
    	        + "client_id=${clientID}" 
    	        + "&client_secret=${clientSecret}"
    	        + "&grant_type=authorization_code"
    	        + "&state=${token}"
    	        + "&code=${code}";
     
    	        break;
      
      }
      
      
      
      
       
       
</script>

</html>
