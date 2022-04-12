<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Zone</title>
</head>
<body>

	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		var auto_1 = setInterval(function() {
			let start = 1;

				console.log("add dummy실행");
				
//				function test() {
//					  sleep(3000);
//					}
				
				send_1();
				sleep(3000);
					send_2();
					sleep(3000);
					send_3();
					sleep(3000);
					send_4();
					sleep(3000);
					send_5();
					sleep(3000);
		}, 10000);

		function sleep(ms) {
			  const wakeUpTime = Date.now() + ms;
			  while (Date.now() < wakeUpTime) {}
			}
		
		
		
		function send_1() {

				console.log("1번센서 데이터 입력 실행");
				$.ajax({
					type : 'post',
					url : 'AddDummyServicecon.do',
					data : { /* 입력한 email data보내기 */
						sensor_seq : 1,
						sv_data : 10,
						gate_num : 1
					},
					dataType : "text", /* 중복체크 결과값 text로 받아오기 */
					success : function() {
					},
					error : function() {
					}
				})

		}
		function send_2() {

				console.log("2번센서 데이터 입력 실행");
				$.ajax({
					type : 'post',
					url : 'AddDummyServicecon.do',
					data : { /* 입력한 email data보내기 */
						sensor_seq : 2,
						sv_data : 10,
						gate_num : 1
					},
					dataType : "text", /* 중복체크 결과값 text로 받아오기 */
					success : function() {
					},
					error : function() {
					}
				})

		}
		function send_3() {

				console.log("3번센서 데이터 입력 실행");
				$.ajax({
					type : 'post',
					url : 'AddDummyServicecon.do',
					data : { /* 입력한 email data보내기 */
						sensor_seq : 3,
						sv_data : 10,
						gate_num : 1
					},
					dataType : "text", /* 중복체크 결과값 text로 받아오기 */
					success : function() {
					},
					error : function() {
					}
				})

		}
		function send_4() {

				console.log("4번센서 데이터 입력 실행");
				$.ajax({
					type : 'post',
					url : 'AddDummyServicecon.do',
					data : { /* 입력한 email data보내기 */
						sensor_seq : 4,
						sv_data : 10,
						gate_num : 1
					},
					dataType : "text", /* 중복체크 결과값 text로 받아오기 */
					success : function() {
					},
					error : function() {
					}
				})

		}
		function send_5() {

				console.log("5번센서 데이터 입력 실행");
				$.ajax({
					type : 'post',
					url : 'AddDummyServicecon.do',
					data : { /* 입력한 email data보내기 */
						sensor_seq : 5,
						sv_data : 10,
						gate_num : 1
					},
					dataType : "text", /* 중복체크 결과값 text로 받아오기 */
					success : function() {
					},
					error : function() {
					}
				})

		}

		
		// 5초에 한번씩 센서 5개에 값이 들어가는게 반복되길 원함
		
	</script>
</body>
</html>