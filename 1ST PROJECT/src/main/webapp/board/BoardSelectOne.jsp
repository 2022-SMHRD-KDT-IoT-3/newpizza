<%@page import="Model.BoardDTO"%>
<%@page import="Model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	int QNA_SEQ= Integer.parseInt(request.getParameter("QNA_SEQ"));
	BoardDAO dao = new BoardDAO();
    BoardDTO dto = dao.BoardSelectOne(QNA_SEQ);
	
	%>
 
	
	<table>
		<tr>
			<td>제목</td>
			<td><%=dto.getTitle()%></td>
		</tr>

		<tr>
			<td>작성자</td>
			<td><%=dto.getWriter()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=dto.getCnt()%></td>
		
		</tr>
	
		<tr>
			<td>내용</td>
			<td><img alt="" src="file/<%=dto.getFileName()%>"><br>
				<%=dto.getContent()%></td>
		</tr>
 
      <a href="BoardMain.jsp">홈으로 가기</a>



	</table>

</body>
</html>