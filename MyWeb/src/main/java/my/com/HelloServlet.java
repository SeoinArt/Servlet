package my.com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

/* Servlet : Server Side Applet
 * [1] HttpServlet 클래스를 상속받아 구현한다 = > http 프로토콜에 특화된 서블렛
 * [2] doGet() 또는 doPost() 메서드를 오버라이드 한다.
 * [3] MyWeb/src/main/webapp
 * 						+---- WEB-INF
 * 								+----- web.xml(deployment descriptor)
 *	- web.xml에 서블릿 등록
 *	- 어노테이션(@WebServlet)을 기술해야한다.
 */



public class HelloServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// req : 사용자 요청과 관련된 정보를 다루는 객체
		// res : 브라우저와 연결되어 브라우저에 동적으로 html을 생성해서 쓸 수 있는 객체
		res.setContentType("text/html"); // 브라우저에 보여줄 문서형식(마임 타입, 컨텐트 타입)을 지정
		PrintWriter pw =res.getWriter();
		pw.println("<h1>Hello Servlet</h1>");
		// 브라우저에 html을 동적으로 만들어서 쓴다.
		
		pw.close();
		
	}
}
