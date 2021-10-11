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
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4" > 
				<div class="card">
					
					<%@include file="/components/message.jsp" %>
					

				</div>
			</div>
		</div>
	</div>
</body>
</html>