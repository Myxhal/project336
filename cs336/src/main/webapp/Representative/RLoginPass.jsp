<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Representative Landing Page</title>
</head>
Welcome back 
<body>
Welcome <%=session.getAttribute("user") %>
<br>***ONLY PICK ONE OPTION AT A TIME***<br>

<p style="float: right;"><a href="AllFlights.jsp">View All Flights</a></p>
<br>
<input type="text" name="dep-air" placeholder="Airport"> 





<p style="float: right;"><a href="ALogout.jsp">Log out</a></p>
<br>

<form action="UnansweredQs.jsp" method="POST">
	Look at all Questions From Our Users
	<br><input type="submit" value="Questions">
	
	
