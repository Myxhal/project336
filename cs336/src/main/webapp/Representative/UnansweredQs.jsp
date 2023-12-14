<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Questions</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
Questions From Our Customers
<br>
<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet result;
    String sql= "";
    
    ResultSet questions;
    
    questions = stmt.executeQuery("SELECT * FROM questions");
    
    while(questions.next()){
    	String cid = questions.getString(1);
    	String q = questions.getString(2);
    	
    	out.println(cid);
    	out.println(q);
    	%>
    	<br>
  	
    	<form action="Reply.jsp">
    	<input type="submit" name="submit_reply" value="Reply">
    	<input type="hidden" name=question value="<%=q%>">
    	<input type="hidden" name=cid value="<%=cid%>">
    	</form>
    <% }%>
    </body>
    </html>