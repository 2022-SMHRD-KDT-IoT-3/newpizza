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

		// 회원가입 기능
		System.out.println("[JoinServiceCon]");
		String nextpage = "";

		// 1. post방식 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 데이터 받아오기
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

		// 3. 데이터 DTO로 묶기
		// MemberDTO dto = new MemberDTO()
//		MemberDTO dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_joindate, mem_type);
		T_MemberDTO dto = new T_MemberDTO(mem_id, mem_pw, mem_name, mem_phone);

		// 4. DB 연결할 DAO 호출
		T_MemberDAO dao = new T_MemberDAO();
		int cnt = dao.join(dto);

		// 세션 선언
		HttpSession Session = request.getSession();

		// 5. 실행결과 확인
		if (cnt > 0) {
			System.out.println("회원가입이 성공하였습니다.");

		Session.setAttribute("mem_name", mem_name);

			nextpage = "Index.jsp";

		} else {
			System.out.println("회원가입이 실패하였습니다.");
			nextpage = "goMain";
		}

		return nextpage;

		// 회원가입 기능 마지막 줄
	}
}
