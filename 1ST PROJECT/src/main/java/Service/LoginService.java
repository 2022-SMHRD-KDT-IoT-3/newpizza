package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;
import Model.T_MemberDAO;
import Model.T_MemberDTO;

public class LoginService implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//로그인 기능
		System.out.println("[LoginServiceCon]");
		
		// 1. post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2. email, pw 받아오기
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		// 3. login메소드 호출
		T_MemberDTO dto = new T_MemberDAO().login(mem_id, mem_pw);
		
		// 4. 성공실패여부
		if(dto != null) {
			System.out.println("-- 로그인 성공");
			System.out.println("로그인 아이디 : " + dto.getMem_id());
			System.out.println("로그인 비밀번호 : " + dto.getMem_pw());
			System.out.println("로그인 이름 : " + dto.getMem_name());
			
			HttpSession session = request.getSession();
			 session.setAttribute("info", dto);
			 //MemberDTO dtot = (MemberDTO)session.getAttribute("info");
			 // System.out.println(dtot.getMem_id());
		}else {
			System.out.println("-- 로그인 실패");
		}
		
		//로그인기능 마지막줄
		String nextpage = "goMain";
		
		return nextpage;
	}
}
