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

</head>
<style>
</style>
<body style="text-align: center;">

<%
	ArrayList<BoardDTO> list = new BoardDAO().showBoard();
	%>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Menu -->
		<nav id="Update">
		<table>
			<caption>
				<h2>게시글 삭제</h2>
			</caption>
			
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			
			<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
			<%
							
							PreparedStatement psmt = null;
							Connection conn = null;
							ResultSet rs = null;
							    // db 연결 
							    try{
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
							    while(rs.next()){
							    	int QNA_SEQ = rs.getInt(1);
							    	String title = rs.getString(2);
							    	String  QNA_JOINDATE= rs.getString(5);
							    	String writer = rs.getString(6);
							    	int cnt = rs.getInt(7);
							    
							    	
							    	out.print("<tr>");
							    	out.print("<td>"+ QNA_SEQ + "</td>");
							    	out.print("<td>"+ title + "</td>");
							    	out.print("<td>"+ writer + "</td>");
							    	out.print("<td>"+ QNA_JOINDATE + "</td>");
							    	out.print("<td>"+ cnt + "</td>");
							    	// String enEmail = URLEncoder.encode(email,"UTF-8");
							    	
							    	out.print("<td><a href='DeleteServiceCon?QNA_SEQ="+ QNA_SEQ + "'>삭제</a></td>");
							    	out.print("</tr>");
							    	} 
							   
							    
							    // db 연결 해제
							    }catch(Exception e){
							    	e.printStackTrace();
							    }finally{
							    	try{
							    		if(rs !=null)rs.close();
							    		if(psmt !=null) psmt.close();
							    		if(conn !=null) psmt.close();
							    	}catch(Exception e){
							    		e.printStackTrace();
							    	}
							    	
							    }
							
							%>
		</table>
		</nav>
		<a href="BoardMain.jsp" class="button next scrolly">되돌아가기</a>
	</div>
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

