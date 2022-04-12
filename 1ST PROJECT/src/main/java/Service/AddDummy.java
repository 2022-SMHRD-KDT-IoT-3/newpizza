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

		
		
		// �����߰� ���
		System.out.println("[AddDummy]");
		String nextpage = "";

		// 1. post��� ���ڵ�
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 2. ������ �޾ƿ���
				
		String sensor_seq = request.getParameter("sensor_seq");
		String sv_data = request.getParameter("sv_data");
		String gate_num = request.getParameter("gate_num");
		
		T_Sensor_valueDTO dto = new T_Sensor_valueDTO(sensor_seq, sv_data, gate_num);
		
		T_Sensor_valueDAO dao = new T_Sensor_valueDAO();
		
		int cnt = dao.AddDummy(dto);
		
		PrintWriter out = response.getWriter();

		// 5. ������ Ȯ��
		if (cnt > 0) {
			System.out.println("������ �߰��� �����Ͽ����ϴ�.");
			out.print("���� ���� \n");
			
		} else {
			System.out.println("������ �߰��� �����Ͽ����ϴ�.");
			out.print("���� ���� \n");
		}
		
		return null;
	}
}
