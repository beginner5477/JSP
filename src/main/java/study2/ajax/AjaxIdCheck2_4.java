package study2.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import study.database.LoginDAO;
import study.database.LoginVO;
import study2.StudyDAO;
import study2.StudyInterface;

@SuppressWarnings("serial")
@WebServlet("/AjaxIdCheck2_4")
public class AjaxIdCheck2_4 extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginIdSearch(mid);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mid", vo.getMid());
		map.put("name", vo.getName());
		map.put("age", vo.getAge()+"");
		map.put("gender", vo.getGender());
		map.put("address", vo.getAddress());
		
		System.out.println("map : " + map);
		
		// map형식의 자료를 JSON형식으로 변환처리한다.
		JSONObject jObj = new JSONObject(map);
		System.out.println("jObj : " + jObj);
		
		// 여러개의 vo객체를 JSON배열로 담아서 처리한다.
		JSONArray jArray = new JSONArray();
		
		jArray.add(jObj);
		
		map = new HashMap<String, String>();
		map.put("mid", "atom1234");
		map.put("name", "아톰");
		map.put("age", "19");
		map.put("gender", "여자");
		map.put("address", "제주");
		
		jObj = new JSONObject(map);
		jArray.add(jObj);
		
		System.out.println("jArray : " + jArray);
		
		response.getWriter().write(jArray.toString());
		
	}
}
