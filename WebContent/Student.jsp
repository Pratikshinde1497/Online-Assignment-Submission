
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Assignments</title>


</head>
<body> <%
			 if(session.getAttribute("log")==null){
				response.sendRedirect("index.html");

			out.println("WelCome : "+session.getAttribute("log"));
			}%>
 
<h1 align="center">Upload Answer File!</h1>
<br>
<a href="Question.jsp">View Assignments</a>
<br>
<a href="logout">Log Out</a>
<br><br><br>

<form action="student11.jsp" method="post" enctype="multipart/form-data">
<table cellpadding="10" align="center"><tr>
<td>Assignment Name:	</td><td><input type="text" name="name"></td></tr>
<tr><td><input type="submit" value="next"></td></tr>
</table>
</form>
</body>
</html>