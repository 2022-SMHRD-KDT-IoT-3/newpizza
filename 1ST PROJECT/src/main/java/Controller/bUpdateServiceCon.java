package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bUpdateServiceCon")
public class bUpdateServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[BoardUpdateServiceCon]");
		
		// post방식 인코딩
		request.setCharacterEncoding("EUC-KR");
		
		// 값 3개
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String  mem_id= request.getParameter("mem_id");
		
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("ID : " + mem_id);
		
		
	}

}
