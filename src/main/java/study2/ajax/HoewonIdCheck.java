package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

// 로그인시 아이디 중복체크하기(AJAX로 처리했다.)
@SuppressWarnings("serial")
@WebServlet("/HoewonIdCheck")
public class HoewonIdCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginIdSearch(mid);
		
		String str = "0";
		if(vo.getName() != null) str = "1";
		
		response.getWriter().write(str);
	}
}
