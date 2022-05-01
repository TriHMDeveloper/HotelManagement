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
	<div class="container" id="load" style="width: 100%;">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage Category Room</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addCategoryRoom" class="btn btn-success"
							data-toggle="modal"><i class="material-icons">&#xE147;</i>
							Add</a> <a href="#deleteCategoryRoom" class="btn btn-danger"
							data-toggle="modal"><i class="material-icons">&#xE15C;</i>
							Del</a>
					</div>
				</div>
			</div>
			<table id="categoryTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>#</th>
						<th>Room Category Name</th>
						<th>Capacity</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${listRoomCate}" varStatus="loop" var="view">
						<tr>
							<td><span class="custom-checkbox"> <input
									type="checkbox" id="checkbox1" name="options[]" value="1">
									<label for="checkbox1"></label>
							</span></td>
							<td class="text-center"><c:out value="${loop.index+1}" /></td>
							<td>${view.catRoomName}</td>
							<td>${view.capacity}</td>
							<td><a href="#editCategoryRoom" class="edit"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
								href="#deleteCategoryRoom_${view.id }" class="delete"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
						</tr>

						<div id="deleteCategoryRoom_${view.id }" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form>
										<div class="modal-header">
											<h4 class="modal-title">Delete CategoryRoom</h4>
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
												href="${pageContext.request.contextPath}/deleteRoomCategory/${view.id}">Delete</a>
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

	<!-- Edit Category Room HTML -->
	<div id="editCategoryRoom" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="category-room-edit" method="POST"
					action="${pageContext.request.contextPath}/editCategoryRoom">
					<!-- Spring -->
					<div class="modal-header mauxin">
						<h4 class="modal-title">Room Category</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<c:if test="${messageCateRoom != null }">
						<div class="alert alert-danger text-center " role="alert">
							${messageCateRoom}</div>
					</c:if>
					<div class="modal-body">
						<input type="hidden" name="exCategoryRoom" id="exCategory" />
						<div class="form-group">
							<label>Category Name</label> <input type="text"
								class="form-control" name="categoryRoom" id="categoryRoom">
						</div>
						<div class="form-group">
							<label>Capacity</label> <input type="text" class="form-control"
								name="capacity" id="categoryPrice">
						</div>
					</div>
					<div class="mx-auto text-center mb-3">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit" class="btn btn-info"
							value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Add Category Room HTML -->
	<div id="addCategoryRoom" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form:form id="category-room" method="POST"
					action="${pageContext.request.contextPath}/addCategoryRoom"
					modelAttribute="roomCateAttribute">
					<!-- Spring -->
					<div class="modal-header mauxin">
						<h4 class="modal-title ">Add Room Category</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<c:if test="${messageCateRoom != null }">
						<div class="alert alert-danger text-center " role="alert">
							${messageCateRoom}</div>
					</c:if>
					<div class="modal-body">
						<div class="form-group">
							<label>Room Category Name</label>
							<form:input type="text" class="form-control" path="catRoomName" />
						</div>

						<div class="form-group">
							<label>Capacity</label>
							<form:input type="text" class="form-control" path="capacity" />
						</div>
					</div>
					<div class="mx-auto text-center mb-3">
						<input type="submit" class="btn btn-info" value="Save"> <input
							type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel">
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
	<c:if test="${messageCateRoom != null }">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#addCategoryRoom').modal({
					"backdrop" : "static"
				});
			});
		</script>
	</c:if>
	<script src="<c:url value="/decoration/js/loadAjax.js"/>"></script>
	<script src="<c:url value="/decoration/js/Valid.js"/>"></script>
</body>


</html>