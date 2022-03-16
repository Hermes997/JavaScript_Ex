package DataJava;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet("/board")
public class SetServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		OutputStream os = response.getOutputStream();
		PrintStream out = new PrintStream(os,true);
		out.println("Hello Servlet");
		
	}
}
