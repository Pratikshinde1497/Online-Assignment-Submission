<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teachers</title>
</head>
<body>


<%

try{
	session.setAttribute("table", new String("Teacher"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
	java.sql.Statement st=con.createStatement();
//	out.println("Connected ");
	ResultSet rs=st.executeQuery("select * from teacher;");	
%>
<h1 align="center">All Teachers Are Here!</h1><br><br>
<ul>
<li><a href="update.jsp">Update</a>
<li><a href="delete.jsp">Delete</a>
</ul>
<center>
<table border="1">
<tr>

		<th>Teacher Id</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Email</th>
		<th>Department</th>
		<th>User Name</th>
		<th>Password</th>
	</tr>

<%	while(rs.next())
	{

%>

<tr>
<td>	<%= rs.getString(1) %>	</td>
<td>	<%= rs.getString(2) %>	</td>
<td>	<%= rs.getString(3) %>	</td>
<td>	<%= rs.getString(4) %>	</td>
<td>	<%= rs.getString(5) %>	</td>
<td>	<%= rs.getString(6) %>	</td>
<td>	<%= rs.getString(7) %>	</td>

</tr>

<%

	}
	rs.close();
	con.close();
	
}
catch(Exception e)
{}
%>
</table>
</center>


</body>
</html>