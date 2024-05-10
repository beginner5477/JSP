package study2.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/test")
public class Test extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Test.java(서블릿파일)");
		
		String msg = "Good Morning";
		//response.sendRedirect(request.getContextPath()+"/WEB-INF/study2/test/test.jsp?msg="+msg);
		
		request.setAttribute("msg", msg);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/test/test2.jsp");
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
