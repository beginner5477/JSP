package study.j0427;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/j0427/T5_StorageTestOk")
public class T5_StorageTestOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid"); 
		System.out.println("T5_StorageTestOk : mid = " + mid);
		
		// 세션 객체 생성
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		
		// 어플리케이션객체 생성
		// ServletContext application = session.getServletContext();
		// ServletContext application = request.getSession().getServletContext();
		ServletContext application = request.getServletContext();
		
		application.setAttribute("aMid", mid);
		
		response.sendRedirect(request.getContextPath()+"/study/0427_storage/t5_StorageTest.jsp");
		
	}
}
