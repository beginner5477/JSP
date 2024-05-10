package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test4DeleteOkCommand implements Test4Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test4DeleteOkCommand입니다.");
		System.out.println("이곳에서는 회원 정보를 DB에서 삭제처리 합니다.");
		
		// DB에 삭제하러 다녀 옵니다.
		
		String message = "자료가 DB에서 삭제되었습니다.";
		request.setAttribute("message", message);
		request.setAttribute("url", "test4.do4");
	}

}
