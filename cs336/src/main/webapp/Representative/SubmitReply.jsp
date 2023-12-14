<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet result;
    String sql= "";
    
    String reply = request.getParameter("rep");
    String q = request.getParameter("question");
    String cid = request.getParameter("cid");
    String repid = (String) session.getAttribute("user");
    
    
    int x = stmt.executeUpdate("insert into replies(ID, question, repID, reply) values('" +cid+"', '"+q+"', '"+repid+"', '"+reply+"')");
    
    int y = stmt.executeUpdate("DELETE FROM questions WHERE question = '" +q+ "'");
    
    out.println("Reply has been added");
    %>
    <form action="RLoginPass.jsp">
    <input type="submit" name="gohome" value="Return to Home Page">
    </form>
    
    <form action="RLogin.jsp">
    <input type="submit" name="logout" value="Logout">
    </form>
    
    </body>
    </html>