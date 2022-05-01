<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
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
						<h2>Manage Check-In</h2>
					</div>
				</div>
			</div>
			<table id="checkinTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>Category</th>
						<th>Room</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listRoomBooked}" varStatus="loop" var="view">
						<tr>

							<td class="td"><c:out value="${loop.index+1}" /></td>
							<td class="td">${view.cateRoom.catRoomName }</td>
							<td class="td">${view.roomNumber }</td>
							<td class="td">
								<div class="text-center" style="color: red; font-weight: bold;">${view.status }
								</div>
							</td>
							<td class="d-flex">
							<a
								href="${pageContext.request.contextPath}/toCheckIn/${view.roomNumber}"
								type="submit" class="ml-4 fas fa-check-square Check-In text-success"
								style="font-size: 1.36rem; margin-top: 0.8px"
								data-toggle="tooltip" title="Check-In">&#xE254;
							</a>
							   <%-- <a href="${pageContext.request.contextPath}/toCheckIn/${view.roomNumber}"
								class="Check-In" data-toggle="modal" type="submit" ><i
									class="fas fa-check-square  text-success"
									style="color: #403678;" data-toggle="tooltip" title="Check-In">&#xE254;</i></a> --%>
								<a href="#deleteCheckin_${view.roomNumber }"
								class="Booked-Cancel delete" data-toggle="modal"> <i
									class="fas fa-window-close text-danger" style="color: #403678;"
									data-toggle="tooltip" title="Cancel Booked">&#xE254;</i></a></td>
						</tr>

						<div id="deleteCheckin_${view.roomNumber }" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form>
										<div class="modal-header mauxin">
											<h4 class="modal-title">Delete Check-In</h4>
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
												href="${pageContext.request.contextPath}/deleteBooking/${view.roomNumber}"
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
	<script src="<c:url value="/decoration/js/loadAjax.js"/>"></script>
</body>

</html>