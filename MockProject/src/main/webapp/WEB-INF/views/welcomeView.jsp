<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="spring.security.SecurityUtils"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>    
</head>
<body>
    <div class="welcomebox" id=intro>    
    <span class="text1">Welcome to Victoria Hotel <i  class="fa fa-hotel" onclick="loadaboutus(this.id)"></i></span>
    
    <security:authorize access="isAuthenticated()">
			<span class="text2">
				
				<%=SecurityUtils.getPrincipal().getFullName()%>
			</span>
		</security:authorize>    
    </div>
</body>

</html>