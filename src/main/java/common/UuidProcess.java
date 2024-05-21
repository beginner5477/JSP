package common;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/UuidProcess")
public class UuidProcess extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UUID uid = UUID.randomUUID();
//		System.out.println(uid.getClass().getName());	//자바에서 참조타입의 타입 형 구하는 방법
		response.getWriter().write(uid.toString());
	}
}
