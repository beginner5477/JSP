package study.j0430;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0430/T01Ok1")
public class T01Ok1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String introduce = request.getParameter("introduce")==null ? "" : request.getParameter("introduce");
		
		System.out.println("이곳은 /j0430/T01OK1 서블릿입니다.");
		System.out.println("content : " + content);
		System.out.println("introduce : " + introduce);
		
		PrintWriter out = response.getWriter();
		out.println("이곳은 T01Ok1컬트롤러 입니다.");
		
		request.setAttribute("msg", "T01Ok1에서 보냅니다");
		
		String viewPage = "/study/0430_web_xml/filter/t1_FilterRes.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
