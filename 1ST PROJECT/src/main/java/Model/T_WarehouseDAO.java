package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class T_WarehouseDAO {

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

	public int insert(T_WarehouseDTO dto) {
		dbconn();
		try {
			System.out.println("[WarehouseDAO insert �޼ҵ� ����]");
			
			String sql = "INSERT INTO t_warehouse(w_addr, w_latitude, w_longitude, mem_id) VALUES (?,1,1,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getW_addr());
			psmt.setString(2, dto.getMem_id());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;

	}
	
	/*
	 * public int Update(T_WarehouseDTO dto) {
	 * 
	 * }
	 */
	public int DeleteWarehouse(String mem_id, String WH_Num) {

		System.out.println("[T_WarehouseDAO Update]");

		dbconn();

		System.out.println("mem_id : " + mem_id + "\nWH_Num : " + WH_Num);

		try {
			String sql = "delete from t_warehouse where mem_id = ? and w_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			psmt.setString(2, WH_Num);


			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

	/*
	 * public int insert(T_WarehouseDTO dto) { dbconn(); try {
	 * System.out.println("[WarehouseDAO insert �޼ҵ� ����]");
	 * 
	 * String sql =
	 * "INSERT INTO t_warehouse(w_addr, w_latitude, w_longitude, mem_id) VALUES (?,1,1,?)"
	 * ; psmt = conn.prepareStatement(sql); psmt.setString(1, dto.getW_addr());
	 * psmt.setString(2, dto.getMem_id());
	 * 
	 * cnt = psmt.executeUpdate();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { dbclose(); } return
	 * cnt;
	 * 
	 * }
	 */	
}