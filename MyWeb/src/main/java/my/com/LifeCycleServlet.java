package my.com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;


@WebServlet("/LifeCycle")
public class LifeCycleServlet extends HttpServlet {

	public LifeCycleServlet() {
		super();
		System.out.println("LifeCycleServlet() 생성자 ...");
	}
	
	@Override
	public void init() throws ServletException{
		super.init();
		System.out.println("init() 호출됨...");
	}
	
	@Override
	public void destroy() {
		super.destroy();
		System.out.println("destroy() 호출됨");
	}
	
}
