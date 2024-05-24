package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		//DB에서 저장된 파일의 정보(원본파일/서버에 저장된 파일 이름)을 가져온다
		PdsDAO dao = new PdsDAO();
		PdsVO vo = dao.getpdsIdxSearch(idx);
		
		//원본파일 명과 서버에 저장된 파일명을 각각 분리 시킨다.
		String[] fNames = vo.getfName().split("/");
		String[] fSNames = vo.getfSName().split("/");
		
		//파일을 패키징 위해 필요한 객체들을 선언한다
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		ServletOutputStream sos = null;
		
		String realPath = request.getServletContext().getRealPath("/images/pds");
		String zipPath = request.getServletContext().getRealPath("/images/pds/temp");
		String zipName = vo.getTitle()+".zip";
		
		fos = new FileOutputStream(zipPath +"/"+ zipName);
		zos = new ZipOutputStream(fos);
		
		byte[] buffer = new byte[2048];
		int size = 0;
		
		//각각의 파일을 패키징 처리하기 위한 fis을 생성 후 zos에 넣는다?
		for(int i = 0; i < fSNames.length; i++) {
			File file = new File(realPath +"/"+ fSNames[i]);
			fis = new FileInputStream(file);
			zos.putNextEntry(new ZipEntry(fSNames[i]));
			while((size = fis.read(buffer)) != -1) {
				zos.write(buffer,0,size);
			}
			zos.flush();
			zos.closeEntry();
			fis.close();
		}
		zos.close();
		
		//서버에서 압축 작업이 완료되면 , 압축파일을 클라이언트로 전송하고, 서버에 존재하는 압축파일을 삭제시킨다.
		//클라이언트로 파일을 전송할 시에는 HTTP프로토콜형식에 맞도록 헤더에 제공해줘야 된다.
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1)
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		else
			downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
		
		// 헤더에 정보를 첨부...
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		fis = new FileInputStream(zipPath + "/" + zipName);
		sos = response.getOutputStream();
		
		while((size = fis.read(buffer)) != -1) {
			sos.write(buffer, 0, size);
		}
		sos.flush();
		sos.close();
		fis.close();
		//클라이언트에 파일전송을 마치면 서버에 존재하는 zip 파일을 삭제처리한다
		new File(zipPath +"/"+ zipName).delete();
	}

}
