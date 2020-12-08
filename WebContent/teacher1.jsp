<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
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
			} 
out.println("WelCome : "+session.getAttribute("log"));
	

String name=request.getParameter("name1");
String mark=request.getParameter("mark");
String day=request.getParameter("day");

String savefile=new String();
	String contentType=request.getContentType();
	
	if(contentType!=null && (contentType.indexOf("multipart/form-data")>=0 ))
	{
		DataInputStream in=new DataInputStream(request.getInputStream());
		int formDataLength=request.getContentLength();
		byte[] dataBytes=new byte[formDataLength];
		int byteRead=0;
		int totalBytesRead=0;
		while(totalBytesRead<formDataLength)
		{
			byteRead=in.read(dataBytes, totalBytesRead, formDataLength);
			totalBytesRead +=byteRead;
		}
		String file=new String(dataBytes);
		
		savefile=file.substring(file.indexOf("filename=\"")+10);
		savefile=savefile.substring(0, file.indexOf("\n"));
		savefile=savefile.substring(savefile.lastIndexOf("\\")+1, savefile.indexOf("\""));
		
		String file1=savefile;
		
		int lastIndex=contentType.lastIndexOf("=");
		String boundy=contentType.substring(lastIndex+1,contentType.length());
		int pos;
		
		pos=file.indexOf("filename=\"");
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		
		int boundryLocation=file.indexOf(boundy,pos)-4;
		
		int startPos=((file.substring(0, pos)).getBytes()).length;
		int endPos=((file.substring(0, boundryLocation)).getBytes()).length;
		
		savefile="C:/uploadDir/Teacher/"+savefile;
		
		File ff=new File(savefile);
		
		try{
			
			FileOutputStream fileOut=new FileOutputStream(ff);
			fileOut.write(dataBytes, startPos, (endPos-startPos));
			fileOut.flush();
			fileOut.close();

			String course=new String("Comp. sci.");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
			java.sql.Statement st=con.createStatement();
			String sql="INSERT INTO Question values(' "+session.getAttribute("log")+" ' , ' "+file1+
					" ' , ' "+savefile+" ' , ' "+mark+" ' , ' "+course+" ' , ' "+day+" ' )";
			int rs=st.executeUpdate(sql);		
			
			if(rs==1)
				out.println("<h1 align=center>Upload SuccessFull</h1>");
			else
				out.println("Upload Failed");
			
			
			}catch(Exception ex)
		{
			out.println(ex);
		}
	}

%>

</body>
</html>