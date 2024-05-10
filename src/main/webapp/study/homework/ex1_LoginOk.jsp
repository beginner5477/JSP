<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ex1_LoginOk.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	
	if((mid.equals("admin") && pwd.equals("1234")) ||(mid.equals("atom") && pwd.equals("1234"))) {
		// 쿠키에 아이디를 저장/해제 처리한다.
		// 로그인시 아이디저장시킨다고 체크하면 쿠키에 아이디 저장하고, 그렇지 않으면 쿠키에서 아이디를 제거한다.
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if(idSave.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);	// 쿠키의 만료시간은 1주일로 한다.
		}
		else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);
		
		// 정상 로그인Ok이후에 모든 처리가 끝나면 ex1_Main.jsp로 보내준다.
		out.print("<script>");
		out.print("alert('"+mid+"님 로그인 되었습니다.');");
		out.print("location.href='"+request.getContextPath()+"/study/homework/ex1_Main.jsp?mid="+mid+"';");
		out.print("</script>");
	}
	else {
		// 회원 인증 실패시 처리... 다시 로그인창으로 보내준다.
		out.print("<script>");
		out.print("alert('로그인 실패~~');");
		out.print("location.href='"+request.getContextPath()+"/study/homework/ex1_Login.jsp';");
		out.print("</script>");
	}
%>