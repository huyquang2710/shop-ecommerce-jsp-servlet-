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
	
	<div class="container admin">
		<!-- first row -->
		<div class="row mt-3">
				<!-- message -->
			  	<div class="container-fluid">
					<%@include file="/components/message.jsp" %>
				</div>
				
				
			<!-- users -->
			<div class="col-md-4" > 
				<div class="card">
					<div class="card text-center">
						<div class="container mt-2" >
							<img style="max-width: 125px" class="img-fluid rounded-circle" src="templates/img/profile.png" alt="users" >
						</div>
						<div class="card-body" >
							<h1 class="text-uppercase text-muted">Users</h1>
						</div>
					</div>
				</div>	
			</div>
			<!-- category -->
			<div class="col-md-4" > 
				<div class="card">
					<div class="card text-center">
						<div class="container mt-2" >
							<img style="max-width: 125px" class="img-fluid rounded-circle" src="templates/img/list.png" alt="categories" >
					</div>
						<div class="card-body" >
							<h1 class="text-uppercase text-muted">Categories</h1>
						</div>
					</div>
				</div>
			</div>
			<!-- product -->
			<div class="col-md-4" > 
				<div class="card">
					<div class="card text-center">
					<div class="container mt-2" >
						<img style="max-width: 125px" class="img-fluid rounded-circle" src="templates/img/delivery-box.png" alt="product" >
					</div>
					<div class="card-body" >
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- add category -->
		<div class="row mt-3">
			<div class="col-md-6" >
				<div class="card" data-toggle="modal" data-target="#add-category-modal">
					<div class="card text-center">
					<div class="container mt-2" >
						<img style="max-width: 125px" class="img-fluid rounded-circle" src="templates/img/calculator.png" alt="product" >
					</div>
					<div class="card-body" >
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>	
				</div>
			</div>
			
			<!-- add product -->
			<div class="col-md-6" >
				<div class="card" >
					<div class="card text-center">
					<div class="container mt-2" >
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
	
	<!-- add category model  -->
		<!-- Modal -->
		<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-while">
		        <h5 class="modal-title" id="exampleModalLabel">Add category</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       
				<form action="add-category" method="post">
					
					<input type="hidden" name="operation" value="addcategory" >
				
					<div class="form-group">
						<label for="title">Title</label> 
						<input type="text" class="form-control" id="title" name="title" placeholder="Title"> 
					</div>	
					<div class="form-group">
						<textarea style="height: 200px;" class="form-control" placeholder="Description" name="description"></textarea>
					</div>	
					<div class="container" > 
						<button type="submit" class="btn btn-success">Save</button>
						<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
					</div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
			
	<!-- end category model -->
</body>
</html>