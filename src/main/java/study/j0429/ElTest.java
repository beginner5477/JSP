package study.j0429;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0429/ElTest")
public class ElTest extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String[] hobbys = request.getParameterValues("hobby");
		
		String hobby = "";
		for(String h : hobbys) {
			hobby += h + "/";
		}
		hobby = hobby.substring(0, hobby.length()-1);
		
		request.setAttribute("name", name);
		request.setAttribute("hobby", hobby);

		String viewPage = "/study/0429_JSTL/el1.jsp";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
