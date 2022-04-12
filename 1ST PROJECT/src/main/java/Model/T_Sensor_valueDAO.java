package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class T_Sensor_valueDAO {

	// �������� ����
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	T_MemberDTO dto = null;
	int cnt = 0;

	// DB���� �޼ҵ�
	public Connection dbconn() {

		// 1. DB����(ojdbc.6.jar �־��ֱ�)
		// 1-1. Class ã�� : DB�� ��Ŭ������ �������ִ� Class
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1-2. DB�� �����ϱ� ���� �ּ�, ���̵�, �н����� ����
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_0310_5";
			String dbpw = "smhrd5";

			// 1-3. Connection ��ü ����ؼ� DB����!
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// DB�������� �޼ҵ�
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
	
	// ���̵����� �Է� �޼ҵ�
	public int AddDummy(T_Sensor_valueDTO dto) {
		dbconn();
		try {
			System.out.println("[TSensorValue ���̵����� �߰� �޼ҵ� ����]");

			// sql�� �ۼ�
			
			System.out.println(dto.getSensor_seq());
			System.out.println(dto.getSv_data());
			System.out.println(dto.getGate_num());

			String sql = "Insert into t_sensor_value(sensor_seq, sv_data, gate_num) values (? , ? , ?)";

			// sql�� db�� ����
			psmt = conn.prepareStatement(sql);

			// ?�� �� ä���
			psmt.setString(1, dto.getSensor_seq());
			psmt.setString(2, dto.getSv_data());
			psmt.setString(3, dto.getGate_num());

			// sql�� ����
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;

	}
	
	// db���� �� �ҷ����� �޼ҵ�
	public ArrayList<T_Sensor_valueDTO> getData() {
		
		ArrayList<T_Sensor_valueDTO> list = new ArrayList<T_Sensor_valueDTO>();
	
		dbconn();

		try {
			// String sql = "select mem_id M t_device_seq D sensor_type S from t_sensor_value";
			
			// String sql = "select * from (select * from t_sensor_value where sensor_seq = 1 order by sv_date desc) where rownum < 2";
			// String sql = "select * from (select * from t_sensor_value where sensor_type = 'CO' order by sv_date desc) where rownum < 2";
			
			
//			 String sql = "SELECT *  FROM (SELECT A.SENSOR_SEQ, A.SENSOR_TYPE, B.SV_DATA, TO_CHAR(B.SV_DATE,'YYYY-MM-DD HH24:MI:SS') �������� FROM T_SENSOR A, T_SENSOR_VALUE  B WHERE A.SENSOR_SEQ = B.SENSOR_SEQ  AND B.MEM_ID='test' ORDER BY B.SV_DATE DESC) where rownum < 2";
//			 String sql = "SELECT *  FROM (SELECT A.SENSOR_SEQ, A.SENSOR_TYPE, B.SV_DATA, TO_CHAR(B.SV_DATE,'YYYY-MM-DD HH24:MI:SS') �������� FROM T_SENSOR A, T_SENSOR_VALUE  B WHERE A.SENSOR_SEQ = B.SENSOR_SEQ  AND B.MEM_ID='test' AND A.sensor_type='CO' ORDER BY B.SV_DATE DESC) where rownum < 2";
			
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
			 System.out.println("������ �߰� ����!");
			}else {
				System.out.println("������ �߰� �� ���� ����");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[dao.setDBSV ����!]");
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
