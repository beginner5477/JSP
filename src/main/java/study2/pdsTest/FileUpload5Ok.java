package study2.pdsTest;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig(
//		location = "/경로명",
		maxFileSize = 1024 * 1024 * 5,
		maxRequestSize = 1024 * 1024 * 5 * 10,
		fileSizeThreshold = 1024 * 1024 * 1	//업로드 시에 메모리의 임시파일의 크기??(int??) 가상메모리?
)
@WebServlet("/FileUpload5Ok")
public class FileUpload5Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		
		Part filePart = request.getPart("fName"); // file태그의 name 명을 적는다
		String fileName = filePart.getSubmittedFileName();	//클라이언트로부터 전송된 파일 네임을 반환
		InputStream fis = filePart.getInputStream();	//입력 스트림 만들기
		
		String uid = UUID.randomUUID().toString().substring(0,8);	//파일명 중복방지 처리
		fileName = fileName.substring(0,fileName.lastIndexOf("."))+"_"+uid+fileName.substring(fileName.lastIndexOf("."));
		FileOutputStream fos = new FileOutputStream(realPath+"/"+fileName);	//파일 출력 스트림 생성
		
		//전송되는 파일의 2KByte=2048Byte 단위로 버퍼에서 읽어서 서버 파일 시스템에 저장시킨다.
		byte[] buffer = new byte[2048];
		int size = 0;
		while((size = fis.read(buffer)) != -1) {
			fos.write(buffer, 0, size);
		}
		fos.close();
		fis.close();
		request.setAttribute("message", "파일업로드 완료");
		request.setAttribute("url", "FileUpload5.st");
		
		request.getRequestDispatcher("/include/message.jsp").forward(request, response);
	}
}
