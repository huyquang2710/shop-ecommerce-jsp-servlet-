<%@page import="com.shop.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="components/common_css_js.jsp" %>

</head>
<body>
	<h1>
		<%
		out.println(FactoryProvider.getFactory());
		%>
	</h1>
</body>
</html>