<%-- <%@page import="Model.MemberDTO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Zone</title>
</head>
<body>
<h1>창고 정보 입력</h1>
<form action ="WarehouseInsertServiceCon.do" method="post">
창고 소유 회원 아이디 <input type="text" name="mem_id"> <br>
창고 주소 <input type = "text" name ="w_addr">
<input type ="submit" value ="정보 입력">
</form>


</body>
</html>