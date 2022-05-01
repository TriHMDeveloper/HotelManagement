<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<div class="container" id="load">
		<div class="table-wrapper w-100 mx-auto">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage Room</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addRoom" class="btn btn-success" data-toggle="modal"><i
							class="material-icons">&#xE147;</i> Add</a> <a href="#deleteRoom"
							class="btn btn-danger" data-toggle="modal"><i
							class="material-icons">&#xE15C;</i> Del</a>
					</div>
				</div>
			</div>
			<table id="extable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>#</th>
						<th>Room number</th>
						<th>Room Category</th>
						<th>Image</th>
						<th>Status</th>
						<th>Price</th>
						<th>Description</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listViewRoom}" varStatus="loop" var="view">
						<tr>
							<td><span class="custom-checkbox"> <input
									type="checkbox" id="checkbox1" name="options[]" value="1">
									<label for="checkbox1"></label>
							</span></td>
							<td><c:out value="${loop.index+1 }" /></td>
							<td>${view.roomNumber }</td>
							<td>${view.cateRoom.catRoomName }</td>
							<td><img
								src="${pageContext.request.contextPath}/decoration/image/${view.image}"
								width=120px height=120px alt="cc"></td>
							<td class="text-success">${view.status }</td>
							<td>${view.price }$</td>
							<td>${view.description }</td>
							<td><a href="#editRoom" class="edit" data-toggle="modal"
								id="btnEdit"><i class="material-icons" data-toggle="tooltip"
									title="Edit">&#xE254;</i></a> <a
								href="#deleteRoom_${view.roomNumber }" class="delete"
								data-toggle="modal" id="btnDelete"><i class="material-icons"
									data-toggle="tooltip" title="Delete">&#xE872;</i></a> <input
								type="hidden" id="number" value="${view.roomNumber}"></td>
						</tr>
						<div id="deleteRoom_${view.roomNumber }" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form>
										<div class="modal-header">
											<h4 class="modal-title">Delete Room</h4>
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
												class="btn btn-danger"
												href="${pageContext.request.contextPath}/admin/deleteRoom/${view.roomNumber}">Delete</a>
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

	<div id="addRoom" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form:form modelAttribute="roomAttribute" id="add-room"
					method="POST" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/admin/addRoom">
					<div class="modal-header">
						<h4 class="modal-title">Add Room</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<c:if test="${messageRoom != null }">
						<div class="alert alert-danger text-center " role="alert">
							${messageRoom}</div>
					</c:if>

					<div class="modal-body">
						<div class="form-group">
							<label>Room Number</label>
							<form:input type="text" class="form-control" path="roomNumber"
								name="roomNumber" />
						</div>
						<div class="form-group">
							<label for="exampleFormControlSelect1">Room Category</label>
							<form:select class="form-control" id="exampleFormControlSelect1"
								path="catRoomId">

								<c:forEach var="option" items="${listRoomCate}" varStatus="loop">
									<form:option value="${option.id}">
										<c:out value="${option.catRoomName}" />
									</form:option>
								</c:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label>Image</label>
							<!-- onchange="readURL(this);" -->
							<form:input type="file" name="image" path="image" />
						</div>
						<div class="form-group">
							<label>Price</label>
							<form:input type="text" class="form-control" path="price"
								name="price" />
						</div>
						<div class="form-group">
							<label>Description</label>
							<form:input type="text" class="form-control" path="description"
								name="description" />
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

	<c:if test="${messageRoom != null}">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#addRoom').modal({
					"backdrop" : "static"
				});
			});
		</script>
	</c:if>

	<div id="editRoom" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="edit-room" method="POST" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/admin/editRoom">

					<div class="modal-header">
						<h4 class="modal-title">Edit Room</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<c:if test="${messageEditRoom != null }">
						<div class="alert alert-danger text-center " role="alert">
							${messageEditRoom}</div>
					</c:if>
					<div class="modal-body">
						<input type="hidden" name="roomId" id="roomId" />
						<div class="form-group">
							<label>Room Number</label> <input type="text"
								class="form-control" name="roomNumber" id="roomNumber" />
						</div>
						<div class="form-group">
							<label for="roomCategory">Room Category</label> <select
								class="form-control" id="roomCategory" name="roomCategory">

								<c:forEach var="option" items="${listRoomCate}" varStatus="loop">
									<option value="${option.catRoomName}">
										<c:out value="${option.catRoomName}" />
									</option>
								</c:forEach>
							</select>

						</div>
						<div class="form-group">
							<label>Price</label> <input type="text" class="form-control"
								name="price" id="price" />
						</div>
						<div class="form-group">
							<label>Description</label> <input type="text"
								class="form-control" name="description" id="description" />
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Update" id="btnUpdate" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:if test="${msg == 'success'}">
		<jsp:include page="success.jsp" />
	</c:if>

	<c:if test="${msgF == 'failed'}">
		<jsp:include page="failed.jsp" />
	</c:if>
	<c:if test="${messageEditRoom != null}">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#editRoom').modal({
					"backdrop" : "static"
				});
			});
		</script>
	</c:if>
	<script src="<c:url value="/decoration/js/loadAjax.js"/>"></script>
	<script src="<c:url value="/decoration/js/Valid.js"/>"></script>
</body>

</html>