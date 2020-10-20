<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="">

<head>
<meta charset="utf-8">
<title>Overview</title>
<meta name="author" content="Salitha">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"
	rel="stylesheet">

<!-- Google fonts -->
<link href='https://fonts.googleapis.com/css?family=ABeeZee'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Aldrich'
	rel='stylesheet'>


</head>

<body>


	<!-- JSTL Data -->
	<c:set var="count" value="0" />
	<c:forEach var="rst" items="${requestdetails}">

		<c:if test="${rst.status == 'Incomplete'}">
			<c:set var="count" value="${count + 1}" />
		</c:if>

	</c:forEach>

	<c:set var="petrol" value="0" />
	<c:set var="diesel" value="0" />
	<c:set var="kerosine" value="0" />

	<c:forEach var="fuel" items="${fsdetails}">

		<c:set var="id" value="${fuel.id}" />
		<c:set var="date" value="${fuel.date}" />
		<c:set var="time" value="${fuel.time}" />
		<c:set var="type" value="${fuel.type}" />
		<c:set var="max" value="${fuel.max}" />
		<c:set var="current" value="${fuel.current}" />


		<c:if test="${time == '12:00:00' }">
			<c:if test="${type == 'Petrol'}">
				<c:set var="petrol" value="${((max - current)/max)*100}" />
			</c:if>

			<c:if test="${type == 'Diesel'}">
				<c:set var="diesel" value="${((max - current)/max)*100}" />
			</c:if>

			<c:if test="${type == 'Kerosine'}">
				<c:set var="kerosine" value="${((max - current)/max)*100}" />
			</c:if>

		</c:if>
	</c:forEach>



	<!-- Hidden menu -->

	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<a href="#">Home</a> <a href="OverviewServlet">Overview</a> <a
				href="GetFuelStockServlet">Reports</a> <a href="GetRequestsServlet">Requests</a>
			<a href="GetOrdersServlet">Order</a> <a href="#">Help</a>
		</div>
	</div>


	<!-- Header -->

	<div class="container-fluid">
		<div class="row shadow-sm"
			style="height: 70px; background-color: yellow; position: fixed; width: 100%; z-index: 5">

			<div class="col-2 align-self-center">
				<button type="button" class="btn btn-success mr-3" id="home_btn">Home</button>
				<button type="button" class="btn btn-success mr-3" id="menu_btn"
					onclick="openNav()">Menu</button>
			</div>

			<div class="col-8 align-self-center text-center heading">Fuel
				Management</div>
			<div class="col-2 align-self-center">
				<button type="button" class="btn btn-warning float-right">Logout</button>
			</div>
		</div>

		<div class="row">



			<!-- Nav -->

			<table style="width: 100%; height: 100%; border: none; margin: 0">

				<tr>
					<td style="width: 15%; position: fixed" id="tdhide" height="100%"
						class="shadow-sm">

						<div class="menu_itms d-none d-lg-block equal"
							style="height: 100%; z-index: 4;">

							<a href="OverviewServlet"><div class="menu active"
									style="margin-top: 100px">
									<i class="fas fa-desktop"></i>Overview
								</div></a> <a href="GetFuelStockServlet"><div class="menu">
									<i class="fas fa-file-word"></i>Reports
								</div></a> <a href="GetRequestsServlet"><div class="menu">
									<i class="fas fa-table"></i>Requests
								</div></a> <a href="GetOrdersServlet"><div class="menu">
									<i class="fas fa-shopping-cart"></i>Order
								</div></a> <a href="#"><div class="menu">
									<i class="fas fa-question-circle"></i>Help
								</div></a>
						</div>
					</td>


					<!--Content -->

					<td style="width: 85%; padding: 20px;" style="position: absolute;">
						<div class="equal" style="margin-top: 100px;">


							<!--  Alert  -->

							<c:set var="dis" value="none" />
							<c:set var="success" value="alert-success" />
							<c:if test="${count > 0}">
								<c:set var="dis" value="block" />

							</c:if>

							<div class="alert ${success} alert-dismissible mb-5"
								style="display: ${dis}">
								<button type="button" class="close" data-dismiss="alert">×</button>
								<strong>Info!</strong> You have <b>${count}</b> new re-stock
								requests.

							</div>

							<div
								class="d-sm-flex align-items-center justify-content-between mb-4">
								<h3 class="h4 mb-0 text-gray-800">Summary</h3>
							</div>


							<div class="row">

								<!-- Card petrol -->
								<div class="col-xl-4 col-md-6 mb-4">
									<div class="card border-left-info shadow h-100 py-2"
										style="border-left-width: medium; border-left-color: orangered">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-info text-uppercase mb-1">Petrol</div>
													<div class="row no-gutters align-items-center">
														<div class="col-auto">
															<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${petrol}%</div>
														</div>
														<div class="col">
															<div class="progress progress-sm mr-2">
																<div class="progress-bar bg-info" role="progressbar"
																	aria-valuenow="${petrol}" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-auto">
													<i class="fas fa-gas-pump fa-2x text-gray-300"></i>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- Card diesel -->
								<div class="col-xl-4 col-md-6 mb-4">
									<div class="card border-left-info shadow h-100 py-2"
										style="border-left-width: medium; border-left-color: orange">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-info text-uppercase mb-1">Diesel</div>
													<div class="row no-gutters align-items-center">
														<div class="col-auto">
															<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${diesel}%</div>
														</div>
														<div class="col">
															<div class="progress progress-sm mr-2">
																<div class="progress-bar bg-info" role="progressbar"
																	aria-valuenow="${diesel}" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-auto">
													<i class="fas fa-gas-pump fa-2x text-gray-300"></i>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- Card kerosine-->
								<div class="col-xl-4 col-md-6 mb-4">
									<div class="card border-left-info shadow h-100 py-2"
										style="border-left-width: medium; border-left-color: yellowgreen">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-info text-uppercase mb-1">Kerosine</div>
													<div class="row no-gutters align-items-center">
														<div class="col-auto">
															<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${kerosine}%</div>
														</div>
														<div class="col">
															<div class="progress progress-sm mr-2">
																<div class="progress-bar bg-info" role="progressbar"
																	aria-valuenow="${kerosine}" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-auto">
													<i class="fas fa-gas-pump fa-2x text-gray-300"></i>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>

							<div class="card mb-4" style="margin-top: 50px">
								<div class="card-header">Fuel Usage</div>
								<div class="card-body" style="width: 90%; align-content: center">

									<div id="line_top_x" align="center"></div>

								</div>
							</div>

						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<script>
	
	$(window).resize(function(){
		  drawChart();
		});
	
		//Progress bar
		$(document).ready(function() {
			$('.progress-bar').css("width", function() {
				return $(this).attr("aria-valuenow") + "%";
			})
		});
		
		function openNav() {
			document.getElementById("myNav").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("myNav").style.width = "0%";
		}
		
		//Google chart
		google.charts.load('current', {
			'packages' : [ 'line' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = new google.visualization.DataTable();
			data.addColumn("string", 'Time');
			data.addColumn('number', 'Petrol');
			data.addColumn('number', 'Diesel');
			data.addColumn('number', 'Kerosine');
	

			data.addRows([ 

			<c:forEach var="fuel" items="${fsdetails}" step="3">

			<c:set var="timemain" value="${fuel.time}" />
			
				<c:set var="petrol" value="0" />
				<c:set var="diesel" value="0" />
				<c:set var="kerosine" value="0" />
					
			<c:forEach var="fuel" items="${fsdetails}">

			<c:set var="time" value="${fuel.time}" />
			<c:set var="type" value="${fuel.type}" />
			<c:set var="current" value="${fuel.current}" />
			
				<c:if test="${ time == timemain }">
			<c:if test="${type == 'Petrol'}">
			
				<c:set var="petrol" value="${petrol + current}" />
			</c:if>

			<c:if test="${type == 'Diesel'}">
				<c:set var="diesel" value="${diesel + current}" />
			</c:if>

			<c:if test="${type == 'Kerosine'}">
				<c:set var="kerosine" value="${kerosine + current}" />
			</c:if>
			</c:if>
			
			</c:forEach>
				
				['${timemain}', ${petrol}, ${diesel}, ${kerosine}],

				</c:forEach>
			]);
			
			
			
			var options = {
				chart : {
					title : 'Fuel usage throughout the day',
					subtitle : 'in Liters (L)'
				},
				width : '100%',
				height : 500,
				axes : {
					x : {
						0 : {
							side : 'bottom'
						}
					}
				}
			};

			var chart = new google.charts.Line(document
					.getElementById('line_top_x'));

			chart.draw(data, google.charts.Line.convertOptions(options));
		}
	</script>

</body>

</html>
