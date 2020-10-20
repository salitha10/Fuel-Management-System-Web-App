<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="">

<head>
<meta charset="utf-8">
<title>Reports</title>
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

<!-- Google fonts -->

<link href='https://fonts.googleapis.com/css?family=Aldrich'
	rel='stylesheet'>

</head>

<body>

	<!--  Forward to servlet -->
	<!--  jsp:include page="/getfs" / -->


	<!-- Hidden menu -->
	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<a href="#">Home</a> <a href="OverviewServlet">Overview</a> <a
				href="GetFuelStockServlet">Reports</a> <a href="GetRequestsServlet">Requests</a>
			<a href="GetOrdersServlet">Order</a> <a href="#">Help</a>
		</div>
	</div>


	<!-- Header  -->

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
								</div></a> <a href="GetFuelStockServlet"><div class="menu active">
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

					<!-- Content  -->

					<td style="width: 85%; padding: 20px;">
						<div class="equal" style="margin-top: 100px;">


							<!-- Card -->

							<div class="card mb-4">
								<div class="card-header">
									<div class="row">
										<div class="col-lg-8 col-7 align-self-center">
											<h5>Fuel Usage</h5>
										</div>
										<div class="col-lg-4 col-5  align-self-center">

											<button type="button" class="btn float-right"
												onclick="window.location.href='InsertFs.jsp'">
												<i class="fas fa-plus" style="margin-right: 20px;"></i>
											</button>

											<button type="button"
												class="btn btn-primary mr-3 float-right" id="edit_btn">Edit</button>
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
												<th>Type</th>
												<th>Max Capacity</th>
												<th>Current Amount</th>
												<th class="hidden" style="display: none;">Edit</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="fuel" items="${fsdetails}">

												<c:set var="id" value="${fuel.id}" />
												<c:set var="date" value="${fuel.date}" />
												<c:set var="time" value="${fuel.time}" />
												<c:set var="type" value="${fuel.type}" />
												<c:set var="max" value="${fuel.max}" />
												<c:set var="current" value="${fuel.current}" />
												<tr>

													<td>${id}</td>


													<td>${date}</td>


													<td>${time}</td>


													<td>${type}</td>


													<td>${max}</td>

													<td>${current}</td>

													<td class="hidden" style="display: none;">
														<!--  Parameters to pass to next page --> <c:url
															value="UpdateFs.jsp" var="fuelupdate">
															<c:param name="id" value="${id}" />
															<c:param name="date" value="${date}" />
															<c:param name="time" value="${time}" />
															<c:param name="type" value="${type}" />
															<c:param name="max" value="${max}" />
															<c:param name="current" value="${current}" />
														</c:url> <a href="#" id="${id}" class="delete"><i
															class="fa fa-trash"></i></a> <a href="${fuelupdate}"><i
															class="fas fa-pencil-alt"></i></a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</td>
				<tr>
			</table>
		</div>
	</div>


	<script>
		window.onload = function() {

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
		
		//Get link from clicked button
		$("a.delete").click(function(){
		    var id = this.id;
		    
		    swal({
				  title: "Are you sure?",
				  text: "Once deleted, you can't undone!",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				   
					  window.location = "DeleteFuelStockServlet?id="+id;
				  } 
				});
		    
		});
		
		
		//Alert messages
	<c:if test="${deleted == 'true'}">
		swal({
			  title: "Delete Success!",
			  text: "The record has been deleted!",
			  icon: "success",
			  button: "Ok",
			});
	</c:if>

	<c:if test="${deleted == 'false'}">
	swal({
		  title: "Delete Failed!",
		  text: "The record can't be deleted!",
		  icon: "error",
		  button: "Ok",
		});
	</c:if>

	<c:if test="${fsinsertsuccess == 'true'}">
	swal({
		  title: "Insert Success!",
		  text: "The record has been inserted!",
		  icon: "success",
		  button: "Ok",
		});

	</c:if>

	<c:if test="${fsinsertsuccess == 'false'}">
	swal({
		  title: "Insert Failed!",
		  text: "The record can't be inserted!",
		  icon: "error",
		  button: "Ok",
		});
	</c:if>

	<c:if test="${fsupdatesuccess == 'true'}">
	swal({
		  title: "Update Success!",
		  text: "The record has been updated",
		  icon: "success",
		  button: "Ok",
		});

	</c:if>

	<c:if test="${fsupdatesuccess == 'false'}">
	swal({
		  title: "Update Failed!",
		  text: "The record can't be updated!",
		  icon: "error",
		  button: "Ok",
		});
	</c:if>
		
		
	</script>
</body>

</html>

