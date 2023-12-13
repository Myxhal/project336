<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New Account Created</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
	String id = request.getParameter("ID");   //THIS PAGE IS FOR AFTER YOU CREATE A NEW ACCOUNT
	String pw = request.getParameter("Password");

	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
    ResultSet result;

    result = stmt.executeQuery("select * from customer where id='" + id + "'");
    if (result.next()) {
    	out.println("User ID exists, please <a href='CreateCAccount.jsp'>try again</a>");
    } else {
    	int x = stmt.executeUpdate("insert into customer (id, password) values('" +id+ "', '" +pw+ "')");
	session.setAttribute("user", id);
    response.sendRedirect("ALoginPass.jsp");

}
%>
<body>

</body>
</html>