<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Log </title>
</head>
<body>
<%@ page import ="java.sql.*" %>

<% 
ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet result;
    
    result = stmt.executeQuery("SELECT * FROM flights");
    
    while(result.next()){
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
    	out.println(result.getString(12));
    	out.println(result.getString(13));
    	out.println(result.getString(14));
    	out.println(result.getString(15));
    	out.println(result.getString(16));
    	%>
    	<br>
    <%}
    %>
    <br>
    <form action="CLoginPass.jsp">
		<input type="submit" value="Return to Home Page">
	</form>
	<form action="CLogout.jsp">
		<input type="submit" value="Logout">
	</form>
	<br>
    </body>
    </html>