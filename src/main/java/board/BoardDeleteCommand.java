package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardDeleteCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		BoardDAO dao = new BoardDAO();
		int res = dao.setBoardDelete(idx);
		
		if(res != 0) {
			request.setAttribute("message", "게시글 삭제 성공");
			request.setAttribute("url", "BoardList.bo");
		} else {
			request.setAttribute("message", "게시글 삭제 실패");
			request.setAttribute("url", "BoardContent.bo?idx="+idx);
		}
	}

}
