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
Results:
<br>

<% String keyword = request.getParameter("KeyWord");

ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet result;
     
    result = stmt.executeQuery("SELECT * FROM replies where question LIKE '%"+keyword+"%'");
    
     while(result.next()){
     out.println(result.getString(1));
     out.println(result.getString(2));
     out.println(result.getString(3));
     out.println(result.getString(4));
     
     %>
     <br>
	<%} %>
	<form action="CLoginPass.jsp">
		<input type="submit" value="Return to Home Page">
	</form>
	<form action="CLogout.jsp">
		<input type="submit" value="Logout">
	</form>
	<br>
	</body>
	</html>