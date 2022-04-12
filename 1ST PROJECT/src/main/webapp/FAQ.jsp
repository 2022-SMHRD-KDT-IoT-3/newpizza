<%@page import="Model.T_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Safe Zone</title>
</head>
<body class="bg-secondary bg-opacity-10">
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
          <a class="nav-link" href="Index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="FAQ.jsp">FAQ</a>
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
            <li><a class="dropdown-item" href="AdminWarehouseSelect.jsp">창고 정보조회/수정/삭제</a></li>
            <li><a class="dropdown-item" href="AdminSensorValueMonitoring.jsp">전체 회원창고 모니터링</a></li>
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
          <a class="nav-link active" href="FAQ.jsp">FAQ</a>
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



<!-- 본문 시작 -->

<!-- 칼럼 분류 -->
   <div class="container" style="margin-top:50px">

      <div style="margin-bottom:50px"> <h1>Safe-Zone <small class="text-muted">FAQ</small> </h1> </div>
      
      <div class="vstack gap-3">
 <!-- 아코디언 들어가기 시작함 -->
         <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item bg-light border">
               <h2 class="accordion-header" id="flush-headingOne">
                  <button class="accordion-button collapsed" type="button"
                     data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
                     aria-expanded="false" aria-controls="flush-collapseOne">
                     [SafeZone 기초]SafeZone이란?</button>
               </h2>
               <div id="flush-collapseOne" class="accordion-collapse collapse"
                  aria-labelledby="flush-headingOne"
                  data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                     기존의 물류운송 관리 또는 보안의 편협하며 분리되어있는 단순화된 서비스의 제공의 목적이 아닌 어느 누구나 보다 저렴한 비용으로 자신의 창고에 대한 상태 및 기초적인 보안상태를 보장 하는데 목적을 두었으며 그밖에도 여러 센서 및 센서의 기준치 설정으로 인한 물건의 손상방지에 힘쓰고자 만든 
                     <code>무인창고경비 및 관리</code>
                     를 목표로 하는 시스템입니다.
                  </div>
               </div>
            </div>
            <div class="accordion-item bg-light border">
               <h2 class="accordion-header" id="flush-headingTwo">
                  <button class="accordion-button collapsed" type="button"
                     data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
                     aria-expanded="false" aria-controls="flush-collapseTwo">
                     [SafeZone 관리]SafeZone 창고 모니터링은 어떻게 하나요?</button>
                     
               </h2>
               <div id="flush-collapseTwo" class="accordion-collapse collapse"
                  aria-labelledby="flush-headingTwo"
                  data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                     우선 저희는 기존에 설정된 기준치에 맞는 값에 따라 오차범위를 설정한 뒤
                     부착되어 있는 센서의 측정값이 기준치이상이 되었을시 1차적으로 알람이 발송이 되도록 설비되어 있습니다.<br>
                     물론 그밖에도 원하시는 시간에 실시간으로 홈페이지로 접속하여 로그인 하신뒤 고객님들의 창고 상태를 실시간 모니터링도 가능합니다.
                  </div>
               </div>
            </div>
            <div class="accordion-item bg-light border">
               <h2 class="accordion-header" id="flush-headingThree">
                  <button class="accordion-button collapsed" type="button"
                     data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
                     aria-expanded="false" aria-controls="flush-collapseThree">
                     기존의 사용자 정보 변경은 어떻게 하나요?</button>
               </h2>
               <div id="flush-collapseThree" class="accordion-collapse collapse"
                  aria-labelledby="flush-headingThree"
                  data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                     기존 상단의 메뉴바에서 회원 정보수정 및 창고 정보수정등을 통해 정보 변경이 가능합니다.
                  </div>
               </div>
            </div>
            <div class="accordion-item bg-light border">
               <h2 class="accordion-header" id="flush-headingFour">
                  <button class="accordion-button collapsed" type="button"
                     data-bs-toggle="collapse" data-bs-target="#flush-collapseFour"
                     aria-expanded="false" aria-controls="flush-collapseFour">
                       서비스를 이용하는 도중 AS는 어떻게 이루어지나요?                     </button>
               </h2>
               <div id="flush-collapseFour" class="accordion-collapse collapse"
                  aria-labelledby="flush-headingFour"
                  data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                     특정 고장난 부분에대한 원인을 분석 및 고장난 부품에대한 교체작업으로 이루어 질 예정이며
                     기존의 교체를 위한 여분 부품을 통해서 이루어 지기 떄문에 빠른 시일(최대3일) 내에 가능합니다.
                  
                  </div>
               </div>
            </div>
            <div class="accordion-item bg-light border">
               <h2 class="accordion-header" id="flush-headingFive">
                  <button class="accordion-button collapsed" type="button"
                     data-bs-toggle="collapse" data-bs-target="#flush-collapseFive"
                     aria-expanded="false" aria-controls="flush-collapseFive">
               시스템 설치 비용은 어떻게 측정되나요?
               </button>
               </h2>
               <div id="flush-collapseFive" class="accordion-collapse collapse"
                  aria-labelledby="flush-headingFive"
                  data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
               업종이 같아도 고객님의 창고 규모 및 구조가 다르다면 설치되는 시스템등이 그에 따라 차이가 나게 됩니다.
                  </div>
               </div>
            </div>
            
            
            <div class="accordion-item bg-light border">
               <h2 class="accordion-header" id="flush-headingSix">
                  <button class="accordion-button collapsed" type="button"
                     data-bs-toggle="collapse" data-bs-target="#flush-collapseSix"
                     aria-expanded="false" aria-controls="flush-collapseSix">
                     여기에 안나와 잇는 질문은 어떻게 해야되나요?</button>
               </h2>
               <div id="flush-collapseSix" class="accordion-collapse collapse"
                  aria-labelledby="flush-headingSix"
                  data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                     아래의 고객센터(<code>062-655-3506,9</code>)로 연락주시기 바랍니다.
                  </div>
               </div>
            </div>
            
            <div class="accordion-item bg-light border">
               <h2 class="accordion-header" id="flush-headingSeven">
                  <button class="accordion-button collapsed" type="button"
                     data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven"
                     aria-expanded="false" aria-controls="flush-collapseSeven">
                     근태관리를 위한 시스템도 있나요?</button>
               </h2>
               <div id="flush-collapseSeven" class="accordion-collapse collapse"
                  aria-labelledby="flush-headingSeven"
                  data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                     기존의 출입자석센서등을 통한 특정사람 출입으로 인한 시간은 확인할 수 있지만 
                     따로 특정 프로그램은 지원하고 있지 않습니다.
                  </div>
               </div>
            </div>
            
            
            <div class="accordion-item bg-light border">
               <h2 class="accordion-header" id="flush-headingEight">
                  <button class="accordion-button collapsed" type="button"
                     data-bs-toggle="collapse" data-bs-target="#flush-collapseEight"
                     aria-expanded="false" aria-controls="flush-collapseEight">
                     정전이 되면 작동되지 않나요?</button>
               </h2>
               <div id="flush-collapseEight" class="accordion-collapse collapse"
                  aria-labelledby="flush-headingEight"
                  data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                     네 작동이 되지 않습니다.
                  </div>
               </div>
            </div>
            
            
            <div class="accordion-item bg-light border">
               <h2 class="accordion-header" id="flush-headingNine">
                  <button class="accordion-button collapsed" type="button"
                     data-bs-toggle="collapse" data-bs-target="#flush-collapseNine"
                     aria-expanded="false" aria-controls="flush-collapseNine">
                     주의할점이 있나요?</button>
               </h2>
               <div id="flush-collapseNine" class="accordion-collapse collapse"
                  aria-labelledby="flush-headingNine"
                  data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                     센서 주변에 물건을 너무 근접하여 적제할시 센서의 인식 범위가 제한되어 정상적인 기능이 힘들 수 있으니 유의 바랍니다.
                  </div>
               </div>
            </div>
            
            
            
         </div>
      </div>
      <!-- 아코디언 끝남 -->


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


<!-- 본문 끝 -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>