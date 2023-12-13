<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Confirmation</title>
</head>
<body>
<%@ page import ="java.sql.*" %>

Thank you for booking your flight!
 	<p style="float: left;"><a href="CReservation.jsp">View All Reservations</a></p>
 	<br>
 	<br>
 	<br>
 	<form action="CLoginPass.jsp">
		<input type="submit" value="Return to Home Page">
	</form>
 	<br>
 	<form action="CLogout.jsp">
		<input type="submit" value="Logout">
	</form>
	<br>
 	
<% 	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
   
	int y = 0;
    String buttonClicked = request.getParameter("button_clicked");
    
    String cid = (String) session.getAttribute("user");
	String airline = request.getParameter("airline");
   	String planeid = request.getParameter("planeid");
   	
   	String depairport = request.getParameter("dep_airport");
	String depdate = request.getParameter("dep_date");
	String deptime = request.getParameter("dep_time");
	String arrairport = request.getParameter("arr_air");
	String tid = (planeid + cid);
	
	int econcost = Integer.parseInt(request.getParameter("eprice"));
	int buscost = Integer.parseInt(request.getParameter("bprice"));
	int firstcost = Integer.parseInt(request.getParameter("fprice"));
	
	if("Book for Economy Class".equals(buttonClicked)){
		 ResultSet result = stmt.executeQuery("select current_timestamp");
		
		 result.next();
		 String current = result.getString("current_timestamp");
		 String cl = "Economy Class";
		 String total = Integer.toString (econcost + 150);
		 
		 int x = stmt.executeUpdate("insert into ticket (tid, cid, airline, planeid, dep_airport, dep_date, dep_time, arr_airport, purchase_date, class, fare) values ('" +tid + "','" +cid +"','" +airline+ "' ,'" +planeid+ "' ,'" +depairport+ "','" +depdate+ "','" +deptime+ "','" +arrairport+ "', '" +current+ "', '"+cl+"', '" +total+ "')");
		}
	else if("Book for Business Class".equals(buttonClicked)){
		ResultSet result = stmt.executeQuery("select current_timestamp");
		
		 result.next();
		 String current = result.getString("current_timestamp");
		 String cl = "Business Class";
		 String total = Integer.toString (buscost + 150);
		 
		 int x = stmt.executeUpdate("insert into ticket (tid, cid, airline, planeid, dep_airport, dep_date, dep_time, arr_airport, purchase_date, class, fare) values ('" +tid + "','" +cid +"','" +airline+ "' ,'" +planeid+ "' ,'" +depairport+ "','" +depdate+ "','" +deptime+ "','"  +arrairport+ "', '" +current+ "', '"+cl+"', '" +total+ "')");
		 }
	else if("Book for First Class".equals(buttonClicked)){
		 ResultSet result = stmt.executeQuery("select current_timestamp");
		
		 result.next();
		 String current = result.getString("current_timestamp");
		 String cl = "First Class";
		 String total = Integer.toString (firstcost + 150);
		 
		 int x = stmt.executeUpdate("insert into ticket (tid, cid, airline, planeid, dep_airport, dep_date, dep_time, arr_airport, purchase_date, class, fare) values ('" +tid + "','" +cid +"','" +airline+ "' ,'" +planeid+ "' ,'" +depairport+ "','" +depdate+ "','" +deptime+ "','" +arrairport+ "', '" +current+ "', '"+cl+"', '" +total+ "')");
		 out.println(total);
		 out.println(cid);
		 out.println(tid);
	}%>
	
	<br>
	<% 
	 out.println("Your Ticket Information");%>
	 <br>
	 <% 
	 ResultSet showTicket;
	 showTicket = stmt.executeQuery("SELECT * FROM ticket WHERE tid= '" +tid+ "'");
	 
	 while(showTicket.next()){
		 out.println(showTicket.getString(1));
		    out.println(showTicket.getString(2));
			out.println(showTicket.getString(3));
			out.println(showTicket.getString(4));
			out.println(showTicket.getString(5));
			out.println(showTicket.getString(6));
			out.println(showTicket.getString(7));
			out.println(showTicket.getString(8));
			out.println(showTicket.getString(9)); 
			out.println(showTicket.getString(10));
			out.println(showTicket.getString(11));
	 }
	
%>
	


</body>
</html>