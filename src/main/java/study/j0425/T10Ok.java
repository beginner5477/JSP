package study.j0425;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T10Ok")
public class T10Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		// DB에서 mid와 같은 자료가 있는지 검색후 돌아온다.
		if(!mid.equals("admin") || !pwd.equals("1234")) {
			// jsp로 보내서 다시 로그인하라는 메세지를 띄우도록 한다.
			response.sendRedirect(request.getContextPath()+"/study/0425/t10_Login.jsp?msgFlag=no");
			return;
		}
		
		// 정상회원들 처리부분...
		System.out.println("정상로그인 처리됨....");
		response.sendRedirect(request.getContextPath()+"/study/0425/t10_main.jsp?msgFlag=ok&mid="+mid);
	}
}
