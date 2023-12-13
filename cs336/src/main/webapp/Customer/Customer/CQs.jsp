<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Questions </title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<% 
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet result;
    
    
    result = stmt.executeQuery("select * from replies"); 

    while(result.next()){
    	String cid = result.getString(1);
    	String question = result.getString(2);
    	String rep = result.getString(3);
    	String replies = result.getString(4);
    	
	    out.println(cid);
	    out.println(question);
	    out.println(rep);
	    out.println(replies);
	    %>
	    <br>
	 <form action="CLoginPass.jsp">
		<input type="submit" value="Return to Home Page">
	</form>
	    
	
	    <form action="KW.jsp" method="POST">
       Search Through Answered Questions: <input type="text" name="KeyWord"/> <br/>
       <input type="submit" value="Search"/>
	    <br>    
	    
	    <form action="CLogout.jsp">
		<input type="submit" value="Logout">
	</form>
	<br>
	<%} %>
	
    


</body>
</html>
    
		