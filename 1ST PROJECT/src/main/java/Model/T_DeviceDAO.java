package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class T_DeviceDAO {

	// 전역변수 선언
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	T_MemberDTO dto = null;
	int cnt = 0;

	// DB연결 메소드
	public Connection dbconn() {

		// 1. DB연결(ojdbc.6.jar 넣어주기)
		// 1-1. Class 찾기 : DB와 이클립스를 연결해주는 Class
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_0310_5";
			String dbpw = "smhrd5";

			// 1-3. Connection 객체 사용해서 DB연결!
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// DB연결종료 메소드
	public void dbclose() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * public int t_sensorAdd(T_SensorDTO dto) {
	 * System.out.println("t_sensorAdd 메소드 실행]"); dbconn(); try {
	 * 
	 * for (int i = 0; i<dto.getArray_sensor_type().length; i++) { String sql =
	 * "Insert into t_sensor values (sensor_seq.nextval, device_seq.nextval, ? , ? , ?)"
	 * ; psmt = conn.prepareStatement(sql); for (int j = 0;
	 * j<dto.getArray_sensor_type().length; i++) { String Sensor_type =
	 * dto.getArray_sensor_type()[i]; String Sensor_unit =
	 * dto.getArray_sensor_unit()[i]; String Sensor_inst_date =
	 * dto.getArray_sensor_inst_date()[i]; // console.log(Sensor_type);
	 * psmt.setString(1, Sensor_type); psmt.setString(2, Sensor_unit);
	 * psmt.setString(3, Sensor_inst_date); cnt = psmt.executeUpdate(); } }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { dbclose(); } return
	 * cnt;
	 * 
	 * }
	 */

	public int AddDevice(T_DeviceDTO dto) {

		
		System.out.println(dto.getDevice_uid());
		System.out.println(dto.getDevice_loc());
		System.out.println(dto.getDevice_inst_date());
		System.out.println(dto.getMem_id());
		
		dbconn();
		try {
			System.out.println("T_DeviceDAO 디바이스 추가 메소드 실행");

			String sql = "Insert into t_device(device_uid, device_loc, device_inst_date, mem_id) values (? , ? , ? , ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getDevice_uid());
			psmt.setString(2, dto.getDevice_loc());
			psmt.setString(3, dto.getDevice_inst_date());
			psmt.setString(4, dto.getMem_id());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

}
