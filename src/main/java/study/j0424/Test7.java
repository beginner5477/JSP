package study.j0424;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({"/T7","/T77"})
public class Test7 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("1.Served at: ").append(request.getContextPath());
		System.out.println("이곳은 Get 메소드 입니다.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("2.Served at: ").append(request.getContextPath());
		System.out.println("이곳은 Post 메소드 입니다.");
		doGet(request, response);
	}

}
