<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question Files</title>
</head>
<body>
<%
if(session.getAttribute("log")==null){
	response.sendRedirect("index.html");
} 
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
	java.sql.Statement st=con.createStatement();
//	out.println("Connected ");
	ResultSet rs=st.executeQuery("select * from question;");	
%>
<h1><center>All Teacher Uploaded Assignments Are Here!</center></h1><br><br>

<center>
<table border="1">
<tr>
		
		<th>Teacher User Name</th>
		<th>Assignment Name</th>
		<th>Assignment Path</th>
		<th>Marks</th>
		<th>Course</th>
		<th>Days</th>
		<th>Open/Download</th>
	</tr>
	
<%
	while(rs.next())
	{

%>

<tr>
<td>	<%= rs.getString(1) %>	</td>
<td>	<%= rs.getString(2) %>	</td>
<td>	<%= rs.getString(3) %>	</td>
<td>	<%= rs.getString(4) %>	</td>
<td>	<%= rs.getString(5) %>	</td>
<td>	<%= rs.getString(6) %>	</td>
<td>	<a href="<%= rs.getString(3) %>">Download</a>	</td>

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