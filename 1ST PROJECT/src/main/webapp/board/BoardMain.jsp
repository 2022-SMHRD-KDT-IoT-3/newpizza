<%@page import="Model.T_MemberDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.BoardDAO"%>
<%@page import="Model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" href="assets/sass/layout/btn.scss" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Safe Zone</title>





<style type="text/css">
#board {
	width: 1000px !important;
	margin: 0px auto !important;
	text-align: center !important;
	margin-top: 100px !important;
	font-size: 28px;
}

#list {
	margin: 0px auto !important;
}

#writer {
	margin-top: 50px !important;
}

a {
	text-decoration: none !important;
}

.btn_search {
	background-color: #91D8FA;
}
</style>




</head>
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
            <li><a class="dropdown-item" href="#">창고 정보조회/수정/삭제</a></li>
            <li><a class="dropdown-item" href="#">전체 회원창고 모니터링</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            MyPage
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="UserMemberUpdate.jsp">내 정보 수정</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">내 창고 모니터링</a></li>
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
            <li><a class="dropdown-item" href="UserMemberUpdate.jsp">내 정보 수정</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">내 창고 모니터링</a></li>
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
	<!--  검색 시작  -->
	<form action="search.jsp" method="post" name="search">
		<table cellpadding="0" cellspacing="0" width="1500" class="pull-right">
			<tr>
				<td align="right"><select class="form-control"
					name="searchField">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
				</select> <input type="text" class="form-control" placeholder="검색어를 입력하세요."
					name="searchText">
					<button type="submit" class="btn btn-success" value="검색 ">검색</button>
					</select></td>
			</tr>
		</table>
	</form>
	<!-- 검색 종료  -->


	<div id="board">
		<table id="list">

			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th></th>
			</tr>



			<%
			for (int i = 0; i < list.size(); i++) {
			%>


			<tr>
				<td><%=i + 1%></td>


				<td><a
					href="BoardSelectOne.jsp?QNA_SEQ=<%=list.get(i).getQNA_SEQ()%>">
						<%=list.get(i).getTitle()%></a></td>
				<td><%=list.get(i).getWriter()%></td>
				<td><%=list.get(i).getQNA_JOINDATE()%></td>
				<td><%=list.get(i).getCnt()%></td>

			</tr>
			<%
			}
			%>

			<%
			PreparedStatement psmt = null;
			Connection conn = null;
			ResultSet rs = null;

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");

				// 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
				String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
				String dbid = "campus_b_0310_5";
				String dbpw = "smhrd5";

				// 1-3. Connection 객체 사용해서 DB연결 !
				conn = DriverManager.getConnection(url, dbid, dbpw);

				// sql준비 및 실행
				String sql = "select title from T_QNA";
				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery();

				// 반복문 안에서 rs객체의 요소들을 tr태그에 넣기
				while (rs.next()) {
					//no , 제목 작성자 작성일 조회수

					int QNA_SEQ = rs.getInt(1);
					String title = rs.getString(2);
					String writer = rs.getString(3);
					String QNA_JOINDATE = rs.getString(4);
					int cnt = rs.getInt(5);

					out.print("<tr>");
					out.print("<td>" + QNA_SEQ + "</td>");
					out.print("<td>" + title + "</td>");
					out.print("<td>" + writer + "</td>");
					out.print("<td>" + QNA_JOINDATE + "</td>");
					out.print("<td>" + cnt + "</td>");

					// String enEmail = URLEncoder.encode(email,"UTF-8");

					out.print("<td><a href='BoardDeleteService?title=" + title + "'>삭제</a></td>");
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

		<a href="DeleteServiceCon?QNA_SEQ=QNA_SEQ"> 삭제하러가기</a> <a
			href="BoardWrite.jsp" class="cta">
			<button class="btn_write" id="write">글쓰기</button>
		</a>


	</div>
	
	
<!-- 푸터 시작 -->
<footer class="bg-dark text-white pt-5 pb-4 fixed-bottom" style="height:144px">
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
 



</body>
</html>