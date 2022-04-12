package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_MemberDAO;

public class UpdatePhone implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[UpdatePhone]");

		request.setCharacterEncoding("UTF-8");

		String mem_phone_cur = request.getParameter("mem_phone_cur");
		String mem_phone_new = request.getParameter("mem_phone_new");

		int cnt = new T_MemberDAO().UpdatePhone(mem_phone_new, mem_phone_cur);
		System.out.println("변경할 전화번호 : " + mem_phone_new);
		
		PrintWriter out = response.getWriter();

		if (cnt > 0) {
			System.out.println("전화번호 변경 성공 ");
			out.print(mem_phone_new);
			out.close();
		} else {
		System.out.println("전화번호 변경 실패");
		}
		return null;
	}
}
