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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="Index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="FAQ.jsp">FAQ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="BoardMain.jsp">Board</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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


<!-- 스크립틀릿 시작 -->
  <%
  String sensor_seq = request.getParameter("sensor_seq");
  String sensor_type = request.getParameter("sensor_type");
  String sensor_unit = request.getParameter("sensor_unit");
  String st_value = request.getParameter("st_value");
  String device_inst_date = request.getParameter("device_inst_date");

  System.out.println("sensor_seq :" + sensor_seq);
  System.out.println("sensor_type :" + sensor_type);
  System.out.println("sensor_unit :" + sensor_unit);
  System.out.println("st_value :" + st_value);
  System.out.println("device_inst_date :" + device_inst_date);
  
  %>
  
  <!-- 스크립틀릿 끝 -->
  
	<!-- 본문 시작 -->

		<!-- 센서 정보 수정 -->
<form action="AddDeviceSensorServicecon.do" method="get"
		style="margin-top: 50px;">

		<h1 class="text-center">센서 정보 수정</h1>


		<div class="row">
			<div class="col">
				센서 종류 <select name="sensorType" class="form-select"
					aria-label="센서 종류 선택">
					<option value="" selected>센서 종류 선택</option>
					<option value="MG">마그네틱 도어 센서</option>
					<option value="PI">모션감지 적외선 센서</option>
					<option value="TM">온도 센서</option>
					<option value="HM">습도 센서</option>
					<option value="CO">일산화탄소 센서</option>
				</select>
			</div>
			<div class="col">
				측정 단위 <select name="sensorUnit" class="form-select"
					aria-label="측정 단위 선택">
					<option value="" selected>측정 단위 선택</option>
					<option value="onoff">마그네틱, 적외선 센서</option>
					<option value="C">C</option>
					<option value="%">%</option>
					<option value="P">PPM</option>
				</select>
			</div>
			<div class="col">
				센서 기준값 <input type="text" class="form-control"
					name="sensorStandardValue" placeholder="센서 기준값">
			</div>
			<div class="col">
				센서 설치일자 <input type="date" class="form-control" name="sensorDate"
					placeholder="센서 설치일자">
			</div>
		</div>

		<p class="hidden1"></p>

		<div class="container" style="margin-top: 50px">
			<button type="submit" class="btn btn-primary">센서 정보 수정</button>
			<button type="reset" class="btn btn-primary">초기화</button>
		</div>

	</form>


<p class="updateresult"></p>


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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

// 정보 변경 시작
	$('#update').on('click', function() {
		let mem_id = $('input[name=mem_id]').val();
		let mem_name = $('input[name=mem_name]').val();
		let mem_phone = $('input[name=mem_phone]').val();
		
		console.log(mem_id);
		console.log(mem_name);
		console.log(mem_phone);
		
		$.ajax({
		url : 'AdminMemberUpdateServiceCon.do',
		type : 'post',
		data : {
		mem_id : mem_id,
		mem_name : mem_name,
		mem_phone : mem_phone,
		},
		dataType : "text",
		success : function(result) {
			if (result == 'success') {
			$('.updateresult').html('<div class="mx-auto w-25 p-3 alert alert-success" role="alert" style="margin-top:40px;"> 정보 변경에 성공하였습니다. </div> ');
			} else {
			$('.updateresult').html('<div class="mx-auto w-25 p-3 alert alert-danger" role="danger" style="margin-top:40px;"> 정보 변경에 실패하였습니다. </div> ');
			}
		},
		error : function() {
			$('.updateresult').html('<div class="mx-auto w-25 p-3 alert alert-danger" role="danger" style="margin-top:40px;"> 정보 변경에 실패하였습니다. </div> ');
		}
		});
	});
// 정보 변경 끝


</script>

</body>

</html>