<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
</head>
<body>
	<form action="${pageContext.request.contextPath }/editProfile"
		method="POST" id="profile">
		<div class="container h-25 rounded mt-2" id="load"
			style="position: absolute;">
			<div class="row" style="background-color: white">
				<div class="col-md-4 ">
					<div
						class="d-flex flex-column align-items-center text-center p-3 py-5">
						<img class="mt-5 rounded-circle"
							src="${pageContext.request.contextPath}/decoration/image/tri.png"
							width="220px" height="220x"> <span
							class="text-black-50 mt-2">${curAccount.fullName}</span>
					</div>
					<div class="text-center" style="margin-left: 29%;">
						<button class="btn btn-primary profile-button"
							style="display: none;" type="submit" onclick="Save()"
							id="savebtn">Save Profile</button>
					</div>
					<div class="text-center" style="margin-left: 29%;">
						<button class="btn btn-primary profile-button"
							style="display: block;" type="button" id="editbtn"
							onclick="Edit()">Edit Profile</button>
					</div>

				</div>
				<div class="col-md-5">
					<div class="p-3 py-3">
						<div
							class="d-flex justify-content-between align-items-center mb-1">
							<h4 class="text-center ml-2">Profile Settings</h4>
						</div>
						<div class="row mt-2 bg-w">
							<div class="col-md-6">
								<label class="labels">Full Name</label><input type="text"
									readonly class="form-control" id="textname"
									value="${curAccount.fullName}">
							</div>
							<div class="col-md-6">
								<label class="labels">User name</label><input type="text"
									readonly class="form-control" id="textusername"
									value="${curAccount.username}">
							</div>
							<div class="col-md-12" id="oldPass" style="display: none;">
								<label class="labels">Old-Password</label> <input
									type="password" id="old-password" name="oldPass"
									class="form-control" />
							</div>
							<c:if test="${messagePass == 'fail' }">
								<jsp:include page="failChangePass.jsp"></jsp:include>
							</c:if>
							<c:if test="${messagePass == 'success' }">
								<jsp:include page="success.jsp"></jsp:include>
							</c:if>
							<div class="col-md-12">
								<label class="labels">Password</label> <input readonly
									type="password" id="textpassword" name="newPass"
									class="form-control" value="${curAccount.password}" name="pwd"/>
							</div>
							<div class="col-md-12" id="textrepassword" style="display: none">
								<label class="labels">RePassword</label><input
									id="textrepasswordinput" type="password" class="form-control" name="repwd">
							</div>

						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">Birthday</label><input type="text"
									readonly id="textdate" class="form-control"
									value="${curAccount.birthDate}">
							</div>
							<div class="col-md-6">
								<label class="labels">PhoneNumber</label><input type="text"
									readonly id="textphonenumber" class="form-control"
									value="${curAccount.phone}">
							</div>
							<div class="col-md-6">
								<label class="labels">IndentityNumber</label><input type="text"
									readonly id="textindenitynumber" class="form-control"
									value="${curAccount.idenityNumber}">
							</div>
							<div class="col-md-12">
								<label class="labels">Email</label><input type="text" readonly
									class="form-control" id="textemail" value="${curAccount.email}">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		function Edit() {
			document.getElementById("savebtn").setAttribute("style",
					"display:block");
			document.getElementById("editbtn").setAttribute("style",
					"display:none");
			document.getElementById("oldPass").setAttribute("style",
					"display:block");
			document.getElementById("textrepassword").setAttribute("style",
					"display:block");
			document.getElementById("textpassword").value = "";
			document.getElementById("textpassword").readOnly = false;

		}
		function Save() {
			if (!x) {
				document.getElementById("savebtn").setAttribute("style",
						"display:none");
				document.getElementById("editbtn").setAttribute("style",
						"display:block");
				document.getElementById("oldPass").setAttribute("style",
						"display:none");
				document.getElementById("textrepassword").setAttribute("style",
						"display:none");
				document.getElementById("textpassword").readOnly = true;
			}
		}
		$(document).ready(function () {
			$('#profile').validate({
				rules: {
					repwd: {
						equalTo: '#textpassword'
					}
				}
			});
		});
	</script>
</body>

</html>