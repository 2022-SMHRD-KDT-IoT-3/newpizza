package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_Standard_valuseDAO;
import Model.T_Standard_valuseDTO;

public class AdminMonitoringStandardAdd implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[AdminMonitoringStandardAdd]");
		String nextpage = "";

		// 1. post방식 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 데이터 받아오기
		String sensor_type = request.getParameter("sensor_type");
		int st_value = Integer.parseInt(request.getParameter("st_value"));
		int w_seq = Integer.parseInt(request.getParameter("w_seq"));

		System.out.println("센서종류 : " + sensor_type);
		System.out.println("기준 값 : " + st_value);
		System.out.println("창고 순번 : " + w_seq);

		// 3. 데이터 DTO로 묶기
		// MemberDTO dto = new MemberDTO()
//	MemberDTO dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_joindate, mem_type);
		T_Standard_valuseDTO dto = new T_Standard_valuseDTO(sensor_type, st_value, w_seq);

		// 4. DB 연결할 DAO 호출
		T_Standard_valuseDAO dao = new T_Standard_valuseDAO();
		int cnt = dao.insert(dto);

		// 세션 선언
		// HttpSession Session = request.getSession();

		// 5. 실행결과 확인
		if (cnt > 0) {
			System.out.println("창고 조건 설정이 성공하였습니다.");

			// Session.setAttribute("mem_name", mem_name);

			nextpage = "index.jsp";

		} else {
			System.out.println("창고 조건 설정이 실패하였습니다.");
			nextpage = "goMain";
		}

		return nextpage;

		// 회원가입 기능 마지막 줄
	}
}
