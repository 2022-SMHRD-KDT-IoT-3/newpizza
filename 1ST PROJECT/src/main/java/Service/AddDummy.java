package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_Sensor_valueDTO;
import Model.T_Sensor_valueDAO;

public class AddDummy implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		// 센서추가 기능
		System.out.println("[AddDummy]");
		String nextpage = "";

		// 1. post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 2. 데이터 받아오기
				
		String sensor_seq = request.getParameter("sensor_seq");
		String sv_data = request.getParameter("sv_data");
		String gate_num = request.getParameter("gate_num");
		
		T_Sensor_valueDTO dto = new T_Sensor_valueDTO(sensor_seq, sv_data, gate_num);
		
		T_Sensor_valueDAO dao = new T_Sensor_valueDAO();
		
		int cnt = dao.AddDummy(dto);
		
		PrintWriter out = response.getWriter();

		// 5. 실행결과 확인
		if (cnt > 0) {
			System.out.println("센서값 추가가 성공하였습니다.");
			out.print("저장 성공 \n");
			
		} else {
			System.out.println("센서값 추가가 실패하였습니다.");
			out.print("저장 실패 \n");
		}
		
		return null;
	}
}
