

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class log_in extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String pass=request.getParameter("pass");
		String choose=request.getParameter("choose");
		
		if(choose.equals("admin"))
		{
			if(choose.equals("admin") && choose.equals("admin"))
			{
				HttpSession session=request.getSession();
				session.setAttribute("log", name);
				RequestDispatcher rd=request.getRequestDispatcher("/Admin.jsp");
				rd.forward(request, response);
			}
		}
		else{
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/oass1","root","");
			java.sql.Statement st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select  uname, pass from "+choose+" where uname = '"+name+"' and pass = '"+pass+"';");	

		
			while(rs.next())
			{
				if(rs.getString(1).equals(name) && rs.getString(2).equals(pass))
				{
					out.println("Success Ful");

					HttpSession session=request.getSession();
					session.setAttribute("log", name);
					session.setAttribute("type", choose);
				
					RequestDispatcher rd=request.getRequestDispatcher("/welcome");
					rd.forward(request, response);
				
				}
				else
				{
					out.println("Sorry, try again");
					RequestDispatcher rd=request.getRequestDispatcher("/register.html");
					rd.include(request, response);
				}
				
			}
			rs.close();
			con.close();
		}
			catch(Exception ex)
			{
				System.out.println(ex);
			}
		}
	}

}
