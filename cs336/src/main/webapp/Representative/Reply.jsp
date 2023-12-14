<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reply to Questions</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet result;
    String sql= "";
    
    String repid = (String) session.getAttribute("user");
    String q = request.getParameter("question");
    String cid = request.getParameter("cid");
    
    
    result = stmt.executeQuery("SELECT * FROM questions WHERE question = '" +q+ "'");
    
    while(result.next()){
    	out.println(result.getString(1));
    	out.println(result.getString(2));
    }
    %>
    <form action="SubmitReply.jsp" >
    <input type="submit" name="submit_reply" value="Reply">
    <input type="text" name="rep" placeholder="Reply">
    <input type="hidden" name=question value="<%=q%>">
    <input type="hidden" name=cid value="<%=cid%>">
    </form>
    </body>
    </html>
    
    