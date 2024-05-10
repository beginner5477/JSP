package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

// 비밀번호 만들기 학습창에서 출력되는 인코딩된 비밀번호를 현재 화면에 출력하게 하는 view에서 불렀다.
@SuppressWarnings("serial")
@WebServlet("/PassCheckAjax")
public class PassCheckAjax extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd").toUpperCase();
		int flag = request.getParameter("flag")==null ? 0 : Integer.parseInt(request.getParameter("flag"));
		
		System.out.println("원본자료 :");
		System.out.println("flag : " + flag);
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		
		// 전송시킬 인코딩된 비밀번호 변수 : sendPwd
		String sendPwd = "";
		
		if(flag == 1) {
			// 숫자만을 암호화 하는 경우... 암호키(0x1234ABCD)
			int key = 0x1234ABCD;
			int encPwd, decPwd;
			encPwd = Integer.parseInt(pwd) ^ key;
			sendPwd = "1234ABCD"+encPwd;
			
			System.out.println("인코딩된 비밀번호 : " + sendPwd);
			System.out.println("앞에서 인코딩(암호화)된 pwd를 DB에 저장처리한다. : ");
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			System.out.println("DB에 저장된 pwd를 다시 불러와서 디코딩처리한다.");
			
			decPwd = encPwd ^ key;
			
			System.out.println("디코딩(복호화)된 비밀번호 : " + decPwd);
			System.out.println("로그인 인증처리한다.");
			System.out.println("~~~~~~~~~~~ The End ~~~~~~~~~~~~~~~");
		}
		else if(flag == 2) {
			// 숫자또는 문자 또는 조합으로 암호화 하는 방법
			// 예) 문자 A로 전송되면 A의 아스키코드를 변형처리해서 암호화한다.
			long intPwd;
			String strPwd = "";
			// 입력받은 암호를 한문자씩 꺼내어서 아스키코드로 변형뒤, 문자로 누적처리해서 만들어준다.
			//pwd = pwd.toUpperCase(); // 입력시 처리해준다.
			for(int i=0; i<pwd.length(); i++) {
				intPwd = (long) pwd.charAt(i);
				strPwd += intPwd;
			}
			System.out.println("strPwd(아스크코드문자로 변환된 비밀번호) : " + strPwd);
			
			intPwd = Long.parseLong(strPwd);
			
			// 암호화시킬 salt키를 선정...
			long key = 0x1234ABCD;
			long encPwd;
			
			encPwd = intPwd ^ key;
			
			sendPwd = key + String.valueOf(encPwd);
			
			// 암호화된 코드와 salt키를 합쳐서 DB에 저장처리한다.
			System.out.println("인코딩(암호화)된 비밀번호(DB에 저장될 비밀본호) : " + sendPwd);
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			
			// 다시 로그인할때 DB의 비밀번호를 가져와서 복호화 시켜준다.
			long decPwd;
			intPwd = Long.parseLong(sendPwd.substring(9));
			decPwd = intPwd ^ key;
			System.out.println("디코딩(복호화)된 비밀번호 : " + decPwd);
			
			// 복호화된 비밀번호는 숫자이기에 문자료 변환후 2개씩 문자 처리한다.
			strPwd = String.valueOf(decPwd);
			
			String result = "";
			char ch;
			
			// 문자로 변환된 복호화 코드를 각각 2자리씩 잘라서 문자로 변형후 누적처리.... 처음 비밀번호와 비교한다.
			for(int i=0; i<strPwd.length(); i+=2) {
				ch = (char) Integer.parseInt(strPwd.substring(i, i+2));
				result += ch;
			}
			System.out.println();
			System.out.println("최종 변환된 비밀번호(원본 비번과 비교하세요) : " + result);
		}
		else if(flag == 3) {
			// 숫자또는 문자 또는 조합으로 암호화 하는 방법 - salt키를 랜덤하게 받아서 처리한다.
			// 예) 문자 A로 전송되면 A의 아스키코드를 변형처리해서 암호화한다.
			long intPwd;
			String strPwd = "";
			// 입력받은 암호를 한문자씩 꺼내어서 아스키코드로 변형뒤, 문자로 누적처리해서 만들어준다.
			for(int i=0; i<pwd.length(); i++) {
				intPwd = (long) pwd.charAt(i);
				strPwd += intPwd;
			}
			System.out.println("strPwd(아스크코드문자로 변환된 비밀번호) : " + strPwd);
			
			intPwd = Long.parseLong(strPwd);
			
			// 암호화시킬 salt키를 선정...
//			long key = 0x1234ABCD;
			long saltKey = (int)(Math.random()*10000000) + 1;
			long encPwd = intPwd ^ saltKey;
			
			String dbSavePwd = (saltKey+"").length() + (saltKey+"") + encPwd;
			
			// 암호화된 코드와 salt키를 합쳐서 DB에 저장처리한다.(salt길이 + salt + 암호화코드)
			System.out.println("인코딩(암호화)된 비밀번호(DB에 저장될 비밀번호) : " + dbSavePwd);
			sendPwd = dbSavePwd;	// 클라이언트로 넘겨줄 인코딩된 비밀번호 값 저장 변수
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
			
			
			// 다시 로그인할때 DB의 비밀번호를 가져와서 복호화 시켜준다.
			int keyLength = Integer.parseInt(dbSavePwd.substring(0,1));
			String strSaltKey = dbSavePwd.substring(1,keyLength+1);
			String sourcePassword = dbSavePwd.substring(keyLength+1);
			
			long intSaltKey = Long.parseLong(strSaltKey);
			long intSourcePassword = Long.parseLong(sourcePassword);
			
			long decPwd = intSourcePassword ^ intSaltKey;
			System.out.println("디코딩(복호화)된 비밀번호 : " + decPwd);
			
			// 복호화된 비밀번호는 숫자이기에 문자로 변환후 2개씩 문자 처리한다.
			strPwd = String.valueOf(decPwd);
			
			String result = "";
			char ch;
			
			// 문자로 변환된 복호화 코드를 각각 2자리씩 잘라서 문자로 변형후 누적처리.... 처음 비밀번호와 비교한다.
			for(int i=0; i<strPwd.length(); i+=2) {
				ch = (char) Integer.parseInt(strPwd.substring(i, i+2));
				result += ch;
			}
			System.out.println();
			System.out.println("최종 변환된 비밀번호(원본 비번과 비교하세요) : " + result);
		}
		else if(flag == 4) {
			SecurityUtil security = new SecurityUtil();
			sendPwd = security.encryptSHA256(pwd);
			
		}
		
		//response.sendRedirect(request.getContextPath()+"/study/password/passCheck.jsp?msg="+"OK");
		response.getWriter().write(sendPwd);
	}
}
