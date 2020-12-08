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
		//String roll=request.getParameter("roll");
	//	String table=session.getAttribute("table").toString();

		try{
			int  roll=Integer.parseInt(request.getParameter("roll"));
			String name=request.getParameter("name");
			String fname=request.getParameter("fname");
			String lname=request.getParameter("lname");
			String email=request.getParameter("email");
			String clas=request.getParameter("class");
			String pass=request.getParameter("pass");

	
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
			java.sql.Statement st=con.createStatement();
			String sql="UPDATE student SET fname = '"+fname+"' , lname = '"+lname+"' , email = '"+email+"' , class = '"+clas+"' , uname = '"+name+"' , pass = '"+pass+"' WHERE id = "+roll;
			int  rs=st.executeUpdate(sql);
			if(rs==1)
				out.println("updated roll "+roll);
			else
				out.println(" Not updated roll "+roll);
			
		}catch(Exception e)
		{
			
		}

%>
<center><h1>All Entries Are Neccesary!</h1></center>
<form action="update_st.jsp" method="post">
<center><table>
<tr>
<td>Enter  Roll No.:</td><td><input name="roll" placeholder="roll no"></td>
</tr>
<tr>
<td>Enter  UserName:</td><td><input name="name" placeholder="Username"></td>
</tr><tr>
<td>Enter  FirstName: </td><td><input name="fname" placeholder="Firstname"></td>
</tr><tr>
<td>Enter  LastName: </td><td><input name="lname" placeholder="Lastname"></td>
</tr><tr>
<td>Enter  Email:</td><td><input name="email" placeholder="Email"></td>
</tr><tr>
<td>Enter  Class:</td><td><input name="class" placeholder="class"></td>
</tr><tr>
<td>Enter PassWord:</td><td> <input type="password" name="pass" placeholder="password"></td></tr><tr>
<td>Confirm PassWord:</td><td><input type="password" name="pass1" placeholder="Confirm pass"></td></tr>
<tr>
<td><input type="submit" value="Submit" ></td><td><input type="reset" value="Reset" ></td></tr>
</table></center>
</form>
</body>
</html>