<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="">

<head>
<meta charset="utf-8">
<title>Requests</title>
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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

<!-- Google fonts -->
<link href='https://fonts.googleapis.com/css?family=Sofia'
	rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=ABeeZee'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Aldrich'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Copse'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Delius Unicase'
	rel='stylesheet'>


</head>

<body>

	<!-- Hidden menu -->

	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<a href="#">Home</a> <a href="OverviewServlet">Overview</a> <a
				href="GetFuelStockServlet">Reports</a> <a href="GetRequestsServlet">Requests</a>
			<a href="GetOrdersServlet">Order</a> <a href="#">Help</a>
		</div>
	</div>

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
					<td style="color: blue; width: 15%; position: fixed" id="tdhide"
						height="100%" class="shadow-sm">

						<div class="menu_itms d-none d-lg-block equal"
							style="height: 100%; z-index: 4;">

							<a href="OverviewServlet"><div class="menu"
									style="margin-top: 100px">
									<i class="fas fa-desktop"></i>Overview
								</div></a> <a href="GetFuelStockServlet"><div class="menu">
									<i class="fas fa-file-word"></i>Reports
								</div></a> <a href="GetRequestsServlet"><div class="menu active">
									<i class="fas fa-table"></i>Requests
								</div></a> <a href="GetOrdersServlet"><div class="menu">
									<i class="fas fa-shopping-cart"></i>Order
								</div></a> <a href="#"><div class="menu">
									<i class="fas fa-question-circle"></i>Help
								</div></a>

						</div>
					</td>

					<!--  Content -->
					<!-- New requests -->



					<td style="width: 85%; padding: 20px;">
						<div class="equal" style="margin-top: 100px;">

							<div class="card mb-4" style="margin-top: 50px">
								<div class="card-header">
									<div class="row">
										<div class="col-lg-8 col-7 align-self-center">
											<h5>New Requests</h5>

										</div>

									</div>
								</div>


								<div class="card-body">

									<table class="table table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Date</th>
												<th>Time</th>
												<th>Branch</th>
												<th>Fuel Type</th>
												<th>Amount</th>
												<th>Status</th>

												<th class="approve">Approve</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="rst" items="${requestdetails}">

												<c:set var="id" value="${rst.id}" />
												<c:set var="date" value="${rst.date}" />
												<c:set var="time" value="${rst.time}" />
												<c:set var="branch" value="${rst.branch}" />
												<c:set var="type" value="${rst.fType}" />
												<c:set var="amount" value="${rst.amount}" />
												<c:set var="status" value="${rst.status}" />

												<c:if test="${rst.status == 'Incomplete'}">

													<tr>

														<td>${id}</td>

														<td>${date}</td>

														<td>${time}</td>

														<td>${branch}</td>

														<td>${type}</td>

														<td>${amount}</td>

														<td>${status}</td>

														<td class="approve"><a
															href="ApproveRequestServlet?id=${id}">
																<button type="button" class="btn btn-primary">Approve</button>
														</a></td>
													</tr>
												</c:if>

											</c:forEach>


										</tbody>
									</table>

								</div>
							</div>
							<!--  Approved -->

							<div class="card mb-4" style="margin-top: 50px">
								<div class="card-header">
									<div class="row">
										<div class="col-lg-8 col-7 align-self-center">
											<h5>Approved Requests</h5>
										</div>
										<div class="col-lg-4 col-5  align-self-center">

											<form action="searchrq">

												<div class="form-group has-search">
													<input type="text" class="form-control" name="term"
														placeholder="&#xF002; Search by branch..."
														style="font-family: Arial, FontAwesome">
												</div>

											</form>
										</div>

									</div>

								</div>


								<div class="card-body">

									<table class="table table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Date</th>
												<th>Time</th>
												<th>Branch</th>
												<th>Fuel Type</th>
												<th>Amount</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="rst" items="${requestdetails}">

												<c:set var="id" value="${rst.id}" />
												<c:set var="date" value="${rst.date}" />
												<c:set var="time" value="${rst.time}" />
												<c:set var="branch" value="${rst.branch}" />
												<c:set var="type" value="${rst.fType}" />
												<c:set var="amount" value="${rst.amount}" />
												<c:set var="status" value="${rst.status}" />

												<c:if test="${rst.status != 'Incomplete'}">
													<tr>

														<td>${id}</td>

														<td>${date}</td>

														<td>${time}</td>

														<td>${branch}</td>

														<td>${type}</td>

														<td>${amount}</td>

														<td>${status}</td>

													</tr>
												</c:if>
											</c:forEach>


										</tbody>
									</table>

								</div>
							</div>



						</div>
					</td>
				</tr>
			</table>

		</div>
	</div>



	<script>
		window.onload = function() {

			//For approve success
			<c:if test="${approvesuccess == 'true'}">
			swal({
				title : "Request Approved!",
				text : "Thre request has been approved successfully!",
				icon : "success",
				button : "Ok",
			});
			</c:if>

			<c:if test="${approvesuccess == 'false'}">
			swal({
				title : "Approve Failed!",
				text : "Can't approve the reqiest at the moment!",
				icon : "error",
				button : "Ok",
			});
			</c:if>

			//Edit button
			var button = document.getElementById('edit_btn'); // Assumes element with id='button'

			button.onclick = function() {

				var div = document.getElementsByClassName('hidden');

				for (var i = 0; i < div.length; i++) {

					if (div[i].style.display !== 'none') {
						div[i].style.display = 'none';
					} else {
						div[i].style.display = 'block';
					}
				}

				button.classList.toggle("btn-danger");
				if (button.innerHTML != 'Cancel') {
					button.innerHTML = 'Cancel';
				} else {
					button.innerHTML = 'Edit';
				}

			}

		}

		function openNav() {
			document.getElementById("myNav").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("myNav").style.width = "0%";
		}
	</script>
</body>

</html>
