<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String dept=request.getParameter("dept");
String pass=request.getParameter("pass");

try{
	int  id=Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
	java.sql.Statement st=con.createStatement();
	int rs=st.executeUpdate("INSERT INTO teacher values("+id+",'"+fname+"','"+lname+"','"+email+"','"+dept+"','"+name+"','"+pass+"')");		
	
	if(rs==1)
		response.sendRedirect("login.html");
	else
		response.sendRedirect("tea_form.html");
	}
	catch(Exception ex)
	{	}
%>
</body>
</html>