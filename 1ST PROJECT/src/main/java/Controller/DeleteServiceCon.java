package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BoardDAO;

@WebServlet("/DeleteServiceCon")
public class DeleteServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String QNA_SEQ = request.getParameter("QNA_SEQ");
	
		BoardDAO dao = new BoardDAO();
		int cnt = dao.deleteBoard(QNA_SEQ);
		
		if(cnt>0) {
			response.sendRedirect("BoardDelete.jsp");
		}else {
			response.sendRedirect("BoardDelete.jsp");
			System.out.println("삭제 실패");
		}
		
	}

}
