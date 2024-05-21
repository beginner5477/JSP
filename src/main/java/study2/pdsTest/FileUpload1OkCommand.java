package study2.pdsTest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

/*
	일반 자바 어노테이션으로 받기
	@MultipartConfig(
			location = "/images/pdsTest",
			maxFileSize = 1024 * 1024 * 10,
			maxRequestSize = 1024 * 1024 * 10 * 10
	)
 */
public class FileUpload1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String fName = request.getParameter("fName") == null ? "" : request.getParameter("fName");
//		System.out.println("fName: "+fName);
		
		/*	COS라이브러리 사용해서 받아야 된다~~~~
		 	MultipartRequest() / DefaultFileRenamePolicy()는 중복된 파일 들어오면 자동으로 리네임 해준다
		 	
		 	사용법: MultipartRequest(저장소명(request),"서버에 저장될 파일의 폴더 경로","서버에 저장될 파일의 최대 용량","코드변환방식","기타 옵션, 파일명 중복방지 등등");
		 	4개는 필수고 마지막 기타옵션은 선택사항임
		 	
		 	서버의 절대경로: /webapp : getRealPath("/")로 가져올 수 있다. 다른거도 있음 나중에 찾아보자
		 */
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/images/pdsTest");	// /webapp을 의미한다는 말임.
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		//파일 업로드 처리하기(객체 생성시 파일이 자동으로 업로드 된다)
		MultipartRequest multipartrequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		//업로드 된 파일의 정보를 추출해보기
		String originalFileName = multipartrequest.getOriginalFileName("fName");	//넘길때 넘긴 이름을 입력해준다
		System.out.println(originalFileName);
		//백엔드에서 체크해야될 보안사항 만약 오리지널 파일이 NULL이거나 공백이면 해커들이 그냥  들어온 것이므로 체크한다
		if(originalFileName != null && !originalFileName.equals("")) {
			request.setAttribute("message", "파일 업로드 완료~");
		} else {
			request.setAttribute("message", "파일 업로드 실패~");
		}
		String filesystemName = multipartrequest.getFilesystemName("fName");	// 서버에 저장된 파일 이름 반환해줌
		System.out.println(filesystemName);
		
		System.out.println(realPath);	//파일이 저장될 서버의 경로
		
		String nickName = multipartrequest.getParameter("nickName");
		System.out.println(nickName);
		
		request.setAttribute("url", "FileUpload1.st");
	}

}
