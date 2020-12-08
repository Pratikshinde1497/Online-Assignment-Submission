<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
</head>
<body>
	<%
			/*  if(session.getAttribute("log")==null){
				response.sendRedirect("index.html");}
				 */
				 out.println("WelCome : "+session.getAttribute("log"));
				
			%>
<ul>
<li><a href="Ad_Stud.jsp">View All Students</a>

<li><a href="Ad_Tea.jsp">View All Teachers</a>
<li><a href="Question.jsp">View All Teachers Posts</a>
<li><a href="Answer.jsp">View All Students Posts</a>
<li><a href="logout">LogOut</a>
</ul>			

</body>
</html>