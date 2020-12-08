<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload</title>
</head>
<body>
<%
/* 
			 if(session.getAttribute("log")==null){
				response.sendRedirect("index.html");

			out.println("WelCome : "+session.getAttribute("log"));}
			 */
			session.setAttribute("FileName", request.getParameter("name"));
			out.println("name of file is "+session.getAttribute("FileName"));
			%>

<form action="student1.jsp" method="post" enctype="multipart/form-data">


Browse File:<input type="file"/><br>

<input type="submit" value="Upload">

</form>

</body>
</html>