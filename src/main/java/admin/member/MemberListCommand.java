package admin.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;
import admin.AdminVO;

public class MemberListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();
		int showLevel = request.getParameter("level") == null ? 999: Integer.parseInt(request.getParameter("level")) ;
		
		ArrayList<AdminVO> vos = dao.getMemberList(showLevel);
		request.setAttribute("vos", vos);
		
		System.out.println(vos);
	}

}
