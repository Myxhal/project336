<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reservations By Flight or Customer Name</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<p style="float: right;"><a href="ALogout.jsp">Log out</a></p>
<%
    ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs1;

String custID = request.getParameter("customerID");

rs1 = stmt.executeQuery("select * from ticket where cid = '"+custID+"');

while(rs1.next()){
			out.println(rs1.getString(1));
		 	out.println(rs1.getString(2));
			out.println(rs1.getString(3));
			out.println(rs1.getString(4));
			out.println(rs1.getString(5));
			out.println(rs1.getString(6));
			out.println(rs1.getString(7));
			out.println(rs1.getString(8));
			out.println(rs1.getString(9));
			out.println(rs1.getString(10));
	%>
	<br>
	<%} %>
</body>
</html>