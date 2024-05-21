package study2.pdsTest;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
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
@WebServlet("/FileUpload6Ok")
public class FileUpload6Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		
		//request 객체 내부의 getParts() 메소드를 사용하여 배열로 받는다
		//multiple로 여러 파일 넘어올 수 있기 때문에 그런거에용~
		
		Collection<Part> fileParts = request.getParts();
		
		for(Part filePart : fileParts) {
			if(!filePart.getName().equals("fName")) continue;
			if(filePart.getSize() == 0) continue;
			String fileName = filePart.getSubmittedFileName();
			InputStream fis = filePart.getInputStream();
			String uid = UUID.randomUUID().toString().substring(0,8);
			fileName = fileName.substring(0,fileName.lastIndexOf("."))+"_"+uid+fileName.substring(fileName.lastIndexOf("."));
			FileOutputStream fos = new FileOutputStream(realPath+"/"+fileName);
			byte[] buffer = new byte[2048];
			int size = 0;
			while((size = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, size);
			}
			fos.close();
			fis.close();
		}
		request.setAttribute("message", "파일업로드 완료");
		request.setAttribute("url", "FileUpload5.st");
		
		request.getRequestDispatcher("/include/message.jsp").forward(request, response);
	}
}
