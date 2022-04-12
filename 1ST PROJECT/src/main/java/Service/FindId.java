package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_MemberDAO;

public class FindId implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[FindIdService]");
		
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		
		String mem_id = new T_MemberDAO().FindId(mem_name, mem_phone);
		
		PrintWriter out = response.getWriter();
		out.print(mem_id);
		out.close();
		
		/*if(mem_id != null) {
			System.out.println("아이디 찾기 성공");
			System.out.println("찾은 아이디 : " + mem_id);
		} else {
			System.out.println("아이디 찾기 실패");
		}*/
			
		return null;
		}
		
		
		
}
