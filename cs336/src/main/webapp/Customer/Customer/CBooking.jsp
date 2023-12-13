<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Booking</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
	If flight is full, click on the waitlist button to be added to the waiting queue.
	<br>
<%
    String dep_airport = request.getParameter("dep-air") + "";   
	String dep_date = request.getParameter("departing-date") + "";   
	String arr_airport = request.getParameter("arr-air") + "";
    String arr_date = request.getParameter("returning-date") + "";   
    String triptype = request.getParameter("triptype") + "";   
    String sort = request.getParameter("button1") + ""; 
    String f1 = request.getParameter("price") + "";   
    String f2 = request.getParameter("stops") + "";
    String f3 = request.getParameter("airline") + "";
    
    
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet result;
    String sql= "";
    
    result = stmt.executeQuery("select * from flights where (dep_airport= '" 
    + dep_airport + "' and arr_airport= '" 
   	+ arr_airport + "' and f_type= '" +triptype+"') or airline= '" +f3+"' or f_type= '" +triptype+"' or (bus_price= '"
   	+f1+ "' or first_price= '" +f1+ "' or eco_price= '" +f1+ "') ");
 
    	while(result.next()){
 		String fid = result.getString(1);
    	String airline = result.getString(2);
    	String planeid = result.getString(3);
    	
    	String depairport = result.getString(4);
    	String depdate = result.getString(5);
    	String deptime = result.getString(6);
    	String arrairport = result.getString(7);
    	
    	String econ$ = result.getString(12);
    	String bus$ = result.getString(13);
    	String first$ = result.getString(14);
    	int seats = Integer.parseInt(result.getString(14));
    	
    	out.println(fid); 
    	out.println(airline);
    	out.println(planeid);
    	out.println(depairport);
    	out.println(depdate);
    	out.println(deptime);
    	out.println(arrairport);
    	out.println(result.getString(8));
    	out.println(result.getString(9));
    	out.println(result.getString(10));
    	out.println(result.getString(11));
    	out.println(result.getString(12));
    	out.println(result.getString(13));
    	out.println(result.getString(14));
    	out.println(result.getString(15));
    	out.println(result.getString(16));
    	%>
    	<br>
    	<form action="CConfirm.jsp">
	    	<input type="submit" name="button_clicked" value="Book for Economy Class">
	    	<input type="submit" name="button_clicked" value="Book for Business Class">
	    	<input type="submit" name="button_clicked" value="Book for First Class">
	    	<input type="hidden" name=airline value="<%=airline%>">
	    	<input type="hidden" name=planeid value="<%=planeid%>">
	    	<input type="hidden" name=dep_airport value="<%=depairport%>">
	    	<input type="hidden" name=dep_date value="<%=depdate%>">
	    	<input type="hidden" name=dep_time value="<%=deptime%>">
	    	<input type="hidden" name=arr_air value="<%=arrairport%>">
	    	<input type="hidden" name=eprice value="<%=econ$%>">
	    	<input type="hidden" name=bprice value="<%=bus$%>">
	    	<input type="hidden" name=fprice value="<%=first$%>">
	    	<input type="hidden" name=avail value="<%=seats%>">
    	</form>
    	
    	<form action="CWaitingList.jsp">
	    	<input type="submit" name="button_clicked" value="Waiting Queue">
	    	<input type="hidden" name=airlineid value="<%=airline%>">
	    	<input type="hidden" name=planeid value="<%=planeid%>">
	    	<input type="hidden" name=dep_date value="<%=depdate%>">
    	</form>
    	
    	
    	<%} %>
 

</body>
</html>