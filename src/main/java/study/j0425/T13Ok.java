package study.j0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T13Ok")
public class T13Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String loginFlag = request.getParameter("loginFlag")==null ? "" : request.getParameter("loginFlag");
		
		if(loginFlag.equals("javascript")) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("location.href='"+request.getContextPath()+"/study/0425/t13Res.jsp?mid="+mid+"&pwd="+pwd+"&loginFlag="+loginFlag+"';");
			out.println("</script>");
		}
		else if(loginFlag.equals("response")) {
			response.sendRedirect(request.getContextPath()+"/study/0425/t13Res.jsp?mid="+mid+"&pwd="+pwd+"&loginFlag="+loginFlag);
		}
		else {
//			String viewPage = "/study/0425/t13Res.jsp?mid="+mid+"&pwd="+pwd+"&loginFlag="+loginFlag;
			request.setAttribute("mid", mid);
			request.setAttribute("pwd", pwd);
			request.setAttribute("loginFlag", loginFlag);
			
			String viewPage = "/study/0425/t13Res.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	}
}
