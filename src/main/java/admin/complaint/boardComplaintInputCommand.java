package admin.complaint;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class boardComplaintInputCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part") == null ? "" : request.getParameter("part");
		String cpMid = request.getParameter("cpMid") == null ? "" : request.getParameter("cpMid");
		String cpContent = request.getParameter("cpContent") == null ? "" : request.getParameter("cpContent");
		int partIdx = request.getParameter("partIdx") == null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		
		AdminDAO dao = new AdminDAO();
		ComplaintVO vo = new ComplaintVO();
		
		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setCpContent(cpContent);
		vo.setCpMid(cpMid);
		int res = dao.setBoardComplaintInput(vo);
		
		response.getWriter().write(res + "");
	}

}
