package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_MemberDAO;

public class AdminMemberDeleteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[AdminMemberDeleteService]");
		
		// 회원정보 삭제 기능

		String mem_id = request.getParameter("mem_id");

		T_MemberDAO dao = new T_MemberDAO();
		int cnt = dao.MemberDelete(mem_id);

		if (cnt > 0) {
			System.out.println("회원정보 삭제 성공");
		} else {
			System.out.println("회원정보 삭제 실패");
		}

		String nextpage = "AdminMemberSelect.jsp";

		return nextpage;
	}

}
