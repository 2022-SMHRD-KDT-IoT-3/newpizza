package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class T_Standard_valuseDAO {

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

	// 센서 기준값 삽입 메소드

	public int insert(T_Standard_valuseDTO dto) {
		dbconn();
		try {
			System.out.println("[Standard_valuesDAO insert 메소드 실행]");

			String sql = "INSERT INTO t_standard_valuse(sensor_type, st_value, w_seq) VALUES (?,?,?)";
			psmt = conn.prepareStatement(sql);
			System.out.println(dto.getSensor_type());
			System.out.println(dto.getSt_value());
			System.out.println(dto.getW_seq());
			psmt.setString(1, dto.getSensor_type());
			psmt.setString(2, dto.getSt_value());
			psmt.setString(3, dto.getW_seq());
			
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

	public ArrayList<T_Standard_valuseDTO> getStandard() {
		
		ArrayList<T_Standard_valuseDTO> list = new ArrayList<T_Standard_valuseDTO>();
	
		dbconn();

		try {
			String sql = "select * from t_standard_valuse";
			
			// select * from (select * from t_sensor_value where sensor_seq = 1 order by sv_date desc) where rownum < 2 ;
			

			
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {

				String st_seq = rs.getString(1);
				String sensor_type = rs.getString(2);
				String st_value = rs.getString(3);
				String w_seq =rs.getString(4);
				
				T_Standard_valuseDTO dto = new T_Standard_valuseDTO(st_seq, sensor_type, st_value,w_seq);
				list.add(dto);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
          return list;
	}
	
	public int standardForAlert(String sensorName, float SV_Data, int W_Seq) {
		System.out.println("[standardDAO.standardForAlert]");
		dbconn();
		int chk = 0;
		try {
			String sql = "select * from t_standard_valuse where sensor_type =? and w_seq=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, sensorName);
			psmt.setInt(2, W_Seq);
			
			rs = psmt.executeQuery();
					
			
			while(rs.next()) {
				String targetSensor =rs.getString("SENSOR_TYPE");
				float targetValue = rs.getFloat("ST_VALUE");
				System.out.println("비교할 센서 : " + targetSensor);
				System.out.println("비교할 기준값 : " + targetValue);
				if(SV_Data>targetValue) {
					chk++;
				}
			}
			System.out.println("기준 초과 : " + chk);
			return chk;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbclose();
		}
		return chk;
	}
	
	   public String getWhNum(String sen_seq) {
		      dbconn();
		      try {
		         String sql = "select distinct gate_num from t_sensor_value where sensor_seq = ?";
		         
		         psmt = conn.prepareStatement(sql);
		         
		         psmt.setString(1, sen_seq);
		         
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

	   public String getStandardValue(String sensor_type, String W_seq) {
		      System.out.println("<sensorDAO.getSensorSeq>");
		      dbconn();
		      try {
		         
		         String sql = "select st_value from t_standard_valuse where st_seq = ? and w_seq = ?";
		         
		         psmt = conn.prepareStatement(sql);
		         
		         psmt.setString(1, sensor_type);
		         psmt.setString(2, W_seq);
		         
		         rs = psmt.executeQuery();
		         
		         String STval = "";
		         if(rs.next()) {
		            STval = rs.getString(1);
		         }
		         
		         return STval;
		         
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      }finally{
		         dbclose();
		      }
		      return null;
		   }



}