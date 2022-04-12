package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;
import Model.T_MemberDAO;
import Model.T_MemberDTO;

public class JoinService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ȸ������ ���
		System.out.println("[JoinServiceCon]");
		String nextpage = "";

		// 1. post��� ���ڵ�
		request.setCharacterEncoding("UTF-8");

		// 2. ������ �޾ƿ���
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw_new");
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		// String mem_joindate = "sysdate";
		// String mem_type = "u";
				
		

		System.out.println("id : " + mem_id);
		System.out.println("pw : " + mem_pw);
		System.out.println("name : " + mem_name);
		System.out.println("tel : " + mem_phone);

		// 3. ������ DTO�� ����
		// MemberDTO dto = new MemberDTO()
//		MemberDTO dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_joindate, mem_type);
		T_MemberDTO dto = new T_MemberDTO(mem_id, mem_pw, mem_name, mem_phone);

		// 4. DB ������ DAO ȣ��
		T_MemberDAO dao = new T_MemberDAO();
		int cnt = dao.join(dto);

		// ���� ����
		HttpSession Session = request.getSession();

		// 5. ������ Ȯ��
		if (cnt > 0) {
			System.out.println("ȸ�������� �����Ͽ����ϴ�.");

		Session.setAttribute("mem_name", mem_name);

			nextpage = "Index.jsp";

		} else {
			System.out.println("ȸ�������� �����Ͽ����ϴ�.");
			nextpage = "goMain";
		}

		return nextpage;

		// ȸ������ ��� ������ ��
	}
}
