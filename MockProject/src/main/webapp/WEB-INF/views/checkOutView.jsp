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
						<h2>Manage Check-Out</h2>
					</div>
				</div>
			</div>
			<table id="checkoutTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>Category</th>
						<th>Room</th>
						<th>Status</th>
						<!-- 				<th>Service</th> -->
						<th>Action</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${listRoomCheckin}" varStatus="loop" var="view">
						<tr>

							<td class="td"><c:out value="${loop.index+1}" /></td>
							<td class="td">${view.cateRoom.catRoomName }</td>
							<td class="td">${view.roomNumber }</td>
							<td class="td">
								<div class="text-center" style="color: red; font-weight: bold;">${view.status }
								</div>
							</td>
							<!-- <td><a href="#viewService" class="View" data-toggle="modal"><i
									class="fas fa-eye ml-4" style="color: #D4B35E;"
									data-toggle="tooltip" title="View">&#xE254;</i></a></td> -->
							<td class="d-flex">
							<a href="${pageContext.request.contextPath}/toAvailable/${view.roomNumber}"
								type="submit" class="ml-4 fas fa-check-square Check-In text-success"
								style="font-size: 1.36rem; margin-top: 0.8px"
								data-toggle="tooltip" title="Check-Out">&#xE254;
							</a>
							</td>

						</tr>

					</c:forEach>

				</tbody>

			</table>
		</div>


		
		
		
	
		
		
	</div>
	<script src="<c:url value="/decoration/js/loadAjax.js"/>"></script>
</body>

</html>