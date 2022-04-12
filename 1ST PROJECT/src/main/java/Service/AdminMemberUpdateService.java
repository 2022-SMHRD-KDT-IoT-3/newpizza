package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_MemberDAO;

public class AdminMemberUpdateService implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[AdminMemberUpdateService]");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		
		System.out.println("회원아이디" + mem_id);
		System.out.println("회원 이름" + mem_name);
		System.out.println("회원 전화번호" + mem_phone);
		
		int cnt = new T_MemberDAO().AdminMemberUpdate(mem_name, mem_phone, mem_id);
		PrintWriter out = response.getWriter();
		
		
		if (cnt > 0) {
			out.write("success"); 
		} else {
			out.write("fail"); 
		}
		return null;
		}
		
		
		
}
