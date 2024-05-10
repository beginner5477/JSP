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
@WebServlet("/database/LoginDelete")
public class LoginDelete extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		// 현재 로그인한 정보와 삭제하려는 mid가 같은지를 비교해서 같으면 자신의 정보를 삭제후 로그아웃처리, 다르면 다시 회원리스트창으로 보낸다.
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		
		LoginDAO dao = new LoginDAO();
		dao.setLoginDelete(mid);
		
		PrintWriter out = response.getWriter();
		
		if(!mid.equals(sMid)) {
			out.print("<script>");
			out.print("alert('회원정보가 삭제 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/database/LoginList';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('회원에서 탈퇴합니다.');");
			out.print("location.href='"+request.getContextPath()+"/database/Logout';");
			out.print("</script>");
		}
	}
}
