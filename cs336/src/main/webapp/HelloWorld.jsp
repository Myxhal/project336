<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 	<title>Travel Login</title>
	</head>
	
	<body>

		Welcome. Please log in with your Travel Reservation Account <!-- the usual HTML way -->
		<% out.println(""); %> <!-- output the same thing, but using 
	                                      jsp programming -->
							  
	
	<br> <br>Login:
	<br>
		<form method="get" action="Customer/NewCLogin.jsp">
			<table>
				<tr>    
					<td>User ID</td><td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="Login">
		</form>
	<br>
	<h2>Faculty Login</h2>
	<a href = "Admin/ALogin.jsp"> <button>Admin</button></a>
	<a href = "Representative/RLogin.jsp"> <button>Representative</button></a>
	
</body>
</html>