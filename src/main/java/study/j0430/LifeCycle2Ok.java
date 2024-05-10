package study.j0430;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/0430/LifeCycle2Ok")
public class LifeCycle2Ok extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		System.out.println("이곳은 init 메소드 입니다.");
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service 메소드 입니다.");
		
		doPost(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doGet 메소드 입니다.");
		response.sendRedirect(request.getContextPath()+"/study/0430_web_xml/lifeCycle/lifeCycle1.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doPost 메소드 입니다.");
		doGet(request, response);
	}
	
	@Override
	public void destroy() {
		System.out.println("이곳은 destroy 메소드 입니다.");
	}
	
	@PostConstruct
	public void initPostConstruct() {
		System.out.println("이곳은 사용자메소드 : @PostConstruct 어노테이션사용시 가장 먼저 수행한다.....");
	}
	
	@PreDestroy
	public void destroyPreDestroy() {
		System.out.println("이곳은 사용자메소드 : @PreDestroy 어노테이션사용시 가장 마지막에(갱신/반납) 수행한다.....");
	}
	
}
