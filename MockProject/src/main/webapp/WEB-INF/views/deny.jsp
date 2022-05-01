<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access deny</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/decoration/css/bootstrap.min.css"/>">
</head>
<body>
	<div class = "container">
		<div class="mt-5">
			<img
				src="${pageContext.request.contextPath}/decoration/image/dragonn.png"
				class="loading" alt="dragon" width="230px" height="230px"
				style="display: block; margin: auto;">
			<div style="margin-left: 33%;">
				<h2
					style="margin-top:3%; color: #E4AC1F; font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;">
					You don't have permissions.... 🥺</h2>
			</div>
		</div>
	</div>
</html>