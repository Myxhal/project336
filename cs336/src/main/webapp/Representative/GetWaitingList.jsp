<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<p style="float: right;"><a href="ALogout.jsp">Log out</a></p>

<%
    ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result;
	
	String user = request.getParameter("User");
	String dep_airport = request.getParameter("dep_airport");
	String dep_date = request.getParameter("dep_date");
	String airline = request.getParameter("airline");
	String plane = request.getParameter("planeid");
	String seatclass = request.getParameter("class");
	
	
	result = stmt.executeQuery("SELECT * FROM flights WHERE (dep_airport = '" +dep_airport+ "' and dep_date = '" +dep_date+ "' and airline = '"
			+airline+ "' and planeid = '" +plane+ "')");
	result.next();
		String dep_time = result.getString(6);
		String arr_airport = result.getString(7);
		String arr_date = result.getString(8);
		String arr_time = result.getString(9);
		int x = (int)Math.random() * 10;
		String z = Integer.toString(x);
		String tid = (plane + user + x);
		String eco = result.getString(12);
		String bus = result.getString(13);
		String first = result.getString(14);
	
	ResultSet time = stmt.executeQuery("SELECT current_timestamp");
	time.next();
	String current = time.getString("current_timestamp");
	
	if(seatclass.equals("First Class")){
		
			int fare = (Integer.parseInt(first) + 150);
			String total = Integer.toString(fare);
			
			int y = stmt.executeUpdate("INSERT INTO ticket(tid, cid, airline, planeID, dep_airport, dep_date, dep_time, arr_airport, purchase_date, class, fare)"
					+ "values ('" +tid+ "', '" +user+ "', '" +airline+ "', '" +plane+ "', '" +dep_airport+ "', '" +dep_date+ "', '" +dep_time+ "', "+arr_airport+ "', '" +current+ "', '" 
					+seatclass+ "', '" +total+ "')");
		}
	else if(seatclass.equals("Business Class")){
		int fare = (Integer.parseInt(bus) + 150);
		String total = Integer.toString(fare);
		
		int y = stmt.executeUpdate("INSERT INTO ticket(tid, cid, airline, planeID, dep_airport, dep_date, dep_time, arr_airport, purchase_date, class, fare) VALUES ('" 
				+tid+ "', '" +user+ "', '" +airline+ "', '" +plane+ "', '" +dep_airport+ "', '" +dep_date+ "', '" +dep_time+ "', '" +arr_airport+ "', '" +current+ "', '" 
				+seatclass+ "', '" +total+ "')");
	}
	else{
		int fare = (Integer.parseInt(eco) + 150);
		String total = Integer.toString(fare);
		
		int y = stmt.executeUpdate("INSERT INTO ticket(tid, cid, airline, planeID, dep_airport, dep_date, dep_time, arr_airport, purchase_date, class, fare) VALUES ('" 
				+tid+ "', '" +user+ "', '" +airline+ "', '" +plane+ "', '" +dep_airport+ "', '" +dep_date+ "', '" +dep_time+ "', '" +arr_airport+ "', '" +current+ "', '" 
				+seatclass+ "', '" +total+ "')");
	}
	out.println("The ticket has been reserved.");
	%>
	
	</body>
	<form action="RLoginPass.jsp">
	<input type="submit" value="Return to Home Page">
	</form>
	</html>	
		
