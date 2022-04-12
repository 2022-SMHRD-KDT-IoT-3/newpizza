<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
	let standard = 20;
	let current_value = 15;
	var check = new Boolean(false);
		
		var auto_1 = setInterval(function() {
			current_value++;
			
		console.log(standard);
		console.log(current_value);
		if (current_value > standard) {
			// if(!check) {
			notify();
//check = Boolean(true);				
	//		}
		}
		}, 5000);
		
			
		
		function notify() {
            if (Notification.permission !== "denied") {
                Notification.requestPermission((permission) => {
                    if (permission === "granted") {
                        const option = {
                            body: "1번 창고 화재상황 발생",
                            icon: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png",
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