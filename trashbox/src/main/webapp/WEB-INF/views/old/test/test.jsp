<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>test page</title>  
</head>
  
<body>
<h2>Test Page</h2>

<h2>${userDetail.currentSession}</h2>

 <c:forEach var="userDetail" items="${userSessionData}">
      <c:if test="${userDetail.currentSession eq 'true'}"> 
      <h2>*현재 접속중인 세션*</h2>
      </c:if> 
       <h2>${userDetail.username}</h2>
       <h4>${userDetail.ip}</h4>
       <h4>${userDetail.lastActivity}</h4>
       <h1>${userDetail.sessionId}</h1>
       <c:if test="${userDetail.currentSession eq 'fasle'}">
       	 <a href="<c:url value="/logoutSession?sessionId=${userDetail.sessionId}"/>">로그아웃</a>
       </c:if> 
       <br>
 </c:forEach>



</body>
</html>