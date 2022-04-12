<%@page import="Model.T_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUpdate.jsp</title>
</head>
<body>
<%
T_MemberDTO info = (T_MemberDTO)session.getAttribute("info");
%>
<% if (info != null) { %>
<form action ="MemberUpdateServiceCon.do" method ="post">
수정할 정보를 입력하세요 <br>
<input type="hidden" name="mem_id" value="<%=info.getMem_id()%>">
이름 수정 <input type="text" name="mem_name"> <br>
비밀번호 수정<input type ="password" name = "mem_pw"> <br>
전화번호 입력 : <input type="text" name="mem_phone"> <br>
<input type="submit" value="수정하기" class="button fit">
<input type="reset" value="초기화">
<% } %>
</form>

</body>
</html>