package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
		BoardDAO dao = new BoardDAO();
		//게시글 조회수 1씩 증가 시키기
		HttpSession session = request.getSession();
		ArrayList<String> contentReadNum = (ArrayList<String>)session.getAttribute("sContentIdx");
		if(contentReadNum == null) {
			contentReadNum = new ArrayList<String>();
		}
		String imsiContentReadNum = "board" + idx;
		if(!contentReadNum.contains(imsiContentReadNum)) {
			dao.setBoardReadNumPlus(idx);
			contentReadNum.add(imsiContentReadNum);
		}
		session.setAttribute("sContentIdx", contentReadNum);
		
		BoardVO vo = dao.getBoardContent(idx);
		request.setAttribute("vo", vo);
		
		//이전글 다음글 달아주기
		BoardVO preVo = dao.getPreNextSearch(idx,"preVo");
		BoardVO nextVo = dao.getPreNextSearch(idx,"nextVo");
		
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		//신고글 유무 처리
		AdminDAO adminDao = new AdminDAO();
		String report = adminDao.getReport("board", idx);
		request.setAttribute("report", report);
		
		System.out.println(idx);
		//댓글 내용 가져가기
		ArrayList<BoardReplyVO> replyVos = dao.getBoardReply(idx);
		request.setAttribute("replyVos", replyVos);
	}

}
