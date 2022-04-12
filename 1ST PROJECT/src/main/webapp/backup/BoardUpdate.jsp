<%@page import="Model.T_MemberDTO"%>
<%@page import="Model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.BoardDTO"%>
<%@page import="Model.T_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
	
	</style>
	<body style="text-align: center;">
	<%
	    // session에서 로그인 정보 가져오기
	     T_MemberDTO info =  (T_MemberDTO)session.getAttribute("info");
	     String title = (String)session.getAttribute("title");
	     String content = (String)session.getAttribute("content");
	%>

		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="BoardUpdate">	
						<ul class="actions vertical">
							<li><h5>게시글 수정</h5></li>
								<form action = "bUpdateServiceCon" method="post">
								  <table style="text-align:center;">
								     <thead>
								        <tr>
								            <th colspan="2">게시판 글 수정</th>
								        </tr>
								     </thead>
								     <tbody>
								        <tr>
								            <td>
								              <input type="text" name = "title" placeholder="제목을 입력하세요" value=<%=title %>>
								            </td>
								        </tr>
								        <tr>
								            <td>
								              <input type="text" name="content" placeholder="내용을 입력하세요" value=<%=content %>>
								            </td>
								        </tr>
								        <tr>
								            <td>
								              <input type="text" name = "title" placeholder="제목을 입력하세요" value=<%=title %>>
								            </td>
								        </tr>
								        
								     </tbody>
								  
								  </table>
								 
									
									<li><input type="text" name = "title" placeholder="제목을 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input type="text" name="content" placeholder="내용을 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input type="hidden" name="mem_id" value=<%=info.getMem_id() %>></li>
									<li><input type="submit" value="JoinUs" class="button fit" style="width: 500px; margin: 0 auto;"></li>
								</form>
						</ul>
					</nav>			
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

