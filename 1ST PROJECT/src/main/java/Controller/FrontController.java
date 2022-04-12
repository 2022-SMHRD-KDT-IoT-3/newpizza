package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Service.AddDeviceSensor;
import Service.AddDummy;
import Service.AddSensor;
import Service.AdminMemberDeleteService;
import Service.AdminMemberUpdateService;
import Service.AdminMonitoringStandardAdd;
import Service.AdminSensorUpdate;
import Service.AdminWarehouseUpdate;
import Service.FindId;
import Service.FindPw;
import Service.IdCheckService;
import Service.JoinService;
import Service.LoginService;
import Service.LogoutService;
import Service.MemberUpdateService;
import Service.UpdatePhone;
import Service.UpdatePw;
import Service.WarehouseInsertService;
import Service.WriteboardService;
import Service.DeleteWareHouse;

//.do�� ������ ���ڿ� ���ΰ��� �� ���Խ�Ŵ
@WebServlet("*.do")
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[FrontController ����]");
		String nextpage = "";
		Command com = null;

		String uri = request.getRequestURI();
		System.out.println(uri);

		String path = request.getContextPath();
		System.out.println(path);

		String command = uri.substring(path.length() + 1);
		System.out.println(command);

		if (command.equals("LoginServiceCon.do")) {
			System.out.println("[�α��μ��񽺽���]");
			com = new LoginService();
			nextpage = com.execute(request, response);
		} else if (command.equals("JoinServiceCon.do")) {
			System.out.println("[ȸ�����Լ��񽺽���]");
			com = new JoinService();
			nextpage = com.execute(request, response);
		} else if (command.equals("IdCheckServiceCon.do")) {
			System.out.println("[���̵��ߺ�üũ���񽺽���]");
			com = new IdCheckService();
			nextpage = com.execute(request, response);
		} else if (command.equals("MemberUpdateServiceCon.do")) {
			System.out.println("[ȸ�������������񽺽���]");
			com = new MemberUpdateService();
			nextpage = com.execute(request, response);

		} else if (command.equals("DeleteServiceCon.do")) {
			System.out.println("[ȸ�������������񽺽���]");
			com = new AdminMemberDeleteService();
			nextpage = com.execute(request, response);

		} else if (command.equals("LogoutServiceCon.do")) {
			System.out.println("[�α׾ƿ����񽺽���]");
			com = new LogoutService();
			nextpage = com.execute(request, response);

		} else if (command.equals("WarehouseInsertServiceCon.do")) {
			System.out.println("[â�������Է¼��񽺽���]");
			com = new WarehouseInsertService();
			nextpage = com.execute(request, response);

		} else if (command.equals("WarehouseUpdateServiceCon.do")) {
			System.out.println("[â�������������񽺽���]");
			com = new AdminWarehouseUpdate();
			nextpage = com.execute(request, response);

		} else if (command.equals("SensorStandardSetSerivce.do")) {
			System.out.println("[�������ذ��������񽺽���]");
			com = new AdminMonitoringStandardAdd();
			nextpage = com.execute(request, response);

		} else if (command.equals("FindIdServiceCon.do")) {
			System.out.println("[���̵�ã�⼭�񽺽���]");
			com = new FindId();
			nextpage = com.execute(request, response);

		} else if (command.equals("FindPwServiceCon.do")) {
			System.out.println("[��й�ȣã�⼭�񽺽���]");
			com = new FindPw();
			nextpage = com.execute(request, response);
		} else if (command.equals("UpdatePhoneService.do")) {
			System.out.println("[��ȭ��ȣ ���� ���񽺽���]");
			com = new UpdatePhone();
			nextpage = com.execute(request, response);
		} else if (command.equals("UpdatePwService.do")) {
			System.out.println("[��й�ȣ ���� ���񽺽���]");
			com = new UpdatePw();
			nextpage = com.execute(request, response);
		} else if (command.equals("AdminMemberUpdateServiceCon.do")) {
			System.out.println("[������ ȸ���������� ���񽺽���]");
			com = new AdminMemberUpdateService();
			nextpage = com.execute(request, response);
		} else if (command.equals("AddSensorServicecon.do")) {
			System.out.println("[������ ���� �߰� ���񽺽���]");
			com = new AddSensor();
			nextpage = com.execute(request, response);
		} else if (command.equals("AddDeviceSensorServicecon.do")) {
			System.out.println("[������ ����̽� �߰� ���񽺽���]");
			com = new AddDeviceSensor();
			nextpage = com.execute(request, response);
		} else if (command.equals("AddDummyServicecon.do")) {
			System.out.println("[���̵����� �߰� ���񽺽���]");
			com = new AddDummy();
			nextpage = com.execute(request, response);
		} else if (command.equals("DeleteWareHouse.do")) {
			System.out.println("[â���������� ���� ����]");
			com = new DeleteWareHouse();
			nextpage = com.execute(request, response);
		} else if(command.equals("WriteboardService.do")) {
			System.out.println("[�Խ��Ǳ� �ۼ� ����]");
			com = new WriteboardService();
			nextpage = com.execute(request, response);
		}
					
		
		/*
		 * else if (command.equals("DeleteWareHouse.do")) {
		 * System.out.println("[���� ���� ���� ���� ����]"); com = new AdminSensorUpdate();
		 * nextpage = com.execute(request, response); }
		 */

		// else if (command.equals("AddDeviceServicecon.do")) {
		// System.out.println("[���� ������ �������� ���񽺽���]");
		// com = new GetCurSensorValue();
		// nextpage = com.execute(request, response);
		// }

		//
		if (nextpage != null) {
			response.sendRedirect(nextpage);
			// else if (command.equals("AddDeviceServicecon.do")) {
			// System.out.println("[���� ������ �������� ���񽺽���]");
			// com = new GetCurSensorValue();
			// nextpage = com.execute(request, response);
			// }

			//

	}
	}
}
