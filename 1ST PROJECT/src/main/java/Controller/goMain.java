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

		// ���� ����
		System.out.println("[goMain]");
		
		HttpSession session = request.getSession();
		T_MemberDTO dto = (T_MemberDTO)session.getAttribute("info");
		// System.out.println(dto.getMem_id());

//		//�޼��� ���
		if(dto != null) {
//			//�α��� ����
//			MessageDAO dao = new MessageDAO();
//			List<MessageDTO> msglist = dao.selectMsg(dto.getEmail());

		// List�� ��� ���� ����ä�� ������ �̵�
		// forward������� �̵��ϱ� ���� List ���� ����
		// request scope
//			request.setAttribute("msglist", msglist);
//			
//			
//			
		}else {
//			
		}

		// forward ������� ������ �̵�
		RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
		rd.forward(request, response);

	}

}
