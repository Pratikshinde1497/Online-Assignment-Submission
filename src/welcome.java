

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

/**
 * Servlet implementation class welcome
 */
public class welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public welcome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session=request.getSession();
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	out.println("welcome : "+session.getAttribute("log"));
	String type=session.getAttribute("type").toString();
	out.println("your Type is:"+type);
	if(type.equals("student"))
	{
		response.sendRedirect("Student.jsp");
	}
	else if(type.equals("teacher"))
	{
		response.sendRedirect("Teacher.jsp");
	}
	
	}

}
