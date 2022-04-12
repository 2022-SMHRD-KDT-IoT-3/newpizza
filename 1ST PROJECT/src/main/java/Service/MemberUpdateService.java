package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;
import Model.T_MemberDAO;
import Model.T_MemberDTO;

public class MemberUpdateService implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[MemberUpdateServiceCon");
		
		request.setCharacterEncoding("UTF-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		
		T_MemberDTO dto = new T_MemberDTO(mem_id, mem_pw, mem_name, mem_phone);
		
		int cnt = new T_MemberDAO().MemberUpdate(dto);
		
		if(cnt>0) {
			System.out.println("-- 회원정보수정 성공");
			
			// 성공시 session에 새로운 정보로 update
			HttpSession session = request.getSession();
			session.setAttribute("info", dto);
		}else {
			System.out.println("-- 회원정보수정 실패");
		}
		String nextpage = "goMain";
		//회원정보 수정 기능 마지막줄
		
		return nextpage;
		
		
		
	}
}
