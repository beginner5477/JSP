package study2.pdsTest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload4OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartrequest = new MultipartRequest(request, realPath,maxSize,encoding, new DefaultFileRenamePolicy());
		
		//업로드 된 파일의 정보를 추출
		Enumeration fileNames = multipartrequest.getFileNames();
		String file = "";
		String oFileName = "";
		String fsName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String)fileNames.nextElement();
			oFileName += multipartrequest.getOriginalFileName(file);
			fsName += multipartrequest.getFilesystemName(file);
		}
		if(multipartrequest != null && !oFileName.equals("")) {
			request.setAttribute("message", "파일이 업로드 되었습니다.");
		}
		else {
			request.setAttribute("message", "파일 업로드 실패~~");
		}
		request.setAttribute("url", "FileUpload4.st");
		System.out.println(oFileName);
		System.out.println(fsName);
	}

}
