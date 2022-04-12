<%@page import="Model.T_MemberDTO"%>
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
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<META HTTP-EQUIV="refresh" CONTENT="15">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Safe Zone</title>
</head>
<body class="text-center bg-secondary bg-opacity-10">
	<!-- 세션 받아오기 시작 -->
<% request.setCharacterEncoding("utf-8"); %>
<% T_MemberDTO info = (T_MemberDTO)session.getAttribute("info");  %>
<!-- 세선 받아오기 끝 -->

<!-- 상단바 시작 -->

<%
if(info != null){
/* 관리자로그인 */
	if(info.getMem_id().equals("admin")){ %>

<!-- 관리자 상단바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="Index.jsp">Safe-Zone</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="Index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="FAQ.jsp">FAQ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="BoardMain.jsp">Board</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            AdminPage
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="AdminMemberSelect.jsp">회원조회/수정/삭제</a></li>
            <li><a class="dropdown-item" href="AdminAddSensor.jsp">창고 정보 추가</a></li>
            <li><a class="dropdown-item" href="AdminWarehouseSelect.jsp">창고 정보조회/수정/삭제</a></li>
            <li><a class="dropdown-item" href="AdminMonitoring.jsp">전체 회원창고 모니터링</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            MyPage
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="MemberUpdate.jsp">내 정보 수정</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="MemberMonitoring.jsp">내 창고 모니터링</a></li>
          </ul>
        </li>
      </ul>
        <a href="#" class="btn btn-info me-md-2" role="button">현재 접속 계정 <%= info.getMem_id() %></a>
        <a href="LogoutServiceCon.do" class="btn btn-primary me-md-2" role="button">로그아웃</a>
    </div>
  </div>
</nav>
<!-- 관리자 상단바 끝 -->
<% } else { %>
<!-- 회원 상단바 시작 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="Index.jsp">Safe-Zone</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="FAQ.jsp">FAQ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="BoardMain.jsp">Board</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            MyPage
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="MemberUpdate.jsp">내 정보 수정</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="MemberMonitoring.jsp">내 창고 모니터링</a></li>
          </ul>
        </li>
      </ul>
      <a href="#" class="btn btn-info me-md-2" role="button">현재 접속 계정 <%= info.getMem_id() %></a>
        <a href="LogoutServiceCon.do" class="btn btn-primary me-md-2" role="button">로그아웃</a>
    </div>
  </div>
</nav>
<% } %>

<!-- 회원 상단바 끝 -->

<!-- 비로그인 상단바 시작 -->
<% } else {  %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="Index.jsp">Safe-Zone</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="FAQ.jsp">FAQ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="BoardMain.jsp">Board</a>
        </li>
        </ul>
        <a href="Login.jsp" class="btn btn-primary me-md-2" role="button">로그인</a>
        <a href="Join.jsp" class="btn btn-primary me-md-2" role="button">회원가입</a>
    </div>
  </div>
</nav>
<% } %>
<!-- 비로그인 상단바 끝 -->


	<!-- 본문 시작  -->

	<table class="table table-hover">
		<thead>
			<tr>
				<td colspan="10">
					<h1>전체 창고 모니터링</h1>
				</td>

			</tr>
		</thead>
		<tr>
			<td>순번</td>
			<td>창고 번호</td>
			<td>소유 회원</td>
			<td>디바이스 아이디</td>
			<td>센서 번호</td>
			<td>센서 종류</td>
			<td>센서 현재값</td>
			<td>센서 기준값</td>
			<td>설치 장소</td>
			<td>설치 일자</td>
		</tr>
		<%
		String pi_v = "";
		String mg_v = "";
		String hm_v = "";
		String tm_v = "";
		String co_v = "";
		String pi_sv = "";
		String mg_sv = "";
		String hm_sv = "";
		String tm_sv = "";
		String co_sv = "";
		
		

		String sv_data = "";
		String w_seq = "";
		String mem_id = "";
		String device_uid = "";
		String sensor_seq = "";
		String sensor_type = "";
		String st_value = "";
		String device_loc = "";
		String device_inst_date = "";

		PreparedStatement psmt = null;
		Connection conn = null;
		ResultSet rs = null;
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
			String sql = "SELECT distinct F.sv_data, E.w_seq, D.mem_id, C.device_uid, A.sensor_seq, A.sensor_type, B.st_value, C.device_loc, C.device_inst_date FROM t_sensor A, t_standard_valuse B, t_device C, t_member D, t_warehouse E, t_sensor_value F where A.device_seq = C.device_seq And C.mem_id = D.mem_id And D.mem_id = E.mem_id And E.w_seq = B.w_seq And A.sensor_seq = F.sensor_seq order by A.sensor_seq";

			/* SELECT sv_seq, sensor_seq, sv_data, sv_date, gate_num
			FROM t_sensor_value */
			/* WHERE sv_date BETWEEN 
			TO_DATE('2015-10-01 23:59:59','yyyy/mm/dd hh24:mi:ss') AND 
			TO_DATE('2015-11-30 23:59:59','yyyy/mm/dd hh24:mi:ss'); */
			/* -- 또는 WHERE sv_date BETWEEN '2015-10-01' AND '2015-11-30'; */

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			//반복문 안에서 rs객체의 요소들을 tr태그에 넣기
			for (int i = 1; rs.next(); i++) {
				sv_data = rs.getString(1);
				w_seq = rs.getString(2);
				mem_id = rs.getString(3);
				device_uid = rs.getString(4);
				sensor_seq = rs.getString(5);
				sensor_type = rs.getString(6);
				st_value = rs.getString(7);
				device_loc = rs.getString(8);
				device_inst_date = rs.getString(9);

				if (sensor_type.equals("MG")) {
			mg_v = sv_data;
			mg_sv = st_value;
				} else if (sensor_type.equals("PI")) {
			pi_v = sv_data;
			pi_sv = st_value;
				} else if (sensor_type.equals("CO")) {
			co_v = sv_data;
			co_sv = st_value;
				} else if (sensor_type.equals("HM")) {
			hm_v = sv_data;
			hm_sv = st_value;
				} else if (sensor_type.equals("TM")) {
			tm_v = sv_data;
			tm_sv = st_value;
				}

				/* String enMem_name = URLEncoder.encode(mem_name, "utf-8"); */

				out.print("<tr>");
				out.print("<td>" + i + "</td>");
				out.print("<td>" + w_seq + "</td>");
				out.print("<td>" + mem_id + "</td>");
				out.print("<td>" + device_uid + "</td>");
				out.print("<td>" + sensor_seq + "</td>");
				out.print("<td>" + sensor_type + "</td>");
				out.print("<td>" + sv_data + "</td>");
				out.print("<td>" + st_value + "</td>");
				out.print("<td>" + device_loc + "</td>");
				out.print("<td>" + device_inst_date + "</td>");

				// String enmem_name = URLEncoder.encode(mem_name, "utf-8");
				// 					out.print("<td><a href='AdminMemberUpdate.jsp?mem_id="+ mem_id +"&mem_name="+enmem_name+"&mem_phone="+mem_phone+"'>정보 수정</a></td>");
				// out.print("<td><a href='AdminMemberUpdate.jsp?mem_num=1'>정보 수정</a></td>");
				// 					out.print("<td><a href='DeleteServiceCon.do?mem_id="+ mem_id +"'>삭제</a></td>");
				out.print("</tr>");

				// out.print("<td><a href='DeleteServiceCon.do?email="+ enMem_name +"'>삭제</a></td>");
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
		System.out.println(co_v);
		System.out.println(mg_v);
		System.out.println(pi_v);
		System.out.println(tm_v);
		System.out.println(hm_v);
		%>

	</table>
	
<!-- 푸터 시작 -->
<footer class="bg-dark text-start text-white pt-5 pb-4 fixed-bottom" style="height:144px">
<div class="container-fluid d-block fixed-bottom" style="margin-top:50px">
		<div class="row" style="margin : 0px">
			<div class="col-2 align-self-center">
			</div>
			<div class="col-1 align-self-center">
				<p class="text-center">(주) 세이프존</p>
			</div>
			<div class="col-3 align-self-center">
				<p class="text-left">대표자 : 박지형<br>
개인정보책임관리자 : 박지형 / 사업자번호 : 178-82-00065<br>
본점 : 광주 동구 예술길 31-15 3, 4, 7층 / E-Mail : smhrd@smhrd.or.kr</p>
			</div>
			<div class="col-1 align-self-center">
				<p class="text-center">고객센터</p>
			</div>
			<div class="col-3 align-self-center">
				<p class="text-left">전화상담 : 062-655-3506, 9 / <br>전화 및 홈페이지상담 : 09시 ~ 19시 (월-금)<br>
- 카카오톡 : 09시 ~ 22시 (연중무휴)</p>
			</div>
			<div class="col-2 align-self-center">
			</div>
			
		</div>

</div>
 </footer>
<!-- 푸터 끝 -->

		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	
	<script>

		let pi_v = <%=pi_v%>;
		let pi_sv = <%=pi_sv%>;

		let mg_v = <%=mg_v%>;
		let mg_sv = <%=mg_sv%>;

		// mg_v = 10;
		// mg_sv = 5;

		let tm_v = <%=tm_v%>;
		let tm_sv = <%=tm_sv%>;

		let hm_v = <%=tm_v%>;
		let hm_sv = <%=hm_sv%>;

<%-- 		let co_v = <%=co_v%>;
		let co_sv = <%=co_sv%>; --%>
		let co_v = 0;
		let co_sv = 0;
		
		console.log("모션감지 현재값 : " + pi_v);
		console.log("모션감지 기준값 : " + pi_sv);
		console.log(mg_v);
		console.log(mg_sv);
		console.log(tm_v);
		console.log(tm_sv);
		console.log(hm_v);
		console.log(hm_sv);
		console.log(co_v);
		console.log(co_sv);


		if (mg_v > mg_sv) {
			notify_M();
		}
		if (pi_v > pi_sv) {
			notify_P();
		}
		if (co_v > co_sv) {
			notify_C();
		}
		if (hm_v > hm_sv) {
			notify_H();
		}
		if (tm_v > tm_sv) {
			notify_T();
		}
		
/* 		var auto_1 = setInterval(function() {
		}, 5000);
		var auto_2 = setInterval(function() {
		}, 5000);
		var auto_3 = setInterval(function() {
		}, 5000);
		var auto_4 = setInterval(function() {
		}, 5000);
		var auto_5 = setInterval(function() {
		}, 5000); */
		
		function notify_M() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "출입문감지 센서 기준치 이상 상황",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }
		function notify_P() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "모션감지 센서 기준치 이상 상황",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }
		function notify_H() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "습도감지 센서 기준치 이상 상황",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }
		function notify_T() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "온도감지 센서 기준치 이상 상황",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }
		function notify_C() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "일산화탄소 센서 기준치 이상 상황",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }

	</script>

</body>
</html>