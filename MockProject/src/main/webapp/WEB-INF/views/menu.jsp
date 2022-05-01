<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="menu min-vh-100 d-flex flex-column" id="layout">
		<div class="d-flex menu-item">
			<i class="fa fa-home mt-1 mr-2" aria-hidden="true"
				style="font-size: 110%; width: fit-content;"></i> <a href="#"
				role="button" id="home" name="home" onclick="loadWelcome()">
				Home</a>
		</div>
		<div class="d-flex menu-item">
			<span><i class="fa fa-book mt-10 mr-2" aria-hidden="true"
				style="font-size: 110%; width: fit-content;"></i></span> <a role="button"
				id="booking" name="booking" href="#" onclick="loadBooking()">Booking</a>
		</div>

		<div class="d-flex menu-item">
			<span><i class="fas fa-sign-in-alt mt-10 mr-2"
				aria-hidden="true" style="font-size: 110%; width: fit-content;"></i></span>
			<a role="button" id="checkin" name="checkin" href="#"
				onclick="loadCheckIn()">Check in</a>
		</div>
		<div class="d-flex menu-item">
			<span><i class="fas fa-sign-out-alt mt-10 mr-2"
				aria-hidden="true" style="font-size: 110%; width: fit-content;"></i></span>
			<a role="button" id="checkout" name="checkout" href="#"
				onclick="loadCheckOut()">Check out</a>
		</div>


		<div class="d-flex menu-item">
			<span><i class="fas fa-file-invoice mt-10 mr-2"
				aria-hidden="true" style="font-size: 110%; width: fit-content;"></i></span>
			<a role="button" id="reservation" name="reservation"
				onclick="loadReservationn()" href="#">Reservation</a>
		</div>

		<security:authorize access="hasRole('ADMIN')">
		<div class="d-flex menu-item">
				<span><i class="fas fa-list mt-1 mr-2" aria-hidden="true"
					style="font-size: 110%; width: fit-content;"></i></span> <a role="button"
					id="category" name="category" href="#" onclick="loadRoomCate()">Room
					Category</a>
			</div>
			<div class="d-flex menu-item">
				<span><i class="fas fa-bed mt-1 mr-2" aria-hidden="true"
					style="font-size: 110%; width: fit-content;"></i></span> <a role="button"
					id="roomlist" name="roomlist" href="#" onclick="loadRoom()">Rooms
					List</a>
			</div>
			<div class="d-flex menu-item">
				<span><i class="fas fa-list-alt mt-10 mr-2"
					aria-hidden="true" style="font-size: 110%; width: fit-content;"></i></span>
				<a role="button" id="serviceCate" name="serviceCate" href="#"
					onclick="loadServiceCate()">Service category</a>
			</div>
			<div class="d-flex menu-item">
				<span><i class="fas fa-concierge-bell mt-10 mr-2"
					aria-hidden="true" style="font-size: 110%; width: fit-content;"></i></span>
				<a role="button" id="serviceCate" name="serviceCate" href="#"
					onclick="loadServicee()">Service</a>
			</div>
			<div class="d-flex menu-item">
				<span><i class="fas fa-money-bill-alt mt-10 mr-2"
					aria-hidden="true" style="font-size: 110%; width: fit-content;"></i></span>
				<a role="button" id="revenue" href="#" onclick="loadRevenuee()">Revenue
				</a>
			</div>
			<div class="d-flex menu-item">
				<span><i class="fas fa-users mt-10 mr-2" aria-hidden="true"
					style="font-size: 110%; width: fit-content;"></i></span> <a role="button"
					id="users" href="#" onclick="loadStaffList()">Users</a>
			</div>			
		</security:authorize>
	</div>
	<script>
		function loadBooking() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/listBooking",
						success : function(data) {
							var d = $("#child");
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});
		}

		function loadServicee() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/admin/listService",
						success : function(data) {
							var d = $("#child");
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});
		}

		function loadServiceCate() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/admin/listServiceCategory",
						success : function(data) {
							var d = $("#child");
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});

		}

		function loadRoom() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/admin/listRoom",
						success : function(data) {
							var d = $("#child");
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});
		}

		function loadRoomCate() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/admin/listRoomCategory",
						success : function(data) {
							var d = $("#child");
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});
		}

		function loadCheckIn() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/checkIn",
						success : function(data) {
							var d = $("#child");
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});
		}

		function loadCheckOut() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/checkOut",
						success : function(data) {
							var d = $("#child");
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});
		}

		function loadStaffList() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/admin/staffList",
						success : function(data) {
							var d = $("#child");
							98999
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});
		}
		function loadRevenuee() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/admin/revenue",
						success : function(data) {
							var d = $("#child");
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});
		}
		function loadReservationn() {
			$
					.ajax({
						type : "get",
						url : "/MockProject/reservationView",
						success : function(data) {
							var d = $("#child");
							var str = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
							d.html(str);
							setTimeout(function() {
								d.html(data);
							}, 1000);
						}
					});
		}
		function loadWelcome() {
			$.ajax({
				type : "get",
				url : "/MockProject/welcome",
				success : function(data) {
					var d = $("#child");
					d.html(data);
				}
			});
		}
		function loadProfile() {
			$.ajax({
				type : "get",
				url : "/MockProject/profile",
				success : function(data) {
					var d = $("#child");
					d.html(data);
				}
			});
		}
	</script>
</body>
</html>