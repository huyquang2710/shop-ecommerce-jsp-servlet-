<%@page import="com.shop.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<%@include file="../components/common_css_js.jsp" %>

</head>
<body>
	<%@include file="../components/navbar.jsp" %>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4" > 
				<div class="card">
					
					<%@include file="../components/message.jsp" %>
					
					<div class="card-body px-5">
						<h3 class="text-center mmy-3" >Sign ins here</h3>
						<form action="login" method="post">
							<div class="form-group">
								<label for="email">Email</label> 
								<input type="text" class="form-control" id="email" name="email" placeholder="Email"> 
							</div>
							<div class="form-group">
								<label for="name">Password</label> 
								<input type="password" class="form-control" id="password" name="password" placeholder="Password"> 
							</div>
							
							<a href="register" >Register here</a>
							
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success" >Login</button>
								<button class="btn btn-outline-warning" >Reset</button>
							</div>	
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>