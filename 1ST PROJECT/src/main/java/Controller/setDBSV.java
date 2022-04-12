package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.T_SensorDAO;
import Model.T_Sensor_valueDAO;
import Model.T_Sensor_valueDTO;
import Model.T_Standard_valuseDAO;

@WebServlet("/setDBSV")
public class setDBSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
	T_Sensor_valueDAO svdao = new T_Sensor_valueDAO();
	T_SensorDAO sendao = new T_SensorDAO();
	String sen_Seq = "0";
	String value = "0";
	String mid = "";
	String WH = "0";
	String hum = null;
	String temp = null;
	String co = null;
	String pir = null;
	String magnetic = null;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[setDBSV.java]");
		// get 방식을 활용한 페이지

		PrintWriter out = response.getWriter();

		request.setCharacterEncoding("utf-8");

		response.setContentType("text/html;charset=UTF-8");
		//mid = request.getParameter("mid");
		mid = "test";
		hum = request.getParameter("hum");
		temp = request.getParameter("temp");
		co = request.getParameter("CO");
		pir = request.getParameter("motion");
		magnetic = request.getParameter("magnetic");
	
		sen_Seq = request.getParameter("senseq"); // 센서 관리용 번호
		WH = "61";
		System.out.println("hum : " + hum + "\ntemp : " + temp + "\nco : " + co + "\npir : " + pir + "\nmagnetic : "
				+ magnetic + "\nsenseq : " + sen_Seq + "\nWH : " + WH);

		sensor("hum", hum);
		sensor("temp", temp);
		sensor("co", co);
		sensor("pir", pir);
		sensor("magnetic", magnetic);

		int cntAlert = 0;
		cntAlert += alert("hum", hum, WH);
		cntAlert += alert("temp", temp, WH);
		cntAlert += alert("co", co, WH);
		cntAlert += alert("pir", pir, WH);
		cntAlert += alert("magnetic", magnetic, WH);
		System.out.println("cntAlert : " + cntAlert);

		if (cntAlert < 3) {
			out.print("{alert : 0}\n");
			cntAlert++;
			System.out.println("=====[Non Alert]=====");
		} else {
			out.print("{alert : 1}\n");
			cntAlert--;
			;
			System.out.println("=====[Alert]=====");
		}
		// 아이디어 한번 오류로 는 오류 값 있을 수 있으므로 5번 연속(연속 아니면 cnt 0으로) cnt 올라갈시 경보나 알람 울리게 설정
	}

	public void sensor(String sensorName, String sensorValue) {
		System.out.println("[method : sensor]");
		if (sensorValue != null) {
			int sv_seq = 0;
			float SV_Data = Float.parseFloat(sensorValue);
			int W_Seq = Integer.parseInt(WH);
			String sensor_Type = sensorName;
			sv_seq = sendao.getSensorSeq(W_Seq, sensor_Type);
			svdao.setDBSV(sv_seq, SV_Data, W_Seq, mid);
			System.out.println("sensorType : " + sensorName + "\nSV_Data : " + SV_Data + "\nsenseq : " + sv_seq
					+ "\nWH : " + W_Seq);
		} else {
			System.out.println("센서값 없음");
		}
	}

	public int alert(String sensorName, String sensorValue, String WH) {
		// sensor standard DTO = standardValue 가 들어가야함
		float SV_Data = 0;
		int W_Seq = 0;

		if (sensorValue != null) {
			SV_Data = Float.parseFloat(sensorValue);
			W_Seq = Integer.parseInt(WH);
		} else {
			System.out.println("센서값 없음");
		}

		T_Standard_valuseDAO ssdao = new T_Standard_valuseDAO();
		int chk = 0;
		chk = ssdao.standardForAlert(sensorName, SV_Data, W_Seq);
		int cnt = 0;
		if (chk > 0) {
			int standardValue = 0;
			Float senval = Float.parseFloat(sensorValue);
			if (standardValue < senval) {
				cnt++;

				return cnt;
			} else {
				System.out.println("센서값 없음");
				cnt--;
			}
		}
		return cnt;
	}

}