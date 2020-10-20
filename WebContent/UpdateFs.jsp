<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Simple Success Confirmation Popup</title>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<% 
	String id = request.getParameter("id");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String type = request.getParameter("type");
	String max = request.getParameter("max");
	String current = request.getParameter("current");
	
	%>

	<!-- Modal HTML -->

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h3 class="modal-title w-100" style="text-align:center color: blue">Enter Data to update</h3>
				</div>
				
				<form method="get" action="updatefs">
				<input type="hidden" name="id" value="<%= id  %>">
				<div class="modal-body">
						<div class="form-group">
							<label for="Date" class="col-form-label">Date:</label>
							<input type="date" name="date" class="form-control" id="Date" value="<%= date %>" required>
						</div>
						
						<div class="form-group">
							<label for="Time" class="col-form-label">Time:</label>
							<input type="time" name="time" class="form-control" id="Time"  value="<%= time %>" required>
						</div>
						
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Fuel Type:</label>
							<input type="text" name="type" class="form-control" id="Type"  value="<%= type %>" required>
						</div>
						
						<div class="form-group">
							<label for="Max" class="col-form-label">Max Capacity:</label>
							<input type="number" min="0" step="1" oninput="validity.valid||(value='');" name="max" class="form-control" id="Max"  value="<%= max %>" required>
						</div>
						
						<div class="Current">
							<label for="recipient-name" class="col-form-label">Current Amount:</label>
							<input type="number" min="0" step="1" oninput="validity.valid||(value='');" name="current" class="form-control" id="Current"  value= "<%= current %>" required>
						</div>
						
				</div>
				<div class="modal-footer">
					<a href="GetFuelStockServlet"><button type="button" class="btn btn-secondary">Close</button></a>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
				</form>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$('#myModal').modal({
			backdrop : 'static',
			keyboard : false
		});
		$(window).on('load', function() {
			$('#myModal').modal('show');
		});
	</script>

</body>
</html>