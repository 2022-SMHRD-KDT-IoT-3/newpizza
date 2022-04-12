<%@page import="java.util.ArrayList"%>
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
<META HTTP-EQUIV="refresh" CONTENT="5">

<!-- Bootstrap CSS -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     <!-- 차트 링크 --> 
     <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 

<style>
.toggle-switch input {
   -webkit-appearance: none;
   -webkit-border-radius: 0;
}

#container {
   display: flex;
   width: 100%;
   /*   height: 98vh; */
   justify-content: center;
   align-items: center;
}

.toggle-switch input[type=checkbox] {
   display: none;
}

.toggle-track {
   display: inline-block;
   position: relative;
   width: 60px;
   height: 25px;
   border-radius: 60px;
   background: #8b8b8b;
}

.toggle-track:before {
   content: '';
   display: block;
   position: absolute;
   top: -6px;
   left: -15px;
   width: 27px;
   height: 27px;
   margin: 5px;
   background: #fff;
   border-radius: 100%;
   border: 1px solid #8b8b8b;
   transition: left 0.3s;
}

.toggle-switch input[type=checkbox]+label .toggle-track:after {
   content: 'OFF';
   display: inline-block;
   position: absolute;
   right: 8px;
   color: #fff;
}

.toggle-switch input[type=checkbox]:checked+label .toggle-track {
   background: #FA9AA6;
}

.toggle-switch input[type=checkbox]:checked+label .toggle-track:before {
   left: 40px;
   border: 1px solid #FA9AA6;
}

.toggle-switch input[type=checkbox]:checked+label .toggle-track:after {
   content: 'ON';
   left: 5px;
}
</style>


