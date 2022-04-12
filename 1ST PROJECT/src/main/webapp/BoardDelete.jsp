<%@page import="Model.T_MemberDTO"%>
<%@page import="Model.BoardDAO"%>
<%@page import="Model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 1.request영역에 저장된 정보를 가져오시오. -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/sass/layout/btn.scss" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>
<style>
#wrapper {
	width: 1000px !important;
	margin: 0px auto !important;
	text-align: center !important;
	margin-top: 100px !important;
}
</style>
<body>
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






	<%
	ArrayList<BoardDTO> list = new BoardDAO().showBoard();
	%>

	<!-- Wrapper -->
	<div id="wrapper" class="panel-body">


		<caption>
			<h2>게시글 삭제</h2>
		</caption>

		<!-- Menu -->
		<nav id="Update">
		<table id="table" class="table table-hover">

			<tr bgcolor="#CDECFA">
				<th>No.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th></th>
			</tr>

			<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
			<%
			PreparedStatement psmt = null;
			Connection conn = null;
			ResultSet rs = null;
			// db 연결 
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");

				// 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
				String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
				String dbid = "campus_b_0310_5";
				String dbpw = "smhrd5";

				// 1-3. Connection 객체 사용해서 DB연결 !
				conn = DriverManager.getConnection(url, dbid, dbpw);

				// sql준비 및 실행
				String sql = "select * from t_qna";
				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery();

				// 반복문 안에서 rs객체의 요소들을 tr태그에 넣기
				while (rs.next()) {
					int QNA_SEQ = rs.getInt(1);
					String title = rs.getString(2);
					String QNA_JOINDATE = rs.getString(5);
					String writer = rs.getString(6);
					int cnt = rs.getInt(7);

					out.print("<tr>");
					out.print("<td>" + QNA_SEQ + "</td>");
					out.print("<td>" + title + "</td>");
					out.print("<td>" + writer + "</td>");
					out.print("<td>" + QNA_JOINDATE + "</td>");
					out.print("<td>" + cnt + "</td>");
					// String enEmail = URLEncoder.encode(email,"UTF-8");

					out.print(
					"<td><a href='DeleteServiceCon?QNA_SEQ=" + QNA_SEQ + "'     class='btn btn-outline-info' >삭제</a></td>");
					out.print("</tr>");
				}

				// db 연결 해제
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
				rs.close();
					if (psmt != null)
				psmt.close();
					if (conn != null)
				psmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			%>
		</table>
		</nav>
		<a href="BoardMain.jsp" class="btn btn-outline-secondary">되돌아가기</a>
	</div>


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
본점 : 광주 동구 예술길 31-15 3, 4, 7층<br>E-Mail : smhrd@smhrd.or.kr</p>
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




	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>

