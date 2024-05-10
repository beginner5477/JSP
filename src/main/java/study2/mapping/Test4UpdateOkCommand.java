package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test4UpdateOkCommand implements Test4Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test4UpdateOkCommand입니다.");
		System.out.println("이곳에서는 회원 정보를 DB에서 수정처리 합니다.");
		
		// DB에 수정하러 다녀 옵니다.
		
		String message = "자료가 DB에서 수정되었습니다.";
		request.setAttribute("message", message);
		request.setAttribute("url", "test4.do4");
	}

}
