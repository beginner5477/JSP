package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do4")
public class Test4Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test4Interface command = null;
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI();
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		if(com.equals("test4")) {
			viewPage += "test4.jsp";
		}
		else if(com.equals("list")) {
			command = new Test4ListCommand();
			command.execute(request, response);
			// viewPage = "/WEB-INF/study2/mapping/list.jsp";
			viewPage += "list.jsp";
		}
		else if(com.equals("input")) {
			// viewPage = "/WEB-INF/study2/mapping/input.jsp";
			viewPage += "input.jsp";
		}
		else if(com.equals("inputOk")) {
			command = new Test4InputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("update")) {
			command = new Test4UpdateCommand();
			command.execute(request, response);
			viewPage += "update.jsp";
		}
		else if(com.equals("updateOk")) {
			command = new Test4UpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("delete")) {
			command = new Test4DeleteCommand();
			command.execute(request, response);
			viewPage += "delete.jsp";
		}
		else if(com.equals("deleteOk")) {
			command = new Test4DeleteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("search")) {
			command = new Test4SearchCommand();
			command.execute(request, response);
			viewPage += "search.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
