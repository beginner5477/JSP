package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		
		String nickName = request.getParameter("nickName")==null? "" : request.getParameter("nickName");
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		String gender = request.getParameter("gender")==null? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday")==null? "" : request.getParameter("birthday");
		String tel = request.getParameter("tel")==null? "" : request.getParameter("tel");
		String address = request.getParameter("address")==null? "" : request.getParameter("address");
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null? "" : request.getParameter("homePage");
		String job = request.getParameter("job")==null? "" : request.getParameter("job");
		String photo = request.getParameter("photo")==""? "noimage.jpg" : request.getParameter("photo");
		String content = request.getParameter("content")==null? "" : request.getParameter("content");
		String userInfor = request.getParameter("userInfor")==null? "" : request.getParameter("userInfor");
		
		String[] hobbys = request.getParameterValues("hobby");
		String hobby = "";
		if(hobbys.length != 0) {
			for(String h : hobbys) {
				hobby += h + "/";
			}
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("/"));
		
		// DB에 저장시킨자료중 not null 데이터는 Back End 체크시켜준다.
		
		
		
		// 모든 체크가 끝난 자료는 vo에 담아서 DB에 저장처리한다.
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(photo);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		System.out.println(photo);
		int res = dao.setMemberUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원 정보 수정이 완료되었습니다.");
			session.setAttribute("sNickName", nickName);
			
		} else {
			request.setAttribute("message", "회원 정보 수정 실패하였습니다.");
		}
		vo = dao.getMemberIdCheck(mid);
		
		// 전화번호 분리(-)
		String[] tel1 = vo.getTel().split("-");
		if(tel1[1].equals(" ")) tel1[1] = "";
		if(tel1[2].equals(" ")) tel1[2] = "";
		request.setAttribute("tel1", tel1[0]);
		request.setAttribute("tel2", tel1[1]);
		request.setAttribute("tel3", tel1[2]);
			
		// 주소분리(/)
		String[] address1 = vo.getAddress().split("/");
		if(address1[0].equals(" ")) address1[0] = "";
		if(address1[1].equals(" ")) address1[1] = "";
		if(address1[2].equals(" ")) address1[2] = "";
		if(address1[3].equals(" ")) address1[3] = "";
		request.setAttribute("postcode", address1[0]);
		request.setAttribute("roadAddress", address1[1]);
		request.setAttribute("detailAddress", address1[2]);
		request.setAttribute("extraAddress", address1[3]);
		
		// 취미는 통째로 넘겨서 jstl에서 포함유무로 처리한다.
		request.setAttribute("hobby", vo.getHobby());
		
		request.setAttribute("vo", vo);
	}

}
