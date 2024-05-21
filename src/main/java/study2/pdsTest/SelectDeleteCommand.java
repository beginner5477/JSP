package study2.pdsTest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class SelectDeleteCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int length = Integer.parseInt(request.getParameter("length"));
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		String fileName = "";
		String res = "0";
		for(int i = 1; i <= length; i++) {
			if(request.getParameter("cb"+i) != null) {
				fileName = request.getParameter("cb"+i);
				File file = new File(realPath+"/"+fileName);
				if(file.exists()) {
					file.delete();
					res = "1";
				}
			}
		}
		response.getWriter().write(res);
	}

}
