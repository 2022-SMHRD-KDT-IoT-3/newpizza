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

		// 1. post��� ���ڵ�
		request.setCharacterEncoding("UTF-8");

		// 2. ������ �޾ƿ���
		String sensor_type = request.getParameter("sensor_type");
		int st_value = Integer.parseInt(request.getParameter("st_value"));
		int w_seq = Integer.parseInt(request.getParameter("w_seq"));

		System.out.println("�������� : " + sensor_type);
		System.out.println("���� �� : " + st_value);
		System.out.println("â�� ���� : " + w_seq);

		// 3. ������ DTO�� ����
		// MemberDTO dto = new MemberDTO()
//	MemberDTO dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_joindate, mem_type);
		T_Standard_valuseDTO dto = new T_Standard_valuseDTO(sensor_type, st_value, w_seq);

		// 4. DB ������ DAO ȣ��
		T_Standard_valuseDAO dao = new T_Standard_valuseDAO();
		int cnt = dao.insert(dto);

		// ���� ����
		// HttpSession Session = request.getSession();

		// 5. ������ Ȯ��
		if (cnt > 0) {
			System.out.println("â�� ���� ������ �����Ͽ����ϴ�.");

			// Session.setAttribute("mem_name", mem_name);

			nextpage = "index.jsp";

		} else {
			System.out.println("â�� ���� ������ �����Ͽ����ϴ�.");
			nextpage = "goMain";
		}

		return nextpage;

		// ȸ������ ��� ������ ��
	}
}
