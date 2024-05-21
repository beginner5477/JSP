package study2.pdsTest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class JavaFileDownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		
		String fileName = request.getParameter("file") == null ? "" : request.getParameter("file");
		
		File file = new File(realPath +"/"+ fileName);
		
		/*HTTP 프로토콜 형식에 맞도록 헤더에 전송할 파일의 정보를 담아준다. */
		String mimeType = request.getServletContext().getMimeType(file+"");
		if(mimeType == null) response.setContentType("application/octet-stream");	//만약 타입이 없으면?? 타입 세팅해주기
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(fileName.getBytes("UTF-8"),"8859_1");
		} else {
			downLoadName = new String(fileName.getBytes("EUC-KR"),"8859_1");
		}
		//헤더에 정보 첨부
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		
		FileInputStream fis = new FileInputStream(file);
		
//		FileOutputStream fos = new FileOutputStream(file);	//이거는 서버에서 파일 주고 받을때 개념?
		
		ServletOutputStream sos = response.getOutputStream();
		byte[] buffer = new byte[2048];
		int size = 0;
		while((size = fis.read(buffer)) != -1) {
			sos.write(buffer,0,size);
		}
		sos.flush();
		sos.close();
		fis.close();
	}

}
