package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/database/JoinOk")
public class JoinOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);		
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setLoginInput(vo);
		
		PrintWriter out = response.getWriter();
		if(res != 0) {
			out.print("<script>");
			out.print("alert('회원에 가입되셨습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('회원 가입 실패~~');");
			out.print("location.href='"+request.getContextPath()+"/study/database/join.jsp';");
			out.print("</script>");
		}
	}
}
