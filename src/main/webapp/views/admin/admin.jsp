<%@page import="com.shop.constants.SessionAttr"%>
<%@page import="com.shop.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	User user = (User) session.getAttribute(SessionAttr.CURRENT_USER);
	if(user == null) {
		session.setAttribute("message", "You are not logged in !! Login first");
		response.sendRedirect("login");
	} else {
		if(user.getType().equals(SessionAttr.ROLE_USER)) {
			session.setAttribute("message", "You are not admin !! Do not access this page");
			response.sendRedirect("login");
			return;
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/components/common_css_js.jsp" %>

</head>
<body>
<%@include file="/components/navbar.jsp" %>
	<%@include file="/components/message.jsp" %>
	<div class="container">
		<!-- first row -->
		<div class="row mt-3">
				
			
			<!-- first box -->
			<div class="col-md-4" > 
				<div class="card text-center">
					<div class="container" >
						<img style="max-width: 125px" class="img-fluid rounded-circle" src="templates/img/profile.png" alt="users" >
					</div>
					<div class="card-body" >
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			<!-- second box -->
			<div class="col-md-4" > 
				<div class="card text-center">
					<div class="container" >
						<img style="max-width: 125px" class="img-fluid rounded-circle" src="templates/img/list.png" alt="categories" >
					</div>
					<div class="card-body" >
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<!-- first box -->
			<div class="col-md-4" > 
				<div class="card text-center">
					<div class="container" >
						<img style="max-width: 125px" class="img-fluid rounded-circle" src="templates/img/delivery-box.png" alt="product" >
					</div>
					<div class="card-body" >
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>
		
		<!-- second row -->
		<div class="row mt-3">
			<div class="col-md-6" >
				<div class="card" >
					<div class="card text-center">
					<div class="container" >
						<img style="max-width: 125px" class="img-fluid rounded-circle" src="templates/img/calculator.png" alt="product" >
					</div>
					<div class="card-body" >
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>	
				</div>
			</div>
			<div class="col-md-6" >
				<div class="card" >
					<div class="card text-center">
					<div class="container" >
						<img style="max-width: 125px" class="img-fluid rounded-circle" src="templates/img/plus.png" alt="product" >
					</div>
					<div class="card-body" >
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>	
				</div>
			</div>
		</div>
	</div>
</body>
</html>