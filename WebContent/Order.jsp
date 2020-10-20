<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="">

<head>
<meta charset="utf-8">
<title>Order</title>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

	<!-- Modal HTML -->
	<div id="myModal" class="modal model-md fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100">Place Order</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">

					<form class="form-horizontal" action="order" method="get">
						<div class="form-group">
							<label class="control-label col-sm-2" for="petrol">Petrol:</label>
							<div class="col-sm">
								<input type="number" min="0" step="1" oninput="validity.valid||(value='');" class="form-control"
									placeholder="Enter Petrol Amount" name="petrol" required>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2" for="diesel">Diesel:</label>
							<div class="col-sm">

								<input type="number" min="0" step="1" oninput="validity.valid||(value='');" class="form-control"
									placeholder="Enter Diesel Amount" name="diesel" required>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2" for="kerosine">Kerosine:</label>
							<div class="col-sm">
								<input type="number" min="0" step="1" oninput="validity.valid||(value='');" class="form-control"
									placeholder="Enter Kerosine Amount" name="kerosine" required>
							</div>
						</div>

						<div class="form-group" data-target="#myModal">
							<div class="col-sm">
								<input type="submit" class="btn btn-primary btn-block btn-md"
									value="Confirm order">
							</div>
						</div>
					</form>

				</div>
				<div class="modal-footer text-center">
					<a href="#" data-dismiss="modal" class="w-100">Cancel</a>
				</div>
			</div>
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
								</div></a> <a href="GetRequestsServlet"><div class="menu">
									<i class="fas fa-table"></i>Requests
								</div></a> <a href="GetOrdersServlet"><div class="menu active">
									<i class="fas fa-shopping-cart"></i>Order
								</div></a> <a href="#"><div class="menu">
									<i class="fas fa-question-circle"></i>Help
								</div></a>

						</div>

					</td>

					<td class="tdcontent" style="width: 85%; padding: 20px;">
						<div class="equal" style="margin-top: 100px";">

							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#myModal">Place Order</button>

							<div class="card mb-4" style="margin-top: 50px">
								<div class="card-header">
									<div class="row">
										<div class="col-lg-8 col-7 align-self-center">
											<h5>Fuel Usage</h5>
										</div>
										<div class="col-lg-4 col-5  align-self-center">
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
												<th>Date & Time</th>
												<th>Petrol</th>
												<th>Diesel</th>
												<th>Kerosine</th>

												<th class="hidden" style="display: none;">Edit</th>
											</tr>
										</thead>

										<tbody>

											<c:forEach var="order" items="${ords}">

												<c:set var="id" value="${order.id}" />
												<c:set var="dt" value="${order.dt}" />
												<c:set var="petrol" value="${order.petrol}" />
												<c:set var="diesel" value="${order.diesel}" />
												<c:set var="kerosine" value="${order.kerosine}" />


												<tr>

													<td>${id}</td>


													<td>${dt}</td>


													<td>${petrol}</td>


													<td>${diesel}</td>


													<td>${kerosine}</td>



													<td class="hidden" style="display: none;"><a
														href="#" id=${id} class="delete"><i class="fa fa-trash"></i></a></td>
												</tr>
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
	
	//For edit button
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
			
			//For order success
			<c:if test="${ordersuccess == 'true'}">
			swal({
				  title: "Order Success!",
				  text: "Your order has been placed!",
				  icon: "success",
				  button: "Ok",
				});
			</c:if>
			
			<c:if test="${ordersuccess == 'false'}">
			swal({
				  title: "Order Failed!",
				  text: "Can't place your oder at the moment!",
				  icon: "error",
				  button: "Ok",
				});
			</c:if>
			
			//For delete success
			<c:if test="${deletedorder == 'true'}">
			swal({
				  title: "Record Deleted!",
				  text: "The record has been deletd successfully!",
				  icon: "success",
				  button: "Ok",
				});
			</c:if>
			
			<c:if test="${deletedorder == 'false'}">
			swal({
				  title: "Delete failed!",
				  text: "The record can't be deleted!",
				  icon: "error",
				  button: "Ok",
				});
			</c:if>
		}

	
	//Update order
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
				   
					  window.location = "DeleteOrderServlet?id="+id;
				  } 
				});
		    
		});
	
	
		function openNav() {
			document.getElementById("myNav").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("myNav").style.width = "0%";
		}
	</script>

</body>

</html>
