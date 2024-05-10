package study.j0430;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/0430/LifeCycle1Ok")
public class LifeCycle1Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service 메소드 입니다.");
		
		response.sendRedirect(request.getContextPath()+"/study/0430_web_xml/lifeCycle/lifeCycle1.jsp");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("이곳은 init 메소드 입니다.");
	}
	
	@Override
	public void destroy() {
		System.out.println("이곳은 destroy 메소드 입니다.");
	}
	
}
