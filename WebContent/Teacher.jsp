
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload</title>
</head>
<body>

<%
			 if(session.getAttribute("log")==null){
				response.sendRedirect("index.html");
				out.println("WelCome : "+session.getAttribute("log"));
				
			}%>

<ul>
<li><a href="Answer.jsp">View All Answer Files</a>
<li><a href="logout">LogOut</a>
</ul>
	<center><h1>File Upload</h1></center>
	<center><form method="post" action="teacher1.jsp" enctype="multipart/form-data" >
	<table >
	<tr>
<td>Enter Name:</td><td>		<input name="name1"></td></tr>
<tr>
<td>
Browse:	</td>	<td>	<input name="file" type="file"></td></tr>
<tr>
<td>
Marks:</td><td>				<input name="mark" size="10"></td></tr>
<tr><td>
Deadline After:</td>	<td><input name="day" size="10">&nbsp Days</td></tr>
<tr>
<td>
<input type="Submit" value="Send"></td></tr>

</table>
</form></center>
</body>
</html>