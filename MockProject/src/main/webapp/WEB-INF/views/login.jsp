<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="<c:url value="/decoration/font-awesome-4.7.0/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/decoration/fontawesome-free-5.0.13/web-fonts-with-css/css/fontawesome-all.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css2?family=Gentium+Book+Basic:wght@700&family=Roboto+Slab:wght@200&display=swap"
	rel="stylesheet">
<link href="<c:url value="/decoration/css/style.css" />"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="<c:url value="/decoration/css/login.css"/>">
<style>
body {
	font-family: 'Gentium Book Basic', serif;
	font-family: 'Roboto Slab', serif;
}

.error {
	color: red;
	border-color: red;	
}
.
</style>

</head>

<body>
	<div class="d-lg-flex half">
		<div class="bg order-1 order-md-2"
			style="background-image: url('${pageContext.request.contextPath}/decoration/image/loginBack-sm.jpg');position: relative;z-index: 1;">
			<div class="layer"></div>
		</div>
		<div class="contents order-2 order-md-1 d-flex align-items-center">

			<div class="m-auto h-100 w-100">
				<div
					class="row align-items-center justify-content-center h-100 w-100 m-0" style="box-sizing: border-box;">
					<div class="col-md-7 col-lg-10">
						<div class="text-center">
							<img
								src="${pageContext.request.contextPath}/decoration/image/logo.png"
								alt="" width="130px" height="130px">
							<h4
								style="color: #C8A862; font-family: 'Gentium Book Basic', serif; font-family: 'Roboto Slab', serif;">Victoria
								Palace</h4>
						</div>
						<c:if test="${param.incorrectAccount != null }">
							<div class="alert alert-danger text-center" style="color: red"
								role="alert">Username or password incorrect</div>
						</c:if>
						<form action="j_spring_security_check"
							class="signin-form d-flex flex-column flex-wrap justify-content-center m-auto"
							id="signInForm" method="POST">
							<div class="form-group">
								<input type="text" class="form-control first"
									placeholder="Username" name="username">
							</div>
							<div class="form-group">
								<input id="password-field" type="password" class="form-control"
									placeholder="Password" name="password"> <span
									toggle="#password-field"
									class="fa fa-fw fa-eye field-icon toggle-password"></span>
							</div>

							<div class="form-group">
								<div class="w-100 d-flex justify-content-between">
									<div class="ml-1">
										<label class="checkbox-wrap checkbox-primary">Remember
											Me <input type="checkbox"> <span class="checkmark"></span>
										</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<button type="submit" class="form-control btn signin">Sign
									In</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>		
	<script src="<c:url value="/decoration/js/jquery.min.js" />"></script>
	<script src="<c:url value="/decoration/js/jquery.validate.min.js"/>"></script>
	<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
		$(document).ready(function () {
			$.validator.addMethod("regex", function (value, element, regularExpression) {
		        var re = new RegExp(regularExpression);
		        return this.optional(element) || re.test(value);
		    }, "Please follow the true format");
		    $('#signInForm').validate({
		        rules: {
		            username: {
		                required: true,
		                minlength: 5,
		                maxlength: 30,
		            },
		            password: {
		                required: true,
		                minlength: 6,
		                regex: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$/,
		            }
		        },
		    });		 
		});
	</script>
</body>
</html>