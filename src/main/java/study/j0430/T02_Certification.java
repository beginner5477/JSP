package study.j0430;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0430/T02_Certification")
public class T02_Certification extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aCertification = request.getParameter("u")==null ? "" : request.getParameter("u");
		
		ServletContext application = request.getServletContext();
		
		// 기존에 저장된 aCertification 값을 출력해본다.
		System.out.println("기존 aCertification : " + application.getAttribute("aCertification"));
		
		// 새로 발급한 인증번호를 aCertification에 저장한다.
		application.setAttribute("aCertification", aCertification);
				
		// 새로 발급된 aCertification 값을 출력해본다.
		System.out.println("기존 aCertification : " + application.getAttribute("aCertification"));
		
		request.setAttribute("message", "인증코드가 발급되었습니다.");
		
		String viewPage = "/study/0430_web_xml/filter/t2_Certification.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
