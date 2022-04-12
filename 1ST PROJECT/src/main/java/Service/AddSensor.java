package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Inter.Command;
import Model.T_SensorDAO;
import Model.T_SensorDTO;

public class AddSensor implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		// 센서추가 기능
		System.out.println("[AddSensor]");
		String nextpage = "";

		// 1. post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 2. 데이터 받아오기
				
		String sensor_type = request.getParameter("sensor_type_value");
		String sensor_unit = request.getParameter("sensor_unit_value");
		String sensor_inst_date = request.getParameter("sensor_inst_date_value");
		
		T_SensorDTO dto = new T_SensorDTO(sensor_type, sensor_unit, sensor_inst_date);
		
		T_SensorDAO dao = new T_SensorDAO();
		
		int cnt = dao.AddSensor(dto);
		
		PrintWriter out = response.getWriter();

		// 5. 실행결과 확인
		if (cnt > 0) {
			System.out.println("센서추가가 성공하였습니다.");
			out.print("저장 성공 \n");
			
		} else {
			System.out.println("센서추가가 실패하였습니다.");
			out.print("저장 실패 \n");
		}
		
		return null;
	}
}
