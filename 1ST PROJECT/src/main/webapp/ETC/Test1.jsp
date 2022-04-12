<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.concurrent.ScheduledThreadPoolExecutor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.T_Standard_valuseDAO"%>
<%@page import="Model.T_Standard_valuseDTO"%>
<%@page import="Model.T_Sensor_valueDAO"%>
<%@page import="Model.T_Sensor_valueDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <%

// 실행간격 지정(3초)
int sleepSec = 3 ;
 
// 시간 출력 포맷
final SimpleDateFormat fmt = new SimpleDateFormat("HH:mm:ss");

 
// 주기적인 작업을 위한
final ScheduledThreadPoolExecutor exec = new ScheduledThreadPoolExecutor(1);
 
 
exec.scheduleAtFixedRate(new Runnable(){
     
    public void run(){
        try {

            Calendar cal = Calendar.getInstance() ;
             
             
            // 콘솔에 현재 시간 출력
            System.out.println(fmt.format(cal.getTime())) ;
             
        } catch (Exception e) {
             
            e.printStackTrace();
             
             
            // 에러 발생시 Executor를 중지시킨다
            exec.shutdown() ;
        }
    }
}, 0, sleepSec, TimeUnit.SECONDS);


%> --%>

	<%
	float pi_v = 0F;
	float mg_v = 0F;
	float hm_v = 0F;
	float tm_v = 0F;
	float co_v = 0F;

	float pi_sv = 0F;
	float mg_sv = 0F;
	float hm_sv = 0F;
	float tm_sv = 0F;
	float co_sv = 0F;
	
	

	ArrayList<T_Sensor_valueDTO> list = new T_Sensor_valueDAO().getData();
	ArrayList<T_Standard_valuseDTO> list1 = new T_Standard_valuseDAO().getStandard();
	%>

	<!-- 현재값 출력 -->

	<div id="board">
		<table id="list" border="1">
			<tr>
				<td>디바이스 순번</td>
				<td>센서 타입</td>
				<td>센서 값</td>
				<td>측정 시간</td>
			</tr>

			<%
			for (int i = 0; i < list.size(); i++) {

				if (list.get(i).getSensor_type().equals("PI")) {
					pi_v = Integer.parseInt(list.get(i).getSv_data());
				} else if (list.get(i).getSensor_type().equals("MG")) {
					mg_v = Integer.parseInt(list.get(i).getSv_data());
				} else if (list.get(i).getSensor_type().equals("CO")) {
					co_v = Integer.parseInt(list.get(i).getSv_data());
				} else if (list.get(i).getSensor_type().equals("HM")) {
					hm_v = Integer.parseInt(list.get(i).getSv_data());
				} else if (list.get(i).getSensor_type().equals("TM")) {
					tm_v = Integer.parseInt(list.get(i).getSv_data());
				}
			%>

			<tr>
				<td><%=list.get(i).getDevice_seq()%></td>
				<td><%=list.get(i).getSensor_type()%></td>
				<td><%=list.get(i).getSv_data()%></td>
				<td><%=list.get(i).getSv_date()%></td>
			</tr>

			<%
			}
			%>

			<%
			System.out.println("적외선센서 현재값 : " + pi_v);
			System.out.println("마그네틱센서 현재값 : " + mg_v);
			System.out.println("일산화탄소센서 현재값 : " + co_v);
			System.out.println("습도센서 현재값 : " + hm_v);
			System.out.println("온도센서 현재값 : " + tm_v);
			%>
		</table>
	</div>


	<!-- 기준값 출력 -->

	<div id="board1">
		<table id="list1" border="1">
			<tr>
				<td>기준값 순번</td>
				<td>센서 종류</td>
				<td>기준값</td>
				<td>창고순번</td>
			</tr>

			<%
			for (int i = 0; i < list1.size(); i++) {

				if (list1.get(i).getSensor_type().equals("PI")) {
					pi_sv = Integer.parseInt(list1.get(i).getSt_value());
				} else if (list1.get(i).getSensor_type().equals("MG")) {
					mg_sv = Integer.parseInt(list1.get(i).getSt_value());
				} else if (list1.get(i).getSensor_type().equals("CO")) {
					co_sv = Integer.parseInt(list1.get(i).getSt_value());
				} else if (list1.get(i).getSensor_type().equals("HM")) {
					hm_sv = Integer.parseInt(list1.get(i).getSt_value());
				} else if (list1.get(i).getSensor_type().equals("TM")) {
					tm_sv = Integer.parseInt(list1.get(i).getSt_value());
				}
			%>


			<tr>
				<td><%=list1.get(i).getSt_seq()%></td>
				<td><%=list1.get(i).getSensor_type()%></td>
				<td><%=list1.get(i).getSt_value()%></td>
				<td><%=list1.get(i).getW_seq()%></td>
			</tr>


			<%
			}
			%>
			
			<%
			System.out.println("적외선센서 기준값: " + pi_sv);
			System.out.println("마그네틱센서 기준값: " + mg_sv);
			System.out.println("일산화탄소센서 기준값: " + co_sv);
			System.out.println("습도센서 기준값: " + hm_sv);
			System.out.println("온도센서 기준값: " + tm_sv);
			%>
			



			<%-- <%
			    CO_i = Integer.parseInt(CO);
			    CO_Si = Integer.parseInt(CO_S);
				%> --%>
		</table>
	</div>

	<script>

		let pi_v = <%=pi_v%>;
		let pi_sv = <%=pi_sv%>;

		let mg_v = <%=mg_v%>;
		let mg_sv = <%=mg_sv%>;

		let tm_v = <%=tm_v%>;
		let tm_sv = <%=tm_sv%>;

		let hm_v = <%=tm_v%>;
		let hm_sv = <%=tm_sv%>;

		let co_v = <%=co_v%>;
		let co_sv = <%=co_sv%>;
		
		co_v = 5;
		co_sv = 3;
		
		console.log("모션감지 현재값 : " + pi_v);
		console.log("모션감지 기준값 : " + pi_sv);
		console.log(mg_v);
		console.log(mg_sv);
		console.log(tm_v);
		console.log(tm_sv);
		console.log(hm_v);
		console.log(hm_sv);
		console.log(co_v);
		console.log(co_sv);

		if (mg_v > mg_sv) {
			
			
		}



//	let standard = 20;
// 	let current_value = 15;
//	var check = new Boolean(false);
		
		var auto_1 = setInterval(function() {
//			current_value++;
			
		console.log(co_i);
		console.log(co_Si);
		if (co_i > co_Si) {
			// if(!check) {
			notify();
//check = Boolean(true);				
	//		}
		}
		}, 5000);
		
			
		
		function notify_M() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "출입문감지 센서 기준치 이상 상황",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }
		function notify_P() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "모션감지 센서 기준치 이상 상황",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }
		function notify_H() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "습도감지 센서 기준치 이상 상황",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }
		function notify_T() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }
		function notify_C() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "",
                        };
                        new Notification("Safe-Zone", option);
                    } else {
                        alert("Notification denied");
                    }
                });
            }
        }

	</script>
</body>
</html>