<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Waiting List</title>
</head>
<%@ page import ="java.sql.*" %> 

We are sorry but the flight you are trying to book is currently full.
 You have been added to a waiting list for this flight and will be notified as soon a seat is available.
 
 <% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();

	String id = (String) session.getAttribute("user");
	String airlineid = request.getParameter("airlineid");
	String planeid = request.getParameter("planeid");
	String depdate = request.getParameter("dep_date"); 
	
	 int x = stmt.executeUpdate("insert into waitinglist (id, airline, planeid, dep_date) value ('" +id +
			 "','" +airlineid+ "' ,'" +planeid+ "' ,'" +depdate+ "')");

%>
<p style="float: right;"><a href="CReservation.jsp">View All Reservations</a></p>
 	<br>
    
	<form action="CLogout.jsp">
		<input type="submit" value="Logout">
	</form>
</html>
	
 