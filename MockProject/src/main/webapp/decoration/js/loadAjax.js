/**
 * 
 */
/*CheckIn View*/
var CItable = $('#checkinTable').DataTable();
CItable.on('click', '.delete', function() {
	var data = CItable.row($(this).parents('tr')).data();
	$('#rNumber').val(data[2]);
});

/*CheckOut-View*/
$('#checkoutTable').DataTable();

/*Roomlist-View*/
var rtable = $('#extable').DataTable();
rtable.on('click', '.edit', function() {
	var data = rtable.row($(this).parents('tr')).data();
	$('#editRoom #roomId').val(data[2]);
	$('#editRoom #roomNumber').val(data[2]);
	$('#editRoom #roomCategory').val(data[3]);
	$('#editRoom #price').val(data[6]);
	$('#editRoom #description').val(data[7]);
});



/*Staff-View*/
var table = $('#userTable').DataTable();
		table.on('click', '.edit', function() {
			var data = table.row($(this).parents('tr')).data();
			$('#exUsername').val(data[2]);
			$('#fullNamee').val(data[1]);
			$('#userName').val(data[2]);
			$('#phonee').val(data[3]);
			$('#birthday').val(data[4]);
			$('#identityNumber').val(data[5]);
			$('#emaill').val(data[6]);
		});		

/*Service Category View*/
var serCateTable = $('#serviceCategoryTable').DataTable();
serCateTable.on('click', '.edit', function() {
	var data = serCateTable.row($(this).parents('tr')).data();
	$('#categorySerID').val(data[2]);
	$('#categorySerName').val(data[2]);
});


/*Service View*/
var sertable = $('#serviceTable').DataTable();
sertable.on('click', '.edit', function() {
	var data = sertable.row($(this).parents('tr')).data();
	$('#exServiceName').val(data[2]);
	$('#serviceName').val(data[2]);
	$('#catSerName').val(data[3]);
	$('#servicePrice').val(data[5]);
	$('#serviceDescription').val(data[6]);
});

/*Room Category View*/
var rcatetable = $('#categoryTable').DataTable();
rcatetable.on('click', '.edit', function() {
	var data = rcatetable.row($(this).parents('tr')).data();
	$('#exCategory').val(data[2]);
	$('#categoryRoom').val(data[2]);
	$('#categoryPrice').val(data[3]);
});

/*Reservation View*/
var restable = $('#reserveTable').DataTable();
		restable.on('click', '.View', function() {
			var data = restable.row($(this).parents('tr')).data();
			$('#bookingId').val(data[0]);
			$('#price').val($('#hiddenTotal').val());
		});

$('[data-toggle="tooltip"]').tooltip();