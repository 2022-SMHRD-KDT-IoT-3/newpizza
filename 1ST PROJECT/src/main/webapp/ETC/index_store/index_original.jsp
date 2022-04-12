<!DOCTYPE html>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Safe-Zone MainPage</title>
    
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<% MemberDTO info = (MemberDTO)session.getAttribute("info");  %>

<% 
if(info != null){
if(info.getMem_id().equals("admin")){ %>
<!-- 관리자 -->
<h1> 관리자 로그인 : <%= info.getMem_id() %></h1>
<a href ="AboutUs.jsp">Abous Us</a>
<a href ="Join.jsp">Join</a>
<a href ="Login.jsp">Login</a>
<a href ="FAQ.jsp">FAQ</a>
<a href ="BoardMain.jsp">Board</a>
<a href ="AdminMemberSelect.jsp">MemberSelect</a>
<a href ="MemberUpdate.jsp">MemberUpdate</a>
<a href ="AdminSensorStandard.jsp">SensorStandard</a>
<a href ="MemberMonitoring.jsp">MemberMonitoring</a>
<a href ="AdminWarehouseInsert.jsp">WarehouseInsert</a>
<a href ="AdminT_sensor.jsp">AdminT_sensor</a>
<a href ="AdminWarehouseUpdate.jsp">WarehouseUpdate</a>
<a href ="AdminMemberUpdate.jsp">AdminMemberUpdate</a>
<a href ="LogoutServiceCon.do">Logout</a>
<%}else{ %>
<!-- 일반회원 -->
<h1> 현재 접속한 아이디 : <%= info.getMem_id() %></h1>
 <a href ="AboutUs.jsp">Abous Us</a>
<a href ="MemberUpdate.jsp">MemberUpdate</a>
<a href ="MemberMonitoring.jsp">MemberMonitoring</a>
<a href ="FAQ.jsp">FAQ</a>
<a href ="BoardMain.jsp">Board</a>
<a href ="LogoutServiceCon.do">Logout</a>
<%} %>

<%}else{ %>
<!-- 비로그인 -->
<h1>로그인을 해주세요</h1>
<a href ="AboutUs.jsp">Abous Us</a>
<a href ="Join.jsp">Join</a>
<a href ="Login.jsp">Login</a>
<a href ="IdPwFind.jsp">ID PW FIND</a>
<a href ="FAQ.jsp">FAQ</a>
<a href ="BoardMain.jsp">Board</a>
<%} %>


  </body>
</html>