package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

// @WebFilter("/*")
public class FilterCertification implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("1. 필터 수행전..");
		
		String admin = request.getParameter("admin")==null ? "" : request.getParameter("admin");
		String u = request.getParameter("u")==null ? "" : request.getParameter("u");
		System.out.println("admin: " + admin + " , user : " + u);
		
		PrintWriter out = response.getWriter();
		
		// 필터에서는 session객체의 사용불가, application객체 사용 가능...
		ServletContext application = request.getServletContext();
		String aCertification = application.getAttribute("aCertification")==null ? "" : (String) application.getAttribute("aCertification");
		System.out.println("현재 발급된 인증번호 : " + aCertification);
		
		// 주소창에 ?admin=admin 으로 들어왔을경우에만 아래 조건을 통과시키도록 한다.
		
		if(!admin.equals("admin")) {
			// 일반 유저이면서, 인증코드가 발급되지 않았다면, '발급 대기'메세지를 띄우고 돌려보낸다.
			if(aCertification.equals("")) {
				out.println("<script>");
				out.println("alert('아직 인증코드가 발급되지않았습니다.\\n잠시후 다시 접속해 주세요.');");
				out.println("history.back();");
				out.println("</script>");
				return;
			}
			
			// 일반유저가 인증코드 발급시 처리
			String aUserCertification = application.getAttribute("aUserCertification")==null? "" : (String) application.getAttribute("aUserCertification");
			if(!aUserCertification.equals(aCertification)) {
				if(!u.equals(aCertification)) {
					out.println("<script>");
					out.println("alert('인증코드를 확인하세요.(?c=인증코드)');");
					out.println("history.back();");
					out.println("</script>");
					return;
				}
				else {
					out.println("<script>");
					out.println("alert('인증되셨습니다. 서비스 이용이 가능합니다.');");
					out.println("</script>");
					application.setAttribute("aUserCertification", u);
				}
			}
		}
		
		chain.doFilter(request, response);
		
		if(admin.equals("admin") && aCertification.equals("")) {
			out.println("<script>");
			out.println("alert('관리자님~ 인증코드를 발급해주세요.');");
			// out.println("location.href='t2_Certification.jsp?admin=admin'");  필터안에서는 location.href 사용불가
			out.println("</script>");
		}
		
		System.out.println("2. 필터 수행후..");
	}

}
