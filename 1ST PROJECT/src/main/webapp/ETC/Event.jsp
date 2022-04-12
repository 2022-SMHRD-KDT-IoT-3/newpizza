<%@page import="java.util.ArrayList"%>
<%@page import="Model.T_Sensor_valueDTO"%>
<%@page import="Model.T_SensorDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Safe Zone</title>

<%
request.setCharacterEncoding("utf-8");

// 센서 값 가져오기
/* String sv_seq = request.getParameter("sv_seq"); 
String sensor_seq = request.getParameter("sensor_seq"); 
String sv_data = request.getParameter("sv_data"); 
String sv_date = request.getParameter("sv_date"); 
String gate_num = request.getParameter("gate_num"); 
String mem_id = request.getParameter("mem_id");  */

// 센서 기준값 가져오기
/* String st_seq = request.getParameter("st_seq");
String sensor_type = request.getParameter("sensor_type");
String st_value = request.getParameter("st_value");
String w_seq = request.getParameter("w_seq"); */
%>

</head>

<body class="text-center">

	<!-- 센서 기준값 가져오기 -->



		<table class="table table-hover">
		<thead>
		<tr>
		<td colspan="4"><h1>센서 기준 값 가져오기</h1></td>
		</tr>
		</thead>
		
		<tbody>
		<tr>
		<td>회원 아이디</td>
		<td>창고 번호</td>
		<td>센서 종류</td>
		<td>센서 기준값</td>
		</tr>

<%
PreparedStatement psmt = null;
Connection conn = null;
ResultSet rs = null;

int cnt=0;
String mem_id = "";
String w_seq = "";
String sensor_type = "";
String st_value = "";

//db연결
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
	String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	String dbid = "campus_b_0310_5";
	String dbpw = "smhrd5";

	// 1-3. Connection객체 사용해서 DB연결!
	conn = DriverManager.getConnection(url, dbid, dbpw);

	//sql준비 및 실행

	// String sql = "select sensor_type, st_value from t_member, t_warehouse, t_standard_valuse  where t_member.mem_id = t_warehouse.mem_id and t_warehouse.w_seq = t_standard_valuse.w_seq;";

	// 창고별 센서의 기준값 가져오기
	// String sql = "select w.mem_id, w.w_seq, v.sensor_type, v.st_value from t_warehouse w, t_standard_valuse v where v.w_seq in (select w_seq from t_warehouse where mem_id = 'test') ORDER BY w.w_seq";

