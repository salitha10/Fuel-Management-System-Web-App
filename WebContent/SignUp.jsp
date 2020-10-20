<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Sign Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

<!-- STYLE CSS -->
<link rel="stylesheet" href="CSS/signup.css">
</head>

<body>

	<c:choose>

		<c:when test='${signupsuccess == "true" }'>
			<script>
				alert("Sign up Success!")
			</script>
		</c:when>

		<c:when test='${signupsuccess == "false" }'>
			<script>
				alert("Sign up failed!")
			</script>
		</c:when>

	</c:choose>


	<div class="wrapper">
		<div class="inner">
			<form action="signup" method="post">
				<h3>Registration Form</h3>
				<div class="form-group">
					<div class="form-wrapper">
						<label for="">First Name</label> <input type="text"
							class="form-control" name="fname" required>
					</div>
					<div class="form-wrapper">
						<label for="">Last Name</label> <input type="text"
							class="form-control" name="lname">
					</div>
				</div>
				<div class="form-wrapper">
					<label for="">Email</label> <input type="email" class="form-control"
						name="email" required>
				</div>
				<div class="form-wrapper">
					<label for="">Phone number</label> <input type="tel"
						class="form-control" name="phone" pattern="[0-9]{10}" required>
				</div>
				<div class="form-wrapper">
					<label for="">Password</label> <input type="password"
						class="form-control" name="pass" required>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox" required> I accept the Terms
						of Use & Privacy Policy. <span class="checkmark"></span>
					</label>
				</div>
				<button>Sign Up</button>
			</form>
		</div>
	</div>

</body>

</html>
