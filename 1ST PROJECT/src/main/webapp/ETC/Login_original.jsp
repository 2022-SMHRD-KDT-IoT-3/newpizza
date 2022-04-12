<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login.jsp</title>
    </head>
    <body>
    
    <form action="LoginServiceCon.do" method="post">
		아이디 입력 : <input id="inputid" type="text" name="mem_id"
			placeholder="ID를 입력하세요">
			<br>
		비밀번호 입력 : <input type="password" name="mem_pw"
			placeholder="PW를 입력하세요">
			<br>
		<input type="submit" value="로그인" class="button fit">
	</form>
    
        
    </body>
</html>
