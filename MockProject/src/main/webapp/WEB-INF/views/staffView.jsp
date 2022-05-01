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
	<div class="container" id="load">
		<div class="table-wrapper w-100 mx-auto">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage User</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addUser" class="btn btn-success" data-toggle="modal"><i
							class="material-icons">&#xE147;</i> <span>Add New User</span></a> <a
							href="#deleteUser" class="btn btn-danger" data-toggle="modal"><i
							class="material-icons">&#xE15C;</i> <span>Delete</span></a>
					</div>
				</div>
			</div>
			<table id="userTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>FullName</th>
						<th>UserName</th>
						<th>PhoneNumber</th>
						<th>BirthDate</th>
						<th>IdentityNumber</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${listViewStaff}" varStatus="loop" var="view">
						<tr>
							<td class="text-center"><c:out value="${loop.index+1}" /></td>
							<td>${view.fullName }</td>
							<td>${view.username }</td>
							<td>${view.phone }</td>
							<td>${view.birthDate }</td>
							<td>${view.idenityNumber }</td>
							<td>${view.email }</td>
							<td>
							<a  href="#viewUser" class="edit" data-toggle="modal">
							<i
									class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
							</a> <a
								href="#deleteUser_${view.accountId }" class="delete"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
						</tr>

						<div id="deleteUser_${view.accountId }" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form>
										<div class="modal-header">
											<h4 class="modal-title">Delete User</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">
											<p>Are you sure you want to delete these Records?</p>
											<p class="text-warning">
												<small>This action cannot be undone.</small>
											</p>
										</div>
										<div class="modal-footer">
											<input type="button" class="btn btn-default"
												data-dismiss="modal" value="Cancel"> <a
												href="${pageContext.request.contextPath }/admin/deleteStaff/${view.accountId }"
												class="btn btn-danger">Delete</a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>

	<div id="addUser" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form:form id="add-user" modelAttribute="userAttribute"
					method="POST"
					action="${pageContext.request.contextPath}/admin/addStaff">
					<div class="modal-header">
						<h4 class="modal-title">Add Staff</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<c:if test="${message != null }">
						<div class="alert alert-danger text-center " role="alert">
							${message}</div>
					</c:if>
					<div class="modal-body">
						<div class="form-group">
							<label>Full Name:</label>
							<form:input type="text" class="form-control" path="fullName" />
						</div>
						<div class="form-group">
							<label>User Name:</label>
							<form:input type="text" class="form-control" path="username" />
						</div>
						<div class="form-group">
							<label>Password:</label>
							<form:input class="form-control" path="password" />
						</div>
						<div class="form-group">
							<label>Birthdate:</label>
							<form:input type="date" class="form-control" path="birthDate" />
						</div>
						<div class="form-group">
							<label>Contact no:</label>
							<form:input type="text" class="form-control" path="phone" />
						</div>
						<div class="form-group">
							<label>Identity Number:</label>
							<form:input type="text" class="form-control" path="idenityNumber" />
						</div>

						<div class="form-group">
							<label>Email: </label>
							<form:input type="text" class="form-control" path="email" />
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel">
						<button type="submit" class="btn btn-success">Add</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<c:if test="${msg == 'success'}">
		<jsp:include page="success.jsp" />
	</c:if>

	<c:if test="${msgF == 'failed'}">
		<jsp:include page="failed.jsp" />
	</c:if>
	<c:if test="${message != null}">

		<script type="text/javascript">
			$(document).ready(function() {
				$('#addUser').modal({
					"backdrop" : "static"
				});
			});
		</script>
	</c:if>


	<!-- View User HTML -->
	<div id="viewUser" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="edit-staff"
					action="${pageContext.request.contextPath}/admin/updateStaff"
					method="POST">
					<div class="modal-header mauxin">
						<h4 class="modal-title">View User</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<c:if test="${messageEdit != null }">
						<div class="alert alert-danger text-center " role="alert">
							${messageEdit}</div>
					</c:if>
					<div class="modal-body">
						<input type="hidden" id="exUsername" name="exUsername" />
						<div class="form-group">
							<label>Full Name:</label> <input id="fullNamee" type="text"
								class="form-control" name="fullName">
						</div>
						<div class="form-group">
							<label>User Name:</label> <input id="userName" type="text"
								class="form-control" name="userName">
						</div>
						<div class="form-group">
							<label>Birthdate:</label> <input type="date" id="birthday"
								class="form-control" name="birthDate">
						</div>
						<div class="form-group">
							<label>Identity Number:</label> <input type="text"
								id="identityNumber" class="form-control" name="identityNumber">
						</div>
						<div class="form-group">
							<label>Phone number:</label> <input type="text" id="phonee"
								class="form-control" name="phone">
						</div>
						<div class="form-group">
							<label>Email: </label> <input type="text" id="emaill"
								class="form-control" name="email">
						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<input type="submit" href="#editUser" class="btn btn-success edit"
							data-toggle="modal" value="Save"> <input type="button"
							class="btn btn-dark" data-dismiss="modal" value="Cancel">
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:if test="${messageEdit != null}">

		<script type="text/javascript">
			$(document).ready(function() {
				$('#viewUser').modal({
					"backdrop" : "static"
				});
			});
		</script>
	</c:if>
	<script src="<c:url value="/decoration/js/loadAjax.js"/>"></script>
	<script src="<c:url value="/decoration/js/Valid.js"/>"></script>
</body>

</html>