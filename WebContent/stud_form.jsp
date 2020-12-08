<%@page import="java.util.Random"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration</title>
</head>
<body>
<%	
int  roll=Integer.parseInt(request.getParameter("roll"));
String name=request.getParameter("name");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String clas=request.getParameter("class");
String pass=request.getParameter("pass");
String pass1=request.getParameter("pass1");
if(pass.equals(pass1))
{
try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
	java.sql.Statement st=con.createStatement();
	int rs=st.executeUpdate("INSERT INTO student values("+roll+",'"+fname+
			"','"+lname+"','"+email+"','"+clas+"','"+name+"','"+pass+"')");		
	
	if(rs==1)
		response.sendRedirect("index.html");
	else
		response.sendRedirect("stud_form.html");
	}
	catch(Exception ex)
	{	
		out.println("Database Problem");
	}
}
else
{
	out.println("Passwords Don't Match!");
	out.println("<a href='stud_form.html'>Back</a>");
}	
%>
</body>
</html>