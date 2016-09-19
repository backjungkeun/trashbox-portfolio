<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>user-resend-authMail</title> 

<!-- jQuery Library -->
<script type="text/javascript" src="<c:url value="/resources/semantic-ui/javascript/library/jquery.min.js"/>"></script>  
    
<script>
  $(document)
    .ready(function() {
    	
    	$('#sendMailButton').on('click', function() {
    		
    		$.ajax({
  			  type: "GET",
  			  url: "<c:url value='/sendAuthMail'/>",
  			  data: { id: '${errorUser}',
  				      email: '${email}'
  				    }
  			  
  		    }).done(function(data) {
  				console.log(data);
  				if(data == true) {
  					alert("Mail 보내기가 성공하였습니다.");
  				} else {
  					alert("Mail 보내기가 실패하였습니다. 다시시도해주세요.");
  				}
  				
  			
  		    });
    		
    	});
    	
    	
    });
</script>


     
</head>
  
<body>
<h1>Resend authMail</h1>

<c:if test="${not empty errorUser}">
        <h2><sec:authentication property="principal" /></h2>
		<h3>Last AuthFailed Id :  ${errorUser}</h3>
		<h3>Email : ${email} </h3>
		
        <button id="sendMailButton" type="button">메일보내기!</button>
		<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'User account is locked'}">
 		 <p>이메일 인증이 완료되지 않은 계정입니다.</p>
 		</c:if>
</c:if>
<c:if test="${empty errorUser}">
    <a href="<c:url value="/login"/>">로그인</a>
    
</c:if>

</body>
</html>