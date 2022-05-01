<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="spring.security.SecurityUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div
		class="container-fluid d-flex justify-content-between align-content-center"
		style="background-color: #690a0d; height: 60px; border: 5px double #b8902d; box-sizing: border-box;">
		<div class="d-flex flex-row name">
			<img style="margin-right: 0;" class="navbar-brand"
				src="${pageContext.request.contextPath}/decoration/image/V.png"
				alt="D" width="30px" height="47px"> <a
				class="navbar-brand m-0 mt-1" id="namehotel" href="${pageContext.request.contextPath}/home">ictoria</a>
			<img class="ml-1"
				src="${pageContext.request.contextPath}/decoration/image/h.png"
				alt="H" width="32px" height="40px" style="margin-top: 2.9%;">
			<a class="navbar-brand mt-1" href="#">otel</a>
		</div>
		

		<button id="profile-btn" class="fas fa-hotel nav-link profile"
			role="button" data-toggle="dropdown"></button>
		<div class="dropdown-menu dropdown-menu-right"
			style="background-color: #690a0d; border: 1px solid #d4b35e;">
			<a href="#" class="dropdown-item" onclick="loadProfile()"> <i class="fas fa-user"></i>
				User Profile
			</a>
			<div class="dropdown-divider" style="border-top: 1px solid #d4b35e;"></div>
			<a href="${pageContext.request.contextPath}/logout"
				class="dropdown-item"> <i class="fas fa-sign-out-alt"></i>
				Logout
			</a>
		</div>
	</div>
<script type="text/javascript">
function loadProfile() {
	$.ajax({
				type : "get",
				url : "/MockProject/profile",
				success : function(data) {
					var d = $("#child");														
					d.html(data);							
				}
			});
}</script>

</body>
</html>