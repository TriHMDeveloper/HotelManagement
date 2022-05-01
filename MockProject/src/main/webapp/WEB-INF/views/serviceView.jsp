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
	<div id="load" class="mx-auto" style="width: 95%;">
		<div class="table-wrapper w-100 mx-auto">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage Service</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addService" class="btn btn-success" data-toggle="modal"><i
							class="material-icons">&#xE147;</i> <span>Add</span></a> <a
							href="#deleteService" class="btn btn-danger" data-toggle="modal"><i
							class="material-icons">&#xE15C;</i> <span>Del</span></a>
					</div>
				</div>
			</div>
			<table id="serviceTable" class="table table-striped table-hover ">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>#</th>
						<th>ServiceName</th>
						<th>Service Category</th>
						<th>Image</th>
						<th>Price</th>
						<th>Description</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listService}" varStatus="loop" var="view">
						<tr>
							<td><span class="custom-checkbox"> <input
									type="checkbox" id="checkbox1" name="options[]" value="1">
									<label></label>
							</span></td>
							<td class="text-center"><c:out value="${loop.index+1}" /></td>
							<td>${view.serName}</td>
							<td>${view.serviceCategory.catSerName}</td>
							<td>
								<div class="thumb">
									<img
										src="${pageContext.request.contextPath}/decoration/image/${view.image}"
										width=120px height=120px alt="cc">
								</div>
							</td>
							<td>${view.price}</td>
							<td>${view.description}</td>
							<td><a href="#editSer" class="edit" data-toggle="modal"><i
									class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
								<a href="#deleteService_${view.id }" class="delete"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
						</tr>

						<div id="deleteService_${view.id }" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form>
										<div class="modal-header">
											<h4 class="modal-title">Delete Service</h4>
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
												href="${pageContext.request.contextPath}/admin/deleteService/${view.id}"
												type="submit" class="btn btn-danger">Delete</a>
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
	<div id="addService" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form:form id="add-service" modelAttribute="serviceAttribute"
					method="POST" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/admin/addService">
					<div class="modal-header">
						<h4 class="modal-title">Add Service</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<c:if test="${messageRoom != null }">
						<div class="alert alert-danger text-center " role="alert">
							${messageRoom}</div>
					</c:if>
					<div class="modal-body">
						<div class="form-group">
							<label>ServiceName</label>
							<form:input type="text" class="form-control" name="serviceName"
								path="serName" />
						</div>
						<div class="form-group">
							<label for="exampleFormControlSelect1">CategoryName</label>
							<form:select class="form-control" id="exampleFormControlSelect1"
								path="catSerIid">

								<c:forEach var="option" items="${listViewCate}" varStatus="loop">
									<form:option value="${option.id}">
										<c:out value="${option.catSerName}" />
									</form:option>
								</c:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label>Image</label>
							<form:input type="file" onchange="readURL(this);" name="image"
								path="image" />
						</div>
						<div class="form-group">
							<label>Price</label>
							<form:input type="text" class="form-control" name="servicePrice"
								path="price" />
						</div>
						<div class="form-group">
							<label>Description</label>
							<form:input type="text" class="form-control"
								name="serviceDescription" path="description" />
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<c:if test="${messageRoom != null}">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#addService').modal({
					"backdrop" : "static"
				});
			});
		</script>
	</c:if>

	<script src="<c:url value="/decoration/jquery.min.js"/>"></script>
	<script charset="utf-8"
		src="<c:url value="/decoration/js/datatable.min.js" />"></script>

	<div id="editSer" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="edit-service" method="POST"
					action="${pageContext.request.contextPath}/admin/editService">
					<div class="modal-header">
						<h4 class="modal-title">Edit Service</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<c:if test="${messageEditRoom != null }">
						<div class="alert alert-danger text-center " role="alert">
							${messageEditRoom}</div>
					</c:if>
					<div class="modal-body">
						<input type="hidden" name="exServiceName" id="exServiceName" />
						<div class="form-group">
							<label>ServiceName</label> <input type="text"
								class="form-control" name="serviceName" id="serviceName" />
						</div>
						<div class="form-group">
							<label for="exampleFormControlSelect1">CategoryName</label> <select
								class="form-control" id="catSerName" name="catSerName">
								<c:forEach var="option" items="${listViewCate}" varStatus="loop">
									<option value="${option.catSerName}">
										<c:out value="${option.catSerName}" />
									</option>
								</c:forEach>
							</select>
						</div>
						<!-- <div class="form-group">
							<label>Image</label>
							<input type="file" onchange="readURL(this);" name="image"
								 />
						</div> -->
						<div class="form-group">
							<label>Price</label> <input type="text" class="form-control"
								name="servicePrice" id="servicePrice" />
						</div>
						<div class="form-group">
							<label>Description</label> <input type="text"
								class="form-control" id="serviceDescription"
								name="serviceDescription" />
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Save">
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
				$('#editSer').modal({
					"backdrop" : "static"
				});
			});
		</script>
	</c:if>
	<script src="<c:url value="/decoration/js/loadAjax.js"/>"></script>
	<script src="<c:url value="/decoration/js/Valid.js"/>"></script>
</body>
</html>