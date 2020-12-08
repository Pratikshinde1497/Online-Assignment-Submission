import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.print.DocFlavor.STRING;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.sun.org.apache.regexp.internal.recompile;

@WebServlet("/FileUpload")
@MultipartConfig(maxFileSize=1024*1024*10)

public class FileUpload extends HttpServlet {

		String fileName;
	private static final String SAVE_DIR="images";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String savepath="C:/Users/l/workspace/Abc/WebContent"+File.separator+SAVE_DIR;
		File fileSaveDir=new File(savepath);
		
			String name=request.getParameter("name");
			Part part=request.getPart("path");
			String mark=request.getParameter("mark");
			String day=request.getParameter("day");
			
			fileName=extractFileName(part);
			part.write(savepath+File.separator+fileName);
			
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
				java.sql.PreparedStatement pst;
				
				pst= con.prepareStatement("insert into t_post values(?,?,?,?)");
				
				pst.setString(1, name);
				String filePath=savepath+File.separator+fileName;
				pst.setString(2, filePath);
				pst.setString(3, mark);
				pst.setString(4,day);
				
			int a=pst.executeUpdate();
			if (a==1) {
				out.println("<h1>Insertion Complete</h1>");
			}
		
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
	
	}

	private String extractFileName(Part part) {
		String contentDisp=part.getHeader("content-disposition");
		String[] items=contentDisp.split(";");
		for (	String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=")+2,s.length()-1);
				
			}			
		}
		return "";
	}

}
