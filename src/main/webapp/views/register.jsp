<%@page import="com.shop.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Account</title>

<%@include file="../components/common_css_js.jsp" %>

</head>
<body>
	<%@include file="../components/navbar.jsp" %>
	
	<div class="row">
		<div class="col-md-4 offset-md-4" > 
			<div class="card">
				<div class="card-body px-5">
					<h3 class="text-center mmy-3" >Sign up here</h3>
					<form action="">
						<div class="form-group">
							<label for="name">Name</label> 
							<input type="text" class="form-control" id="name" name="name" placeholder="Name"> 
						</div>
						<div class="form-group">
							<label for="username">Username</label> 
							<input type="text" class="form-control" id="username" name="username" placeholder="Username"> 
						</div>
						<div class="form-group">
							<label for="phone">Phone</label> 
							<input type="number" class="form-control" id="phone" name="phone" placeholder="Phone"> 
						</div>
						<div class="form-group">
							<label for="name">Password</label> 
							<input type="password" class="form-control" id="password" name="password" placeholder="Password"> 
						</div>
						<div class="form-group">
							<label for="address">Address</label> 
							<textarea style="height: 200px" class="form-control" name="address" placeholder="Address"></textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success" >Register</button>
							<button class="btn btn-outline-warning" >Reset</button>
						</div>	
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>