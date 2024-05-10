package study.j0425;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T14Ok3")
public class T14Ok3 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 T14Ok3 입니다.");
		
		String mid = (String) request.getAttribute("mid");
		String pwd = (String) request.getAttribute("pwd");
		String secureKey = (String) request.getAttribute("secureKey");
		String secureMasterKey = (String) request.getAttribute("secureMasterKey");
		String userPwd = pwd + secureKey;
		
		String viewPage = "";  
		if(!mid.equals("admin") || !userPwd.equals("1234"+secureMasterKey)) {
			request.setAttribute("loginFlag", "NO");
			viewPage = "/study/0425/t14_forward.jsp";
		}
		else {
			request.setAttribute("loginFlag", "OK");
			viewPage = "/study/0425/t14Res.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
