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
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage Booking</h2>
                    </div>
                </div>
            </div>
            <table id="bookedTable" class="table table-striped table-hover">
                <thead>
                    <tr>
                        
                        <th>#</th>
						<th>Room number</th>
						<th>Room Category</th>
						<th>Status</th>
						<th>Price</th>
						<th>Action</th>
                    </tr>
                </thead>
                <tbody>
                
                	<c:forEach items="${listRoomAvailable}" varStatus="loop" var="view">
						<tr>
							
							<td><c:out value="${loop.index+1 }"/> </td>
							<td>${view.roomNumber }</td>
							<td>${view.cateRoom.catRoomName }</td>
							<td class="text-success">${view.status }</td>
							<td>${view.price }</td>
							 <td>
	                            <a type="button" href="#addBooking" class="btn btn-primary view" data-toggle="modal">Booked</a>
	                        </td>
						</tr>

						
					</c:forEach>
                
                </tbody>
            </table>
        </div>
        <div id="addBooking" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form:form id="add-booking" method="POST" action="${pageContext.request.contextPath}/addBooking" modelAttribute="bookingAttribute">
                        <div class="modal-header mauxin">
                            <h4 class="modal-title ">Book</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                        
                        	<div class="form-group">
                                <label>Room Number</label>
                                <form:input type="text" class="form-control" id="roomNumber" path="roomNumber" />
                            </div>
                        
                            <div class="form-group">
                                <label>Name</label>
                                <form:input type="text" class="form-control" path="nameCustomer"/>
                            </div>
                            
                            <div class="form-group">
                                <label>Identity Number</label>
                                <form:input type="text" class="form-control" path="identityNumber" />
                            </div>
                            
                            <div class="form-group">
                                <label>Contact#</label>
                                <form:input type="text" class="form-control" path="phone"/>
                            </div>
                            <div class="form-group">
                                <label for="Check-In-Date">Check-In-Date:</label>
                                <form:input type="date" class="form-control" id="Check-In-Date-Booking" path="startDay" name="Check-In-Date"/>
                            </div>
                            <div class="form-group">
                                 <label for="Check-Out-Date">Check-Out-Date:</label>
                                 <form:input type="date" class="form-control" id="Check-Out-Date-Booking" path="endDay" name="Check-Out-Date"/>
                            </div>
                            <div class="form-group">
                                 <label>People number</label>
                                 <form:input type="text" class="form-control" path="numberOfPeople" />
                            </div>                                                       
                        </div>
                        <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-info" value="Book">
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        <!-- Edit Category Room HTML -->

    </div>	
    <script type="text/javascript">
	
		var btable = $('#bookedTable').DataTable();
	    btable.on('click', '.view', function() {
	        var data = btable.row($(this).parents('tr')).data();
	        $('#roomNumber').val(data[1]);
	    });
	    $('[data-toggle="tooltip"]').tooltip();
	    
	    function getDate(){
			   var date_in = new Date($('#Check-In-Date-Booking').val());
			   var date_out = new Date($('#Check-Out-Date-Booking').val());
			   var booleann=false;
			   if(date_out>date_in){
				   booleann=true;		   
			   }
			   if(booleann==false){
				   alert('Check Out Date must be greater than Check In Date')
			   }   
		   }
		   $(document).ready(function(){
			   $("#Check-Out-Date-Booking").change(function(){
			       getDate();
			   });
			 });
	</script>
	<script src="<c:url value="/decoration/js/Valid.js"/>"></script>
</body>

</html>