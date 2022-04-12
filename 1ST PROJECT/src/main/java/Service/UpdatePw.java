package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_MemberDAO;

public class UpdatePw implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[UpdatePw]");

		request.setCharacterEncoding("UTF-8");

		String mem_pw_cur = request.getParameter("mem_pw_cur");
		String mem_pw_new = request.getParameter("mem_pw_new");

		int cnt = new T_MemberDAO().UpdatePw(mem_pw_new, mem_pw_cur);
		System.out.println("������ ��й�ȣ : " + mem_pw_new);
		
		PrintWriter out = response.getWriter();

		if (cnt > 0) {
			System.out.println("��й�ȣ ���� ���� ");
			out.print(mem_pw_new);
			out.close();
		} else {
		System.out.println("��ȭ��ȣ ���� ����");
		}
		return null;
	}
}
