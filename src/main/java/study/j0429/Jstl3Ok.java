package study.j0429;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0429/Jstl3Ok")
public class Jstl3Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		
		MemberVO vo = null;
		
		vo = new MemberVO();
		vo.setName("홍길동");
		vo.setAge(25);
		vo.setGender("남자");
		vo.setJob("학생");
		vo.setAddress("서울");
		vos.add(vo);
		
		request.setAttribute("vo", vo);
		
		vo = new MemberVO();
		vo.setName("김말숙");
		vo.setAge(33);
		vo.setGender("여자");
		vo.setJob("회사원");
		vo.setAddress("청주");
		vos.add(vo);
		
		vo = new MemberVO();
		vo.setName("이기자");
		vo.setAge(30);
		vo.setGender("남자");
		vo.setJob("공무원");
		vo.setAddress("제주");
		vos.add(vo);
		
		vo = new MemberVO();
		vo.setName("소나무");
		vo.setAge(53);
		vo.setGender("여자");
		vo.setJob("군인");
		vo.setAddress("인천");
		vos.add(vo);
		
		vo = new MemberVO();
		vo.setName("고인돌");
		vo.setAge(13);
		vo.setGender("남자");
		vo.setJob("학생");
		vo.setAddress("청주");
		vos.add(vo);
		
		request.setAttribute("vos", vos);
		request.setAttribute("cnt", vos.size());
		
		String viewPage = "/study/0429_JSTL/jstl3Res.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
