<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Login</title>
</head>
<body>
			<%@ page import ="java.sql.*" %>
	<%

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM Customer where id = " + id;
			
    
    ResultSet result = stmt.executeQuery(str);
    if (result.next()){
    	 ResultSet result2;
    	    result2 = stmt.executeQuery("select * from customer where id='" + id + "' and password='" + pw + "'");
    	    if (result2.next()) {
    	    	session.setAttribute("user", id); // the username will be stored in the session
    	        response.sendRedirect("CLoginPass.jsp");
    	    }
    	    else{out.println("Invalid ID / Password. Return to the previous page to try again");
    	    }
    	    }
    	else{out.println("Invalid ID / Password. Return to the previous page to try again");
    	}
    	    		%>
    	   
		<br>
		<form method = "get" action = "CreateCAccount.jsp">
				<input type="submit" value = "Create New Account">
				</form>
</body>
</html>