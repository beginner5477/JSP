package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		MemberDAO dao = new MemberDAO();
		int res = dao.setMemberDeleteUpdate(mid);
		//DAO접근해서 id로 vo로 그 회원 정보 담아와서 pwd에서 salt 키 분리해서 그거랑 넘어온 pwd 랑 결합해서 sha 돌린다음
		// 암호화 비번 생성하고 그거랑 database에 있던 pwd랑 비교해서 맞으면 탈퇴처리하게 만들면 된다.
		if(res != 0) {
			session.invalidate();
			request.setAttribute("message", "회원 탈퇴 되셨습니다. 같은 아이디로 한달간 가입 불가입니다.");
			request.setAttribute("url", request.getContextPath()+"/Main");
		} else {
			request.setAttribute("message", "회원 탈퇴 실패.");
			request.setAttribute("url", "/MemberMain.mem");
		}
	}

}
