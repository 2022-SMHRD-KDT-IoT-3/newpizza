<%@page import="Model.T_MemberDTO"%>
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
          <a class="nav-link" href="Index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="FAQ.jsp">FAQ</a>
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
          <a class="nav-link" href="Index.jsp">Home</a>
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
          <a class="nav-link" href="Index.jsp">Home</a>
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
   <div class="container" style="margin-top: 100px;"></div>
 

<form action="JoinServiceCon.do" method="post">
    
  <h1 class="text-center">SafeZone 회원가입</h1>
    
  <div class="form-floating mb-3 mx-auto w-25" style="margin-top:50px">
    <input type="text" id="mem_id" class="form-control" name="mem_id" placeholder="아이디 입력">
    <label for="exampleInputPassword1" class="form-label">아이디 입력 </label>
    </div>
  <div class="form-floating mb-3 mx-auto w-25">
    <input type="password" class="form-control" name="mem_pw_new" placeholder="비밀번호 입력">
    <label for="exampleInputPassword1" class="form-label">비밀번호 입력</label>
  </div>
  <div class="form-floating mb-3 mx-auto w-25">
    <input type="password" class="form-control" name="mem_pw_new_check" placeholder="비밀번호 재입력">
    <label for="exampleInputPassword1" class="form-label">비밀번호 재입력</label>
  </div>
  <div class="form-floating mb-3 mx-auto w-25">
    <input type="text" class="form-control" name="mem_name" placeholder="이름 입력">
    <label for="exampleInputPassword1" class="form-label">이름 입력</label>
  </div>
  <div class="form-floating mb-3 mx-auto w-25">
    <input type="text" class="form-control" name="mem_phone" placeholder="전화번호 입력">
    <label for="exampleInputPassword1" class="form-label">전화번호 입력</label>
  </div>
  
  <div class="container" style="margin-top:50px">
  <button type="submit" class="btn btn-primary">회원가입 하기</button>
  <button type="reset" class="btn btn-primary">초기화</button>
  <a href="IdPwFind.jsp" class="btn btn-primary" role="button">아이디 비밀번호 찾기</a>
  </div>
</form>
<p class="result"></p>
<!-- 본문 끝 -->


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


// 아이디 중복체크
    $(function () {
	$("#mem_id").on("focusout", function() {
		let mem_id = $("input[name=mem_id]").val();
		console.log(mem_id);
		$.ajax({
		url : 'IdCheckServiceCon.do',
		type : 'post',
		data : {
		mem_id : mem_id,
		},
		dataType : "text",
		success : function(result) {
			if (result == 'true') {
			$('.result').html('<div class="mx-auto w-25 p-3 alert alert-danger" role="alert" style="margin-top:20px;"> 중복된 아이디가 있습니다. 다른 아이디를 입력해주세요. </div> ');
			} else {
			$('.result').html('<div class="mx-auto w-25 p-3 alert alert-success" role="danger" style="margin-top:20px;"> 중복된 아이디가 없습니다. 가입을 진행해주세요. </div> ');
			}
		},
		error : function() {
			$('.idcheckresult').html('<div class="mx-auto w-25 p-3 alert alert-danger" role="danger" style="margin-top:20px;"> 아이디 중복 확인에 실패하였습니다. </div> ');
		}
		});
	})
    })
// 아이디 중복체크 끝    
	
 // 비밀번호 일치 확인	
    $(function () {
        $("input").keyup(function(){
        	
        let mem_pw_new = $("input[name=mem_pw_new]").val();
        let mem_pw_check = $("input[name=mem_pw_new_check]").val();
        console.log(mem_pw_check);
        console.log(mem_pw_new);
       	 
        if (mem_pw_new != '' && mem_pw_check == '' ) {
            null;
        } else if (mem_pw_new != "" || mem_pw_check != "") {
            if (mem_pw_new == mem_pw_check) {
           	 $('.result').html('<div class="w-25 mx-auto p-3 alert alert-success alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 비밀번호가 일치합니다. </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
            } else {
           	 $('.result').html('<div class="w-25 mx-auto p-3 alert alert-danger alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 비밀번호가 일치하지 않습니다. </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
            }
        
        }
    });
    });
// 비밀번호 일치 확인 끝
</script>	



</body>

</html>