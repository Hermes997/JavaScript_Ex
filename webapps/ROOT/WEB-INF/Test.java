import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

//서블릿 클래스 
public class Test extends HttpServlet{

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		OutputStream os = response.getOutputStream(); //출력스트림을 받는다.
		PrintStream out = new PrintStream(os,true); // 출력 스트림을 조작하는 객체를 생성 (true : 스트림의 버퍼가 가득 차지 않아도 출력) 
		out.println("Hello Servlet"); // 문자열 브라우저로 출력
		
	}
}