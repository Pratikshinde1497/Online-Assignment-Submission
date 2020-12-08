<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete</title>
</head>
<body>
<%
		String id=request.getParameter("id");
		String table=session.getAttribute("table").toString();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
			java.sql.Statement st=con.createStatement();
			
			int  rs=st.executeUpdate("delete from "+table+" where id = "+id);
			if(rs==1)
				out.println("Deleted id "+id);
			else
				out.println(" Not Deleted id "+id);
		}
		catch(Exception e){}

%>
<ul>
<li><a href="Ad_Tea.jsp">View All Teachers</a>
<li><a href="update.jsp">Update</a>
<li><a href="delete.jsp">Delete</a>
</ul>

<form action="delete.jsp">
<table align="center">
<tr><td>Enter the Id</td><td><input name="id"></td></tr>
<tr>
<td><input type="submit" value="Delete"></td></tr>
</table>
</form>
</body>
</html>