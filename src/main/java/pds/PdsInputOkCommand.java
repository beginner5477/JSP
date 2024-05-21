package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class PdsInputOkCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024 * 1024 * 30;
		String encoding = "UTF-8";
		
		MultipartRequest multipartrequest = new MultipartRequest(request, realPath,maxSize,encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartrequest.getFileNames();
		String file = "";
		String oFileName = "";
		String fSName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String)fileNames.nextElement();
			
			if(multipartrequest.getFilesystemName(file) != null) {
				oFileName += multipartrequest.getOriginalFileName(file);
				fSName += multipartrequest.getFilesystemName(file);
			}
		}
		
		//업로드시킨 파일의 정보를 DB에 저장시키기 위해서 전송된 폼의 내용들을 모두 변수에 담아준다
		String mid = multipartrequest.getParameter("mid") == null ? "" : multipartrequest.getParameter("mid");
		String nickName = multipartrequest.getParameter("nickName") == null ? "" : multipartrequest.getParameter("nickName");
		int fSize = multipartrequest.getParameter("fSize") == null ? 0 : Integer.parseInt(multipartrequest.getParameter("fSize"));
		String title = multipartrequest.getParameter("title") == null ? "" : multipartrequest.getParameter("title");
		String part = multipartrequest.getParameter("part") == null ? "" : multipartrequest.getParameter("part");
		String openSw = multipartrequest.getParameter("openSw") == null ? "" : multipartrequest.getParameter("openSw");
		String pwd = multipartrequest.getParameter("pwd") == null ? "" : multipartrequest.getParameter("pwd");
		String hostIp = multipartrequest.getParameter("hostIp") == null ? "" : multipartrequest.getParameter("hostIp");
		String content = multipartrequest.getParameter("content") == null ? "" : multipartrequest.getParameter("content");
		
		//비밀번호 암호화(SHA-256)
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		//가공처리된 모든 자료들을 VO에 담아서 DB에 저장한다
		PdsVO vo = new PdsVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(oFileName);
		vo.setfSName(fSName);
		vo.setfSize(fSize);
		vo.setTitle(title);
		vo.setPart(part);
		vo.setOpenSw(openSw);
		vo.setPwd(pwd);
		vo.setHostIp(hostIp);
		vo.setContent(content);
		
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsInputOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "자료실에 자료가 업로드 되었습니다.");
			request.setAttribute("url", "PdsList.pds");
		}
		else {
			request.setAttribute("message", "자료실에 자료 업로드 실패~~");
			request.setAttribute("url", "PdsInput.pds");
		}
	}
	
}
