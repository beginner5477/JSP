package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AllMemberChageCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String level = request.getParameter("level") == null ? "" : request.getParameter("level");
		String list = request.getParameter("list") == null?"":request.getParameter("list");
		list = list.substring(0,list.length()-1);
		
		System.out.println(level);
		System.out.println(list);
		
		AdminDAO dao = new AdminDAO();
		int res = dao.setAllMemberChange(level,list);
		String str = "";
		if(res != 0) str = "1";
		else str = "0";
		response.getWriter().write(str);
	}

}
