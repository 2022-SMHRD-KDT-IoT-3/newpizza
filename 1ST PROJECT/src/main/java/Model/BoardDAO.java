package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	// �������� ����
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	int cnt = 0;
	T_MemberDTO dto = null;

	// DB���� �޼ҵ�
	public void dbconn() {
		try {
			// 1. DB����(ojdbc6.jar �־��ֱ�)
			// 1-1. Classã�� : DB�� ��Ŭ������ �������ִ� Class
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1-2. DB�� �����ϱ� ���� �ּ�, ���̵�, �н����� ����
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_0310_5";
			String dbpw = "smhrd5";

			// 1-3. Connection��ü ����ؼ� DB����!
			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// DB close �޼ҵ�
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

	// �Խñ� �ۼ� �޼ҵ�
	public int insertBoard(BoardDTO dto) {
		dbconn();
		try {

			String sql = "insert into T_QNA values(t_qna_seq.nextval,?,?,?,sysdate,?,0)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getFileName());
//			psmt.setString(4, dto.getWriter());
			psmt.setString(4, "test");

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

	// �Խñ� ��� ��ȸ �޼ҵ�
	public ArrayList<BoardDTO> showBoard() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		dbconn();

		try {

			String sql = "select * from T_QNA order by QNA_JOINDATE desc";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String writer = rs.getString(3);
				String fileName = rs.getString(4);
				String content = rs.getString(5);
				String QNA_JOINDATE = rs.getString(6);
				int cnt = rs.getInt(7);

				BoardDTO dto = new BoardDTO(num, title, writer, fileName, content, QNA_JOINDATE, cnt);
				list.add(dto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return list;

	}

	// �Խñ� �ϳ� Ŭ������ ��� �޼ҵ�
	public BoardDTO BoardSelectOne(int QNA_SEQ) {
		dbconn();

		BoardDTO dto = null;

		try {

			String sql = "select * from T_QNA where QNA_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, QNA_SEQ);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int cnum = rs.getInt(1);
				String title = rs.getString(2);
				String content  = rs.getString(3);
				String fileName = rs.getString(4);
				String QNA_JOINDATE = rs.getString(5);
				String writer = rs.getString(6);
				int cnt = rs.getInt(7);
				BoardDTO dto2 = new BoardDTO(cnum, title, content, fileName, QNA_JOINDATE, writer, cnt);
				dto2.setCnt(cnt);
				cnt++;
				countUpdate(cnt, QNA_SEQ);

				dto = new BoardDTO(cnum, title, content, fileName, QNA_JOINDATE, writer, cnt);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return dto;

	}

	// ��ȸ�� ���� �޼ҵ�
	public int countUpdate(int cnt, int QNA_SEQ) {
		dbconn();

		try {

			String sql = "update T_QNA set cnt = ? where QNA_SEQ = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, cnt);
			psmt.setInt(2, QNA_SEQ);

			return psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return -1;

	}

	// �˻� ��� �޼ҵ�
	public ArrayList<BoardDTO> getSearch(String searchField, String searchText) {

		dbconn();

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "select * from T_QNA where " + searchField.trim();

		BoardDTO dto = null;
		try {

			if (searchText != null && !searchText.equals("")) {
				sql += " LIKE '%" + searchText.trim() + "%' order by  desc limit 10";
			}

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				dto.setQNA_SEQ(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setWriter(rs.getString(3));
				dto.setFileName(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setQNA_JOINDATE(rs.getString(6));
				dto.setCnt(rs.getInt(7));

				list.add(dto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return list;
	}

	// �Խñ� ���� �޼ҵ� (��)
	public int deleteBoard(String QNA_SEQ) {
		dbconn();

		try {

			String sql = "delete from T_QNA where QNA_SEQ=? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, QNA_SEQ);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;

	}

	// �Խñ� ���� �޼ҵ�
	public int update(String title, String content) {
		dbconn();

		try {
			String sql = "update t_qna set title=?, content=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

	// �Խ��� ����¡ �޼ҵ�
	public int getCount() {

		dbconn();

		try {

			String sql = "select count(*) from bbs";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return -1;
	}
}
