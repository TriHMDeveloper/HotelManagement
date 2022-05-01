<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" id="load" style="width: 100%;">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage Category Service</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addCategoryService" class="btn btn-success"
							data-toggle="modal"><i class="material-icons">&#xE147;</i>
							Add</a> <a href="#deleteCategoryService" class="btn btn-danger"
							data-toggle="modal"><i class="material-icons">&#xE15C;</i>
							Del</a>
					</div>
				</div>
			</div>
			<table id="serviceCategoryTable"
				class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>#</th>
						<th>Category Name</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${listViewCate}" varStatus="loop" var="view">
						<tr>
							<td><span class="custom-checkbox"> <input
									type="checkbox" id="checkbox1" name="options[]" value="1">
									<label></label>
							</span></td>
							<td class="text-center"><c:out value="${loop.index+1}" /></td>
							<td>${view.catSerName}</td>
							<td><a href="#editCategoryService" class="edit"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
								href="#deleteCategoryService_${view.id }" class="delete"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
						</tr>

						<div id="deleteCategoryService_${view.id }" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form>
										<div class="modal-header mauxin">
											<h4 class="modal-title">Delete Category Service</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">
											<p>Are you sure you want to delete these Records?</p>
											<p class="text-warning">
												<small>This action cannot be undone. </small>
											</p>
										</div>
										<div class="modal-footer">
											<input type="button" class="btn btn-default"
												data-dismiss="modal" value="Cancel"> <a
												href="${pageContext.request.contextPath}/deleteCategoryService/${view.id}"
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
	<!-- Delete Service Category  HTML -->

	<!-- Edit Category Room HTML -->
	<div id="editCategoryService" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="edit-category-service" method="POST"
					action="${pageContext.request.contextPath}/editCategoryService">
					<!-- Spring -->
					<div class="modal-header mauxin">
						<h4 class="modal-title">Service Category</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" class="form-control" name="categorySerID"
							id="categorySerID">
						<div class="form-group">
							<label>Category Name</label> <input type="text"
								class="form-control" name="categorySerName" id="categorySerName">
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
	<div id="addCategoryService" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form:form id="category-service" method="POST"
					action="${pageContext.request.contextPath}/addCategoryService"
					modelAttribute="serviceCateAttribute">
					<!-- Spring -->
					<div class="modal-header mauxin">
						<h4 class="modal-title ">Add Service Category</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<c:if test="${messageCateService != null }">
						<div class="alert alert-danger text-center " role="alert">
							${messageCateService}</div>
					</c:if>
					<div class="modal-body">
						<div class="form-group">
							<label>CategoryName</label>
							<form:input type="text" class="form-control" path="catSerName" />
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
	<c:if test="${messageCateService != null }">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#addCategoryService').modal({
					"backdrop" : "static"
				});
			});
		</script>
	</c:if>
	<script src="<c:url value="/decoration/js/loadAjax.js"/>"></script>
	<script src="<c:url value="/decoration/js/Valid.js"/>"></script>

</body>
</html>