<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Cancelation </title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<p style="float: left;"><a href="CReservation.jsp">View Reservations</a></p>

<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	
    String id = (String) session.getAttribute("user");
    String seatclass = request.getParameter("class");
    String tid = request.getParameter("tid");
	
	
	 if("Business Class".equals(seatclass) || "First Class".equals(seatclass)){
    	int x = stmt.executeUpdate("delete from ticket where tid= '"+id+"' ");
    	out.println("Flight has been cancelled. This cannot be undone");
	 }
	    else{
	    	out.println("This flight cannot be cancelled since it is not booked with Business or First Class.");
	    }
	 
	 %>
	 <br>
	 <br>
	 <br>
	 <form action="CLogout.jsp">
		<input type="submit" value="Logout">
	</form>
	<br>
	<form action="CLoginPass.jsp">
		<input type="submit" value="Return to Home Page">
	</form>

	</body>
	</html>
    			  