package my.com;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostTest")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * post방식의 요청은 doPost()를 재정의한다.
	 */
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset = utf-8");
		PrintWriter out = res.getWriter();
		// post 방식일 때 한글 처리
		req.setCharacterEncoding("UTF-8");
		
		
		
		// 요청 데이터 받기
		String name =req.getParameter("name");
		String userid = req.getParameter("userid");
		out.println("<h1>Name : "+name+"</h1>");
		out.println("<h1>UserId : "+userid+"</h1>");
		
		out.close();
	}

}