//	String sql = "SELECT COUNT(*), w.mem_id, w.w_seq, v.sensor_type, v.st_value FROM t_warehouse w, t_standard_valuse v WHERE v.w_seq	IN (SELECT w_seq FROM t_warehouse where mem_id = 'test') ORDER BY w.w_seq";     
	String sql = "SELECT w.mem_id, w.w_seq, v.sensor_type, v.st_value FROM t_warehouse w, t_standard_valuse v WHERE v.w_seq	IN (SELECT w_seq FROM t_warehouse where mem_id = 'test') ORDER BY w.w_seq";     

	psmt = conn.prepareStatement(sql);
	rs = psmt.executeQuery();

	
	while (rs.next()) {
		//cnt = rs.getString(1);
		//mem_id = rs.getString(2);
		//w_seq = rs.getString(3);
		//sensor_type = rs.getString(4);
		//st_value = rs.getString(5);
		mem_id = rs.getString(1);
		w_seq = rs.getString(2);
		sensor_type = rs.getString(3);
		st_value = rs.getString(4);

		
		// 마그네틱 센서 기준값 
		if (Integer.parseInt(sensor_type) == 1) {
		
			if (sensor_type.equals("MG")) {
			String mg_st_value = st_value;
		} 
		
			
			
		}
		
		//out.print("<tr>");
		//out.print("<td colspan=4> 총갯수 : " + cnt + "</td>");
		//out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td>" + mem_id + "</td>");
		out.print("<td>" + w_seq + "</td>");
		out.print("<td>" + sensor_type + "</td>");
		out.print("<td>" + st_value + "</td>");
		out.print("</tr>");
	
		

		cnt++;
	}
	
	//db 연결 해제
} catch (Exception e) {
	e.printStackTrace();
} finally {
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
%>

		</tbody>
		</table>

<!-- 센서 현재 값 가져오기 -->
	
	<table class="table table-hover">
		<thead>
		<tr>
		<td colspan="6"><h1>몇개 나와야 하나..<%=cnt %>  </h1></td>
		</tr>
		<tr>
		<td colspan="6"><h1>현재 센서 값</h1></td>
		</tr>
		</thead>
		
		<tbody>
		<tr>
		<td>센서값 순번</td>
		<td>센서 순번</td>
		<td>센서 값</td>
		<td>측정일자</td>
		<td>게이트번호</td>
		<td>회원아이디</td>
		</tr>
		
<%
psmt = null;
conn = null;
rs = null;
String sv_seq = "";
String sensor_seq = "";
String sv_data = "";
String sv_date = "";
String gate_num = "";
mem_id = "";

//db연결
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
	String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	String dbid = "campus_b_0310_5";
	String dbpw = "smhrd5";

	// 1-3. Connection객체 사용해서 DB연결!
	conn = DriverManager.getConnection(url, dbid, dbpw);

	//sql준비 및 실행

	// String sql = "select sensor_type, st_value from t_member, t_warehouse, t_standard_valuse  where t_member.mem_id = t_warehouse.mem_id and t_warehouse.w_seq = t_standard_valuse.w_seq;";
	// sql = "SELECT * FROM (SELECT * FROM T_SENSOR_VALUE WHERE t_sensor_value.mem_id = 'test1' ORDER BY SV_DATE DESC) WHERE ROWNUM < 2";
	// String sql = "SELECT * FROM t_sensor_value WHERE mem_id = 'test1' AND sensor_seq = 21 AND ROWNUM < 10 ORDER BY SV_DATE DESC;";
	String sql;

	

//	for (int i = 0; i < cnt; i++) {
		sql = "SELECT * FROM (SELECT * FROM t_sensor_value WHERE mem_id = 'test1' AND sensor_seq = 21 ORDER BY SV_DATE DESC) WHERE ROWNUM < 2";
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		rs.next();
		sv_seq = rs.getString(1);
		sensor_seq = rs.getString(2);
		sv_data = rs.getString(3);
		sv_date = rs.getString(4);
		gate_num = rs.getString(5);
		mem_id = rs.getString(6);
		
//		T_Sensor_valueDTO dto = new T_Sensor_valueDTO(sv_seq, sensor_seq, sv_data, sv_date, gate_num, mem_id);
//		
//		ArrayList<T_Sensor_valueDTO> list = new ArrayList<T_Sensor_valueDTO>();
//		list.add(dto);
		
		out.print("<tr>");
		out.print("<td>" + sv_seq + "</td>");
		out.print("<td>" + sensor_seq + "</td>");
		out.print("<td>" + sv_data + "</td>");
		out.print("<td>" + sv_date + "</td>");
		out.print("<td>" + gate_num + "</td>");
		out.print("<td>" + mem_id + "</td>");
		out.print("</tr>");

		
		
		sql = "SELECT * FROM (SELECT * FROM t_sensor_value WHERE mem_id = 'test1' AND sensor_seq = 22 ORDER BY SV_DATE DESC) WHERE ROWNUM < 2";
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		rs.next();
		sv_seq = rs.getString(1);
		sensor_seq = rs.getString(2);
		sv_data = rs.getString(3);
		sv_date = rs.getString(4);
		gate_num = rs.getString(5);
		mem_id = rs.getString(6);
		
		out.print("<tr>");
		out.print("<td>" + sv_seq + "</td>");
		out.print("<td>" + sensor_seq + "</td>");
		out.print("<td>" + sv_data + "</td>");
		out.print("<td>" + sv_date + "</td>");
		out.print("<td>" + gate_num + "</td>");
		out.print("<td>" + mem_id + "</td>");
		out.print("</tr>");


		sql = "SELECT * FROM (SELECT * FROM t_sensor_value WHERE mem_id = 'test1' AND sensor_seq = 23 ORDER BY SV_DATE DESC) WHERE ROWNUM < 2";
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		rs.next();
		sv_seq = rs.getString(1);
		sensor_seq = rs.getString(2);
		sv_data = rs.getString(3);
		sv_date = rs.getString(4);
		gate_num = rs.getString(5);
		mem_id = rs.getString(6);
		
		out.print("<tr>");
		out.print("<td>" + sv_seq + "</td>");
		out.print("<td>" + sensor_seq + "</td>");
		out.print("<td>" + sv_data + "</td>");
		out.print("<td>" + sv_date + "</td>");
		out.print("<td>" + gate_num + "</td>");
		out.print("<td>" + mem_id + "</td>");
		out.print("</tr>");
		sql = "SELECT * FROM (SELECT * FROM t_sensor_value WHERE mem_id = 'test1' AND sensor_seq = 24 ORDER BY SV_DATE DESC) WHERE ROWNUM < 2";
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		rs.next();
		sv_seq = rs.getString(1);
		sensor_seq = rs.getString(2);
		sv_data = rs.getString(3);
		sv_date = rs.getString(4);
		gate_num = rs.getString(5);
		mem_id = rs.getString(6);
		
		out.print("<tr>");
		out.print("<td>" + sv_seq + "</td>");
		out.print("<td>" + sensor_seq + "</td>");
		out.print("<td>" + sv_data + "</td>");
		out.print("<td>" + sv_date + "</td>");
		out.print("<td>" + gate_num + "</td>");
		out.print("<td>" + mem_id + "</td>");
		out.print("</tr>");
		sql = "SELECT * FROM (SELECT * FROM t_sensor_value WHERE mem_id = 'test1' AND sensor_seq = 25 ORDER BY SV_DATE DESC) WHERE ROWNUM < 2";
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		rs.next();
		sv_seq = rs.getString(1);
		sensor_seq = rs.getString(2);
		sv_data = rs.getString(3);
		sv_date = rs.getString(4);
		gate_num = rs.getString(5);
		mem_id = rs.getString(6);
		
		out.print("<tr>");
		out.print("<td>" + sv_seq + "</td>");
		out.print("<td>" + sensor_seq + "</td>");
		out.print("<td>" + sv_data + "</td>");
		out.print("<td>" + sv_date + "</td>");
		out.print("<td>" + gate_num + "</td>");
		out.print("<td>" + mem_id + "</td>");
		out.print("</tr>");

		
//	}
	
	//db 연결 해제
} catch (Exception e) {
	e.printStackTrace();
} finally {
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
%>

		</tbody>
		</table>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function() {

			$
					.ajax({
						url : 'Cur_Sensor_value.do',
						type : 'post',
						data : {
							mem_id : 'test'
						},
						dataType : "text ",
						success : function(changephoneresult) {
							$('.changephoneresult')
									.html(
											'<div class="w-75 mx-auto p-3 alert alert-primary alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 변경하신 전화번호는 <br>'
													+ changephoneresult
													+ '입니다. </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
						},
						error : function() {
							/* alert('전화번호 변경 실패'); */
							$('.changephoneresult')
									.html(
											'<div class="w-75 mx-auto p-3 alert alert-primary alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 전화번호 변경에 실패하였습니다.<br> 재시도해주세요 </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
						}

					});
		})

		</body>
		</html>
	