<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>test page</title>  
</head>
  
<body>
<h2>naver accessToken Test Page</h2>

<h3>${result.access_token}</h3>
<br>
<p>${result.scope}</p>
<br>
<h3>${result.refresh_token}</h3>
<br>
<p>${result.expires_in}</p>

</body>
</html>