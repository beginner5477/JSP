package study.j0426;

import java.awt.Graphics2D;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0426/T02Ok")
public class T02Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		String hakbun = request.getParameter("hakbun")==null ? "" : request.getParameter("hakbun");
		int kor = (request.getParameter("kor")==null || request.getParameter("kor").equals("")) ? 0 : Integer.parseInt(request.getParameter("kor")); 
		int eng = (request.getParameter("eng")==null || request.getParameter("eng").equals("")) ? 0 : Integer.parseInt(request.getParameter("eng")); 
		int mat = (request.getParameter("mat")==null || request.getParameter("mat").equals("")) ? 0 : Integer.parseInt(request.getParameter("mat")); 
		int soc = (request.getParameter("soc")==null || request.getParameter("soc").equals("")) ? 0 : Integer.parseInt(request.getParameter("soc")); 
		int sci = (request.getParameter("sci")==null || request.getParameter("sci").equals("")) ? 0 : Integer.parseInt(request.getParameter("sci"));
		
		int tot = kor + eng + mat + soc + sci;
		double avg = tot / 5.0;
		String grade = "";
		
		switch((int)(avg / 10)) {
			case 10:
			case 9:
				grade = "A"; break;
			case 8:
				grade = "B"; break;
			case 7:
				grade = "C"; break;
			case 6:
				grade = "D"; break;
			default:
				grade = "F";
		}
		
//		request.setAttribute("name", name);
//		request.setAttribute("hakbun", hakbun);
//		request.setAttribute("kor", kor);
//		request.setAttribute("eng", eng);
//		request.setAttribute("mat", mat);
//		request.setAttribute("soc", soc);
//		request.setAttribute("sci", sci);
//		request.setAttribute("tot", tot);
//		request.setAttribute("avg", avg);
//		request.setAttribute("grade", grade);
		
//		T02VO vo = new T02VO();
		
//		vo.setName(name);
//		vo.setHakbun(hakbun);
//		vo.setKor(kor);
//		vo.setEng(eng);
//		vo.setMat(mat);
//		vo.setSoc(soc);
//		vo.setSci(sci);
//		vo.setTot(tot);
//		vo.setAvg(avg);
//		vo.setGrade(grade);
		
		T02VO vo = new T02VO(name, hakbun, kor, eng, mat, soc, sci, tot, avg, grade, hostIp);
		
		request.setAttribute("vo", vo);
		
		String viewPage = "/study/0426/t02Res.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
