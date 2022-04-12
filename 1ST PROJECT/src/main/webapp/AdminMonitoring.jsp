<%@page import="Model.T_Standard_valuseDAO"%>
<%@page import="Model.T_SensorDAO"%>
<%@page import="Model.T_Sensor_valueDAO"%>
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
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
               <li class="nav-item"><a class="nav-link" href="Index.jsp">Home</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="FAQ.jsp">FAQ</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="BoardMain.jsp">Board</a>
               </li>
               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle active" href="#"
                  id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                  aria-expanded="false"> AdminPage </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="AdminMemberSelect.jsp">회원조회/수정/삭제</a></li>
                     <li><a class="dropdown-item" href="AdminAddSensor.jsp">창고
                           정보 추가</a></li>
                     <li><a class="dropdown-item" href="AdminWarehouseSelect.jsp">창고
                           정보조회/수정/삭제</a></li>
                     <li><a class="dropdown-item" href="AdminMonitoring.jsp">전체
                           회원창고 모니터링</a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     MyPage </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="MemberUpdate.jsp">내
                           정보 수정</a></li>
                     <li><hr class="dropdown-divider"></li>
                     <li><a class="dropdown-item" href="MemberMonitoring.jsp">내
                           창고 모니터링</a></li>
                  </ul></li>
            </ul>
            <a href="#" class="btn btn-info me-md-2" role="button">현재 접속 계정
               <%= info.getMem_id() %></a> <a href="LogoutServiceCon.do"
               class="btn btn-primary me-md-2" role="button">로그아웃</a>
         </div>
      </div>
   </nav>
   <!-- 관리자 상단바 끝 -->
   <% } else { %>
   <!-- 회원 상단바 시작 -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
         <a class="navbar-brand" href="Index.jsp">Safe-Zone</a>
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
               <li class="nav-item"><a class="nav-link active"
                  aria-current="page" href="Index.jsp">Home</a></li>
               <li class="nav-item"><a class="nav-link" href="FAQ.jsp">FAQ</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="BoardMain.jsp">Board</a>
               </li>
               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     MyPage </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="MemberUpdate.jsp">내
                           정보 수정</a></li>
                     <li><hr class="dropdown-divider"></li>
                     <li><a class="dropdown-item" href="MemberMonitoring.jsp">내
                           창고 모니터링</a></li>
                  </ul></li>
            </ul>
            <a href="#" class="btn btn-info me-md-2" role="button">현재 접속 계정
               <%= info.getMem_id() %></a> <a href="LogoutServiceCon.do"
               class="btn btn-primary me-md-2" role="button">로그아웃</a>
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
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
               <li class="nav-item"><a class="nav-link active"
                  aria-current="page" href="Index.jsp">Home</a></li>
               <li class="nav-item"><a class="nav-link" href="FAQ.jsp">FAQ</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="BoardMain.jsp">Board</a>
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
   <h1>전체 창고 모니터링</h1>
   <hr>
<div class = "container-fluid">
<div class="row">
   <div class="col-4">
      <table class="table table-light table-hover">
         <thead>
            <tr>
               <td colspan="5">
                  <h5>
                  <strong>
                  test 회원 1번 창고 모니터링
                  </strong>
                  </h5>
               </td>
            </tr>
         </thead>
         <tr>
         <td colspan="3" class = "text-start">
                  창고 주소 : 광주광역시 서구 쌍촌동 1020번지
                  </td>
                  <td colspan="2">
                  설치 일자 : 2022-03-30 17:00:00
                  </td>
                  </tr>
         <tr>
            <td>센서 번호</td>
            <td>센서 종류</td>
            <td>센서 현재값</td>
            <td>센서 기준값</td>
            <td> 현재 상태 </td>
         </tr>
         <tr>
            <td>1</td>
            <td>마그네틱 도어</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
            <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>2</td>
            <td>적외선 모션감지</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>3</td>
            <td>온도 감지</td>
            <td class="table-success">17도</td>
            <td class="table-secondary">25도</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>4</td>
            <td>습도 감지</td>
            <td class="table-success">15%</td>
            <td class="table-secondary">50%</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>5</td>
            <td>일산화탄소 감지</td>
            <td class="table-success">70ppm</td>
            <td class="table-secondary">300ppm</td>
      <td class="table-primary">정상</td>
         </tr>
      </table>
      </div>
      
      <!-- 두번째 창고 시작 -->
      
         <div class="col-4">
      <table class="table table-light table-hover">
         <thead>
            <tr>
               <td colspan="5">
                  <h5>
                  <strong>
                  test 회원 2번 창고 모니터링
                  </strong>
                  </h5>
               </td>
            </tr>
         </thead>
         <tr>
         <td colspan="3" class = "text-start">
                  창고 주소 : 광주광역시 동구 사직동 65번지
                  </td>
                  <td colspan="2">
                  설치 일자 : 2022-04-01 14:00:00
                  </td>
                  </tr>
         <tr>
            <td>센서 번호</td>
            <td>센서 종류</td>
            <td>센서 현재값</td>
            <td>센서 기준값</td>
            <td> 현재 상태 </td>
         </tr>
         <tr>
            <td>6</td>
            <td>마그네틱 도어</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>7</td>
            <td>적외선 모션감지</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>8</td>
            <td>온도 감지</td>
            <td class="table-success">20도</td>
            <td class="table-secondary">22도</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>9</td>
            <td>습도 감지</td>
            <td class="table-success">16%</td>
            <td class="table-secondary">30%</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>10</td>
            <td>일산화탄소 감지</td>
            <td class="table-success">70ppm</td>
            <td class="table-secondary">300ppm</td>
      <td class="table-primary">정상</td>
         </tr>
      </table>
      </div>
      
      <!-- 두번째 창고 끝 -->
      
      <!-- 세번째 창고 시작 -->
         <div class="col-4">
      <table class="table table-light table-hover">
         <thead>
            <tr>
               <td colspan="5">
                  <h5>
                  <strong>
                  test 회원 3번 창고 모니터링
                  </strong>
                  </h5>
               </td>
            </tr>
         </thead>
         <tr>
         <td colspan="3" class = "text-start">
                  창고 주소 : 광주광역시 광산구 신가동 200-4번지
                  </td>
                  <td colspan="2">
                  설치 일자 : 2022-04-02 11:00:00
                  </td>
                  </tr>
         <tr>
            <td>센서 번호</td>
            <td>센서 종류</td>
            <td>센서 현재값</td>
            <td>센서 기준값</td>
            <td> 현재 상태 </td>
         </tr>
         <tr>
            <td>11</td>
            <td>마그네틱 도어</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>12</td>
            <td>적외선 모션감지</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>13</td>
            <td>온도 감지</td>
            <td class="table-success">10도</td>
            <td class="table-secondary">15도</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>14</td>
            <td>습도 감지</td>
            <td class="table-success">12%</td>
            <td class="table-secondary">35%</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>15</td>
            <td>일산화탄소 감지</td>
            <td class="table-success">70ppm</td>
            <td class="table-secondary">300ppm</td>
      <td class="table-primary">정상</td>
         </tr>
      </table>
      </div>
      <!-- 세번째 창고 끝 -->
      
      
   </div>
   </div>
   </div>
   
   <!-- 두번째 줄 시작 -->
   
   <div class = "container-fluid">
<div class="row">
   
   <!-- 첫번째 창고 시작 -->
   <div class="col-4">
      <table class="table table-light table-hover">
         <thead>
            <tr>
               <td colspan="5">
                  <h5>
                  <strong>
                  test2 회원 1번 창고 모니터링
                  </strong>
                  </h5>
               </td>
            </tr>
         </thead>
         <tr>
         <td colspan="3" class = "text-start">
                  창고 주소 : 화순군 동면 운농리 1001-10
                  </td>
                  <td colspan="2">
                  설치 일자 : 2022-04-03 10:00:00
                  </td>
                  </tr>
         <tr>
            <td>센서 번호</td>
            <td>센서 종류</td>
            <td>센서 현재값</td>
            <td>센서 기준값</td>
            <td> 현재 상태 </td>
         </tr>
         <tr>
            <td>16</td>
            <td>마그네틱 도어</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>17</td>
            <td>적외선 모션감지</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>18</td>
            <td>온도 감지</td>
            <td class="table-success">11도</td>
            <td class="table-secondary">20도</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>19</td>
            <td>습도 감지</td>
            <td class="table-success">22%</td>
            <td class="table-secondary">30%</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>20</td>
            <td>일산화탄소 감지</td>
            <td class="table-success">70ppm</td>
            <td class="table-secondary">300ppm</td>
      <td class="table-primary">정상</td>
         </tr>
      </table>
      </div>
      
   <!-- 첫번째 창고 끝 -->
   
      
      <!-- 두번째 창고 시작 -->
      
         <div class="col-4">
      <table class="table table-light table-hover">
         <thead>
            <tr>
               <td colspan="5">
                  <h5>
                  <strong>
                  test3 회원 1번 창고 모니터링
                  </strong>
                  </h5>
               </td>
            </tr>
         </thead>
         <tr>
         <td colspan="3" class = "text-start">
                  창고 주소 : 담양군 대덕면 운암리 200
                  </td>
                  <td colspan="2">
                  설치 일자 : 2022-04-03 14:00:00
                  </td>
                  </tr>
         <tr>
            <td>센서 번호</td>
            <td>센서 종류</td>
            <td>센서 현재값</td>
            <td>센서 기준값</td>
            <td> 현재 상태 </td>
         </tr>
         <tr>
            <td>21</td>
            <td>마그네틱 도어</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>22</td>
            <td>적외선 모션감지</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>23</td>
            <td>온도 감지</td>
            <td class="table-success">12도</td>
            <td class="table-secondary">40도</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>24</td>
            <td>습도 감지</td>
            <td class="table-success">15%</td>
            <td class="table-secondary">60%</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>25</td>
            <td>일산화탄소 감지</td>
            <td class="table-success">70ppm</td>
            <td class="table-secondary">400ppm</td>
      <td class="table-primary">정상</td>
         </tr>
      </table>
      </div>

      
      <!-- 두번째 창고 끝 -->
      
      <!-- 세번째 창고 시작 -->
         <div class="col-4">
      <table class="table table-light table-hover">
         <thead>
            <tr>
               <td colspan="5">
                  <h5>
                  <strong>
                  test4 회원 1번 창고 모니터링
                  </strong>
                  </h5>
               </td>
            </tr>
         </thead>
         <tr>
         <td colspan="3" class = "text-start">
                  창고 주소 : 함평군 손불면 학산리 1013-11
                  </td>
                  <td colspan="2">
                  설치 일자 : 2022-04-05 13:00:00
                  </td>
                  </tr>
         <tr>
            <td>센서 번호</td>
            <td>센서 종류</td>
            <td>센서 현재값</td>
            <td>센서 기준값</td>
            <td> 현재 상태 </td>
         </tr>
         <tr>
            <td>26</td>
            <td>마그네틱 도어</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>27</td>
            <td>적외선 모션감지</td>
            <td class="table-success">닫힘</td>
            <td class="table-secondary">열림</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>28</td>
            <td>온도 감지</td>
            <td class="table-success">12도</td>
            <td class="table-secondary">35도</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>29</td>
            <td>습도 감지</td>
            <td class="table-success">20%</td>
            <td class="table-secondary">40%</td>
      <td class="table-primary">정상</td>
         </tr>
         <tr>
            <td>30</td>
            <td>일산화탄소 감지</td>
            <td class="table-success">70ppm</td>
            <td class="table-secondary">300ppm</td>
      <td class="table-primary">정상</td>
         </tr>
      </table>
      </div>

      <!-- 세번째 창고 끝 -->
      
      
   </div>
   </div>
   </div>
   
   <!-- 두번째 줄 끝 -->
   <!-- 푸터 시작 -->
   

<!--    <footer class="bg-dark text-start text-white pt-5 pb-4 sticky-bottom">
      <div class="container-fluid d-block sticky-bottom"
         style="margin-top: 50px">
         <div class="row" style="margin: 0px">
            <div class="col-2 align-self-center"></div>
            <div class="col-1 align-self-center">
               <p class="text-center">(주) 세이프존</p>
            </div>
            <div class="col-3 align-self-center">
               <p class="text-left">
                  대표자 : 박지형<br> 개인정보책임관리자 : 박지형 / 사업자번호 : 178-82-00065<br>
                  본점 : 광주 동구 예술길 31-15 3, 4, 7층 / E-Mail : smhrd@smhrd.or.kr
               </p>
            </div>
            <div class="col-1 align-self-center">
               <p class="text-center">고객센터</p>
            </div>
            <div class="col-3 align-self-center">
               <p class="text-left">
                  전화상담 : 062-655-3506, 9 / <br>전화 및 홈페이지상담 : 09시 ~ 19시 (월-금)<br>
                  - 카카오톡 : 09시 ~ 22시 (연중무휴)
               </p>
            </div>
            <div class="col-2 align-self-center"></div>

         </div>

      </div>
   </footer> -->
   <!-- 푸터 끝 -->

   <!-- Optional JavaScript; choose one of the two! -->

   <!-- Option 1: Bootstrap Bundle with Popper -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>

   <!-- Option 2: Separate Popper and Bootstrap JS -->
   <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
   <script type="text/javascript">
   </script>



   <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

   <script
      src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
      integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
      integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
      crossorigin="anonymous"></script>
   <script src="dashboard.js"></script>


</body>
</html>