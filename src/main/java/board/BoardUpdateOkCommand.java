package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardUpdateOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String title = request.getParameter("title")==null ? "" :  request.getParameter("title");
		String content = request.getParameter("content")==null ? "" :  request.getParameter("content");
		String openSw = request.getParameter("openSw")==null ? "" :  request.getParameter("openSw");
		String hostIp = request.getParameter("hostIp")==null ? "" :  request.getParameter("hostIp");
		BoardVO vo = new BoardVO();
		vo.setIdx(idx);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setOpenSw(openSw);
		vo.setHostIp(hostIp);
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "게시글 내용 수정 완료");
		} else {
			request.setAttribute("message", "게시글 내용 수정 실패");
		}
//		request.setAttribute("pag", pag);
//		request.setAttribute("pageSize", pageSize);
//		request.setAttribute("idx", idx);
		request.setAttribute("url", "BoardContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
	}

}
