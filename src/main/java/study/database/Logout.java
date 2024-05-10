package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/database/Logout")
public class Logout extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('"+mid+"님 로그아웃 되었습니다.');");
		out.print("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
		out.print("</script>");
	}
}
