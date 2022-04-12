package Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Inter.Command;
import Model.T_DeviceDAO;
import Model.T_DeviceDTO;
import Model.T_SensorDAO;
import Model.T_SensorDTO;

public class AddDeviceSensor implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		// �����߰� ���
		System.out.println("[AddDeviceSensor.java]");
		System.out.println("[AddDevice]");
		String nextpage = "AdminAddSensor.jsp"; // �Ƹ� â����ü ��ȸ �������� ���� �Ұ����� ������ 

		// 1. post��� ���ڵ�
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 2. ������ �޾ƿ���
		
		String device_uid = request.getParameter("device_uid");
		String mem_id = request.getParameter("mem_id");
		String device_loc = request.getParameter("device_loc");
		String device_inst_date = request.getParameter("device_inst_date");
		
		T_DeviceDTO dto = new T_DeviceDTO(device_uid, device_loc, device_inst_date, mem_id);
		
		T_DeviceDAO dao = new T_DeviceDAO();
		
		int cnt = dao.AddDevice(dto);
		
		PrintWriter out = response.getWriter();

		// 5. ������ Ȯ��
		if (cnt > 0) {
			System.out.println("�����߰��� �����Ͽ����ϴ�.");
			out.print("���� ���� \n");
			
		} else {
			System.out.println("�����߰��� �����Ͽ����ϴ�.");
			out.print("���� ���� \n");
		}
		
		// �����߰� ���
		System.out.println("[AddSensor]");
		
		// 1. post��� ���ڵ�
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 2. ������ �޾ƿ���
				
		String[] sensor_type = request.getParameterValues("sensorType");
		String[] sensorUnit = request.getParameterValues("sensorUnit");
		String[] sensorStandardValue = request.getParameterValues("sensorStandardValue");
		String[] sensorDate = request.getParameterValues("sensorDate");

		
			System.out.println(sensorStandardValue);
		
		for (int i = 1; i < sensorDate.length; i++) {
			
			System.out.println("sensNum : " + i + "\ntype : " + sensor_type[i] + "\nUnit : " + sensorUnit[i]
					+ "\nStandard : " + sensorStandardValue[i] + "\ninstdate : " + sensorDate[i]);
			
			T_SensorDTO sendto = new T_SensorDTO(sensor_type[i], sensorUnit[i], sensorDate[i]);
			
			T_SensorDAO sendao = new T_SensorDAO();
			
			int sencnt = sendao.AddSensor(sendto);
			
			// 5. ������ Ȯ��
			if (sencnt > 0) {
				System.out.println("�����߰��� �����Ͽ����ϴ�.");
				out.print("���� ���� \n");
				
			} else {
				System.out.println("�����߰��� �����Ͽ����ϴ�.");
				out.print("���� ���� \n");
			}
		}
		
		
		return nextpage;
	}
}
