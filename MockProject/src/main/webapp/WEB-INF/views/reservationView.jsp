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
<link rel='stylesheet' type='text/css' media='screen' href='main.css'>
<script src="<c:url value="/decoration/js/main.js" />"></script>
</head>

<body>
	<div class="container" id="load">
		<div class="table-wrapper w-100 mx-auto">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Reservation</h2>
					</div>
				</div>
			</div>
			<table id="reserveTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Booking ID</th>
						<th>Customer IdentityNumber</th>
						<th>Room Number</th>
						<th>Service</th>
						<th>Checkin</th>
						<th>Checkout</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${availableBooking}" varStatus="loop" var="view">
						<tr>
							<td class="td">${view.bookingId}</td>
							<td class="td">${view.customer.identityNumber}</td>
							<td class="td">${view.room.roomNumber}</td>
							<td><a href="#viewService_${view.bookingId }" class="View"
								data-toggle="modal"><i class="fas fa-eye ml-4"
									style="color: #D4B35E;" data-toggle="tooltip" title="View">&#xE254;</i></a>
								<div id="viewService_${view.bookingId }" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<form>
												<div class="modal-header mauxin">
													<h4 class="modal-title">View Service</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
												</div>
												<div class="modal-body">
													<table id="serviceTable"
														class="table table-danger table-striped table-hover table-bordered">
														<thead>
															<tr>
																<th>Service name</th>
																<th>Price</th>
																<th>Quantity</th>
																<th>Action</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${view.quantity}" varStatus="loop"
																var="list">
																<tr>
																	<td class="td">${list.service.serName}</td>
																	<td class="td">${list.service.price}</td>
																	<td class="td">${list.quantity}</td>
																	<td>
																		<div class="d-flex">
																			<a href="#editService" class="edit"
																				data-toggle="modal"><i class="material-icons"
																				data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
																				href="#deleteReservation_${view.bookingId }_${list.serviceId}"
																				class="delete" data-toggle="modal"><i
																				class="material-icons" data-toggle="tooltip"
																				title="Delete">&#xE872;</i></a>
																		</div>
																	</td>

																</tr>

																<div
																	id="deleteReservation_${view.bookingId }_${list.serviceId}"
																	class="modal fade">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<form>
																				<div class="modal-header">
																					<h4 class="modal-title">Delete Ordered Service</h4>
																					<button type="button" class="close"
																						data-dismiss="modal" aria-hidden="true">&times;</button>
																				</div>
																				<div class="modal-body">
																					<p>Are you sure you want to delete these
																						Records?</p>
																					<p class="text-warning">
																						<small>This action cannot be undone.</small>
																					</p>
																				</div>

																				<div class="modal-footer">
																					<input type="button" class="btn btn-default"
																						data-dismiss="modal" value="Cancel"> <a
																						class="btn btn-danger"
																						href="${pageContext.request.contextPath}/deleteOrderedService/${view.bookingId }_${list.serviceId}">Delete</a>
																				</div>
																			</form>
																		</div>
																	</div>
																</div>

																<input type="hidden" name="hiddenTotal"
																	value="${list.quantity * list.service.price}" />
															</c:forEach>
														</tbody>
													</table>
												</div>
												<div class="modal-footer">
													<a type="button" href="#addService"
														class="btn btn-success .addService" data-toggle="modal">Add</a>
													<input type="button" class="btn btn-default"
														data-dismiss="modal" value="Cancel">
												</div>
											</form>
										</div>
									</div>
								</div></td>
							<td class="td">${view.startDate}</td>
							<td class="td">${view.endDate}</td>
							<c:forEach items="${ total.totalMap }" var="t">

								<c:if test="${view.bookingId == t.key}">
									<td class="td">${t.value}</td>
								</c:if>
							</c:forEach>


						</tr>

					</c:forEach>

					<c:forEach items="${inavailableBooking}" varStatus="loop" var="view">
						<tr>
							<td class="td">${view.bookingId}</td>
							<td class="td">${view.customer.identityNumber}</td>
							<td class="td">${view.room.roomNumber}</td>
							<td><a href="#viewService_${view.bookingId }" class="View"
								data-toggle="modal"><i class="fas fa-eye ml-4"
									style="color: #D4B35E;" data-toggle="tooltip" title="View">&#xE254;</i></a>
								<div id="viewService_${view.bookingId }" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<form>
												<div class="modal-header mauxin">
													<h4 class="modal-title">View Service</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
												</div>
												<div class="modal-body">
													<table id="serviceTable"
														class="table table-danger table-striped table-hover table-bordered">
														<thead>
															<tr>
																<th>Service name</th>
																<th>Price</th>
																<th>Quantity</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${view.quantity}" varStatus="loop"
																var="list">
																<tr>
																	<td class="td">${list.service.serName}</td>
																	<td class="td">${list.service.price}</td>
																	<td class="td">${list.quantity}</td>

																</tr>

																<input type="hidden" name="hiddenTotal"
																	value="${list.quantity * list.service.price}" />
															</c:forEach>
														</tbody>
													</table>
												</div>
												<div class="modal-footer">
													<input type="button" class="btn btn-default"
														data-dismiss="modal" value="Cancel">
												</div>
											</form>
										</div>
									</div>
								</div></td>
							<td class="td">${view.startDate}</td>
							<td class="td">${view.endDate}</td>
							<c:forEach items="${ total2.totalMap }" var="t2">
								
								<c:if test="${view.bookingId == t2.key}">
									<td class="td">${t2.value}</td>
								</c:if>
							</c:forEach> 

						<!-- 	<td>abc</td> -->
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>

		<div id="addService" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form:form id="call-service"
						action="${pageContext.request.contextPath }/addServiceForCustomer"
						modelAttribute="addService" method="POST">
						<div class="modal-header mauxin">
							<h4 class="modal-title">Add Service</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<form:input type="hidden" path="bookingId" id="bookingId" />
								<label>Category Service</label> <select class="form-control"
									name="categoryName" id="categoryName">
									<option value="${null }" selected>--Select service
										category--</option>
									<c:forEach items="${listServiceCategory}" var="view"
										varStatus="loop">
										<option value="${view.id}">
											<c:out value="${view.catSerName }" />
										</option>
										<c:set var="id" value="${view.id }" />
									</c:forEach>
								</select>
							</div>
							<div id="details">

								<div class="form-group">
									<label>Service Name</label>
									<form:select class="form-control" name="categoryName"
										id="serviceName" path="serviceId">

									</form:select>
								</div>
								<div class="form-group">
									<label>Quantity</label>
									<form:input type="text" path="quantity" class="form-control" />
								</div>
							</div>

						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal"
								value="Cancel"> <input type="submit"
								class="btn btn-success" value="Add" id="btnAddService">
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
	</div>
	<script src="<c:url value="/decoration/jquery.min.js"/>"></script>
	<script charset="utf8"
		src="<c:url value="/decoration/js/datatable.min.js" />"></script>
	<script type="text/javascript">
		var table = $('#reserveTable').DataTable();
		table.on('click', '.View', function() {
			var data = table.row($(this).parents('tr')).data();
			$('#bookingId').val(data[0]);
			$('#price').val($('#hiddenTotal').val());
		});

		$(document)
				.ready(
						function() {

							/* $(document).on('click', '#choose', function() {
								$('#details').toggle("slide");
							}); */

							$('#categoryName')
									.change(
											function() {
												var categoryId = $(this).val();
												//alert(categoryId);
												$
														.ajax({
															type : 'GET',
															url : "/MockProject/addServiceDetails/"
																	+ categoryId,
															success : function(
																	data) {
																var slctSubcat = $('#serviceName'), option1 = "";
																slctSubcat
																		.empty();

																for (var i = 0; i < data.length; i++) {
																	option1 = option1
																			+ "<option value='"+ data[i].id + "'>"
																			+ data[i].serName
																			+ "</option>";
																}
																slctSubcat
																		.append(option1);
															},
															error : function() {
																alert("error");
															}
														});
											});
						});
	</script>
</body>

</html>