<title>Safe Zone</title>
</head>
<body class="text-center">
   <!-- 세션 받아오기 시작 -->
   <%
   request.setCharacterEncoding("utf-8");
   %>
   <%
   T_MemberDTO info = (T_MemberDTO) session.getAttribute("info");
   %>
   <!-- 세선 받아오기 끝 -->

   <!-- 상단바 시작 -->

   <%
   if (info != null) {
      /* 관리자로그인 */
      if (info.getMem_id().equals("admin")) {
   %>

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
                  class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     AdminPage </a>
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
               <%=info.getMem_id()%></a> <a href="LogoutServiceCon.do"
               class="btn btn-primary me-md-2" role="button">로그아웃</a>
         </div>
      </div>
   </nav>
   <!-- 관리자 상단바 끝 -->
   <%
   } else {
   %>
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
                  class="nav-link dropdown-toggle active" href="#"
                  id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                  aria-expanded="false"> MyPage </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="MemberUpdate.jsp">내
                           정보 수정</a></li>
                     <li><hr class="dropdown-divider"></li>
                     <li><a class="dropdown-item" href="MemberMonitoring.jsp">내
                           창고 모니터링</a></li>
                  </ul></li>
            </ul>
            <a href="#" class="btn btn-info me-md-2" role="button">현재 접속 계정
               <%=info.getMem_id()%></a> <a href="LogoutServiceCon.do"
               class="btn btn-primary me-md-2" role="button">로그아웃</a>
         </div>
      </div>
   </nav>
   <%
   }
   %>

   <!-- 회원 상단바 끝 -->

   <!-- 비로그인 상단바 시작 -->
   <%
   } else {
   %>
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
   <%
   }
   %>
   <!-- 비로그인 상단바 끝 -->

   <!-- 본문 시작  -->
   <!-- 현재 센서값 받아오기 스크립틀릿 시작 -->

   <%
   PreparedStatement psmt = null;
   Connection conn = null;
   ResultSet rs = null;
   String MG = "";
   String PI = "";
   String TM = "";
   String HM = "";
   String CO = "";

   String mg_v = "";
   String pi_v = "";
   String hm_v = "";
   String tm_v = "";
   String co_v = "";

   ArrayList<String> MG_data = new ArrayList<>();
   ArrayList<String> PI_data = new ArrayList<>();
   ArrayList<String> TM_data = new ArrayList<>();
   ArrayList<String> HM_data = new ArrayList<>();
   ArrayList<String> CO_data = new ArrayList<>();

   ArrayList<String> MG_date = new ArrayList<>();
   ArrayList<String> PI_date = new ArrayList<>();
   ArrayList<String> TM_date = new ArrayList<>();
   ArrayList<String> HM_date = new ArrayList<>();
   ArrayList<String> CO_date = new ArrayList<>();

   //1. db연결(mg_data)
   //2. db연결(pi_data)
   //3. db연결(tm_data)
   //4. db연결(hm_data)
   //5. db연결(co_data)

   try {
      Class.forName("oracle.jdbc.driver.OracleDriver");

      // 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
      String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
      String dbid = "campus_b_0310_5";
      String dbpw = "smhrd5";

      // 1-3. Connection객체 사용해서 DB연결!
      conn = DriverManager.getConnection(url, dbid, dbpw);

      //sql준비 및 실행
      // String sql = "SELECT * FROM t_sensor_value where mem_id = 'test'";

      // String sql = "Select * from (select A.sv_data, A.sv_date, B.sensor_type FROM t_sensor_value A, t_sensor B where A.sensor_seq = B.sensor_seq and A.mem_id = 'test' and B.sensor_type = 'MG' order by A.sv_date desc) where rownum < 2";

         String sql = "select * from (select sv_data, sv_date from t_sensor_value where sensor_seq = ?  order by sv_date desc) where rownum < 25";

         psmt = conn.prepareStatement(sql);
      for (int i = 1; i <= 5; i++) {
         psmt.setInt(1, i);
         rs = psmt.executeQuery();

         if (i == 1) {// mg
      while (rs.next()) {
         int cnt = 0;
         MG_data.add(rs.getString(1));
         MG_date.add(rs.getString(2));
         System.out.print("==== mg ===="+ cnt);
         System.out.print(MG_data.get(cnt));
         System.out.println(MG_date.get(cnt++));
      }
         } else if (i == 2) { // pi
      while (rs.next()) {
         PI_data.add(rs.getString(1));
         PI_date.add(rs.getString(2));
      }

         } else if (i == 3) { // tm
      while (rs.next()) {
         TM_data.add(rs.getString(1));
         TM_date.add(rs.getString(2));
      }

         } else if (i == 4) { // hm
      while (rs.next()) {
         HM_data.add(rs.getString(1));
         HM_date.add(rs.getString(2));
      }

         } else if (i == 5) { // co
      while (rs.next()) {
         CO_data.add(rs.getString(1));
         CO_date.add(rs.getString(2));
      }

         }

      }

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
   %>
   <!-- 현재 센서값 받아오기 스크립틀릿 끝 -->



   <!-- 테이블 시작 -->
   <div class="container" style="margin-top: 20px">
      <div class="row" style="margin-top: 20px">
         <h1>내 창고 모니터링 </h1>
      </div>
      <div class="row alert alert-info" style="margin-top: 20px">
         <div class="col">
            <h5>마그네틱 도어</h5>
         </div>
         <div class="col">
            <h5>적외선 모션감지</h5>
         </div>
         <div class="col">
            <h5>온도 감지</h5>
         </div>
         <div class="col">
            <h5>습도 감지</h5>
         </div>
         <div class="col">
            <h5>일산화탄소 감지</h5>
         </div>
      </div>
   </div>

   <div class="container">
      <div class="row alert alert-warning">
         <div class="col">
            <h5><%if(MG_data.get(1).equals("1")){
            out.print("닫힘");}else{out.print("열림");}
            %></h5>
         </div>
         <div class="col">
            <h5><%if(PI_data.get(1).equals("1")){
            out.print("움직임 감지됨");}else{out.print("이상 없음");}
            %></h5>
         </div>
         <div class="col">
            <h5><%=TM_data.get(1)%>도
            </h5>
         </div>
         <div class="col">
            <h5><%=HM_data.get(1)%>%
            </h5>
         </div>
         <div class="col">
            <h5><%=CO_data.get(1)%>ppm
            </h5>
         </div>
      </div>
   </div>
<!-- 

   <div class="container text-center">
      <div class="row alert alert-success">
         <div class="col">
            <div class="toggle-switch">
               <p>센서 제어</p>
               <input type="checkbox" id="chkTog4"> <label for="chkTog4">
                  <span class="toggle-track"></span>
               </label>
            </div>
         </div>
         <div class="col">
            <div class="toggle-switch">
               <p>센서 제어</p>
               <input type="checkbox" id="chkTog5"> <label for="chkTog5">
                  <span class="toggle-track"></span>
               </label>
            </div>
         </div>
         <div class="col">
            <div class="toggle-switch">
               <p>센서 제어</p>
               <input type="checkbox" id="chkTog6"> <label for="chkTog6">
                  <span class="toggle-track"></span>
               </label>
            </div>
         </div>
         <div class="col">
            <div class="toggle-switch">
               <p>센서 제어</p>
               <input type="checkbox" id="chkTog7"> <label for="chkTog7">
                  <span class="toggle-track"></span>
               </label>
            </div>
         </div>
         <div class="col">
            <div class="toggle-switch">
               <p>센서 제어</p>
               <input type="checkbox" id="chkTog8"> <label for="chkTog8">
                  <span class="toggle-track"></span>
               </label>
            </div>
         </div>
      </div>
   </div>

 -->








   <!-- 그래프 시작 -->
<!--    <div class="container-fluid" style="margin-top: 20px">
      <div class="row">
         <div class="col">
            <h3>온도 그래프</h3>
            <canvas class="w-100" id="myChart_T"></canvas>
         </div>
         <div class="col">
            <h3>습도 그래프</h3>
            <canvas class="w-100" id="myChart_H"></canvas>
         </div>
         <div class="col">
            <h3>일산화탄소 그래프</h3>
            <canvas class="w-100" id="myChart_C"></canvas>
         </div>
      </div>
   </div>
 -->   <!-- 그래프 끝 -->

<div class="container-fluid" style="margin-top: 20px">
      <div class="row">
         <div class="col">
            <h3>온도 그래프</h3>
            <canvas class="w-100" id="myChartT"></canvas>
         </div>
         <div class="col">
            <h3>습도 그래프</h3>
            <canvas class="w-100" id="myChartH"></canvas>
         </div>
         <div class="col">
            <h3>일산화탄소 그래프</h3>
            <canvas class="w-100" id="myChartC"></canvas>
         </div>
      </div>
   </div>








    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <!-- 차트 -->
    <script>
        var ctx = document.getElementById('myChartT').getContext('2d');
        var chart = new Chart(ctx, {
            // 챠트 종류를 선택 
            type: 'line',
            // 챠트를 그릴 데이타 
            data: {
                labels: [<%="'"+TM_date.get(15)+"'"%>, <%="'"+TM_date.get(12)+"'"%>,<%="'"+TM_date.get(9)+"'"%>,<%="'"+TM_date.get(6)+"'"%>,<%="'"+TM_date.get(3)+"'"%>,<%="'"+TM_date.get(0)+"'"%>],
                datasets: [{
                    label: 'temp',
                    backgroundColor: 'transparent', borderColor: 'red', 
                    data: [<%=TM_data.get(15)%>, <%=TM_data.get(12)%>, <%=TM_data.get(9)%>, <%=TM_data.get(6)%>, <%=TM_data.get(3)%>, <%=TM_data.get(0)%>]
                }]
            },
            // 옵션 
            options: {}
        }); 
        var ctx = document.getElementById('myChartH').getContext('2d');
        var chart = new Chart(ctx, {
            // 챠트 종류를 선택 
            type: 'line',
            // 챠트를 그릴 데이타 
            data: {
                labels: [<%="'"+HM_date.get(15)+"'"%>, <%="'"+HM_date.get(12)+"'"%>,<%="'"+HM_date.get(9)+"'"%>,<%="'"+HM_date.get(6)+"'"%>,<%="'"+HM_date.get(3)+"'"%>,<%="'"+HM_date.get(0)+"'"%>],
                datasets: [{
                    label: 'Humidity',
                    backgroundColor: 'transparent', borderColor: 'blue', 
                    data: [<%=HM_data.get(15)%>, <%=HM_data.get(12)%>,<%=HM_data.get(9)%>,<%=HM_data.get(6)%>,<%=HM_data.get(3)%>,<%=HM_data.get(0)%>]
                }]
            },
            // 옵션 
            options: {}
        }); 
        var ctx = document.getElementById('myChartC').getContext('2d');
        var chart = new Chart(ctx, {
            // 챠트 종류를 선택 
            type: 'line',
            // 챠트를 그릴 데이타 
            data: {
                labels: [<%="'"+CO_date.get(15)+"'"%>, <%="'"+CO_date.get(12)+"'"%>,<%="'"+CO_date.get(9)+"'"%>,<%="'"+CO_date.get(6)+"'"%>,<%="'"+CO_date.get(3)+"'"%>,<%="'"+CO_date.get(0)+"'"%>],
                datasets: [{
                    label: 'CO gas',
                    backgroundColor: 'transparent', borderColor: 'gray', 
                    data: [<%=CO_data.get(15)%>,<%=CO_data.get(12)%>,<%=CO_data.get(9)%>,<%=CO_data.get(6)%>,<%=CO_data.get(3)%>,<%=CO_data.get(0)%>]
                }]
            },
            // 옵션 
            options: {}
        }); 
        </script>

   <!-- 푸터 시작 -->
   <footer class="bg-dark text-start text-white pt-5 pb-4 fixed-bottom"
      style="height: 144px">
      <div class="container-fluid d-block fixed-bottom"
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
   </footer>
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
      $('#btn').on('click', function() {
         // 1. 입력한 email 가져오기
         let email = $('input[name=email]').val();
         console.log(email);

         // 2. ajax로 email 보내기(IdCheckServiceCon)
         $.ajax({
            url : 'IdCheckServiceCon.do', /* 어디로 보낼지 */
            type : 'post',
            data : { /* 입력한 email data보내기 */
               email : email
            },
            dataType : "text", /* 중복체크 결과값 text로 받아오기 */
            success : function(result) {
               alert('성공', result);
               if (result == 'false') {
                  // 중복X
                  $('#idcheck').html('중복되는 아이디가 없습니다.');
               } else {
                  // 중복O
                  $('#idcheck').html('아이디가 중복됩니다.');
               }
            },
            error : function() {
               alert('실패');
            }
         });
      });
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