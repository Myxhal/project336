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
	ResultSet rs1;

	String airlineid = request.getParameter("userid");

    rs1 = stmt.executeQuery("delete from customer where ID = '"+userid+"' ");
    out.println("Customer has been deleted. This cannot be undone");


    %>
	<br>
	<% %>

</body>
</html>
