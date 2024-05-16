package study2.modal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;
import study2.StudyInterface;

public class ModalTestCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		MemberDAO dao = new MemberDAO();
		MemberVO mVo = dao.getMemberIdCheck(mid);
		
		request.setAttribute("mVo", mVo);
	}

}
