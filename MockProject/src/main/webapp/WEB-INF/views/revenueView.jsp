
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
	<div class="container row" id="load"
		style="margin: 5% auto; width: 100%; min-height: 450px;">
		<div class="col-lg-12" id="columnchart_values"></div>
	</div>


	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$
									.ajax({
										type : 'GET',
										headers : {
											Accept : "application/json; charset=utf-8",
											"Content-Type" : "application/json; charset=utf-8"
										},
										url : '${pageContext.request.contextPath}/admin/revenueList',
										success : function(result) {
											google.charts.load('current', {
												'packages' : [ 'corechart' ]
											});
											google.charts
													.setOnLoadCallback(function() {
														drawChart(result);
													});
										}
									});

							function drawChart(result) {
								//alert(result.length);
								var data = new google.visualization.DataTable();

								var dataArray = [];
								data.addColumn('number', 'Month');
								data.addColumn('number', 'Revenue');
								//data.addColumn({role: 'style', type: 'string'}); */
								
								//var header = ['Month', 'Revenue', {role : 'style'}];
								//dataArray.push(header);
								for (var i = 1; i <= 12; i++) {
									if (i - 1 < result.length) {
										data.addRow([result[i - 1].month, result[i - 1].revenue]);
									}
									else {
										data.addRow([i , 0]);
									}
								}
								
								
							/* 	$.each(result, function(i, obj) {
									dataArray.push([ obj.month, obj.revenue, "blue" ]);
									/* 	data = google.visualization
												.arrayToDataTable([
														[ "Month", "Revenue", {
															role : "style"
														} ],
														[ obj.month, obj.revenue,
																"blue" ] ]); 
								});*/

//								data.addRow(dataArray);
 
								var view = new google.visualization.DataView(
										data);
														//view.setColumns([ 1, 0]);

								 view.setColumns([ 0, 1, {
									calc : "stringify",
									sourceColumn : 1,
									type : "string",
									role : "annotation"
								}, ]); 

								var options = {
									title : "Revenue By Month ($/Month) in 2021",
									animation : {
										startup : true,
										duration : 1000,
										easing : 'out'
									},
								//colors : "blue",
								};
								var chart = new google.visualization.ColumnChart(
										document
												.getElementById("columnchart_values"));
								chart.draw(view, options);
							}

							/* $(window).resize(function() {
								drawChart();
							}); */
						});
		/* 		google.charts.load("current", {
		 packages : [ 'corechart' ]
		 }); 
		
		 google.charts.setOnLoadCallback(drawChart); */
	</script>
</body>

</html>