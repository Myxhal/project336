<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Reservations</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<% 
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet result;
    
    String id = (String) session.getAttribute("user");
    
    result = stmt.executeQuery("select * from ticket where cid= '"+id+"'"); 

    while(result.next()){
    	String tid = result.getString(1);
    	String seatclass = result.getString(10);
    	String airlineid = result.getString(3);
    	String planeid = result.getString(4);
    	String depdate = result.getString(6);
    	
    	out.println(result.getString(1));
	    out.println(result.getString(2));
		out.println(result.getString(3));
		out.println(result.getString(4));
		out.println(result.getString(5));
		out.println(result.getString(6));
		out.println(result.getString(7));
		out.println(result.getString(8));
		out.println(result.getString(9)); 
		out.println(result.getString(10));
		out.println(result.getString(11));
		%>
		<br>
		<form action="CancelReservation.jsp">
	    	<input type="submit" name="button_clicked" value="Cancel Flight">
	    	<input type="hidden" name=class value="<%=seatclass%>">
	    	<input type="hidden" name=airline_id value="<%=airlineid%>">
	    	<input type="hidden" name=aircraft_id value="<%=planeid%>">
	    	<input type="hidden" name=dep_date value="<%=depdate%>">
	    	
    	</form>
    	<%} %>
		<form action="CLoginPass.jsp">
		<input type="submit" value="Return to Home Page">
	</form>
	<br>
		<form action="CLogout.jsp">
		<input type="submit" value="Logout">
	</form>
	
    


</body>
</html>
    