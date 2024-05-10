package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

public class HoewonInputCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		// 아이디 중복체크
		LoginVO vo2 = dao.getLoginIdSearch(mid);
		if(vo2.getName() != null) {
			response.getWriter().write("아이디가 중복되었습니다. 다시 가입하세요.");
		}
		else {
			int res = dao.setLoginInput(vo);
			if(res != 0) response.getWriter().write("1");
			else response.getWriter().write("회원 가입실패~~, 다시 가입해 주세요.");
		}
		
	}

}
