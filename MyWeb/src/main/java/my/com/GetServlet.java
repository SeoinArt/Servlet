package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * web.xml에 서블릿 등록 대신 annotation을 이용해 등록한다
 * @WebServlet("/url패턴") [주의] url패턴은 unique힌 이름이어야 한다.
 */
@WebServlet("/GetTest")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// get 방식의 요청을 처리하기 위해서는 doGet()을 재정의 한다.
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<h1>GetServlet</h1>");
		out.println("<h2>Get방식의 요청을 처리할때는 doGet()을 오버라이드 한다.</h2>");
		
		// 요청 데이터 받기
		// String getParameter("파라미터명");
		String name = req.getParameter("name");
		String userid = req.getParameter("userid");
		out.print("<h3> 이름 : "+name + "</h3>");
		out.print("<h3> 아이디 : "+userid + "</h3>");
		
		
		
		out.close();
	}

}
