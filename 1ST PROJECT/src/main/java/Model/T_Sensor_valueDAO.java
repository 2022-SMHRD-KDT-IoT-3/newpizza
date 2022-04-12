package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class T_Sensor_valueDAO {

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
	
	// 더미데이터 입력 메소드
	public int AddDummy(T_Sensor_valueDTO dto) {
		dbconn();
		try {
			System.out.println("[TSensorValue 더미데이터 추가 메소드 실행]");

			// sql문 작성
			
			System.out.println(dto.getSensor_seq());
			System.out.println(dto.getSv_data());
			System.out.println(dto.getGate_num());

			String sql = "Insert into t_sensor_value(sensor_seq, sv_data, gate_num) values (? , ? , ?)";

			// sql문 db에 전달
			psmt = conn.prepareStatement(sql);

			// ?에 값 채우기
			psmt.setString(1, dto.getSensor_seq());
			psmt.setString(2, dto.getSv_data());
			psmt.setString(3, dto.getGate_num());

			// sql문 실행
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;

	}
	
	// db에서 값 불러오는 메소드
	public ArrayList<T_Sensor_valueDTO> getData() {
		
		ArrayList<T_Sensor_valueDTO> list = new ArrayList<T_Sensor_valueDTO>();
	
		dbconn();

		try {
			// String sql = "select mem_id M t_device_seq D sensor_type S from t_sensor_value";
			
			// String sql = "select * from (select * from t_sensor_value where sensor_seq = 1 order by sv_date desc) where rownum < 2";
			// String sql = "select * from (select * from t_sensor_value where sensor_type = 'CO' order by sv_date desc) where rownum < 2";
			
			
//			 String sql = "SELECT *  FROM (SELECT A.SENSOR_SEQ, A.SENSOR_TYPE, B.SV_DATA, TO_CHAR(B.SV_DATE,'YYYY-MM-DD HH24:MI:SS') 측정일자 FROM T_SENSOR A, T_SENSOR_VALUE  B WHERE A.SENSOR_SEQ = B.SENSOR_SEQ  AND B.MEM_ID='test' ORDER BY B.SV_DATE DESC) where rownum < 2";
//			 String sql = "SELECT *  FROM (SELECT A.SENSOR_SEQ, A.SENSOR_TYPE, B.SV_DATA, TO_CHAR(B.SV_DATE,'YYYY-MM-DD HH24:MI:SS') 측정일자 FROM T_SENSOR A, T_SENSOR_VALUE  B WHERE A.SENSOR_SEQ = B.SENSOR_SEQ  AND B.MEM_ID='test' AND A.sensor_type='CO' ORDER BY B.SV_DATE DESC) where rownum < 2";
			
String sql = "SELECT * FROM (SELECT A.mem_id, B.device_seq, B.sensor_type, C.sv_data, C.sv_date FROM t_device A, t_sensor B, t_sensor_value C WHERE A.device_seq = B.device_seq AND B.sensor_seq = C.sensor_seq AND A.mem_id = 'test' order by C.sv_date desc) where rownum < 6";			
			
			// select * from (select * from t_sensor_value where sensor_seq = 1 order by sv_date desc) where rownum < 2 ;
			
			/*
			 * SELECT DISTINCT a.deptno , b.dname FROM emp a , dept b WHERE a.deptno =
			 * b.deptno AND a.sal > 1500
			 */
			
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String device_seq = rs.getString(2);
				String sensor_type = rs.getString(3);
				String sv_data = rs.getString(4);
				String sv_date =rs.getString(5);
				
				T_Sensor_valueDTO dto = new T_Sensor_valueDTO(device_seq, sensor_type, sv_data, sv_date);
				list.add(dto);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
          return list;
	}
	
	public void setDBSV(int Sensor_seq, float Sv_data, int Gate_num, String Mem_id) {	
		dbconn();
		try {
			String sql = "insert into t_sensor_value values (T_SENSOR_VALUE_SEQ.nextval, ? , ? , systimestamp,  ?, ?) ";
			psmt = conn.prepareStatement(sql);
						
			psmt.setInt(1, Sensor_seq);
			psmt.setFloat(2, Sv_data);
			psmt.setInt(3, Gate_num);
			psmt.setString(4, Mem_id);
			
			cnt = psmt.executeUpdate();
			
			if(cnt>0) {
			 System.out.println("데이터 추가 성공!");
			}else {
				System.out.println("데이터 추가 할 것이 없음");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[dao.setDBSV 오류!]");
		}finally {
			dbclose();
		}
	}
	
	  public String getWhNum(String sensor_seq) {
	      dbconn();
	      try {
	         String sql = "select distinct gate_num from t_sensor_value where sensor_seq = ?";
	         
	         psmt = conn.prepareStatement(sql);
	         
	         psmt.setString(1, sensor_seq);
	         
	         rs = psmt.executeQuery();
	         String Wh = "";
	         if(rs.next()) {
	          Wh = rs.getString(1);
	          return Wh;
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         dbclose();
	      }
	      
	      
	      return null;
	   }


	
}
