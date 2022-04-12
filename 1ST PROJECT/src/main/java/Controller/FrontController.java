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

//.do로 끝나는 문자열 맵핑값을 다 포함시킴
@WebServlet("*.do")
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[FrontController 실행]");
		String nextpage = "";
		Command com = null;

		String uri = request.getRequestURI();
		System.out.println(uri);

		String path = request.getContextPath();
		System.out.println(path);

		String command = uri.substring(path.length() + 1);
		System.out.println(command);

		if (command.equals("LoginServiceCon.do")) {
			System.out.println("[로그인서비스실행]");
			com = new LoginService();
			nextpage = com.execute(request, response);
		} else if (command.equals("JoinServiceCon.do")) {
			System.out.println("[회원가입서비스실행]");
			com = new JoinService();
			nextpage = com.execute(request, response);
		} else if (command.equals("IdCheckServiceCon.do")) {
			System.out.println("[아이디중복체크서비스실행]");
			com = new IdCheckService();
			nextpage = com.execute(request, response);
		} else if (command.equals("MemberUpdateServiceCon.do")) {
			System.out.println("[회원정보수정서비스실행]");
			com = new MemberUpdateService();
			nextpage = com.execute(request, response);

		} else if (command.equals("DeleteServiceCon.do")) {
			System.out.println("[회원정보삭제서비스실행]");
			com = new AdminMemberDeleteService();
			nextpage = com.execute(request, response);

		} else if (command.equals("LogoutServiceCon.do")) {
			System.out.println("[로그아웃서비스실행]");
			com = new LogoutService();
			nextpage = com.execute(request, response);

		} else if (command.equals("WarehouseInsertServiceCon.do")) {
			System.out.println("[창고정보입력서비스실행]");
			com = new WarehouseInsertService();
			nextpage = com.execute(request, response);

		} else if (command.equals("WarehouseUpdateServiceCon.do")) {
			System.out.println("[창고정보수정서비스실행]");
			com = new AdminWarehouseUpdate();
			nextpage = com.execute(request, response);

		} else if (command.equals("SensorStandardSetSerivce.do")) {
			System.out.println("[센서기준값설정서비스실행]");
			com = new AdminMonitoringStandardAdd();
			nextpage = com.execute(request, response);

		} else if (command.equals("FindIdServiceCon.do")) {
			System.out.println("[아이디찾기서비스실행]");
			com = new FindId();
			nextpage = com.execute(request, response);

		} else if (command.equals("FindPwServiceCon.do")) {
			System.out.println("[비밀번호찾기서비스실행]");
			com = new FindPw();
			nextpage = com.execute(request, response);
		} else if (command.equals("UpdatePhoneService.do")) {
			System.out.println("[전화번호 변경 서비스실행]");
			com = new UpdatePhone();
			nextpage = com.execute(request, response);
		} else if (command.equals("UpdatePwService.do")) {
			System.out.println("[비밀번호 변경 서비스실행]");
			com = new UpdatePw();
			nextpage = com.execute(request, response);
		} else if (command.equals("AdminMemberUpdateServiceCon.do")) {
			System.out.println("[관리자 회원정보수정 서비스실행]");
			com = new AdminMemberUpdateService();
			nextpage = com.execute(request, response);
		} else if (command.equals("AddSensorServicecon.do")) {
			System.out.println("[관리자 센서 추가 서비스실행]");
			com = new AddSensor();
			nextpage = com.execute(request, response);
		} else if (command.equals("AddDeviceSensorServicecon.do")) {
			System.out.println("[관리자 디바이스 추가 서비스실행]");
			com = new AddDeviceSensor();
			nextpage = com.execute(request, response);
		} else if (command.equals("AddDummyServicecon.do")) {
			System.out.println("[더미데이터 추가 서비스실행]");
			com = new AddDummy();
			nextpage = com.execute(request, response);
		} else if (command.equals("DeleteWareHouse.do")) {
			System.out.println("[창고정보삭제 서비스 실행]");
			com = new DeleteWareHouse();
			nextpage = com.execute(request, response);
		} else if(command.equals("WriteboardService.do")) {
			System.out.println("[게시판글 작성 실행]");
			com = new WriteboardService();
			nextpage = com.execute(request, response);
		}
					
		
		/*
		 * else if (command.equals("DeleteWareHouse.do")) {
		 * System.out.println("[센서 정보 변경 서비스 실행]"); com = new AdminSensorUpdate();
		 * nextpage = com.execute(request, response); }
		 */

		// else if (command.equals("AddDeviceServicecon.do")) {
		// System.out.println("[현재 센서값 가져오기 서비스실행]");
		// com = new GetCurSensorValue();
		// nextpage = com.execute(request, response);
		// }

		//
		if (nextpage != null) {
			response.sendRedirect(nextpage);
			// else if (command.equals("AddDeviceServicecon.do")) {
			// System.out.println("[현재 센서값 가져오기 서비스실행]");
			// com = new GetCurSensorValue();
			// nextpage = com.execute(request, response);
			// }

			//

	}
	}
}
