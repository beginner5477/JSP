package study2.pdsTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartrequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String oFileName1 = multipartrequest.getOriginalFileName("fName1");
		String oFileName2 = multipartrequest.getOriginalFileName("fName2");
		String oFileName3 = multipartrequest.getOriginalFileName("fName3");
		
		String fsName1 = multipartrequest.getFilesystemName("fName1");
		String fsName2 = multipartrequest.getFilesystemName("fName2");
		String fsName3 = multipartrequest.getFilesystemName("fName3");
		
		if(oFileName1 != null && !oFileName1.equals("")) {
			request.setAttribute("message", "파일 업로드 성공~");
		} else {
			request.setAttribute("message", "파일 업로드 실패");
		}
		
		request.setAttribute("url", "FileUpload2.st");
	}

}
