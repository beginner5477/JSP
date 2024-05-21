package common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.BoardDAO;
import board.BoardVO;
import pds.PdsDAO;
import pds.PdsVO;

public class Pagination {

	public static void pageChange(HttpServletRequest request, int pag, int pageSize,String section,String part) {
		BoardDAO boardDao = new BoardDAO();
		PdsDAO pdsDao = new PdsDAO();
		int totRecCnt = 0;
		PdsDAO dao = new PdsDAO();
		if(section.equals("board")) {
			totRecCnt = boardDao.getTotRecCnt();	// 게시판의 전체 레코드수 구하기
		}
		else if(section.equals("pds")) {
			totRecCnt = pdsDao.getTotRecCnt(part);	// 게시판의 전체 레코드수 구하기
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		if(pag > totPage) pag = 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		List<BoardVO> vos = null;
		List<PdsVO> pdsVos = null;
		if(section.equals("board")) {
			if(part == null || part.equals("")) {
				vos = boardDao.getBoardList(startIndexNo, pageSize);	// 게시판의 전체 자료 가져오기
			} else {
				String search = part.split("/")[0];
				String searchString = part.split("/")[1];
				/*dao에 두개 가져가서 뽑아오면 끝임*/
			}
			request.setAttribute("vos", vos);
			
		} else if(section.equals("pds")) {
			pdsVos = pdsDao.getPdsList(startIndexNo, pageSize, part);	// 게시판의 전체 자료 가져오기
			request.setAttribute("vos", pdsVos);
		}
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
		if(part != null && !part.equals(""))
		request.setAttribute("part", part);
		
	}


}
