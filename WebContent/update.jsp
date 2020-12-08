<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
</head>
<body>
<%
		//String id=request.getParameter("id");
	//	String table=session.getAttribute("table").toString();

		try{

			int  id=Integer.parseInt(request.getParameter("id"));
	String name=request.getParameter("name");
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String email=request.getParameter("email");
	String dept=request.getParameter("dept");
	String pass=request.getParameter("pass");
	
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
			java.sql.Statement st=con.createStatement();
			String sql="UPDATE teacher SET fname = '"+fname+"' , lname = '"+lname+"' , email = '"+email+"' , dept = '"+dept+"' , uname = '"+name+"' , pass = '"+pass+"' WHERE id = "+id;
			int  rs=st.executeUpdate(sql);
			if(rs==1)
				out.println("updated id "+id);
			else
				out.println(" Not updated id "+id);
			
		}catch(Exception e)
		{
			
		}

%>
<ul>
<li><a href="Ad_Tea.jsp">View All Teachers</a>
<li><a href="update.jsp">Update</a>
<li><a href="delete.jsp">Delete</a>
</ul>

<form action="update.jsp" method="post">
<center>
<table>
<tr>
<td>Enter  Teacher Id:</td><td><input name="id" placeholder="Teacher Id"></td>
</tr>
<tr>
<td>Enter  UserName:</td><td><input name="name" placeholder="UserName"></td>
</tr><tr>
<td>Enter  FirstName: </td><td><input name="fname" placeholder="Firstname"></td>
</tr><tr>
<td>Enter  LastName: </td><td><input name="lname" placeholder="lastname"></td>
</tr><tr>
<td>Enter  Email:</td><td><input name="email" placeholder="Email"></td>
</tr><tr>
<td>Enter  Department:</td><td><input name="dept" placeholder="Dept"></td>
</tr><tr>
<td>Enter PassWord:</td><td> <input type="password" name="pass" placeholder="Password"></td></tr><tr>
<td>Confirm PassWord:</td><td><input type="password" name="pass1" placeholder="Confirm pass"></td></tr>
<tr>
<td><input type="submit" value="Submit" ></td><td><input type="reset" value="Reset" ></td></tr>
</table></center>
</form>
</body>
</html>