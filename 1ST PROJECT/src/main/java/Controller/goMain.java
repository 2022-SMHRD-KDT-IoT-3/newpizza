package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.T_MemberDTO;

@WebServlet("/goMain")
public class goMain extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 세션 정보
		System.out.println("[goMain]");
		
		HttpSession session = request.getSession();
		T_MemberDTO dto = (T_MemberDTO)session.getAttribute("info");
		// System.out.println(dto.getMem_id());

//		//메세지 출력
		if(dto != null) {
//			//로그인 상태
//			MessageDAO dao = new MessageDAO();
//			List<MessageDTO> msglist = dao.selectMsg(dto.getEmail());

		// List에 담긴 정보 가진채로 페이지 이동
		// forward방식으로 이동하기 전에 List 정보 저장
		// request scope
//			request.setAttribute("msglist", msglist);
//			
//			
//			
		}else {
//			
		}

		// forward 방식으로 페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
		rd.forward(request, response);

	}

}
